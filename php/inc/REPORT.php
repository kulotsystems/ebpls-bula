<?php

    /**
     * get_report_info
     *
     * Get all report information
     * @param int $report_id - the report id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */

    if(!function_exists('get_report_info')) {
        function get_report_info($report_id, $str_purpose) {
            $report_id = intval($report_id);
            $GLOBALS['query'] = "SELECT `Title`, `Description`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `reports` ";
            $GLOBALS['query'] .= "WHERE `ID`=$report_id";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting report information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    $arr = array(
                        'id' => $report_id,
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
?>
