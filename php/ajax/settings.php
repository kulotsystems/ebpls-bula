<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        // FUNCTION: GET ITEM OF 1 SETTING
        function get_setting_item($setting_id) {
            require INDEX . 'php/inc/SETTING.php';
            $setting = get_setting_info($setting_id, 'for getting setting item data');
            return array(
                'item_id' => $setting_id,
                'item_avatar' => '',
                'item_maintitle' => $setting['title'],
                'item_subtitle' => $setting['desc'],
                'item_update_date' => $setting['date_updated']
            );
        }


        // FUNCTION: GET DATA OF 1 SETTING
        function get_setting_data($setting_id) {
            require INDEX . 'php/inc/SETTING.php';
            $setting = get_setting_info($setting_id, 'for getting setting data');
            return array(
                'id' => $setting['id'],
                'title' => $setting['title'],
                'desc' => $setting['desc'],
                'data' => $setting['data']
            );
        }


        // GET ALL SETTINGS
        if(isset($_POST['get_application_settings']) || isset($_POST['get_system_settings'])) {
            $last_item_id = trim($_POST['last_item']);
            $active_item_id = intval($_POST['active_item']);

            $param  = '';
            $is_system = 0;
            if(isset($_POST['get_application_settings'])) {
                $param = $_POST['get_application_settings'];
            }
            else {
                $is_system = 1;
                $param = $_POST['get_system_settings'];
            }

            // check if active item exits
            $query = "SELECT `ID` FROM `settings` WHERE `ID`=$active_item_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking if active setting item exists')) {
                $active_item_exists = (mysqli_num_rows($result) > 0);

                $query = "SELECT `ID` ";
                $query .= "FROM `settings` ";
                $query .= "WHERE `IsSystem`=$is_system ";
                $query .= "ORDER BY `ID`";
                $result = mysqli_query($con, $query);
                if (has_no_db_error('getting all settings')) {
                    $arr_settings = array();
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
                                array_push($arr_settings, get_setting_item($item_id));
                                $ctr += 1;

                                if($item_id == $active_item_id)
                                    $did_passed_active_item = true;

                                if ($ctr > $item_limit && $did_passed_active_item) break;
                            }
                            else {
                                // active item does not exist
                                array_push($arr_settings, get_setting_item($item_id));
                                $ctr += 1;
                                if ($ctr > $item_limit) break;
                            }
                        }
                        else {
                            // has last item found
                            // initiate get item when already passed the last item
                            if ($did_passed_last_item) {
                                array_push($arr_settings, get_setting_item($item_id));
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
                        'menu_href' => $param,
                        'items' => $arr_settings,
                        'total_items' => $total_items
                    );
                }
            }
        }


        // GET DATA OF 1 SETTING
        else if(isset($_POST['get_application_setting_data']) || isset($_POST['get_system_setting_data'])) {
            $setting_id = (isset($_POST['get_application_setting_data'])) ? intval($_POST['get_application_setting_data']) : intval($_POST['get_system_setting_data']);
            $response['success']['data'] = get_setting_data($setting_id);
        }

        // SAVE SETTING
        else if(isset($_POST['save_setting'])) {
            $setting_id = intval($_POST['save_setting']);

            // check if the setting is valid
            $query = "SELECT `ID` FROM `settings` WHERE `ID`=$setting_id";
            $result = mysqli_query($con, $query);
            if (has_no_db_error('checking if setting exists')) {
                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = 'SETTING NOT FOUND';
                else {
                    $item = get_setting_item($setting_id);
                    $title = mysqli_real_escape_string($con, strip_tags(trim($_POST['title'])));
                    $desc = mysqli_real_escape_string($con, strip_tags(trim($_POST['desc'])));
                    $data = array();
                    if($setting_id == 1) { // BUSINESS PERMIT SETTING
                        $data = array(
                            'permit_no_prefix' => mysqli_real_escape_string($con, strip_tags(trim($_POST['permit_no_prefix']))),
                            'permit_no_next' => intval($_POST['permit_no_next']),
                            'permit_no_digits' => intval($_POST['permit_no_digits']),
                            'plate_no_prefix' => mysqli_real_escape_string($con, strip_tags(trim($_POST['plate_no_prefix']))),
                            'plate_no_next' => intval($_POST['plate_no_next']),
                            'plate_no_digits' => intval($_POST['plate_no_digits'])
                        );
                    }
                    array_walk($data, 'utf8encode');
                    $str_data = mysqli_real_escape_string($con, strip_tags(json_encode($data)));

                    // update setting
                    $query  = "UPDATE `settings` ";
                    $query .= "SET `Title`='$title', ";
                    $query .= "`Description`='$desc', ";
                    $query .= "`Data`='$str_data' ";
                    $query .= "WHERE `ID`=$setting_id";
                    mysqli_query($con, $query);
                    if(has_no_db_error('updating setting')) {

                        // get update date
                        $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `settings` WHERE `ID`=$setting_id";
                        $result = mysqli_query($con, $query);
                        while ($row = mysqli_fetch_assoc($result)) {
                            $response['success']['data'] = $row['UpdatedAt'];
                            break;
                        }

                        // append to system log (UPDATE)
                        append_to_system_log(array(
                            'action' => 'UPDATE',
                            'item' => $item,
                            'item_data' => get_setting_data($setting_id)
                        ));
                    }
                }
            }
        }

    }
    require '__fin.php';

?>