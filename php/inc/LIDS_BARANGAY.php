<?php

    /**
     * get_barangay_info
     *
     * Get all barangay information
     * @param int $barangay_id - the barangay id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_barangay_info')) {
        function get_barangay_info($barangay_id, $str_purpose) {
            $barangay_id = intval($barangay_id);
            $GLOBALS['query']  = "SELECT `MunCityID`, `BrgyDesc` FROM `brgy` WHERE `BrgyID`=$barangay_id";
            $result_z = mysqli_query($GLOBALS['con_lids'], $GLOBALS['query']);
            if (has_no_db_error('getting barangay information ' . $str_purpose)) {
                $arr = array();
                require INDEX . 'php/inc/LIDS_MUNCITY.php';
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);

                    $arr = array(
                        'id' => $barangay_id,
                        'name' =>$row_z['BrgyDesc'],
                        'muncity' => get_muncity_info($row_z['MunCityID'], 'for getting barangay information')
                    );
                }
                else {
                    $arr = array(
                        'id' => 0,
                        'name' => '[barangay]',
                        'muncity' => get_muncity_info(0, 'for getting barangay information')
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
     * belongs_to_poblacion
     *
     * Detemine if a barangay id belongs to poblacion area
     * @param int $barangay_id - the barangay id
     *
     * @return bool
     *
     */
    if(!function_exists('belongs_to_poblacion')) {
        function belongs_to_poblacion($barangay_id) {
            $poblacion = array(
                8184, // SAN ROQUE
                8176, // SALVACION
                8175  // SAGRADA
            );
            return in_array($barangay_id, $poblacion);
        }
    }

?>
