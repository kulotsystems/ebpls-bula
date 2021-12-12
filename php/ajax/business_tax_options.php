<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        // FUNCTION: GET ITEM OF 1 BUSINESS TAX OPTION
        function get_tax_option_item($tax_option_id) {
            require INDEX . 'php/inc/TAX_OPTION.php';
            $tax_option = get_tax_option_info($tax_option_id, 'for getting business tax option item data');
            return array(
                'item_id' => $tax_option_id,
                'item_avatar' => '',
                'item_maintitle' => $tax_option['title'],
                'item_subtitle' => $tax_option['desc'],
                'item_update_date' => $tax_option['date_updated']
            );
        }


        // FUNCTION: GET DATA OF 1 TAX OPTION
        function get_tax_option_data($tax_option_id) {
            require INDEX . 'php/inc/TAX_OPTION.php';
            $tax_option = get_tax_option_info($tax_option_id, 'for getting business tax option data');
            return array(
                'id' => $tax_option['id'],
                'title' => $tax_option['title'],
                'desc' => $tax_option['desc'],
                'data' => $tax_option['data']
            );
        }


        // GET ALL BUSINESS TAX OPTIONS
        if(isset($_POST['get_business_tax_options'])) {
            $last_item_id = trim($_POST['last_item']);
            $active_item_id = intval($_POST['active_item']);

            // check if active item exits
            $query = "SELECT `ID` FROM `taxes_option` WHERE `ID`=$active_item_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking if active tax option item exists')) {
                $active_item_exists = (mysqli_num_rows($result) > 0);

                $query = "SELECT `ID` ";
                $query .= "FROM `taxes_option` ";
                $query .= "WHERE 1 ";
                $query .= "ORDER BY `ID`";
                $result = mysqli_query($con, $query);
                if (has_no_db_error('getting all tax options')) {
                    $arr_tax_options = array();
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
                                array_push($arr_tax_options, get_tax_option_item($item_id));
                                $ctr += 1;

                                if($item_id == $active_item_id)
                                    $did_passed_active_item = true;

                                if ($ctr > $item_limit && $did_passed_active_item) break;
                            }
                            else {
                                // active item does not exist
                                array_push($arr_tax_options, get_tax_option_item($item_id));
                                $ctr += 1;
                                if ($ctr > $item_limit) break;
                            }
                        }
                        else {
                            // has last item found
                            // initiate get item when already passed the last item
                            if ($did_passed_last_item) {
                                array_push($arr_tax_options, get_tax_option_item($item_id));
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
                        'menu_href' => $_POST['get_business_tax_options'],
                        'items' => $arr_tax_options,
                        'total_items' => $total_items
                    );
                }
            }
        }


        // GET DATA OF 1 TAX OPTION
        else if(isset($_POST['get_business_tax_option_data'])) {
            $tax_option_id = intval($_POST['get_business_tax_option_data']);
            $response['success']['data'] = get_tax_option_data($tax_option_id);
        }


        // SAVE BUSINESS TAX OPTION
        else if(isset($_POST['save_business_tax_option'])) {
            $tax_option_id = intval($_POST['save_business_tax_option']);

            // check if the business tax option is valid
            $query = "SELECT `ID` FROM `taxes_option` WHERE `ID`=$tax_option_id";
            $result = mysqli_query($con, $query);
            if (has_no_db_error('checking if business tax option exists')) {
                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = 'BUSINESS TAX OPTION NOT FOUND';
                else {
                    $item = get_tax_option_item($tax_option_id);
                    $title = mysqli_real_escape_string($con, strip_tags(trim($_POST['title'])));
                    $desc = mysqli_real_escape_string($con, strip_tags(trim($_POST['desc'])));
                    $data = array();
                    if($tax_option_id == 1) { // BUSINESS TAX PENALTY
                        $data = array(
                            'NEW' => array(
                                'percentage' => floatval($_POST['new_tax_penalty']),
                                'date_start' => mysqli_real_escape_string($con, strip_tags(trim($_POST['new_date_start']))),
                                'date_end' => mysqli_real_escape_string($con, strip_tags(trim($_POST['new_date_end'])))
                            ),
                            'RENEWAL' => array(
                                'percentage' => floatval($_POST['renewal_tax_penalty']),
                                'date_start' => mysqli_real_escape_string($con, strip_tags(trim($_POST['renewal_date_start']))),
                                'date_end' => mysqli_real_escape_string($con, strip_tags(trim($_POST['renewal_date_end'])))
                            )
                        );
                    }
                    array_walk($data, 'utf8encode');
                    $str_data = mysqli_real_escape_string($con, strip_tags(json_encode($data)));

                    // update business tax option
                    $query  = "UPDATE `taxes_option` ";
                    $query .= "SET `Title`='$title', ";
                    $query .= "`Description`='$desc', ";
                    $query .= "`Data`='$str_data' ";
                    $query .= "WHERE `ID`=$tax_option_id";
                    mysqli_query($con, $query);
                    if(has_no_db_error('updating business tax option')) {

                        // get update date
                        $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `taxes_option` WHERE `ID`=$tax_option_id";
                        $result = mysqli_query($con, $query);
                        while ($row = mysqli_fetch_assoc($result)) {
                            $response['success']['data'] = $row['UpdatedAt'];
                            break;
                        }

                        // append to system log (UPDATE)
                        append_to_system_log(array(
                            'action' => 'UPDATE',
                            'item' => $item,
                            'item_data' => get_tax_option_data($tax_option_id)
                        ));
                    }
                }
            }
        }

    }
    require '__fin.php';

?>