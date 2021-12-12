<?php

    /**
     * get_setting_info
     *
     * Get all setting information
     * @param int $setting_id - the setting id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */

    if(!function_exists('get_setting_info')) {
        function get_setting_info($setting_id, $str_purpose) {
            $setting_id = intval($setting_id);
            $GLOBALS['query'] = "SELECT `Title`, `Description`, `Data`, `IsSystem`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `settings` ";
            $GLOBALS['query'] .= "WHERE `ID`=$setting_id";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting setting information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    if($row_z['Data'] == '')
                        $row_z['Data'] = '{}';
                    $arr = array(
                        'id' => $setting_id,
                        'title' => $row_z['Title'],
                        'desc' => $row_z['Description'],
                        'data' => json_decode($row_z['Data'], true),
                        'is_system' => $row_z['IsSystem'],
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
     * get_business_permit_setting
     *
     * Get all business permit setting information
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_business_permit_setting')) {
        function get_business_permit_setting($str_purpose) {
            $setting = get_setting_info(1, 'for getting business permit information ' . $str_purpose);
            $arr_data = $setting['data'];
            return array(
                'permit_no_prefix' => (isset($arr_data['permit_no_prefix'])) ? $arr_data['permit_no_prefix'] : '',
                'permit_no_next' => (isset($arr_data['permit_no_next'])) ? intval($arr_data['permit_no_next']) : 0,
                'permit_no_digits' => (isset($arr_data['permit_no_digits'])) ? intval($arr_data['permit_no_digits']) : 3,
                'plate_no_prefix' => (isset($arr_data['plate_no_prefix'])) ? $arr_data['plate_no_prefix'] : '',
                'plate_no_next' => (isset($arr_data['plate_no_next'])) ? intval($arr_data['plate_no_next']) : 0,
                'plate_no_digits' => (isset($arr_data['plate_no_digits'])) ? intval($arr_data['plate_no_digits']) : 3
            );
        }
    }

    /**
     * write_setting_data
     *
     * Write a value to a setting data
     * @param int $setting_id - the setting id
     * @param string $data_index - the setting data index
     * @param string $data_value - the value to be written
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     */
    if(!function_exists('write_setting_data')) {
        function write_setting_data($setting_id, $data_index, $data_value, $str_purpose) {
            $arr_data = array();
            if($setting_id == 1)
                $arr_data = get_business_permit_setting('for writing to setting data ' . $str_purpose);
            if(sizeof($arr_data) > 0) {
                if(isset($arr_data[$data_index])) {
                    $arr_data[$data_index] = $data_value;
                    array_walk($arr_data, 'utf8encode');
                    $str_data = mysqli_real_escape_string($GLOBALS['con'], json_encode($arr_data));

                    $GLOBALS['query']  = "UPDATE `settings` ";
                    $GLOBALS['query'] .= "SET `Data`='$str_data' ";
                    $GLOBALS['query'] .= "WHERE `ID`=$setting_id";
                    mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                    if(!has_no_db_error('writing to setting data ' . $str_purpose)) {
                        require INDEX . 'php/ajax/__fin.php';
                        exit();
                    }
                }
            }
        }
    }

?>
