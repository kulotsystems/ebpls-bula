<?php

    /**
     * get_payment_mode_info
     *
     * Get all payment mode information
     * @param int $payment_mode_id - the payment mode id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_payment_mode_info')) {
        function get_payment_mode_info($payment_mode_id, $str_purpose) {
            $payment_mode_id = intval($payment_mode_id);
            $GLOBALS['query']  = "SELECT `Title`, `Description`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `payment_modes` ";
            $GLOBALS['query'] .= "WHERE `ID`=$payment_mode_id";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting payment mode information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    $arr = array(
                        'id' => $payment_mode_id,
                        'title' => $row_z['Title'],
                        'desc' => $row_z['Description'],
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
     * get_all_payment_modes
     *
     * Get all payment modes and its data
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_all_payment_modes')) {
        function get_all_payment_modes($str_purpose) {
            $arr = array();
            $GLOBALS['query'] = "SELECT `ID` FROM `payment_modes` WHERE 1 ORDER BY `ID`";
            $resultz = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting all payment modes ' . $str_purpose)) {
                while ($rowz = mysqli_fetch_assoc($resultz)) {
                    array_push($arr, get_payment_mode_info($rowz['ID'], 'for getting all payment modes'));
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
