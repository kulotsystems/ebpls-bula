<?php

    /**
     * get_province_info
     *
     * Get all province information
     * @param int $province_id - the province id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_province_info')) {
        function get_province_info($province_id, $str_purpose) {
            $province_id = intval($province_id);
            $GLOBALS['query']  = "SELECT `RegionID`, `ProvinceDesc` FROM `province` WHERE `ProvinceID`=$province_id";
            $result_z = mysqli_query($GLOBALS['con_lids'], $GLOBALS['query']);
            if (has_no_db_error('getting province information ' . $str_purpose)) {
                $arr = array();
                require INDEX . 'php/inc/LIDS_REGION.php';
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    $arr = array(
                        'id' => $province_id,
                        'name' => $row_z['ProvinceDesc'],
                        'region' => get_region_info($row_z['RegionID'], 'for getting province information')
                    );
                }
                else {
                    $arr = array(
                        'id' => 0,
                        'name' => '[province]',
                        'region' => get_region_info(0, 'for getting province information')
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
