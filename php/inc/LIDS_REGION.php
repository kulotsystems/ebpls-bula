<?php

    /**
     * get_region_info
     *
     * Get all region information
     * @param int $region_id - the region id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_region_info')) {
        function get_region_info($region_id, $str_purpose) {
            $region_id = intval($region_id);
            $GLOBALS['query']  = "SELECT `RegionDesc` FROM `region` WHERE `RegionID`=$region_id";
            $result_z = mysqli_query($GLOBALS['con_lids'], $GLOBALS['query']);
            if (has_no_db_error('getting region information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    $arr = array(
                        'id' => $region_id,
                        'name' => $row_z['RegionDesc']
                    );
                }
                else {
                    $arr = array(
                        'id' => 0,
                        'name' => '[region]'
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
