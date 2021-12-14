<?php

    /**
     * get_fee_info
     *
     * Get all fee information
     * @param int $fee_id - the fee id
     * @param boolean $include_lines_of_business - include lines of business or not
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */

    if(!function_exists('get_fee_info')) {
        function get_fee_info($fee_id, $include_lines_of_business, $str_purpose) {
            $fee_id = intval($fee_id);
            $GLOBALS['query'] = "SELECT `Title`, `Description`, `IsMultipleCollection`, `IsForPoblacionOnly`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `fees` ";
            $GLOBALS['query'] .= "WHERE `ID`=$fee_id";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting fee information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);

                    // get fee classification
                    $arr_lines_of_business = array();
                    if($include_lines_of_business) {
                        $GLOBALS['query']  = "SELECT `ID`, `ApplicationType`, `BusinessLineID`, `FeeVariableID`, `Amount`, `NewTaxVariableID`, `RenewalTaxVariableID`, `NewTaxFixed`, `RenewalTaxFixed` ";
                        $GLOBALS['query'] .= "FROM `fees_classification` ";
                        $GLOBALS['query'] .= "WHERE `FeeID`=$fee_id ";
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

                                array_push($arr_lines_of_business, array(
                                    'business_line_id' => $business_line_id,
                                    'application_type' => $rowz2['ApplicationType'],
                                    'fee_variable_id' => intval($rowz2['FeeVariableID']),

                                    'amount' => $rowz2['Amount'],
                                    'new_tax_var_id' => intval($rowz2['NewTaxVariableID']),
                                    'renewal_tax_var_id' => intval($rowz2['RenewalTaxVariableID']),
                                    'new_tax_fixed' => floatval($rowz2['NewTaxFixed']),
                                    'renewal_tax_fixed' => floatval($rowz2['RenewalTaxFixed']),
                                    'tax_brackets' => $arr_taxes_brackets,
                                ));
                            }
                        }
                        else {
                            require INDEX . 'php/ajax/__fin.php';
                            exit();
                        }
                    }

                    $arr = array(
                        'id' => $fee_id,
                        'title' => $row_z['Title'],
                        'desc' => $row_z['Description'],
                        'is_multiple_collection' => $row_z['IsMultipleCollection'],
                        'is_for_poblacion_only' => $row_z['IsForPoblacionOnly'],
                        'date_created' => $row_z['CreatedAt'],
                        'date_updated' => $row_z['UpdatedAt'],
                        'classifications' => $arr_lines_of_business
                    );
                }
                return $arr;
            }
            else {
                require INDEX . 'php/ajax/__fin.php';
                exit();
            }
        }
    }


    /**
     * get_application_fees
     *
     * Get the fees information of an application
     * @param string $application_type - NEW or RENEWAL
     * @param array $business_activities - an array of business activities
     * @param int $business_size - the business size
     * @param int $total_employees - the total number of employees
     * @parm double $business_area - the business area in sq. m.
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_application_fees')) {
        function get_application_fees($application_type, $business_activities, $business_size, $total_employees, $business_area, $belongs_to_poblacion, $str_purpose) {
            require INDEX . 'php/inc/BUSINESS_LINE.php';
            require INDEX . 'php/inc/FEE.php';
            require INDEX . 'php/inc/FEE_VARIABLE.php';

            $belongs_to_poblacion = intval($belongs_to_poblacion);

            // get business size id
            $business_size_id = 0;
            if(sizeof($business_size) > 0)
                $business_size_id = $business_size['id'];

            $total_fee = 0;
            $arr_fee_ids = array();
            $arr_fees_classification = array();
            // get fees classifications of lines of business
            for($i=0; $i<sizeof($business_activities); $i++) {
                $business_line_id = $business_activities[$i]['business_line_id'];

                $param_units = $business_activities[$i]['units'];
                $param_capitalization = $business_activities[$i]['capitalization'];
                $param_gross_sales_essential = $business_activities[$i]['gross_sales_essential'];
                $param_gross_sales_non_essential = $business_activities[$i]['gross_sales_non_essential'];
                $param_gross_sales_combined = $business_activities[$i]['gross_sales_combined'];

                $GLOBALS['query']  = "SELECT `fees_classification`.`ID`, `fees_classification`.`FeeID`, `fees_classification`.`FeeVariableID`, `fees_classification`.`Amount`, `fees_classification`.`NewTaxVariableID`, `fees_classification`.`RenewalTaxVariableID`, `fees_classification`.`NewTaxFixed`, `fees_classification`.`RenewalTaxFixed` ";
                $GLOBALS['query'] .= "FROM `fees_classification`, `fees` ";
                $GLOBALS['query'] .= "WHERE ";
                $GLOBALS['query'] .= "`fees_classification`.`BusinessLineID`=$business_line_id ";
                $GLOBALS['query'] .= "AND ";
                $GLOBALS['query'] .= "(";
                $GLOBALS['query'] .= "  (`fees`.`IsForPoblacionOnly`=1 AND $belongs_to_poblacion=1) ";
                $GLOBALS['query'] .= "  OR ";
                $GLOBALS['query'] .= "  (`fees`.`IsForPoblacionOnly`=0) ";
                $GLOBALS['query'] .= ") ";
                $GLOBALS['query'] .= "AND `fees`.`ID`=`fees_classification`.`FeeID`";
                $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                if(has_no_db_error('getting fee classifications ' . $str_purpose)) {

                    while($row_z = mysqli_fetch_assoc($result_z)) {
                        $fee_id = intval($row_z['FeeID']);
                        $fee    = get_fee_info($fee_id, false, '');
                        $fee_classification_id = intval($row_z['ID']);

                        $NewTaxVariableID     = $row_z['NewTaxVariableID'];
                        $RenewalTaxVariableID = $row_z['RenewalTaxVariableID'];
                        $NewTaxFixed          = $row_z['NewTaxFixed'];
                        $RenewalTaxFixed      = $row_z['RenewalTaxFixed'];

                        // get amount
                        $amount = 0;
                        // ===========================================================

                        $arr_assets = array(
                            'units' => $param_units,
                            'capitalization' => $param_capitalization,
                            'gross_sales_essential' => $param_gross_sales_essential,
                            'gross_sales_non_essential' => $param_gross_sales_non_essential,
                            'gross_sales_combined' => $param_gross_sales_combined
                        );
                        if(!function_exists('get_tax_from_bracket')) {
                            function get_tax_from_bracket($application_type, $arr_tax_brackets, $asset, $arr_assets)
                            {
                                $arr_tax = array(
                                    'tax_bracket' => array(),
                                    'tax_amount' => 0
                                );
                                for ($i = sizeof($arr_tax_brackets) - 1; $i >= 0; $i--) {
                                    if ($arr_tax_brackets[$i]['application_type'] == $application_type) {
                                        $asset_min = $arr_tax_brackets[$i]['asset_minimum'];
                                        $asset_max = $arr_tax_brackets[$i]['asset_maximum'];
                                        if ($asset_max == -1)
                                            $asset_max = PHP_INT_MAX;
                                        if ($asset >= $asset_min && $asset <= $asset_max) {
                                            $arr_tax['tax_bracket'] = $arr_tax_brackets[$i];
                                            if(intval($arr_tax_brackets[$i]['is_by_percentage']) == 1) {
                                                $percent_source = 0;
                                                switch($arr_tax_brackets[$i]['of_tax_variable_id'])
                                                {
                                                    case 3:
                                                        $percent_source = $arr_assets['capitalization'];
                                                        break;
                                                    case 4:
                                                        $percent_source = $arr_assets['gross_sales_non_essential'];
                                                        break;
                                                    case 5:
                                                        $percent_source = $arr_assets['gross_sales_essential'];
                                                        break;
                                                    case 6:
                                                        $percent_source = $arr_assets['gross_sales_combined'];
                                                        break;
                                                    case 9:
                                                        $percent_source = $arr_assets['units'];
                                                        break;
                                                }

                                                if($arr_tax_brackets[$i]['in_excess_of'] > 0) {
                                                    $percent_source -= $arr_tax_brackets[$i]['in_excess_of'];
                                                }

                                                $arr_tax['tax_amount'] = ($percent_source * ($arr_tax_brackets[$i]['percentage'] / 100) * ($arr_tax_brackets[$i]['percentage2'] / 100)) + $arr_tax_brackets[$i]['additional_amount'];
                                            }
                                            else {
                                                $arr_tax['tax_amount'] = $arr_tax_brackets[$i]['tax_amount'];
                                            }
                                            break;
                                        }
                                    }
                                }
                                return $arr_tax;
                            }
                        }


                        $arr_taxes_brackets = [];
                        $GLOBALS['query']  = "SELECT `ID`, `ApplicationType`, `AssetMinimum`, `AssetMaximum`, `Amount`, `IsByPercentage`, `Percentage`, `Percentage2`, `OfTaxVariableID`, `InExcessOf`, `AdditionalAmount` ";
                        $GLOBALS['query'] .= "FROM `fees_classification_tax` ";
                        $GLOBALS['query'] .= "WHERE `FeesClassificationID`=$fee_classification_id ";
                        $GLOBALS['query'] .= "ORDER BY `ApplicationType`, `AssetMinimum`";
                        $resultz2 = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                        if (has_no_db_error('getting tax brackets in lines of fee classification')) {
                            while ($rowz2 = mysqli_fetch_assoc($resultz2)) {
                                array_push($arr_taxes_brackets, array(
                                    'id' => intval($rowz2['ID']),
                                    'application_type' => $rowz2['ApplicationType'],
                                    'asset_minimum' => floatval($rowz2['AssetMinimum']),
                                    'asset_maximum' => floatval($rowz2['AssetMaximum']),
                                    'tax_amount' => floatval($rowz2['Amount']),
                                    'is_by_percentage' => intval($rowz2['IsByPercentage']),
                                    'percentage' => floatval($rowz2['Percentage']),
                                    'percentage2' => floatval($rowz2['Percentage2']),
                                    'of_tax_variable_id' => intval($rowz2['OfTaxVariableID']),
                                    'in_excess_of' => floatval($rowz2['InExcessOf']),
                                    'additional_amount' => floatval($rowz2['AdditionalAmount'])
                                ));
                            }
                        }

                        if($application_type == 'NEW') {
                            $arr_tax = array(
                                'tax_amount' => 0,
                                'tax_bracket' => array()
                            );
                            $new_business_tax = 0;
                            $tax_variable = $NewTaxVariableID;
                            if($tax_variable == 2) {
                                // FIXED AMOUNT
                                $new_business_tax = $NewTaxFixed;
                            }
                            else if($tax_variable == 3) {
                                // PER CAPITALIZATION
                                $arr_tax = get_tax_from_bracket($application_type, $arr_taxes_brackets, $param_capitalization, $arr_assets);
                                $new_business_tax = $arr_tax['tax_amount'];
                            }
                            else if($tax_variable == 7) {
                                // (Total Capitalization * 0.01) / 20
                                $new_business_tax = ($param_capitalization * 0.01) / 20;
                            }
                            else if($tax_variable == 9) {
                                // PER NUMBER OF UNITS
                                $arr_tax = get_tax_from_bracket($application_type, $arr_taxes_brackets, $param_units, $arr_assets);
                                $new_business_tax = $arr_tax['tax_amount'];
                            }
                            $amount = $new_business_tax;
                        }
                        else if($application_type == 'RENEWAL') {
                            $arr_tax = array(
                                'tax_amount' => 0,
                                'tax_bracket' => array()
                            );
                            $renewal_business_tax = 0;
                            $tax_variable = $RenewalTaxVariableID;
                            if($tax_variable == 2) {
                                // FIXED AMOUNT
                                $renewal_business_tax = $RenewalTaxFixed;
                            }
                            else if($tax_variable == 4) {
                                // PER GROSS SALES (NON-ESSENTIAL)
                                $arr_tax = get_tax_from_bracket($application_type, $arr_taxes_brackets, $param_gross_sales_non_essential, $arr_assets);
                                $renewal_business_tax = $arr_tax['tax_amount'];
                            }
                            else if($tax_variable == 5) {
                                // PER GROSS SALES (ESSENTIAL)
                                $arr_tax = get_tax_from_bracket($application_type, $arr_taxes_brackets, $param_gross_sales_essential, $arr_assets);
                                $renewal_business_tax = $arr_tax['tax_amount'];
                            }
                            else if($tax_variable == 6) {
                                // PER GROSS SALES (NON-ESSENTIAL + ESSENTIAL)
                                $arr_tax = get_tax_from_bracket($application_type, $arr_taxes_brackets, $param_gross_sales_combined, $arr_assets);
                                $renewal_business_tax = $arr_tax['tax_amount'];
                            }
                            else if($tax_variable == 8) {
                                // (Total Gross Sales * 0.01) / 20
                                $renewal_business_tax = ($total_gross_sales * 0.01) / 20;
                            }
                            else if($tax_variable == 9) {
                                // PER NUMBER OF UNITS
                                $arr_tax = get_tax_from_bracket($application_type, $arr_taxes_brackets, $param_units, $arr_assets);
                                $renewal_business_tax = $arr_tax['tax_amount'];
                            }
                            $amount = $renewal_business_tax;
                        }

                        // ===========================================================

                        if($fee['is_multiple_collection'] == 1) {
                            // multiple collection
                            /*if(!in_array($fee_id, $arr_fee_ids)) {
                                array_push($arr_fee_ids, $fee_id);

                                array_push($arr_fees_classification, array(
                                    'fee' => $fee['title'],
                                    'fee_variable' => $fee_variable['title'],
                                    'amount' => $amount
                                ));
                            }
                            else {
                                for($j=0; $j<sizeof($arr_fees_classification); $j++) {
                                    if($arr_fees_classification[$j]['fee'] == $fee['title']) {
                                        $arr_fees_classification[$j]['amount'] += $amount;
                                    }
                                }
                            }*/
                            $fee['title'] .= " (" . $business_activities[$i]['business_line_title'] . ")";
                            array_push($arr_fees_classification, array(
                                'fee' => $fee['title'],
                                'fee_variable' => '',
                                'amount' => $amount
                            ));
                            $total_fee += $amount;

                        }
                        else {
                            // not multiple collection
                            if(!in_array($fee_id, $arr_fee_ids)) {
                                array_push($arr_fee_ids, $fee_id);

                                array_push($arr_fees_classification, array(
                                    'fee' => $fee['title'],
                                    'fee_variable' => '',
                                    'amount' => $amount
                                ));
                                $total_fee += $amount;
                            }
                            else {
                                for($j=0; $j<sizeof($arr_fees_classification); $j++) {
                                    if($arr_fees_classification[$j]['fee'] == $fee['title']) {
                                        if($amount > $arr_fees_classification[$j]['amount']) {
                                            $total_fee -= $arr_fees_classification[$j]['amount'];
                                            $arr_fees_classification[$j]['amount'] = $amount;
                                            $total_fee += $amount;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                else {
                    require INDEX . 'php/ajax/__fin.php';
                    exit();
                }
            }
            return array(
                'fee_classifications' => $arr_fees_classification,
                'total_fee' => $total_fee
            );

        }
    }
?>
