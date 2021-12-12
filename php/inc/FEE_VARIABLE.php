<?php

    /**
     * get_fee_variable_info
     *
     * Get all fee variable information
     * @param int $fee_variable_id - the fee variable id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     * @param boolean $is_id_title_only - get fee variable id and title only
     *
     * @return array
     *
     */

    if(!function_exists('get_fee_variable_info')) {
        function get_fee_variable_info($fee_variable_id, $str_purpose, $is_id_title_only = false) {
            $fee_variable_id = intval($fee_variable_id);
            $GLOBALS['query'] = "SELECT `Title`";
            if(!$is_id_title_only) {
                $GLOBALS['query'] .= ", `FieldName`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt";
            }
            $GLOBALS['query'] .= " FROM `fees_variable` ";
            $GLOBALS['query'] .= "WHERE `ID`=$fee_variable_id";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting fee variable information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);

                    if(!$is_id_title_only) {
                        $arr = array(
                            'id' => $fee_variable_id,
                            'title' => $row_z['Title'],
                            'field_name' => $row_z['FieldName'],
                            'date_created' => $row_z['CreatedAt'],
                            'date_updated' => $row_z['UpdatedAt']
                        );
                    }
                    else {
                        $arr = array(
                            'id' => $fee_variable_id,
                            'title' => $row_z['Title']
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
     * get_all_fee_variables
     *
     * Get all fee variables and its data
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     * @param boolean $is_id_title_only - get all fee variables id and title only
     *
     * @return array
     *
     */
    if(!function_exists('get_all_fee_variables')) {
        function get_all_fee_variables($str_purpose, $is_id_title_only = false) {
            $arr = array();
            $GLOBALS['query'] = "SELECT `ID` FROM `fees_variable` WHERE 1 ORDER BY `ID`";
            $resultz = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting fee variables ' . $str_purpose)) {
                while ($rowz = mysqli_fetch_assoc($resultz)) {
                    array_push($arr, get_fee_variable_info($rowz['ID'], 'for getting fee variables', $is_id_title_only));
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
