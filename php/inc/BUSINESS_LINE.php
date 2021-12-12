<?php

    /**
     * get_line_of_business_info
     *
     * Get all line of business information
     * @param int $business_line_id - the business line id
     * @param boolean $include_tax_brackets - include tax brackets or not
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     * @param boolean $is_id_title_only - get line of business id and title only
     *
     * @return array
     *
     */
    if(!function_exists('get_line_of_business_info')) {
        function get_line_of_business_info($business_line_id, $include_tax_brackets, $str_purpose, $is_id_title_only = false) {
            $business_line_id = intval($business_line_id);
            $GLOBALS['query'] = "SELECT `BusinessLine`";
            if(!$is_id_title_only) {
                $GLOBALS['query'] .= ", `Description`, `NewTaxVariableID`, `RenewalTaxVariableID`, `NewTaxFixed`, `RenewalTaxFixed`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt";
            }
            $GLOBALS['query'] .= " FROM `business_lines` ";
            $GLOBALS['query'] .= "WHERE `ID`=$business_line_id";

            // echo $GLOBALS['query'];

            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting line of business information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);

                    // get tax brackets
                    $arr_taxes_brackets = array();
                    if($include_tax_brackets) {
                        $GLOBALS['query']  = "SELECT `ID`, `ApplicationType`, `AssetMinimum`, `AssetMaximum`, `Amount`, `IsByPercentage`, `Percentage`, `OfTaxVariableID`, `InExcessOf`, `AdditionalAmount` ";
                        $GLOBALS['query'] .= "FROM `business_lines_tax` ";
                        $GLOBALS['query'] .= "WHERE `BusinessLineID`=$business_line_id ";
                        $GLOBALS['query'] .= "ORDER BY `ApplicationType`, `AssetMinimum`";
                        $resultz2 = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                        if (has_no_db_error('getting tax brackets in lines of business')) {
                            while ($rowz2 = mysqli_fetch_assoc($resultz2)) {
                                array_push($arr_taxes_brackets, array(
                                    'id' => intval($rowz2['ID']),
                                    'application_type' => $rowz2['ApplicationType'],
                                    'asset_minimum' => floatval($rowz2['AssetMinimum']),
                                    'asset_maximum' => floatval($rowz2['AssetMaximum']),
                                    'tax_amount' => floatval($rowz2['Amount']),
                                    'is_by_percentage' => intval($rowz2['IsByPercentage']),
                                    'percentage' => floatval($rowz2['Percentage']),
                                    'of_tax_variable_id' => intval($rowz2['OfTaxVariableID']),
                                    'in_excess_of' => floatval($rowz2['InExcessOf']),
                                    'additional_amount' => floatval($rowz2['AdditionalAmount'])
                                ));
                            }
                        }
                        else {
                            require INDEX . 'php/ajax/__fin.php';
                            exit();
                        }
                    }

                    if(!$is_id_title_only) {
                        $arr = array(
                            'id' => $business_line_id,
                            'title' => $row_z['BusinessLine'],
                            'desc' => $row_z['Description'],
                            'new_tax_var_id' => intval($row_z['NewTaxVariableID']),
                            'renewal_tax_var_id' => intval($row_z['RenewalTaxVariableID']),
                            'new_tax_fixed' => floatval($row_z['NewTaxFixed']),
                            'renewal_tax_fixed' => floatval($row_z['RenewalTaxFixed']),
                            'tax_brackets' => $arr_taxes_brackets,
                            'date_created' => $row_z['CreatedAt'],
                            'date_updated' => $row_z['UpdatedAt']
                        );
                    }
                    else {
                        $arr = array(
                            'id' => $business_line_id,
                            'title' => $row_z['BusinessLine']
                        );
                    }
                }
                else {
                    if(!$is_id_title_only) {
                        $arr = array(
                            'id' => 0,
                            'title' => '[line of business]',
                            'desc' => '[description]',
                            'new_tax_var_id' => 0,
                            'renewal_tax_var_id' => 0,
                            'new_tax_fixed' => 0,
                            'renewal_tax_fixed' => 0,
                            'tax_brackets' => array(),
                            'date_created' => '[date_created]',
                            'date_updated' => '[date_updated]'
                        );
                    }
                    else {
                        $arr = array(
                            'id' => 0,
                            'title' => '[line of business]'
                        );
                    }
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
     * get_all_lines_of_business
     *
     * Get all lines of business and its data
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     * @param boolean $is_id_title_only - get all lines of business id and title only
     *
     * @return array
     *
     */
    if(!function_exists('get_all_lines_of_business')) {
        function get_all_lines_of_business($str_purpose, $is_id_title_only = false) {
            $arr = array();
            $GLOBALS['query'] = "SELECT `ID` FROM `business_lines` WHERE 1 ORDER BY `BusinessLine`, `Description`";
            $resultz = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting all lines of business ' . $str_purpose)) {
                while ($rowz = mysqli_fetch_assoc($resultz)) {
                    array_push($arr, get_line_of_business_info($rowz['ID'], false, 'for getting all lines of business', $is_id_title_only));
                }
            }
            else {
                require INDEX . 'php/ajax/__fin.php';
                exit();
            }
            return $arr;
        }
    }
?>
