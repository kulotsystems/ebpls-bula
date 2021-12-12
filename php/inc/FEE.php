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
                        $GLOBALS['query']  = "SELECT `ApplicationType`, `BusinessLineID`, `FeeVariableID`, `Amount` ";
                        $GLOBALS['query'] .= "FROM `fees_classification` ";
                        $GLOBALS['query'] .= "WHERE `FeeID`=$fee_id ";
                        $GLOBALS['query'] .= "ORDER BY `ApplicationType`";
                        $resultz2 = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                        if (has_no_db_error('getting fee classifications')) {
                            while ($rowz2 = mysqli_fetch_assoc($resultz2)) {
                                $business_line_id = intval($rowz2['BusinessLineID']);

                                // get business size fee of this fee and line of business
                                $arr_business_size_fee = array();
                                $GLOBALS['query']  = "SELECT `ApplicationType`, `BusinessSizeID`, `Amount` FROM `business_sizes_fee` ";
                                $GLOBALS['query'] .= "WHERE `BusinessLineID`=$business_line_id AND `FeeID`=$fee_id AND `ApplicationType`='" . $rowz2['ApplicationType'] . "' ";
                                $GLOBALS['query'] .= "ORDER BY `ApplicationType`, `BusinessSizeID`, `CreatedAt` DESC";

                                $resultz3 = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                                if (has_no_db_error('getting fee classifications')) {
                                    while ($rowz3 = mysqli_fetch_assoc($resultz3)) {
                                        array_push($arr_business_size_fee, array(
                                            'application_type' => $rowz3['ApplicationType'],
                                            'business_size_id' => intval($rowz3['BusinessSizeID']),
                                            'amount' => floatval($rowz3['Amount'])
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
                                    'business_size_fees' => $arr_business_size_fee
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
                $GLOBALS['query']  = "SELECT `fees_classification`.`ID`, `fees_classification`.`FeeID`, `fees_classification`.`FeeVariableID`, `fees_classification`.`Amount` ";
                $GLOBALS['query'] .= "FROM `fees_classification`, `fees` ";
                $GLOBALS['query'] .= "WHERE `fees_classification`.`ApplicationType`='$application_type' ";
                $GLOBALS['query'] .= "AND `fees_classification`.`BusinessLineID`=$business_line_id ";
                $GLOBALS['query'] .= "AND ";
                $GLOBALS['query'] .= "(";
                $GLOBALS['query'] .= "  (`fees`.`IsForPoblacionOnly`=1 AND $belongs_to_poblacion=1) ";
                $GLOBALS['query'] .= "  OR ";
                $GLOBALS['query'] .= "  (`fees`.`IsForPoblacionOnly`=0) ";
                $GLOBALS['query'] .= ") ";
                $GLOBALS['query'] .= "AND `fees`.`ID`=`fees_classification`.`FeeID`";
                $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                if(has_no_db_error('getting fee classifications ' . $str_purpose)) {

                    require INDEX . 'php/inc/FEE_VARIABLE.php';
                    while($row_z = mysqli_fetch_assoc($result_z)) {
                        $fee_id = intval($row_z['FeeID']);

                        $fee = get_fee_info($fee_id, false, 'for getting application fees');
                        $fee_variable = get_fee_variable_info($row_z['FeeVariableID'], 'for getting application fees');
                        $amount = 0;

                        if($fee_variable['id'] == 2) {
                            // FIXED AMOUNT
                            $amount = floatval($row_z['Amount']);
                        }
                        else if($fee_variable['id'] == 3) {
                            // PER BUSINESS SIZE
                            $GLOBALS['query']  = "SELECT `Amount` FROM `business_sizes_fee` ";
                            $GLOBALS['query'] .= "WHERE `ApplicationType`='$application_type' ";
                            $GLOBALS['query'] .= "AND `BusinessSizeID`=$business_size_id ";
                            $GLOBALS['query'] .= "AND `BusinessLineID`=$business_line_id ";
                            $GLOBALS['query'] .= "AND FeeID=" . $row_z['FeeID'] . " ";
                            $result_2z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                            if(has_no_db_error('getting business size fee ' . $str_purpose)) {
                                if(mysqli_num_rows($result_2z) > 0) {
                                    $row_2z = mysqli_fetch_assoc($result_2z);
                                    $amount = floatval($row_2z['Amount']);
                                }
                            }
                            else {
                                require INDEX . 'php/ajax/__fin.php';
                                exit();
                            }
                        }
                        else if($fee_variable['id'] == 4) {
                            // TOTAL EMPLOYEES *
                            $amount = $total_employees * floatval($row_z['Amount']);
                        }
                        else if($fee_variable['id'] == 5) {
                            // BUSINESS AREA *
                            $amount = $business_area * floatval($row_z['Amount']);
                        }

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
                                'fee_variable' => $fee_variable['title'],
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
                                    'fee_variable' => $fee_variable['title'],
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
