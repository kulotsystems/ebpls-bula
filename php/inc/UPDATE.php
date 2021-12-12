<?php

    /**
     * get_update_info
     *
     * Get all update information
     * @param int $update_id - the update id
     * @param boolean $include_update_list - include update list or not
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */

    if(!function_exists('get_update_info')) {
        function get_update_info($update_id, $include_update_list, $str_purpose) {
            $update_id = intval($update_id);
            $GLOBALS['query']  = "SELECT `Period`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `updates_periods` ";
            $GLOBALS['query'] .= "WHERE `ID`=$update_id";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting update information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    $arr_updates = array();
                    if($include_update_list) {
                        $GLOBALS['query']  = "SELECT `ID`, `Menu`, `Tab`, `Details`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt ";
                        $GLOBALS['query'] .= "FROM `updates` ";
                        $GLOBALS['query'] .= "WHERE `UpdatePeriodID`=$update_id ";
                        $GLOBALS['query'] .= "ORDER BY UNIX_TIMESTAMP(`CreatedAt`) DESC";

                        $result_2z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                        while($row_2z = mysqli_fetch_assoc($result_2z)) {
                            array_push($arr_updates, array(
                                'id' => $row_2z['ID'],
                                'menu' => $row_2z['Menu'],
                                'tab' => $row_2z['Tab'],
                                'details' => $row_2z['Details'],
                                'date_created' => $row_2z['CreatedAt'],
                                'date_updated' => $row_2z['UpdatedAt'],
                            ));
                        }
                    }
                    $arr = array(
                        'id' => $update_id,
                        'period' => $row_z['Period'],
                        'date_created' => $row_z['CreatedAt'],
                        'date_updated' => $row_z['UpdatedAt'],
                        'updates' => $arr_updates
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
