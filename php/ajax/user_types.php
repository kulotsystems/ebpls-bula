<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        // FUNCTION: GET ITEM OF 1 USER TYPE
        function get_user_type_item($usertype_id) {
            require INDEX . 'php/inc/USER_TYPE.php';
            $user_type = get_user_type_info($usertype_id, false, 'for getting user type item data');
            return array(
                'item_id' => $usertype_id,
                'item_avatar' => '',
                'item_maintitle' => $user_type['acronym'],
                'item_subtitle' => $user_type['title'],
                'item_update_date' => $user_type['date_updated']
            );
        }


        // FUNCTION: GET DATA OF 1 USER TYPE
        function get_user_type_data($usertype_id) {
            require INDEX . 'php/inc/USER_TYPE.php';
            $user_type = get_user_type_info($usertype_id, true, 'for getting user type data');
            return array(
                'id' => intval($usertype_id),
                'acronym' => $user_type['acronym'],
                'title' => $user_type['title'],
                'desc' => $user_type['desc'],
                'access' => $user_type['access']
            );
        }


        // GET ALL USER TYPES
        if(isset($_POST['get_user_types'])) {
            $last_item_id = trim($_POST['last_item']);
            $active_item_id = intval($_POST['active_item']);

            // check if active item exits
            $query = "SELECT `ID` FROM `user_types` WHERE `ID`=$active_item_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking of active user type item exists')) {
                $active_item_exists = (mysqli_num_rows($result) > 0);

                $query = "SELECT `ID` FROM `user_types` WHERE 1 ORDER BY `Acronym`, `Title`";
                $result = mysqli_query($con, $query);
                if (has_no_db_error('getting all user types')) {
                    $arr_user_types = array();
                    $total_items = mysqli_num_rows($result);
                    $item_limit = intval($_POST['item_limit']);
                    $did_passed_last_item = false;
                    $did_passed_active_item = false;
                    $ctr = 1;
                    while ($row = mysqli_fetch_assoc($result)) {
                        $item_id = intval($row['ID']);
                        if ($last_item_id == '') {
                            // no last item found -> means on load
                            if($active_item_exists) {
                                // active item exists
                                array_push($arr_user_types, get_user_type_item($item_id));
                                $ctr += 1;

                                if($item_id == $active_item_id)
                                    $did_passed_active_item = true;

                                if ($ctr > $item_limit && $did_passed_active_item) break;
                            }
                            else {
                                // active item does not exist
                                array_push($arr_user_types, get_user_type_item($item_id));
                                $ctr += 1;
                                if ($ctr > $item_limit) break;
                            }
                        }
                        else {
                            // has last item found
                            // initiate get item when already passed the last item
                            if ($did_passed_last_item) {
                                array_push($arr_user_types, get_user_type_item($item_id));
                                $ctr += 1;
                            }
                            else {
                                if ($item_id == intval($last_item_id))
                                    $did_passed_last_item = true;
                            }
                            if ($ctr > $item_limit) break;
                        }
                    }
                    $response['success']['data'] = array(
                        'menu_href' => $_POST['get_user_types'],
                        'items' => $arr_user_types,
                        'total_items' => $total_items
                    );
                }
            }
        }


        // GET DATA OF 1 USER TYPE
        else if(isset($_POST['get_user_type_data'])) {
            $usertype_id = intval($_POST['get_user_type_data']);
            $response['success']['data'] = get_user_type_data($usertype_id);
        }


        // CREATE NEW USER TYPE
        else if(isset($_POST['create_new_usertype'])) {
            $usertype_acronym = '[new_user_type]';
            $query = "INSERT INTO `user_types`(`Acronym`) VALUES('$usertype_acronym')";
            mysqli_query($con, $query);
            if (has_no_db_error('creating new user type')) {
                $id = intval(mysqli_insert_id($con));

                // get the insert date
                $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `user_types` WHERE `ID`=$id";
                $result = mysqli_query($con, $query);
                $row = mysqli_fetch_assoc($result);

                $response['success']['data'] = array(
                    'item_id' => $id,
                    'item_avatar' => '',
                    'item_maintitle' => $usertype_acronym,
                    'item_subtitle' => '',
                    'item_update_date' => $row['UpdatedAt']
                );

                // append to system log (INSERT)
                append_to_system_log(array(
                    'action' => 'INSERT',
                    'item' => get_user_type_item($id),
                    'item_data' => get_user_type_data($id)
                ));
            }
        }


        // SAVE USER TYPE
        else if(isset($_POST['save_usertype'])) {
            $usertype_id = intval($_POST['save_usertype']);

            // check if the user type is valid
            $query = "SELECT `ID` FROM `user_types` WHERE `ID`=$usertype_id";
            $result = mysqli_query($con, $query);
            if (has_no_db_error('checking if user type exists')) {

                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = 'USER TYPE NOT FOUND';
                else {
                    $item = get_user_type_item($usertype_id);
                    $usertype_acronym = mysqli_real_escape_string($con, strip_tags(trim($_POST['acronym'])));
                    $usertype_title = mysqli_real_escape_string($con, strip_tags(trim($_POST['title'])));
                    $usertype_desc = mysqli_real_escape_string($con, strip_tags(trim($_POST['desc'])));
                    $usertype_access = array();
                    if(isset($_POST['access'])) {
                        $usertype_access = $_POST['access'];
                        array_walk($usertype_access, 'utf8encode');
                    }

                    // update user type data
                    $query = "UPDATE `user_types` ";
                    $query .= "SET `Acronym`='$usertype_acronym', ";
                    $query .= "`Title`='$usertype_title', ";
                    $query .= "`Description`='$usertype_desc', ";
                    $query .= "`Access`='" . mysqli_real_escape_string($con, json_encode($usertype_access)) . "' ";
                    $query .= "WHERE `ID`=$usertype_id";


                    mysqli_query($con, $query);
                    if (has_no_db_error('saving user type data')) {

                        // get update date
                        $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `user_types` WHERE `ID`=$usertype_id";
                        $result = mysqli_query($con, $query);
                        while ($row = mysqli_fetch_assoc($result)) {
                            $response['success']['data'] = $row['UpdatedAt'];
                            break;
                        }

                        // append to system log (UPDATE)
                        append_to_system_log(array(
                            'action' => 'UPDATE',
                            'item' => $item,
                            'item_data' => get_user_type_data($usertype_id)
                        ));
                    }
                }
            }
        }


        // DELETE USER TYPE
        else if(isset($_POST['delete_usertype'])) {
            $usertype_id = intval($_POST['delete_usertype']);

            // check if the user type is valid
            $query = "SELECT `ID` FROM `user_types` WHERE `ID`=$usertype_id";
            $result = mysqli_query($con, $query);
            if (has_no_db_error('checking if user type exists')) {
                if (mysqli_num_rows($result) <= 0)
                    $response['error'] = 'USER TYPE NOT FOUND';
                else {
                    // check if this user type is associated with users
                    $query = "SELECT `CitizenID` FROM `users` WHERE `UserTypeID`=$usertype_id";
                    $result = mysqli_query($con, $query);
                    if (has_no_db_error('checking for associated user data of user type')) {

                        if (mysqli_num_rows($result) > 0) {
                            $response['success']['message'] = 'UNABLE TO DELETE';
                            $response['success']['sub_message'] = '<span  style="font-size: 1.2em">This <b class="text-info">USER TYPE</b> cannot be deleted because there are <b class="text-danger">USER ACCOUNTS</b> data associated with it.</span>';
                        } else {
                            $item = get_user_type_item($usertype_id);
                            $item_data = get_user_type_data($usertype_id);

                            $query = "DELETE FROM `user_types` WHERE ID=$usertype_id";
                            mysqli_query($con, $query);
                            if (has_no_db_error('deleting user type')) {
                                $response['success']['data'] = '1';

                                // append to system log (DELETE)
                                append_to_system_log(array(
                                    'action' => 'DELETE',
                                    'item' => $item,
                                    'item_data' => $item_data
                                ));
                            }
                        }
                    }
                }
            }
        }
    }
    require '__fin.php';

?>