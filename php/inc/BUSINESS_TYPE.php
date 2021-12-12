<?php

    /**
     * get_business_type_info
     *
     * Get all business type information
     * @param int $business_type_id - the business type id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_business_type_info')) {
        function get_business_type_info($business_type_id, $str_purpose) {
            $business_type_id = intval($business_type_id);
            $GLOBALS['query']  = "SELECT `Title`, `Description`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `business_types` ";
            $GLOBALS['query'] .= "WHERE `ID`=$business_type_id";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting business type information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    $arr = array(
                        'id' => $business_type_id,
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
     * get_all_business_types
     *
     * Get all business sizes and its data
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_all_business_types')) {
        function get_all_business_types($str_purpose) {
            $arr = array();
            $GLOBALS['query'] = "SELECT `ID` FROM `business_types` WHERE 1 ORDER BY `ID`";
            $resultz = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting all business types ' . $str_purpose)) {
                while ($rowz = mysqli_fetch_assoc($resultz)) {
                    array_push($arr, get_business_type_info($rowz['ID'], 'for getting all business types'));
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
