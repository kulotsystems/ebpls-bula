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
                            $business_line_id = intval($_POST['business_line_id']);
                            $new_tax_status = intval($_POST['new_tax_status']);
                            $renewal_tax_status = intval($_POST['renewal_tax_status']);
                            $new_tax_fixed = floatval($_POST['new_tax_fixed']);
                            $renewal_tax_fixed = floatval($_POST['renewal_tax_fixed']);


                            // insert or update classification
                            $fees_classification_id = 0;
                            $query  = "SELECT `ID` FROM `fees_classification` WHERE `BusinessLineID`=$business_line_id AND `FeeID`=$fee_id";
                            $result = mysqli_query($con, $query);
                            if(!has_no_db_error('for checking classification existence'))
                                $can_proceed = false;
                            else {
                                if(mysqli_num_rows($result) <= 0) {
                                    // insert
                                    $query = "INSERT INTO `fees_classification`(`BusinessLineID`, `FeeID`, `FeeVariableID`, `NewTaxVariableID`, `RenewalTaxVariableID`) VALUES($business_line_id, $fee_id, 1, $new_tax_status, $renewal_tax_status)"; // FeeVariableID not needed
                                    mysqli_query($con, $query);
                                    if(!has_no_db_error('for inserting new fee classification'))
                                        $can_proceed = false;
                                    else
                                        $fees_classification_id = mysqli_insert_id($con);
                                }
                                else {
                                    // get id
                                    $row = mysqli_fetch_assoc($result);
                                    $fees_classification_id = intval($row['ID']);
                                }
                            }


                            // get previous fee brackets
                            $arr_prev_tax_brackets = array();
                            $query  = "SELECT `ID`, `ApplicationType` FROM `fees_classification_tax` ";
                            $query .= "WHERE `FeesClassificationID`=$fees_classification_id";
                            $result = mysqli_query($con, $query);
                            if(!has_no_db_error('getting previous fee brackets'))
                                $can_proceed = false;
                            else {
                                while($row = mysqli_fetch_assoc($result)) {
                                    $prev_id = intval($row['ID']);
                                    $application_type = $row['ApplicationType'];
                                    $proceed_add = false;
                                    if(($new_tax_status == 3 || $new_tax_status == 9) && $application_type == 'NEW')
                                        $proceed_add = true;
                                    else if(($renewal_tax_status == 4 || $renewal_tax_status == 5 || $renewal_tax_status == 6 || $renewal_tax_status == 9) && $application_type == 'RENEWAL')
                                        $proceed_add = true;

                                    if($proceed_add) {
                                        array_push($arr_prev_tax_brackets, array(
                                            'id' => $prev_id,
                                            'application_type' => $application_type
                                        ));
                                    }
                                }
                            }

                            if($can_proceed) {
                                // keep track of submitted prev fee brackets
                                $arr_current_tax_brackets = array();

                                // gather new id of submitted new fee brackets
                                $arr_new_tax_brackets_id_new = array();
                                $arr_new_tax_brackets_id_renewal = array();

                                // save new fee brackets
                                if ($new_tax_status == 3 || $new_tax_status == 9) {
                                    $new_tax_brackets = array();
                                    if (isset($_POST['new_tax_brackets'])) {
                                        $new_tax_brackets = $_POST['new_tax_brackets'];
                                    }

                                    for($i=0; $i<sizeof($new_tax_brackets); $i++) {
                                        $tax_bracket = $new_tax_brackets[$i];
                                        $order = intval($tax_bracket['order']);
                                        $id = intval($tax_bracket['id']);
                                        $asset_min = floatval($tax_bracket['asset_min']);
                                        $asset_max = floatval($tax_bracket['asset_max']);
                                        $tax_value = floatval($tax_bracket['tax_value']);
                                        $is_by_percentage = intval($tax_bracket['is_by_percentage']);
                                        $percentage = floatval($tax_bracket['percentage']);
                                        $of_tax_variable_id = intval($tax_bracket['of_tax_variable']);
                                        $in_excess_of = floatval($tax_bracket['in_excess_of']);
                                        $additional_tax = floatval($tax_bracket['additional_tax']);

                                        if($id == -1) { // insert
                                            $query  = "INSERT INTO `fees_classification_tax`(`ApplicationType`, `FeesClassificationID`, `AssetMinimum`, `AssetMaximum`, `Amount`, `IsByPercentage`, `Percentage`, `OfTaxVariableID`, `InExcessOf`, `AdditionalAmount`) ";
                                            $query .= "VALUES('NEW', $fees_classification_id, $asset_min, $asset_max, $tax_value, $is_by_percentage, $percentage, $of_tax_variable_id, $in_excess_of, $additional_tax)";
                                            mysqli_query($con, $query);
                                            if(!has_no_db_error('adding fee bracket for new business')) {
                                                $can_proceed = false;
                                            }
                                            array_push($arr_new_tax_brackets_id_new, array(
                                                'order' => $order,
                                                'new_id' => mysqli_insert_id($con)
                                            ));

                                        }
                                        else { // update
                                            $query  = "UPDATE `fees_classification_tax` ";
                                            $query .= "SET `AssetMinimum`=$asset_min, ";
                                            $query .= "`AssetMaximum`=$asset_max, ";
                                            $query .= "`Amount`=$tax_value, ";
                                            $query .= "`IsByPercentage`=$is_by_percentage, ";
                                            $query .= "`Percentage`=$percentage, ";
                                            $query .= "`OfTaxVariableID`=$of_tax_variable_id, ";
                                            $query .= "`InExcessOf`=$in_excess_of, ";
                                            $query .= "`AdditionalAmount`=$additional_tax ";
                                            $query .= "WHERE `ID`=$id";
                                            mysqli_query($con, $query);
                                            if(!has_no_db_error('updating tax bracket for new business')) {
                                                $can_proceed = false;
                                            }
                                            array_push($arr_current_tax_brackets, array(
                                                'id' => $id,
                                                'application_type' => 'NEW'
                                            ));
                                        }
                                    }
                                }

                                if($can_proceed) {
                                    // save renewal fee brackets
                                    if ($renewal_tax_status == 4 || $renewal_tax_status == 5 || $renewal_tax_status == 6 || $renewal_tax_status == 9) {
                                        $renewal_tax_brackets = array();
                                        if (isset($_POST['renewal_tax_brackets'])) {
                                            $renewal_tax_brackets = $_POST['renewal_tax_brackets'];
                                        }

                                        for ($i = 0; $i < sizeof($renewal_tax_brackets); $i++) {
                                            $tax_bracket = $renewal_tax_brackets[$i];
                                            $order = intval($tax_bracket['order']);
                                            $id = intval($tax_bracket['id']);
                                            $asset_min = floatval($tax_bracket['asset_min']);
                                            $asset_max = floatval($tax_bracket['asset_max']);
                                            $tax_value = floatval($tax_bracket['tax_value']);
                                            $is_by_percentage = intval($tax_bracket['is_by_percentage']);
                                            $percentage = floatval($tax_bracket['percentage']);
                                            $of_tax_variable_id = intval($tax_bracket['of_tax_variable']);
                                            $in_excess_of = floatval($tax_bracket['in_excess_of']);
                                            $additional_tax = floatval($tax_bracket['additional_tax']);

                                            if ($id == -1) { // insert
                                                $query = "INSERT INTO `fees_classification_tax`(`ApplicationType`, `FeesClassificationID`, `AssetMinimum`, `AssetMaximum`, `Amount`, `IsByPercentage`, `Percentage`, `OfTaxVariableID`, `InExcessOf`, `AdditionalAmount`) ";
                                                $query .= "VALUES('RENEWAL', $fees_classification_id, $asset_min, $asset_max, $tax_value, $is_by_percentage, $percentage, $of_tax_variable_id, $in_excess_of, $additional_tax)";
                                                mysqli_query($con, $query);
                                                if (!has_no_db_error('adding fee bracket for renewal')) {
                                                    $can_proceed = false;
                                                }
                                                array_push($arr_new_tax_brackets_id_renewal, array(
                                                    'order' => $order,
                                                    'new_id' => mysqli_insert_id($con)
                                                ));

                                            } else { // update
                                                $query = "UPDATE `fees_classification_tax` ";
                                                $query .= "SET `AssetMinimum`=$asset_min, ";
                                                $query .= "`AssetMaximum`=$asset_max, ";
                                                $query .= "`Amount`=$tax_value, ";
                                                $query .= "`IsByPercentage`=$is_by_percentage, ";
                                                $query .= "`Percentage`=$percentage, ";
                                                $query .= "`OfTaxVariableID`=$of_tax_variable_id, ";
                                                $query .= "`InExcessOf`=$in_excess_of, ";
                                                $query .= "`AdditionalAmount`=$additional_tax ";
                                                $query .= "WHERE `ID`=$id";
                                                mysqli_query($con, $query);
                                                if (!has_no_db_error('updating tax bracket for renewal')) {
                                                    $can_proceed = false;
                                                }
                                                array_push($arr_current_tax_brackets, array(
                                                    'id' => $id,
                                                    'application_type' => 'RENEWAL'
                                                ));
                                            }
                                        }
                                    }

                                    // save fee classification data
                                    if($can_proceed) {
                                        $query = "UPDATE `fees_classification` ";
                                        $query .= "SET ";
                                        $query .= "`NewTaxVariableID`=$new_tax_status, ";
                                        $query .= "`RenewalTaxVariableID`=$renewal_tax_status, ";
                                        $query .= "`NewTaxFixed`=$new_tax_fixed, ";
                                        $query .= "`RenewalTaxFixed`=$renewal_tax_fixed ";
                                        $query .= "WHERE `ID`=$fees_classification_id";
                                        mysqli_query($con, $query);
                                        if (has_no_db_error('saving fee classification')) {
                                            for ($i = 0; $i < sizeof($arr_prev_tax_brackets); $i++) {
                                                $prev_id = $arr_prev_tax_brackets[$i]['id'];
                                                $application_type = $arr_prev_tax_brackets[$i]['application_type'];

                                                $is_found = false;
                                                for ($j = 0; $j < sizeof($arr_current_tax_brackets); $j++) {
                                                    if($application_type == $arr_current_tax_brackets[$j]['application_type']) {
                                                        if ($prev_id == $arr_current_tax_brackets[$j]['id']) {
                                                            $is_found = true;
                                                            break;
                                                        }
                                                    }
                                                }

                                                if (!$is_found) {
                                                    $query = "DELETE FROM `fees_classification_tax` WHERE `ID`=$prev_id";
                                                    mysqli_query($con, $query);
                                                    if (!has_no_db_error('removing tax bracket for ' . strtolower($application_type))) {
                                                        $can_proceed = false;
                                                        break;
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