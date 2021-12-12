<?php

    /**
     * get_application_info
     *
     * Get all application information
     * @param int $application_id - the application id
     * @param boolean $include_business_activities - include business activities or not
     * $param string $stage - ENUM('edit', 'verification', 'invoice', 'permit')
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_application_info')) {
        function get_application_info($application_id, $include_business_activities, $stage, $str_purpose) {
            $application_id = intval($application_id);
            $other_table = 'applications_for' . $stage;
            $GLOBALS['query']  = "SELECT `applications`.`ApplicationType`, ";
            $GLOBALS['query'] .= "`applications`.`PaymentModeID`, ";
            $GLOBALS['query'] .= "`applications`.`BusinessID`, ";
            $GLOBALS['query'] .= "`applications`.`DTIRegNumber`, ";
            $GLOBALS['query'] .= "DATE_FORMAT(`applications`.`DTIRegDate`, '%M %e, %Y') AS DTIRegDate, ";
            $GLOBALS['query'] .= "`applications`.`CDARegNumber`, ";
            $GLOBALS['query'] .= "DATE_FORMAT(`applications`.`CDARegDate`, '%M %e, %Y') AS CDARegDate, ";
            $GLOBALS['query'] .= "`applications`.`SECRegNumber`, ";
            $GLOBALS['query'] .= "DATE_FORMAT(`applications`.`SECRegDate`, '%M %e, %Y') AS SECRegDate, ";
            $GLOBALS['query'] .= "`applications`.`ActiveRegNumber`, ";
            $GLOBALS['query'] .= "`applications`.`TotalMaleEmployees`, ";
            $GLOBALS['query'] .= "`applications`.`TotalMaleEmployeesFromLGU`, ";
            $GLOBALS['query'] .= "`applications`.`TotalFemaleEmployees`, ";
            $GLOBALS['query'] .= "`applications`.`TotalFemaleEmployeesFromLGU`, ";
            $GLOBALS['query'] .= "`applications`.`BusinessAreaSqM`, ";
            $GLOBALS['query'] .= "`applications`.`IsRenting`, ";
            $GLOBALS['query'] .= "`applications`.`LessorFullName`, ";
            $GLOBALS['query'] .= "`applications`.`LessorAddress`, ";
            $GLOBALS['query'] .= "`applications`.`LessorContactNum`, ";
            $GLOBALS['query'] .= "`applications`.`LessorEmail`, ";
            $GLOBALS['query'] .= "`applications`.`MonthlyRental`, ";
            $GLOBALS['query'] .= "DATE_FORMAT(`$other_table`.`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, ";
            $GLOBALS['query'] .= "DATE_FORMAT(`$other_table`.`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt ";
            $GLOBALS['query'] .= "FROM `applications`, `$other_table` ";
            $GLOBALS['query'] .= "WHERE `applications`.`ID`=`$other_table`.`ApplicationID` ";
            $GLOBALS['query'] .= "AND `applications`.`ID`=$application_id";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting application information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    $application_type = $row_z['ApplicationType'];

                    // get business activities and total assets
                    $arr_bus_activities = array();
                    $total_business_tax = 0;
                    $total_asset = 0;
                    if($include_business_activities) {
                        require INDEX . 'php/inc/BUSINESS_LINE.php';
                        require INDEX . 'php/inc/TAX_VARIABLE.php';
                        $GLOBALS['query']  = "SELECT `ID`, `BusinessLineID`, `Units`, `Capitalization`, `GrossSalesEssential`, `GrossSalesNonEssential` FROM `business_activities` ";
                        $GLOBALS['query'] .= "WHERE `ApplicationID`=$application_id";
                        $resultz2 = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                        if (has_no_db_error('getting business activities')) {
                            while ($rowz2 = mysqli_fetch_assoc($resultz2)) {
                                $line_of_business = get_line_of_business_info($rowz2['BusinessLineID'], false, 'for getting application information');
                                $units = intval($rowz2['Units']);
                                $capitalization = floatval($rowz2['Capitalization']);
                                $gross_sales_essential = floatval($rowz2['GrossSalesEssential']);
                                $gross_sales_non_essential = floatval($rowz2['GrossSalesNonEssential']);
                                $gross_sales_combined = $gross_sales_essential + $gross_sales_non_essential;

                                $business_tax = get_business_activity_tax($application_type, $line_of_business['id'], $units, $capitalization, $gross_sales_essential, $gross_sales_non_essential, $gross_sales_combined, 'for getting business activities');

                                $str_tax_explanation = "";
                                $str_currency_class = ($business_tax['tax_variable']['id'] != 9) ? 'sp-currency sp-amount' : 'sp-amount';
                                if(sizeof($business_tax['tax_bracket']) > 0) {
                                    $tax_bracket = $business_tax['tax_bracket'];
                                    if(isset($tax_bracket['asset_minimum']))
                                        $str_tax_explanation .= "From <span class='$str_currency_class'>" . $tax_bracket['asset_minimum'] . "</span> ";
                                    if(isset($tax_bracket['asset_maximum'])) {
                                        if($tax_bracket['asset_maximum'] == -1)
                                            $str_tax_explanation .= "and above,<br>";
                                        else
                                            $str_tax_explanation .= " to <span class='$str_currency_class'>" . $tax_bracket['asset_maximum'] . "</span><br>";
                                    }
                                    $str_tax_explanation .= "Business Tax is ";
                                    if(isset($tax_bracket['is_by_percentage'])) {
                                        if($tax_bracket['is_by_percentage'] == 1) {
                                            if(isset($tax_bracket['additional_amount'])) {
                                                if($tax_bracket['additional_amount'] > 0)
                                                    $str_tax_explanation .= "<span class='sp-amount sp-currency'>" . $tax_bracket['additional_amount'] . "</span> plus ";
                                            }
                                            if(isset($tax_bracket['percentage']))
                                                $str_tax_explanation .= "<span class='sp-amount'>" . $tax_bracket['percentage'] . "</span>% of ";
                                            if(isset($tax_bracket['of_tax_variable_id'])) {
                                                $tax_variable = get_tax_variable_info($tax_bracket['of_tax_variable_id'], "for generating business tax explanation");
                                                $str_tax_explanation .= trim($tax_variable['formula'], 'PER ');
                                            }
                                            if(isset($tax_bracket['in_excess_of'])) {
                                                if($tax_bracket['in_excess_of'] > 0)
                                                    $str_tax_explanation .= " in excess of <span class='sp-amount sp-currency'>" . $tax_bracket['in_excess_of'] . "</span>";
                                            }
                                        }
                                        else {
                                            $str_tax_explanation .= (isset($tax_bracket['tax_amount'])) ? "<span class='sp-amount sp-currency'>" . $tax_bracket['tax_amount'] . "</span>" : 0;
                                        }
                                        $str_tax_explanation .= ".";
                                    }
                                }


                                array_push($arr_bus_activities, array(
                                    'id' => intval($rowz2['ID']),
                                    'business_line_id' => $line_of_business['id'],
                                    'business_line_title' => $line_of_business['title'],
                                    'business_line_desc' => $line_of_business['desc'],
                                    'units' => $units,
                                    'capitalization' => $capitalization,
                                    'gross_sales_essential' => $gross_sales_essential,
                                    'gross_sales_non_essential' => $gross_sales_non_essential,
                                    'gross_sales_combined' => $gross_sales_combined,
                                    'business_tax_formula' => $business_tax['tax_variable']['formula'],
                                    'business_tax_explanation' => $str_tax_explanation,
                                    'business_tax' => $business_tax['tax_amount']
                                ));

                                // accumulate total assets
                                $total_business_tax += $business_tax['tax_amount'];
                                $total_asset += $gross_sales_combined;
                            }
                        }
                        else {
                            require INDEX . 'php/ajax/__fin.php';
                            exit();
                        }
                    }

                    require INDEX . 'php/inc/BUSINESS.php';
                    $business = get_business_info($row_z['BusinessID'], 'for getting application information');

                    $arr = array(
                        'id' => $application_id,
                        'business' => $business,
                        'application_type' => $application_type,
                        'business_activities' => $arr_bus_activities,
                        'total_business_tax' => $total_business_tax,
                        'total_asset' => $total_asset,
                        'payment_mode_id' => intval($row_z['PaymentModeID']),
                        'dti_number' => $row_z['DTIRegNumber'],
                        'dti_date' => $row_z['DTIRegDate'],
                        'cda_number' => $row_z['CDARegNumber'],
                        'cda_date' => $row_z['CDARegDate'],
                        'sec_number' => $row_z['SECRegNumber'],
                        'sec_date' => $row_z['SECRegDate'],
                        'active_number' => $row_z['ActiveRegNumber'],
                        'total_male_emp' => intval($row_z['TotalMaleEmployees']),
                        'total_male_emp_lgu' => intval($row_z['TotalMaleEmployeesFromLGU']),
                        'total_female_emp' => intval($row_z['TotalFemaleEmployees']),
                        'total_female_emp_lgu' => intval($row_z['TotalFemaleEmployeesFromLGU']),
                        'business_area' => floatval($row_z['BusinessAreaSqM']),
                        'is_reting' => intval($row_z['IsRenting']),
                        'lessor_fullname' => $row_z['LessorFullName'],
                        'lessor_address' => $row_z['LessorAddress'],
                        'lessor_contact_num' => $row_z['LessorContactNum'],
                        'lessor_email' => $row_z['LessorEmail'],
                        'monthly_rental' => floatval($row_z['MonthlyRental']),
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

?>
