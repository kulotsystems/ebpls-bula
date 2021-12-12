<?php

    /**
     * get_tax_variable_info
     *
     * Get all tax variable information
     * @param int $tax_variable_id - the tax variable id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */

    if(!function_exists('get_tax_variable_info')) {
        function get_tax_variable_info($tax_variable_id, $str_purpose) {
            $tax_variable_id = intval($tax_variable_id);
            $GLOBALS['query'] = "SELECT `Formula`, `ForNewBusiness`, `ForRenewal`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `taxes_variable` ";
            $GLOBALS['query'] .= "WHERE `ID`=$tax_variable_id";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting tax variable information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);

                    $arr = array(
                        'id' => $tax_variable_id,
                        'formula' => $row_z['Formula'],
                        'for_new' => intval($row_z['ForNewBusiness']),
                        'for_renewal' => intval($row_z['ForRenewal']),
                        'date_created' => $row_z['CreatedAt'],
                        'date_updated' => $row_z['UpdatedAt']
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
     * get_all_tax_variables
     *
     * Get all tax variables and its data
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     *
     */
    if(!function_exists('get_all_tax_variables')) {
        function get_all_tax_variables($str_purpose) {
            $arr = array();
            $GLOBALS['query'] = "SELECT `ID` FROM `taxes_variable` WHERE 1 ORDER BY `ID`";
            $resultz = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting tax variables ' . $str_purpose)) {
                while ($rowz = mysqli_fetch_assoc($resultz)) {
                    //if($rowz['ID'] != 7 && $rowz['ID'] != 8) { // UNINCLUDE (CAPITALIZATION * 0.01) / 20 and (TOTAL GROSS SALES * 0.01) / 20
                        array_push($arr, get_tax_variable_info($rowz['ID'], 'for getting tax variables'));
                    //}
                }
            }
            else {
                require INDEX . 'php/ajax/__fin.php';
                exit();
            }
            return $arr;
        }
    }

    /**
     * get_business_activity_tax
     *
     * Get the tax information of a business activity
     * @param string $application_type - NEW or RENEWAL
     * @param int $business_line_id - the line of business id
     * @param int $units - the number of units
     * @param double $capitalization - the capitalization
     * @param double $gross_sales_essential - the gross sales essential
     * @param double $gross_sales_non_essential - the gross sales non-essential
     * @param double $gross_sales_combined - the total gross sales (essential + non-essential)
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_business_activity_tax')) {
        function get_business_activity_tax($application_type, $param_business_line_id, $param_units, $param_capitalization, $param_gross_sales_essential, $param_gross_sales_non_essential, $param_gross_sales_combined, $str_purpose) {
            $arr = array();
            require INDEX . 'php/inc/BUSINESS_LINE.php';
            $line_of_business = get_line_of_business_info($param_business_line_id, true, 'for getting business activity tax ' . $str_purpose);
            $new_business_tax_variable = get_tax_variable_info($line_of_business['new_tax_var_id'], 'for getting business activity tax ' . $str_purpose);
            $renewal_business_tax_variable = get_tax_variable_info($line_of_business['renewal_tax_var_id'], 'for getting business activity tax ' . $str_purpose);

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

                                    $arr_tax['tax_amount'] = ($percent_source * ($arr_tax_brackets[$i]['percentage'] / 100)) + $arr_tax_brackets[$i]['additional_amount'];
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

            if($application_type == 'NEW') {
                $arr_tax = array(
                    'tax_amount' => 0,
                    'tax_bracket' => array()
                );
                $new_business_tax = 0;
                $tax_variable = $new_business_tax_variable['id'];
                if($tax_variable == 2) {
                    // FIXED AMOUNT
                    $new_business_tax = $line_of_business['new_tax_fixed'];
                }
                else if($tax_variable == 3) {
                    // PER CAPITALIZATION
                    $arr_tax = get_tax_from_bracket($application_type, $line_of_business['tax_brackets'], $param_capitalization, $arr_assets);
                    $new_business_tax = $arr_tax['tax_amount'];
                }
                else if($tax_variable == 7) {
                    // (Total Capitalization * 0.01) / 20
                    $new_business_tax = ($param_capitalization * 0.01) / 20;
                }
                else if($tax_variable == 9) {
                    // PER NUMBER OF UNITS
                    $arr_tax = get_tax_from_bracket($application_type, $line_of_business['tax_brackets'], $param_units, $arr_assets);
                    $new_business_tax = $arr_tax['tax_amount'];
                }
                $arr = array(
                    'tax_variable' => $new_business_tax_variable,
                    'tax_amount' => $new_business_tax,
                    'tax_bracket' => $arr_tax['tax_bracket']
                );
            }
            else if($application_type == 'RENEWAL') {
                $arr_tax = array(
                    'tax_amount' => 0,
                    'tax_bracket' => array()
                );
                $renewal_business_tax = 0;
                $tax_variable = $renewal_business_tax_variable['id'];
                if($tax_variable == 2) {
                    // FIXED AMOUNT
                    $renewal_business_tax = $line_of_business['renewal_tax_fixed'];
                }
                else if($tax_variable == 4) {
                    // PER GROSS SALES (NON-ESSENTIAL)
                    $arr_tax = get_tax_from_bracket($application_type, $line_of_business['tax_brackets'], $param_gross_sales_non_essential, $arr_assets);
                    $renewal_business_tax = $arr_tax['tax_amount'];
                }
                else if($tax_variable == 5) {
                    // PER GROSS SALES (ESSENTIAL)
                    $arr_tax = get_tax_from_bracket($application_type, $line_of_business['tax_brackets'], $param_gross_sales_essential, $arr_assets);
                    $renewal_business_tax = $arr_tax['tax_amount'];
                }
                else if($tax_variable == 6) {
                    // PER GROSS SALES (NON-ESSENTIAL + ESSENTIAL)
                    $arr_tax = get_tax_from_bracket($application_type, $line_of_business['tax_brackets'], $param_gross_sales_combined, $arr_assets);
                    $renewal_business_tax = $arr_tax['tax_amount'];
                }
                else if($tax_variable == 8) {
                    // (Total Gross Sales * 0.01) / 20
                    $renewal_business_tax = ($total_gross_sales * 0.01) / 20;
                }
                else if($tax_variable == 9) {
                    // PER NUMBER OF UNITS
                    $arr_tax = get_tax_from_bracket($application_type, $line_of_business['tax_brackets'], $param_units, $arr_assets);
                    $renewal_business_tax = $arr_tax['tax_amount'];
                }
                $arr = array(
                    'tax_variable' => $renewal_business_tax_variable,
                    'tax_amount' => $renewal_business_tax,
                    'tax_bracket' => $arr_tax['tax_bracket']
                );
            }
            return $arr;
        }
    }

?>
