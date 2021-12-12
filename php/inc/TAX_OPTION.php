<?php

    /**
     * get_tax_option_info
     *
     * Get all business tax option information
     * @param int $tax_option_id - the tax option id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */

    if(!function_exists('get_tax_option_info')) {
        function get_tax_option_info($tax_option_id, $str_purpose) {
            $tax_option_id = intval($tax_option_id);
            $GLOBALS['query'] = "SELECT `Title`, `Description`, `Data`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `taxes_option` ";
            $GLOBALS['query'] .= "WHERE `ID`=$tax_option_id";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting tax option information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    if($row_z['Data'] == '')
                        $row_z['Data'] = '{}';
                    $arr = array(
                        'id' => $tax_option_id,
                        'title' => $row_z['Title'],
                        'desc' => $row_z['Description'],
                        'data' => json_decode($row_z['Data'], true),
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
     * get_application_tax_penalty
     *
     * Get the business tax penalty information of an application
     * @param string $application_type - NEW or RENEWAL
     * @param string $verification_date - the date of verification
     * @param double $total_business_tax - the total business tax
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_application_tax_penalty')) {
        function get_application_tax_penalty($application_type, $verification_date, $total_business_tax, $str_purpose) {

            // get the date part of the verification date
            $arr_verification_date = explode(',', $verification_date);
            $verification_date = strtotime($arr_verification_date[0]);

            $tax_option = get_tax_option_info(1, 'for getting application business tax penalty ' . $str_purpose);
            $tax_penalty = $tax_option['data'][$application_type];
            $percentage = floatval($tax_penalty['percentage']);
            $penalty_amount = $total_business_tax * ($percentage / 100.0);

            return array(
                'percentage' => $percentage,
                'amount' => $penalty_amount,
                'effectivity_start' => $tax_penalty['date_start'],
                'effectivity_end' => $tax_penalty['date_end'],
                'tax_with_penalty' => $total_business_tax + $penalty_amount
            );
        }
    }

?>
