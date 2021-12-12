<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        // FUNCTION: GET ITEM OF 1 USER ACCOUNT
        function get_user_account_item($citizen_id) {
            require INDEX . "php/inc/USER_ACCOUNT.php";
            $user_account = get_user_account_info($citizen_id, 'for getting user account item data');
            return array(
                'item_id' => $citizen_id,
                'item_avatar' => $user_account['citizen']['avatar'],
                'item_maintitle' => $user_account['citizen']['full_name'],
                'item_subtitle' => '(' . $user_account['user_type']['acronym'] . ') ' . $user_account['user_type']['title'],
                'item_update_date' => $user_account['date_updated']
            );
        }


        // FUNCTION: GET DATA OF 1 USER ACCOUNT
        function get_user_account_data($citizen_id) {
            require INDEX . 'php/inc/USER_TYPE.php';
            require INDEX . 'php/inc/USER_ACCOUNT.php';
            $user_account = get_user_account_info($citizen_id, 'for getting user account data');
            $arr_user_types = get_all_user_types('for getting user account data');

            if($user_account['citizen']['id'] == 1 && $GLOBALS['arr_admin_details']['citizen_id'] != 1) {
                $GLOBALS['response']['error'] = 'STOP HACKING!';
            }
            return array(
                'citizen_id' => intval($user_account['citizen']['id']),
                'citizen_avatar' => $user_account['citizen']['avatar'],
                'citizen_full_name' => $user_account['citizen']['full_name'],
                'username' => $user_account['username'],
                'password' => $user_account['password'],
                'is_active' => $user_account['is_active'],
                'usertype_id' => $user_account['user_type']['id'],
                'usertypes' => $arr_user_types
            );
        }


        // GET ALL USER ACCOUNTS
        if(isset($_POST['get_user_accounts'])) {
            $last_item_id = trim($_POST['last_item']);
            $active_item_id = intval($_POST['active_item']);

            // check if active item exits
            $query = "SELECT `CitizenID` FROM `users` WHERE `CitizenID`=$active_item_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking if active user item exists')) {
                $active_item_exists = (mysqli_num_rows($result) > 0);

                $query = "SELECT ";
                $query .= "`users`.`CitizenID`, `users`.`UserTypeID` ";
                $query .= "FROM `users`, `user_types` ";
                $query .= "WHERE `users`.`UserTypeID`=`user_types`.`ID` ";
                $query .= "ORDER BY `user_types`.`Acronym` ASC, `user_types`.`Title` ASC, `users`.`UpdatedAt` DESC";
                $result = mysqli_query($con, $query);
                if (has_no_db_error('getting all user accounts')) {
                    $arr_user_accounts = array();
                    $total_items = mysqli_num_rows($result);
                    $item_limit = intval($_POST['item_limit']);
                    $did_passed_last_item = false;
                    $did_passed_active_item = false;
                    $ctr = 1;
                    while ($row = mysqli_fetch_assoc($result)) {
                        $item_id = intval($row['CitizenID']);
                        $usertype_id = intval($row['UserTypeID']);

                        // === OTHER USERS CAN'T SEE THE DEFAULT A. LIDS (SA) ACCOUNT
                        if($item_id == 1) {
                            if($arr_admin_details['citizen_id'] != 1) {
                                $total_items -= 1;
                                continue;
                            }
                        }
                        // ==========================================================

                        if ($last_item_id == '') {
                            // no last item found -> means on load
                            if($active_item_exists) {
                                // active item exists
                                array_push($arr_user_accounts, get_user_account_item($item_id));
                                $ctr += 1;

                                if($item_id == $active_item_id)
                                    $did_passed_active_item = true;

                                if ($ctr > $item_limit && $did_passed_active_item) break;
                            }
                            else {
                                // active item does not exist
                                array_push($arr_user_accounts, get_user_account_item($item_id));
                                $ctr += 1;
                                if ($ctr > $item_limit) break;
                            }
                        }
                        else {
                            // has last item found
                            // initiate get item when already passed the last item
                            if ($did_passed_last_item) {
                                array_push($arr_user_accounts, get_user_account_item($item_id));
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
                        'menu_href' => $_POST['get_user_accounts'],
                        'items' => $arr_user_accounts,
                        'total_items' => $total_items
                    );
                }
            }
        }


        // GET DATA OF 1 USER ACCOUNT
        else if(isset($_POST['get_user_account_data'])) {
            $citizen_id = intval($_POST['get_user_account_data']);
            $response['success']['data'] = get_user_account_data($citizen_id);
        }


        // CREATE NEW USER ACCOUNT
        else if(isset($_POST['create_new_useraccount'])) {
            // get the first record in user types
            $query = "SELECT `ID`, `Acronym`, `Title` FROM `user_types` WHERE 1 ORDER BY `Acronym`, `Title` LIMIT 1";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('getting one user type for creating user account')) {
                if(mysqli_num_rows($result) <= 0) {
                    $response['success']['message'] = 'UNABLE TO CREATE USER ACCOUNT';
                    $response['success']['sub_message'] = '<span style="font-size: 1.2em">A user account cannot be created because there are no <span class="text-info">USER TYPES</span> available.</span>';
                }
                else {
                    // check for unprocessed user account
                    $query = "SELECT `CitizenID` FROM `users` WHERE `CitizenID`=0";
                    $result2 = mysqli_query($con, $query);
                    if(has_no_db_error('checking for unprocessed user account')) {
                        if(mysqli_num_rows($result2) > 0) {
                            $response['success']['message'] = 'UNABLE TO CREATE USER ACCOUNT';
                            $response['success']['sub_message'] = '<span style="font-size: 1.2em">A new user account cannot be created because there is still a <span class="text-info">USER ACCOUNT</span> with <span class="text-danger">[NO CITIZEN]</span> assigned.</span>';
                        }
                        else {
                            // proceed
                            $row = mysqli_fetch_assoc($result);
                            $usertype_id = $row['ID'];
                            $usertype_acronym = $row['Acronym'];
                            $usertype_title = $row['Title'];

                            require INDEX . "php/inc/DATA_SHIFT.php";
                            $new_password = mysqli_real_escape_string($con, password_hash(CURRENT_TIME, PASSWORD_DEFAULT) . 'ebpls' . data_shift(''));
                            $query = "INSERT INTO `users`(`UserTypeID`, `CitizenID`, `Password`) VALUES($usertype_id, 0, '$new_password')";
                            mysqli_query($con, $query);
                            if (has_no_db_error('creating new user account')) {

                                // get the insert date
                                $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `users` WHERE `CitizenID`=0";
                                $result = mysqli_query($con, $query);
                                $row = mysqli_fetch_assoc($result);

                                require INDEX . 'php/inc/LIDS_CITIZEN.php';
                                $citizen = get_citizen_info(0, 'for creating user account');

                                $response['success']['data'] = array(
                                    'item_id' => 0,
                                    'item_avatar' => $citizen['avatar'],
                                    'item_maintitle' => $citizen['full_name'],
                                    'item_subtitle' => "(" . $usertype_acronym . ") " . $usertype_title,
                                    'item_update_date' => $row['UpdatedAt']
                                );

                                // append to system log (INSERT)
                                append_to_system_log(array(
                                    'action' => 'INSERT',
                                    'item' => get_user_account_item(0),
                                    'item_data' => get_user_account_data(0)
                                ));
                            }
                        }
                    }
                }
            }
        }


        // SAVE USER ACCOUNT
        else if(isset($_POST['save_useraccount'])) {
            $citizen_id = intval($_POST['save_useraccount']);
            if($citizen_id == 1 && $GLOBALS['arr_admin_details']['citizen_id'] != 1) {
                $GLOBALS['response']['error'] = 'STOP HACKING!';
            }
            else {

                // check if user account is valid
                $query = "SELECT `CitizenID` FROM `users` WHERE `CitizenID`=$citizen_id";
                $result = mysqli_query($con, $query);
                if (has_no_db_error('checking if user account exists')) {
                    if (mysqli_num_rows($result) <= 0)
                        $response['error'] = 'USER ACCOUNT NOT FOUND';
                    else {
                        $new_citizen_id = intval($_POST['citizen_id']);

                        // check if new citizen id has already a user account associated with it
                        $query = "SELECT `CitizenID` FROM `users` WHERE `CitizenID`=$new_citizen_id AND `CitizenID`!=$citizen_id";
                        $result = mysqli_query($con, $query);
                        if (has_no_db_error('checking if user account is used')) {
                            if (mysqli_num_rows($result) > 0) {
                                $response['success']['message'] = 'UNABLE TO SAVE USER ACCOUNT';
                                $response['success']['sub_message'] = '<span style="font-size: 1.2em">The <span class="text-info">CITIZEN</span> assigned has already an <span class="text-danger">EXISTING USER ACCOUNT</span>.</span>';
                            } else {

                                $usertype_id = intval($_POST['usertype_id']);

                                // check if the usertype is valid
                                $query = "SELECT `ID` FROM `user_types` WHERE `ID`=$usertype_id";
                                $result = mysqli_query($con, $query);
                                if (has_no_db_error('checking if user type is valid')) {
                                    if (mysqli_num_rows($result) <= 0)
                                        $response['error'] = 'USER TYPE NOT FOUND';
                                    else {
                                        $item = get_user_account_item($citizen_id);

                                        // check if username is available
                                        $can_proceed = false;
                                        $username = mysqli_real_escape_string($con, strip_tags(trim($_POST['username'])));
                                        if ($username == "")
                                            $can_proceed = true;
                                        else {
                                            $query = "SELECT `Username` FROM `users` WHERE `Username`='$username' AND `CitizenID`!=$citizen_id";
                                            $result = mysqli_query($con, $query);
                                            if (has_no_db_error('checking if username is valid')) {
                                                if (mysqli_num_rows($result) > 0) {
                                                    $response['success']['message'] = 'UNABLE TO SAVE USER ACCOUNT';
                                                    $response['success']['sub_message'] = '<span style="font-size: 1.2em">The <span class="text-danger">USERNAME</span> supplied is not available.</span>';
                                                } else
                                                    $can_proceed = true;
                                            }
                                        }

                                        if ($can_proceed) {
                                            $is_active = intval($_POST['is_active']);

                                            require INDEX . "php/inc/DATA_SHIFT.php";
                                            $password = mysqli_real_escape_string($con, password_hash($_POST['password'], PASSWORD_DEFAULT) . 'ebpls' . data_shift($_POST['password']));

                                            $query = "UPDATE `users` ";
                                            $query .= "SET `CitizenID`=$new_citizen_id, ";
                                            $query .= "`UserTypeID`=$usertype_id, ";
                                            $query .= "`Username`='$username', ";
                                            $query .= "`Password`='$password', ";
                                            $query .= "`IsActive`=$is_active ";
                                            $query .= "WHERE `CitizenID`=$citizen_id";

                                            mysqli_query($con, $query);
                                            if (has_no_db_error('saving user account')) {
                                                // get update date
                                                $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `users` WHERE `CitizenID`=$new_citizen_id";
                                                $result = mysqli_query($con, $query);
                                                while ($row = mysqli_fetch_assoc($result)) {
                                                    $response['success']['data'] = $row['UpdatedAt'];
                                                    break;
                                                }

                                                // append to system log (UPDATE)
                                                append_to_system_log(array(
                                                    'action' => 'UPDATE',
                                                    'item' => $item,
                                                    'item_data' => get_user_account_data($new_citizen_id)
                                                ));
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        // CHANGE PASSWORD (OWN USER ACCOUNT)
        else if(isset($_POST['change_user_account_old_password']) && isset($_POST['change_user_account_new_password'])) {
            $citizen_id = intval($arr_admin_details['citizen_id']);
            $old_password = $_POST['change_user_account_old_password'];
            $new_password = $_POST['change_user_account_new_password'];

            // check if user account is valid
            $query = "SELECT `CitizenID`, `Password` FROM `users` WHERE `CitizenID`=$citizen_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking if user account exists')) {
                if (mysqli_num_rows($result) <= 0)
                    $response['error'] = 'USER ACCOUNT NOT FOUND';
                else {
                    $row = mysqli_fetch_assoc($result);

                    require INDEX . "php/inc/DATA_SHIFT.php";
                    $arr_password = explode('ebpls', $row['Password']);
                    $password = '';
                    if(sizeof($arr_password) > 1)
                        $password =  data_shift($arr_password[1], false);

                    if($password != $old_password) {
                        $response['success']['data'] = "INCORRECT OLD PASSWORD";
                    }
                    else {
                        $new_password = mysqli_real_escape_string($con, password_hash($new_password, PASSWORD_DEFAULT) . 'ebpls' . data_shift($new_password));
                        $query  = "UPDATE `users` SET `Password`='$new_password' ";
                        $query .= "WHERE `CitizenID`=$citizen_id";
                        mysqli_query($con, $query);
                        if(has_no_db_error('changing password')) {
                            $response['success']['data'] = "";

                            // append to system log (CHANGE PASSWORD)
                            append_to_system_log(array(
                                'action' => 'CHANGE PASSWORD',
                                'item' => get_user_account_item($citizen_id),
                                'item_data' => array()
                            ));
                        }
                    }
                }
            }
        }


        // DELETE USER ACCOUNT
        else if(isset($_POST['delete_useraccount'])) {
            $citizen_id = intval($_POST['delete_useraccount']);
            if($citizen_id == 1 && $GLOBALS['arr_admin_details']['citizen_id'] != 1) {
                $GLOBALS['response']['error'] = 'STOP HACKING!';
            }
            else {
                // check if user account is valid
                $query = "SELECT `CitizenID` FROM `users` WHERE `CitizenID`=$citizen_id";
                $result = mysqli_query($con, $query);
                if (has_no_db_error('checking if user account exists')) {
                    if (mysqli_num_rows($result) <= 0)
                        $response['error'] = 'USER ACCOUNT NOT FOUND';
                    else {

                        // todo: check for associated data

                        $item = get_user_account_item($citizen_id);
                        $item_data = get_user_account_data($citizen_id);
                        $query = "DELETE FROM `users` WHERE CitizenID=$citizen_id";
                        mysqli_query($con, $query);
                        if (has_no_db_error('deleting user account')) {
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
    require '__fin.php';

?>