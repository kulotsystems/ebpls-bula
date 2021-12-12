<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        // FUNCTION: GET ITEM OF 1 BUSINESS SIZE
        function get_business_size_item($business_size_id) {
            require INDEX . 'php/inc/BUSINESS_SIZE.php';
            $business_size = get_business_size_info($business_size_id, 'for getting business size item data');
            return array(
                'item_id' => $business_size_id,
                'item_avatar' => '',
                'item_maintitle' => $business_size['title'],
                'item_subtitle' => $business_size['desc'],
                'item_update_date' => $business_size['date_updated']
            );
        }


        // FUNCTION: GET DATA OF 1 BUSINESS SIZE
        function get_business_size_data($business_size_id) {
            require INDEX . 'php/inc/BUSINESS_SIZE.php';
            $business_size = get_business_size_info($business_size_id, 'for getting business size data');
            return array(
                'title' => $business_size['title'],
                'desc' => $business_size['desc'],
                'asset_limit_from' => $business_size['asset_limit_from'],
                'asset_limit_to' => $business_size['asset_limit_to'],
                'total_workers_from' => $business_size['total_workers_from'],
                'total_workers_to' => $business_size['total_workers_to']
            );
        }


        // GET ALL BUSINESS SIZES
        if(isset($_POST['get_business_sizes'])) {
            $last_item_id = trim($_POST['last_item']);
            $active_item_id = intval($_POST['active_item']);

            // check if active item exits
            $query = "SELECT `ID` FROM `business_sizes` WHERE `ID`=$active_item_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking if active business size item exists')) {
                $active_item_exists = (mysqli_num_rows($result) > 0);

                $query = "SELECT `ID` ";
                $query .= "FROM `business_sizes` ";
                $query .= "WHERE 1 ";
                $query .= "ORDER BY `AssetLimitFrom`, `AssetLimitTo`, `TotalWorkersFrom`, `TotalWorkersTo`";
                $result = mysqli_query($con, $query);
                if (has_no_db_error('getting all business sizes')) {
                    $arr_business_sizes = array();
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
                                array_push($arr_business_sizes, get_business_size_item($item_id));
                                $ctr += 1;

                                if($item_id == $active_item_id)
                                    $did_passed_active_item = true;

                                if ($ctr > $item_limit && $did_passed_active_item) break;
                            }
                            else {
                                // active item does not exist
                                array_push($arr_business_sizes, get_business_size_item($item_id));
                                $ctr += 1;
                                if ($ctr > $item_limit) break;
                            }
                        }
                        else {
                            // has last item found
                            // initiate get item when already passed the last item
                            if ($did_passed_last_item) {
                                array_push($arr_business_sizes, get_business_size_item($item_id));
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
                        'menu_href' => $_POST['get_business_sizes'],
                        'items' => $arr_business_sizes,
                        'total_items' => $total_items
                    );
                }
            }
        }


        // GET DATA OF 1 BUSINESS SIZE
        else if(isset($_POST['get_business_size_data'])) {
            $business_size_id = intval($_POST['get_business_size_data']);
            $response['success']['data'] = get_business_size_data($business_size_id);
        }


        // CREATE NEW BUSINESS SIZE
        else if(isset($_POST['create_new_business_size'])) {
            $business_size_title = '[new business size]';
            $query = "INSERT INTO `business_sizes`(`Title`) VALUES('$business_size_title')";
            mysqli_query($con, $query);
            if (has_no_db_error('creating new business size')) {
                $id = intval(mysqli_insert_id($con));

                // get the insert date
                $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `business_sizes` WHERE `ID`=$id";
                $result = mysqli_query($con, $query);
                $row = mysqli_fetch_assoc($result);

                $response['success']['data'] = array(
                    'item_id' => $id,
                    'item_avatar' => '',
                    'item_maintitle' => $business_size_title,
                    'item_subtitle' => '',
                    'item_update_date' => $row['UpdatedAt']
                );

                // append to system log (INSERT)
                append_to_system_log(array(
                    'action' => 'INSERT',
                    'item' => get_business_size_item($id),
                    'item_data' => get_business_size_data($id)
                ));
            }
        }


        // SAVE BUSINESS SIZE
        else if(isset($_POST['save_business_size'])) {
            $business_size_id = intval($_POST['save_business_size']);

            // check if the line of business is valid
            $query = "SELECT `ID` FROM `business_sizes` WHERE `ID`=$business_size_id";
            $result = mysqli_query($con, $query);
            if (has_no_db_error('checking if business size exists')) {
                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = 'BUSINESS SIZE NOT FOUND';
                else {
                    $item = get_business_size_item($business_size_id);
                    $business_size_title = mysqli_real_escape_string($con, strip_tags(trim($_POST['title'])));
                    $description = mysqli_real_escape_string($con, strip_tags(trim($_POST['desc'])));
                    $asset_limit_from = floatval($_POST['asset_limit_from']);
                    $asset_limit_to = floatval($_POST['asset_limit_to']);
                    $total_workers_from = floatval($_POST['total_workers_from']);
                    $total_workers_to = floatval($_POST['total_workers_to']);

                    // check if $business_size_title is available
                    $can_proceed = true;
                    if($business_size_title != '[new business size]') {
                        $query = "SELECT `ID` FROM `business_sizes` WHERE `Title`='$business_size_title' ";
                        $query .= "AND `ID`!=$business_size_id";
                        $result = mysqli_query($con, $query);
                        if (has_no_db_error('checking business size redundancy')) {
                            if(mysqli_num_rows($result) > 0) {
                                $response['success']['message'] = 'UNABLE TO SAVE LINE OF BUSINESS';
                                $response['success']['sub_message'] = '<span style="font-size: 1.2em">There is already a <span class="text-info">BUSINESS SIZE</span> named <span class="text-danger">' . $business_size_title . '.</span></span>';
                                $can_proceed = false;
                            }
                        }
                    }
                    if($can_proceed) {
                        $query  = "UPDATE `business_sizes` ";
                        $query .= "SET `Title`='$business_size_title', ";
                        $query .= "`Description`='$description', ";
                        $query .= "`AssetLimitFrom`=$asset_limit_from, ";
                        $query .= "`AssetLimitTo`=$asset_limit_to, ";
                        $query .= "`TotalWorkersFrom`=$total_workers_from, ";
                        $query .= "`TotalWorkersTo`=$total_workers_to ";
                        $query .= "WHERE `ID`=$business_size_id";
                        mysqli_query($con, $query);
                        if (has_no_db_error('saving business size')) {
                            // get update date
                            $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `business_sizes` WHERE `ID`=$business_size_id";
                            $result = mysqli_query($con, $query);
                            while ($row = mysqli_fetch_assoc($result)) {
                                $response['success']['data'] = $row['UpdatedAt'];
                                break;
                            }
                        }

                        // append to system log (UPDATE)
                        append_to_system_log(array(
                            'action' => 'UPDATE',
                            'item' => $item,
                            'item_data' => get_business_size_data($business_size_id)
                        ));
                    }
                }
            }
        }


        // DELETE BUSINESS SIZE
        else if(isset($_POST['delete_business_size'])) {
            $business_size_id = intval($_POST['delete_business_size']);

            // check if the business size is valid
            $query = "SELECT `ID` FROM `business_sizes` WHERE `ID`=$business_size_id";
            $result = mysqli_query($con, $query);
            if (has_no_db_error('checking if business size exists')) {
                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = 'BUSINESS SIZE NOT FOUND';
                else {

                    // todo: check for associated data

                    $item = get_business_size_item($business_size_id);
                    $item_data = get_business_size_data($business_size_id);
                    $query = "DELETE FROM `business_sizes` WHERE ID=$business_size_id";
                    mysqli_query($con, $query);
                    if (has_no_db_error('deleting business size')) {
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
    require '__fin.php';

?>