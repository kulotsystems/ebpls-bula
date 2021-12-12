<?php

    /**
     * get_business_size_info
     *
     * Get all business size information
     * @param int $business_size_id - the business size id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     * @param boolean $is_id_title_only - get business size id and title only
     *
     * @return array
     *
     */
    if(!function_exists('get_business_size_info')) {
        function get_business_size_info($business_size_id, $str_purpose, $is_id_title_only = false) {
            $business_size_id = intval($business_size_id);
            $GLOBALS['query']  = "SELECT `Title` ";
            if(!$is_id_title_only) {
                $GLOBALS['query'] .= ", `Description`, `AssetLimitFrom`, `AssetLimitTo`, `TotalWorkersFrom`, `TotalWorkersTo`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt ";
            }
            $GLOBALS['query'] .= "FROM `business_sizes`";
            $GLOBALS['query'] .= "WHERE `ID`=$business_size_id";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting business size information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    if(!$is_id_title_only) {
                        $arr = array(
                            'id' => $business_size_id,
                            'title' => $row_z['Title'],
                            'desc' => $row_z['Description'],
                            'asset_limit_from' => floatval($row_z['AssetLimitFrom']),
                            'asset_limit_to' => floatval($row_z['AssetLimitTo']),
                            'total_workers_from' => intval($row_z['TotalWorkersFrom']),
                            'total_workers_to' => intval($row_z['TotalWorkersTo']),
                            'date_created' => $row_z['CreatedAt'],
                            'date_updated' => $row_z['UpdatedAt']
                        );
                    }
                    else {
                        $arr = array(
                            'id' => $business_size_id,
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
     * get_all_business_sizes
     *
     * Get all business sizes and its data
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     * @param boolean $is_id_title_only - get all business size id and title only
     *
     * @return array
     *
     */
    if(!function_exists('get_all_business_sizes')) {
        function get_all_business_sizes($str_purpose, $is_id_title_only = false) {
            $arr = array();
            $GLOBALS['query'] = "SELECT `ID` FROM `business_sizes` WHERE 1 ORDER BY `AssetLimitFrom` DESC, `TotalWorkersFrom` DESC";
            $resultz = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting all business sizes ' . $str_purpose)) {
                while ($rowz = mysqli_fetch_assoc($resultz)) {
                    array_push($arr, get_business_size_info($rowz['ID'], 'for getting all business sizes', $is_id_title_only));
                }
            }
            else {
                require INDEX . 'php/ajax/__fin.php';
                exit();
            }
            return $arr;
        }
    }

    /**
     * get_application_business_size
     *
     * Get the business size of the application
     * @param int $total_employees - the total number of employees
     * @param double $total_asset - the total amount of asset
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_application_business_size')) {
        function get_application_business_size($total_employees, $total_asset, $str_purpose) {
            $total_employees = intval($total_employees);
            $total_asset = floatval($total_asset);

            $arr = array();
            $business_sizes = get_all_business_sizes('for getting application business size ' . $str_purpose);
            for($i=0; $i<sizeof($business_sizes); $i++) {

                // mutate -1 values to max
                $total_workers_from = intval($business_sizes[$i]['total_workers_from']);
                $total_workers_to = intval($business_sizes[$i]['total_workers_to']);
                if($total_workers_to == -1)
                    $total_workers_to = PHP_INT_MAX;
                $asset_limit_from = floatval($business_sizes[$i]['asset_limit_from']);
                $asset_limit_to = floatval($business_sizes[$i]['asset_limit_to']);
                if($asset_limit_to == -1)
                    $asset_limit_to = PHP_INT_MAX;

                // if(($total_employees >= $total_workers_from && $total_employees <= $total_workers_to) ||  ($total_asset >= $asset_limit_from && $total_asset <= $asset_limit_to)) {
                   if($total_asset >= $asset_limit_from && $total_asset <= $asset_limit_to) {
                      $arr = $business_sizes[$i];
                      break;
                   }

            }
            return $arr;
        }
    }

?>
