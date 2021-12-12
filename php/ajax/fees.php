<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        // FUNCTION: GET ITEM OF 1 FEE
        function get_fee_item($fee_id) {
            require INDEX . 'php/inc/FEE.php';
            $fee = get_fee_info($fee_id, false, 'for getting fee item data');
            return array(
                'item_id' => $fee_id,
                'item_avatar' => '',
                'item_maintitle' => $fee['title'],
                'item_subtitle' => $fee['desc'],
                'item_update_date' => $fee['date_updated']
            );
        }


        // FUNCTION: GET DATA OF 1 FEE
        function get_fee_data($fee_id) {
            require INDEX . 'php/inc/FEE.php';
            require INDEX . 'php/inc/BUSINESS_LINE.php';
            require INDEX . 'php/inc/BUSINESS_SIZE.php';
            require INDEX . 'php/inc/FEE_VARIABLE.php';
            $fee = get_fee_info($fee_id, true, 'for getting fee data');
            return array(
                'title' => $fee['title'],
                'desc' => $fee['desc'],
                'is_multiple_collection' => $fee['is_multiple_collection'],
                'is_for_poblacion_only' => $fee['is_for_poblacion_only'],
                'classifications' => $fee['classifications'],
                'lines_of_business' => get_all_lines_of_business('for getting fee data', true),
                'business_sizes' => get_all_business_sizes('for getting fee data'),
                'fee_variables' => get_all_fee_variables('for getting fee data', true)
            );
        }


        // GET ALL FEES
        if(isset($_POST['get_fees'])) {
            $last_item_id = trim($_POST['last_item']);
            $active_item_id = intval($_POST['active_item']);

            // check if active item exits
            $query = "SELECT `ID` FROM `fees` WHERE `ID`=$active_item_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking if active fee item exists')) {
                $active_item_exists = (mysqli_num_rows($result) > 0);

                $query = "SELECT `ID` ";
                $query .= "FROM `fees` ";
                $query .= "WHERE 1 ";
                $query .= "ORDER BY `Title`, `Description`";
                $result = mysqli_query($con, $query);
                if (has_no_db_error('getting all fees')) {
                    $arr_fees = array();
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
                                array_push($arr_fees, get_fee_item($item_id));
                                $ctr += 1;

                                if($item_id == $active_item_id)
                                    $did_passed_active_item = true;

                                if ($ctr > $item_limit && $did_passed_active_item) break;
                            }
                            else {
                                // active item does not exist
                                array_push($arr_fees, get_fee_item($item_id));
                                $ctr += 1;
                                if ($ctr > $item_limit) break;
                            }
                        }
                        else {
                            // has last item found
                            // initiate get item when already passed the last item
                            if ($did_passed_last_item) {
                                array_push($arr_fees, get_fee_item($item_id));
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
                        'menu_href' => $_POST['get_fees'],
                        'items' => $arr_fees,
                        'total_items' => $total_items
                    );
                }
            }
        }


        // GET DATA OF 1 FEE
        else if(isset($_POST['get_fee_data'])) {
            $fee_id = intval($_POST['get_fee_data']);
            $response['success']['data'] = get_fee_data($fee_id);
        }


        // CREATE NEW FEE
        else if(isset($_POST['create_new_fee'])) {
            $fee_title = '[new fee]';
            $query = "INSERT INTO `fees`(`Title`) VALUES('$fee_title')";
            mysqli_query($con, $query);
            if (has_no_db_error('creating new fee')) {
                $id = intval(mysqli_insert_id($con));

                // get the insert date
                $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `fees` WHERE `ID`=$id";
                $result = mysqli_query($con, $query);
                $row = mysqli_fetch_assoc($result);

                $response['success']['data'] = array(
                    'item_id' => $id,
                    'item_avatar' => '',
                    'item_maintitle' => $fee_title,
                    'item_subtitle' => '',
                    'item_update_date' => $row['UpdatedAt']
                );

                // append to system log (INSERT)
                append_to_system_log(array(
                    'action' => 'INSERT',
                    'item' => get_fee_item($id),
                    'item_data' => get_fee_data($id)
                ));
            }
        }


        // SAVE FEE
        else if(isset($_POST['save_fee'])) {
            $fee_id = intval($_POST['save_fee']);

            // check if the fee is valid
            $query = "SELECT `ID` FROM `fees` WHERE `ID`=$fee_id";
            $result = mysqli_query($con, $query);
            if (has_no_db_error('checking if fee exists')) {
                if (mysqli_num_rows($result) <= 0)
                    $response['error'] = 'FEE NOT FOUND';
                else {
                    $item = get_fee_item($fee_id);
                    $fee_title = mysqli_real_escape_string($con, strip_tags(trim($_POST['title'])));

                    // check if fee title is available
                    $can_proceed = true;
                    if($fee_title != '[new fee]') {
                        $query = "SELECT `ID` FROM `fees` WHERE `Title`='$fee_title' ";
                        $query .= "AND `ID`!=$fee_id";
                        $result = mysqli_query($con, $query);
                        if (has_no_db_error('checking fee redundancy')) {
                            if(mysqli_num_rows($result) > 0) {
                                $response['success']['message'] = 'UNABLE TO SAVE FEE';
                                $response['success']['sub_message'] = '<span style="font-size: 1.2em">There is already a <span class="text-info">FEE</span> named <span class="text-danger">' . $fee_title . '.</span></span>';
                                $can_proceed = false;
                            }
                        }
                    }
                    if($can_proceed) {
                        $fee_desc = mysqli_real_escape_string($con, strip_tags(trim($_POST['desc'])));
                        $fee_is_multiple_collection = intval($_POST['is_multiple_collection']);
                        $is_for_poblacion_only = intval($_POST['is_for_poblacion_only']);
                        $arr_classifications = array();
                        if (isset($_POST['classifications'])) {
                            $arr_classifications = $_POST['classifications'];
                        }

                        // update fee record
                        $query  = "UPDATE `fees` ";
                        $query .= "SET `Title`='$fee_title', ";
                        $query .= "`Description`='$fee_desc', ";
                        $query .= "`IsMultipleCollection`=$fee_is_multiple_collection, ";
                        $query .= "`IsForPoblacionOnly`=$is_for_poblacion_only ";
                        $query .= "WHERE `ID`=$fee_id";
                        mysqli_query($con, $query);
                        if (has_no_db_error('saving fee')) {

                            // update classifications
                            $can_proceed = true;
                            for($i=0; $i<sizeof($arr_classifications); $i++) {
                                $business_line_id = intval($arr_classifications[$i]['business_line_id']);
                                $application_type = mysqli_real_escape_string($con, $arr_classifications[$i]['application_type']);
                                $fee_variable_id = intval($arr_classifications[$i]['fee_variable_id']);
                                $amount = floatval($arr_classifications[$i]['fee_amount']);

                                // check if classification exists
                                $query  = "SELECT `ID` FROM `fees_classification` ";
                                $query .= "WHERE `ApplicationType`='$application_type' ";
                                $query .= "AND `BusinessLineID`=$business_line_id ";
                                $query .= "AND `FeeID`=$fee_id";
                                $result = mysqli_query($con, $query);
                                if(!has_no_db_error('checking if fee classification exists'))
                                    $can_proceed = false;
                                else {
                                    if($fee_variable_id != 1) {

                                        // fee is applicable
                                        if (mysqli_num_rows($result) <= 0) {
                                            $query = "INSERT INTO `fees_classification`(`ApplicationType`, `BusinessLineID`, `FeeID`, `FeeVariableID`, `Amount`) ";
                                            $query .= "VALUES('$application_type', $business_line_id, $fee_id, $fee_variable_id, $amount)";
                                            mysqli_query($con, $query);
                                            if (!has_no_db_error('adding fee classification'))
                                                $can_proceed = false;
                                        }
                                        else {
                                            $row = mysqli_fetch_assoc($result);
                                            $query = "UPDATE `fees_classification` ";
                                            $query .= "SET `ApplicationType`='$application_type', ";
                                            $query .= "`BusinessLineID`=$business_line_id, ";
                                            $query .= "`FeeID`=$fee_id, ";
                                            $query .= "`FeeVariableID`=$fee_variable_id, ";
                                            $query .= "`Amount`=$amount ";
                                            $query .= "WHERE `ID`=" . intval($row['ID']);
                                            mysqli_query($con, $query);
                                            if (!has_no_db_error('updating fee classification'))
                                                $can_proceed = false;
                                        }

                                        // fee is per business size
                                        if($fee_variable_id == 3) {
                                            // fee is per business size
                                            $business_size_fees = array();
                                            if(isset($arr_classifications[$i]['business_size_fees'])) {
                                                $business_size_fees = $arr_classifications[$i]['business_size_fees'];
                                                for($j=0; $j<sizeof($business_size_fees); $j++) {
                                                    $business_size_id = intval($business_size_fees[$j]['id']);
                                                    $business_size_fee_amount = floatval($business_size_fees[$j]['amount']);

                                                    // check if business size fee exists
                                                    $query = "SELECT `ID` FROM `business_sizes_fee` ";
                                                    $query .= "WHERE `ApplicationType`='$application_type' ";
                                                    $query .= "AND `BusinessSizeID`=$business_size_id ";
                                                    $query .= "AND `BusinessLineID`=$business_line_id ";
                                                    $query .= "AND `FeeID`=$fee_id ";
                                                    $query .= "ORDER BY `CreatedAt` DESC";
                                                    $result2 = mysqli_query($con, $query);
                                                    if (!has_no_db_error('checking if business size fee exists')) {
                                                        $can_proceed = false;
                                                        break;
                                                    }
                                                    else {
                                                        if(mysqli_num_rows($result2) > 0) {
                                                            // business size fee exists
                                                            $row2 = mysqli_fetch_assoc($result2);
                                                            $business_size_fee_id = intval($row2['ID']);

                                                            $query  = "UPDATE `business_sizes_fee` ";
                                                            $query .= "SET `Amount`=$business_size_fee_amount ";
                                                            $query .= "WHERE `ID`=$business_size_fee_id";
                                                            mysqli_query($con, $query);
                                                            if (!has_no_db_error('updating business size fee')) {
                                                                $can_proceed = false;
                                                                break;
                                                            }
                                                        }
                                                        else {
                                                            // business size fee does not exist
                                                            $query  = "INSERT INTO `business_sizes_fee`(`ApplicationType`, `BusinessSizeID`, `BusinessLineID`, `FeeID`, `Amount`) ";
                                                            $query .= "VALUES('$application_type', $business_size_id, $business_line_id, $fee_id, $business_size_fee_amount)";
                                                            mysqli_query($con, $query);
                                                            if (!has_no_db_error('adding business size fee')) {
                                                                $can_proceed = false;
                                                                break;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    else {

                                        // fee is not applicable
                                        if(mysqli_num_rows($result) > 0) {
                                            $row = mysqli_fetch_assoc($result);
                                            $query  = "DELETE FROM `fees_classification` ";
                                            $query .= "WHERE `ID`=" . intval($row['ID']);
                                            mysqli_query($con, $query);
                                            if(!has_no_db_error('removing fee classification'))
                                                $can_proceed = false;
                                        }

                                    }
                                }
                            }

                            if($can_proceed) {
                                // get update date
                                $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `fees` WHERE `ID`=$fee_id";
                                $result = mysqli_query($con, $query);
                                while ($row = mysqli_fetch_assoc($result)) {
                                    $response['success']['data'] = $row['UpdatedAt'];
                                    break;
                                }

                                // append to system log (UPDATE)
                                append_to_system_log(array(
                                    'action' => 'UPDATE',
                                    'item' => $item,
                                    'item_data' => get_fee_data($fee_id)
                                ));
                            }
                        }
                    }
                }
            }
        }


        // DELETE FEE
        else if(isset($_POST['delete_fee'])) {
            $fee_id = intval($_POST['delete_fee']);

            // check if the fee is valid
            $query = "SELECT `ID` FROM `fees` WHERE `ID`=$fee_id";
            $result = mysqli_query($con, $query);
            if (has_no_db_error('checking if fee exists')) {
                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = 'FEE NOT FOUND';
                else {

                    // todo: check for associated data

                    $item = get_fee_item($fee_id);
                    $item_data = get_fee_data($fee_id);
                    $query = "DELETE FROM `fees` WHERE ID=$fee_id";
                    mysqli_query($con, $query);
                    if (has_no_db_error('deleting fee')) {
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