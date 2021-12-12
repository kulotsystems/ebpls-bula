<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        // FUNCTION: GET ITEM OF 1 LINE OF BUSINESS
        function get_line_of_business_item($business_line_id) {
            require INDEX . 'php/inc/BUSINESS_LINE.php';
            $line_of_business = get_line_of_business_info($business_line_id, false, 'for getting line of business item data');
            return array(
                'item_id' => $business_line_id,
                'item_avatar' => '',
                'item_maintitle' => $line_of_business['title'],
                'item_subtitle' => $line_of_business['desc'],
                'item_update_date' => $line_of_business['date_updated']
            );
        }


        // FUNCTION: GET DATA OF 1 LINE OF BUSINESS
        function get_line_of_business_data($business_line_id) {
            require INDEX . 'php/inc/BUSINESS_LINE.php';
            require INDEX . 'php/inc/TAX_VARIABLE.php';
            $line_of_business = get_line_of_business_info($business_line_id, true, 'for getting line of business data');
            return array(
                'business_line' => $line_of_business['title'],
                'desc' => $line_of_business['desc'],
                'new_tax_var_id' => $line_of_business['new_tax_var_id'],
                'renewal_tax_var_id' => $line_of_business['renewal_tax_var_id'],
                'new_tax_fixed' => $line_of_business['new_tax_fixed'],
                'renewal_tax_fixed' => $line_of_business['renewal_tax_fixed'],
                'tax_variables' => get_all_tax_variables('for getting line of business data'),
                'tax_brackets' => $line_of_business['tax_brackets']
            );
        }


        // GET ALL LINES OF BUSINESS
        if(isset($_POST['get_lines_of_business'])) {
            $last_item_id = trim($_POST['last_item']);
            $active_item_id = intval($_POST['active_item']);

            // check if active item exits
            $query = "SELECT `ID` FROM `business_lines` WHERE `ID`=$active_item_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking if active line of business item exists')) {
                $active_item_exists = (mysqli_num_rows($result) > 0);

                $query = "SELECT `ID` ";
                $query .= "FROM `business_lines` ";
                $query .= "WHERE 1 ";
                $query .= "ORDER BY `BusinessLine`, `Description`";
                $result = mysqli_query($con, $query);
                if (has_no_db_error('getting all lines of business')) {
                    $arr_lines_of_business = array();
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
                                array_push($arr_lines_of_business, get_line_of_business_item($item_id));
                                $ctr += 1;

                                if($item_id == $active_item_id)
                                    $did_passed_active_item = true;

                                if ($ctr > $item_limit && $did_passed_active_item) break;
                            }
                            else {
                                // active item does not exist
                                array_push($arr_lines_of_business, get_line_of_business_item($item_id));
                                $ctr += 1;
                                if ($ctr > $item_limit) break;
                            }
                        }
                        else {
                            // has last item found
                            // initiate get item when already passed the last item
                            if ($did_passed_last_item) {
                                array_push($arr_lines_of_business, get_line_of_business_item($item_id));
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
                        'menu_href' => $_POST['get_lines_of_business'],
                        'items' => $arr_lines_of_business,
                        'total_items' => $total_items
                    );
                }
            }
        }


        // GET DATA OF 1 LINE OF BUSINESS
        else if(isset($_POST['get_line_of_business_data'])) {
            $business_line_id = intval($_POST['get_line_of_business_data']);
            $response['success']['data'] = get_line_of_business_data($business_line_id);
        }


        // CREATE NEW LINE OF BUSINESS
        else if(isset($_POST['create_new_line_of_business'])) {
            $business_line_title = '[new line of business]';
            $query = "INSERT INTO `business_lines`(`BusinessLine`) VALUES('$business_line_title')";
            mysqli_query($con, $query);
            if (has_no_db_error('creating new line of business')) {
                $id = intval(mysqli_insert_id($con));

                // get the insert date
                $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `business_lines` WHERE `ID`=$id";
                $result = mysqli_query($con, $query);
                $row = mysqli_fetch_assoc($result);

                $response['success']['data'] = array(
                    'item_id' => $id,
                    'item_avatar' => '',
                    'item_maintitle' => $business_line_title,
                    'item_subtitle' => '',
                    'item_update_date' => $row['UpdatedAt']
                );

                // append to system log (INSERT)
                append_to_system_log(array(
                    'action' => 'INSERT',
                    'item' => get_line_of_business_item($id),
                    'item_data' => get_line_of_business_data($id)
                ));
            }
        }


        // SAVE LINE OF BUSINESS
        else if(isset($_POST['save_line_of_business'])) {
            $business_line_id = intval($_POST['save_line_of_business']);

            // check if the line of business is valid
            $query = "SELECT `ID` FROM `business_lines` WHERE `ID`=$business_line_id";
            $result = mysqli_query($con, $query);
            if (has_no_db_error('checking if line of business exists')) {
                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = 'LINE OF BUSINESS NOT FOUND';
                else {
                    $item = get_line_of_business_item($business_line_id);
                    $business_line_title = mysqli_real_escape_string($con, strip_tags(trim($_POST['title'])));
                    $business_line_desc = mysqli_real_escape_string($con, strip_tags(trim($_POST['desc'])));

                    // check if BusinessLine is available
                    $can_proceed = true;
                    if($business_line_title != '[new line of business]') {
                        $query = "SELECT `ID` FROM `business_lines` WHERE `BusinessLine`='$business_line_title' ";
                        $query .= "AND `ID`!=$business_line_id";
                        $result = mysqli_query($con, $query);
                        if (has_no_db_error('checking line of business redundancy')) {
                            if(mysqli_num_rows($result) > 0) {
                                $response['success']['message'] = 'UNABLE TO SAVE LINE OF BUSINESS';
                                $response['success']['sub_message'] = '<span style="font-size: 1.2em">There is already a <span class="text-info">LINE OF BUSINESS</span> named <span class="text-danger">' . $business_line_title . '.</span></span>';
                                $can_proceed = false;
                            }
                        }
                    }
                    if($can_proceed) {
                        $new_tax_status = intval($_POST['new_tax_status']);
                        $renewal_tax_status = intval($_POST['renewal_tax_status']);
                        $new_tax_fixed = floatval($_POST['new_tax_fixed']);
                        $renewal_tax_fixed = floatval($_POST['renewal_tax_fixed']);

                        // get previous tax brackets
                        $arr_prev_tax_brackets = array();
                        $query  = "SELECT `ID`, `ApplicationType` FROM `business_lines_tax` ";
                        $query .= "WHERE `BusinessLineID`=$business_line_id";
                        $result = mysqli_query($con, $query);
                        if(!has_no_db_error('getting previous tax brackets'))
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

                            // keep track of submitted prev tax brackets
                            $arr_current_tax_brackets = array();

                            // gather new id of submitted new tax brackets
                            $arr_new_tax_brackets_id_new = array();
                            $arr_new_tax_brackets_id_renewal = array();

                            // save new tax brackets
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
                                        $query  = "INSERT INTO `business_lines_tax`(`ApplicationType`, `BusinessLineID`, `AssetMinimum`, `AssetMaximum`, `Amount`, `IsByPercentage`, `Percentage`, `OfTaxVariableID`, `InExcessOf`, `AdditionalAmount`) ";
                                        $query .= "VALUES('NEW', $business_line_id, $asset_min, $asset_max, $tax_value, $is_by_percentage, $percentage, $of_tax_variable_id, $in_excess_of, $additional_tax)";
                                        mysqli_query($con, $query);
                                        if(!has_no_db_error('adding tax bracket for new business')) {
                                            $can_proceed = false;
                                        }
                                        array_push($arr_new_tax_brackets_id_new, array(
                                            'order' => $order,
                                            'new_id' => mysqli_insert_id($con)
                                        ));

                                    }
                                    else { // update
                                        $query  = "UPDATE `business_lines_tax` ";
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
                                // save renewal tax brackets
                                if ($renewal_tax_status == 4 || $renewal_tax_status == 5 || $renewal_tax_status == 6 || $renewal_tax_status == 9) {
                                    $renewal_tax_brackets = array();
                                    if (isset($_POST['renewal_tax_brackets'])) {
                                        $renewal_tax_brackets = $_POST['renewal_tax_brackets'];
                                    }

                                    for($i=0; $i<sizeof($renewal_tax_brackets); $i++) {
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

                                        if($id == -1) { // insert
                                            $query  = "INSERT INTO `business_lines_tax`(`ApplicationType`, `BusinessLineID`, `AssetMinimum`, `AssetMaximum`, `Amount`, `IsByPercentage`, `Percentage`, `OfTaxVariableID`, `InExcessOf`, `AdditionalAmount`) ";
                                            $query .= "VALUES('RENEWAL', $business_line_id, $asset_min, $asset_max, $tax_value, $is_by_percentage, $percentage, $of_tax_variable_id, $in_excess_of, $additional_tax)";
                                            mysqli_query($con, $query);
                                            if(!has_no_db_error('adding tax bracket for renewal')) {
                                                $can_proceed = false;
                                            }
                                            array_push($arr_new_tax_brackets_id_renewal, array(
                                                'order' => $order,
                                                'new_id' => mysqli_insert_id($con)
                                            ));

                                        }
                                        else { // update
                                            $query  = "UPDATE `business_lines_tax` ";
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
                                            if(!has_no_db_error('updating tax bracket for renewal')) {
                                                $can_proceed = false;
                                            }
                                            array_push($arr_current_tax_brackets, array(
                                                'id' => $id,
                                                'application_type' => 'RENEWAL'
                                            ));
                                        }
                                    }

                                }

                                // save line of business data
                                if ($can_proceed) {
                                    $query = "UPDATE `business_lines` ";
                                    $query .= "SET `BusinessLine`='$business_line_title', ";
                                    $query .= "`Description`='$business_line_desc', ";
                                    $query .= "`NewTaxVariableID`=$new_tax_status, ";
                                    $query .= "`RenewalTaxVariableID`=$renewal_tax_status, ";
                                    $query .= "`NewTaxFixed`=$new_tax_fixed, ";
                                    $query .= "`RenewalTaxFixed`=$renewal_tax_fixed ";
                                    $query .= "WHERE `ID`=$business_line_id";
                                    mysqli_query($con, $query);
                                    if (has_no_db_error('saving line of business')) {

                                        // consolidate $arr_prev_tax_brackets and $arr_current_tax_brackets
                                        // delete unincluded tax brackets

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
                                                $query = "DELETE FROM `business_lines_tax` WHERE `ID`=$prev_id";
                                                mysqli_query($con, $query);
                                                if (!has_no_db_error('removing tax bracket for ' . strtolower($application_type))) {
                                                    $can_proceed = false;
                                                    break;
                                                }
                                            }
                                        }


                                        if($can_proceed) {
                                            // get update date
                                            $update_date = '';
                                            $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `business_lines` WHERE `ID`=$business_line_id";
                                            $result = mysqli_query($con, $query);
                                            while ($row = mysqli_fetch_assoc($result)) {
                                                $update_date = $row['UpdatedAt'];
                                                break;
                                            }
                                            $response['success']['data'] = array(
                                                'update_date' => $update_date,
                                                'new_tax_brackets_id_new' => $arr_new_tax_brackets_id_new,
                                                'new_tax_brackets_id_renewal' => $arr_new_tax_brackets_id_renewal
                                            );

                                            // append to system log (UPDATE)
                                            append_to_system_log(array(
                                                'action' => 'UPDATE',
                                                'item' => $item,
                                                'item_data' => get_line_of_business_data($business_line_id)
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


        // DELETE LINE OF BUSINESS
        else if(isset($_POST['delete_line_of_business'])) {
            $business_line_id = intval($_POST['delete_line_of_business']);

            // check if the line of business is valid
            $query = "SELECT `ID` FROM `business_lines` WHERE `ID`=$business_line_id";
            $result = mysqli_query($con, $query);
            if (has_no_db_error('checking if line of business exists')) {
                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = 'LINE OF BUSINESS NOT FOUND';
                else {

                    // todo: check for associated data

                    $item = get_line_of_business_item($business_line_id);
                    $item_data = get_line_of_business_data($business_line_id);
                    $query = "DELETE FROM `business_lines` WHERE ID=$business_line_id";
                    mysqli_query($con, $query);
                    if (has_no_db_error('deleting line of business')) {
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

        // GET FEE SETTINGS
        else if(isset($_POST['get_fee_settings_for'])) {


            $business_line_id = intval($_POST['get_fee_settings_for']);
            $fee_id = intval($_POST['fee_id']);

            // get fee classification
            $res = [];
            $GLOBALS['query']  = "SELECT `ID`, `ApplicationType`, `BusinessLineID`, `FeeVariableID`, `Amount`, `NewTaxVariableID`, `RenewalTaxVariableID`, `NewTaxFixed`, `RenewalTaxFixed` ";
            $GLOBALS['query'] .= "FROM `fees_classification` ";
            $GLOBALS['query'] .= "WHERE `FeeID`=$fee_id AND `BusinessLineID`=$business_line_id ";
            $GLOBALS['query'] .= "ORDER BY `ApplicationType`";

            $resultz2 = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting fee classifications')) {
                while ($rowz2 = mysqli_fetch_assoc($resultz2)) {
                    $business_line_id = intval($rowz2['BusinessLineID']);
                    $fees_classif_id  = intval($rowz2['ID']);

                    // get tax brackets
                    $arr_taxes_brackets = array();
                    $GLOBALS['query']  = "SELECT `ID`, `ApplicationType`, `AssetMinimum`, `AssetMaximum`, `Amount`, `IsByPercentage`, `Percentage`, `OfTaxVariableID`, `InExcessOf`, `AdditionalAmount` ";
                    $GLOBALS['query'] .= "FROM `fees_classification_tax` ";
                    $GLOBALS['query'] .= "WHERE `FeesClassificationID`=$fees_classif_id ";
                    $GLOBALS['query'] .= "ORDER BY `ApplicationType`, `AssetMinimum`";
                    $resultz3 = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                    if (has_no_db_error('getting tax brackets in fees classification')) {
                        while ($rowz3 = mysqli_fetch_assoc($resultz3)) {
                            array_push($arr_taxes_brackets, array(
                                'id' => intval($rowz3['ID']),
                                'application_type' => $rowz3['ApplicationType'],
                                'asset_minimum' => floatval($rowz3['AssetMinimum']),
                                'asset_maximum' => floatval($rowz3['AssetMaximum']),
                                'tax_amount' => floatval($rowz3['Amount']),
                                'is_by_percentage' => intval($rowz3['IsByPercentage']),
                                'percentage' => floatval($rowz3['Percentage']),
                                'of_tax_variable_id' => intval($rowz3['OfTaxVariableID']),
                                'in_excess_of' => floatval($rowz3['InExcessOf']),
                                'additional_amount' => floatval($rowz3['AdditionalAmount'])
                            ));
                        }
                    }
                    else {
                        require INDEX . 'php/ajax/__fin.php';
                        exit();
                    }


                    $res = [
                        'business_line_id' => $business_line_id,
                        'application_type' => $rowz2['ApplicationType'],
                        'fee_variable_id' => intval($rowz2['FeeVariableID']),

                        'amount' => $rowz2['Amount'],
                        'new_tax_var_id' => intval($rowz2['NewTaxVariableID']),
                        'renewal_tax_var_id' => intval($rowz2['RenewalTaxVariableID']),
                        'new_tax_fixed' => floatval($rowz2['NewTaxFixed']),
                        'renewal_tax_fixed' => floatval($rowz2['RenewalTaxFixed']),
                        'tax_brackets' => $arr_taxes_brackets,
                    ];
                }

                require INDEX . 'php/inc/TAX_VARIABLE.php';
                $res['tax_variables'] = get_all_tax_variables('for getting fee settings');

                $response['success']['data'] = $res;

            }
            else {
                require INDEX . 'php/ajax/__fin.php';
                exit();
            }
        }
    }
    require '__fin.php';

?>