<?php

    /**
     * get_muncity_info
     *
     * Get all municipality / city information
     * @param int $muncity_id - the municipality / city id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_muncity_info')) {
        function get_muncity_info($muncity_id, $str_purpose) {
            $muncity_id = intval($muncity_id);
            $GLOBALS['query']  = "SELECT `ProvinceID`, `Type`, `MunCityDesc` FROM `muncity` WHERE `MunCityID`=$muncity_id";
            $result_z = mysqli_query($GLOBALS['con_lids'], $GLOBALS['query']);
            if (has_no_db_error('getting municipality/city information ' . $str_purpose)) {
                $arr = array();
                require INDEX . 'php/inc/LIDS_PROVINCE.php';
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    $arr = array(
                        'id' => $muncity_id,
                        'name' => $row_z['MunCityDesc'],
                        'type' => $row_z['Type'],
                        'province' => get_province_info($row_z['ProvinceID'], 'for getting municipality/city information')
                    );
                }
                else {
                    $arr = array(
                        'id' => 0,
                        'name' => '[municipality / city]',
                        'type' => '[TYPE]',
                        'province' => get_province_info(0, 'for getting municipality/city information')
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
