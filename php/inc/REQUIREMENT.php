<?php

    /**
     * get_requirement_info
     *
     * Get all requirement information
     * @param int $requirement_id - the requirement id
     * @param boolean $include_lines_of_business - include lines of business or not
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */

    if(!function_exists('get_requirement_info')) {
        function get_requirement_info($requirement_id, $include_lines_of_business, $str_purpose) {
            $requirement_id = intval($requirement_id);
            $GLOBALS['query'] = "SELECT `Title`, `Description`, `ValidationCodeTitle`, `IsForUpload`, `CollectAfter`, `IsForPoblacionOnly`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `requirements` ";
            $GLOBALS['query'] .= "WHERE `ID`=$requirement_id";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting requirement information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);

                    // get requirement classification
                    $arr_lines_of_business = array();
                    if($include_lines_of_business) {
                        $GLOBALS['query']  = "SELECT `ApplicationType`, `BusinessLineID` ";
                        $GLOBALS['query'] .= "FROM `requirements_classification` ";
                        $GLOBALS['query'] .= "WHERE `RequirementID`=$requirement_id ";
                        $GLOBALS['query'] .= "ORDER BY `ApplicationType`";
                        $resultz2 = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                        if (has_no_db_error('getting requirement classifications')) {
                            while ($rowz2 = mysqli_fetch_assoc($resultz2)) {
                                array_push($arr_lines_of_business, array(
                                    'business_line_id' => intval($rowz2['BusinessLineID']),
                                    'application_type' => $rowz2['ApplicationType'],
                                ));
                            }
                        }
                    }

                    $arr = array(
                        'id' => $requirement_id,
                        'title' => $row_z['Title'],
                        'desc' => $row_z['Description'],
                        'validation_code_title' => $row_z['ValidationCodeTitle'],
                        'for_upload' => $row_z['IsForUpload'],
                        'collect_after' => $row_z['CollectAfter'],
                        'is_for_poblacion_only' => $row_z['IsForPoblacionOnly'],
                        'date_created' => $row_z['CreatedAt'],
                        'date_updated' => $row_z['UpdatedAt'],
                        'classifications' => $arr_lines_of_business
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
     * get_application_requirements
     *
     * Get the requirement information of an application
     * @param int $application_id - the application id
     * @param string $application_type - NEW or RENEWAL
     * @param array $business_activities - an array of business activities
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_application_requirements')) {
        function get_application_requirements($application_id, $application_type, $business_activities, $belongs_to_poblacion, $str_purpose) {
            $belongs_to_poblacion = intval($belongs_to_poblacion);
            $arr_requirement_ids = array();
            $arr_requirements = array();
            for($i=0; $i<sizeof($business_activities); $i++) {
                $business_line_id = $business_activities[$i]['business_line_id'];
                $GLOBALS['query']  = "SELECT `requirements_classification`.`RequirementID` FROM `requirements_classification`, `requirements` ";
                $GLOBALS['query'] .= "WHERE `requirements_classification`.`RequirementID`=`requirements`.`ID` ";
                $GLOBALS['query'] .= "AND `requirements_classification`.`BusinessLineID`=$business_line_id ";
                $GLOBALS['query'] .= "AND `requirements_classification`.`ApplicationType`='$application_type' ";
                $GLOBALS['query'] .= "AND ";
                $GLOBALS['query'] .= "(";
                $GLOBALS['query'] .= "  (`requirements`.`IsForPoblacionOnly`=1 AND $belongs_to_poblacion=1) ";
                $GLOBALS['query'] .= "  OR ";
                $GLOBALS['query'] .= "  (`requirements`.`IsForPoblacionOnly`=0) ";
                $GLOBALS['query'] .= ") ";
                $GLOBALS['query'] .= "ORDER BY `requirements`.`CollectAfter`,  `requirements`.`IsForUpload`";
                $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                if(has_no_db_error('getting requirement classifications ' . $str_purpose)) {
                    while($row_z = mysqli_fetch_assoc($result_z)) {
                        $requirement_id = intval($row_z['RequirementID']);
                        if(!in_array($requirement_id, $arr_requirement_ids)) {
                            // for reference in avoiding redundancy
                            array_push($arr_requirement_ids, $requirement_id);

                            $requirement = get_requirement_info($requirement_id, false, 'getting requirement classifications');

                            array_push($arr_requirements, array(
                                'id' => $requirement_id,
                                'title' => $requirement['title'],
                                'validation_code_title' => $requirement['validation_code_title'],
                                'for_upload' => $requirement['for_upload'],
                                'collect_after' => $requirement['collect_after'],
                                'submitted' => get_application_submitted_requirement($application_id, $requirement_id)
                            ));
                        }
                    }
                }
                else {
                    require INDEX . 'php/ajax/__fin.php';
                    exit();
                }
            }
            return $arr_requirements;
        }
    }


    /**
     * get_application_submitted_requirement
     *
     * Get the submitted requirement information of an application
     * @param int $application_id - the application id
     * @param int $requirement_id - the requirement id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_application_submitted_requirement')) {
        function get_application_submitted_requirement($application_id, $requirement_id) {
            $file_name = '';
            $validation_code = '';
            $is_verified = 0;
            $GLOBALS['query']  = "SELECT `Filename`, `ValidationCode`, `IsVerified` ";
            $GLOBALS['query'] .= "FROM `applications_requirement` ";
            $GLOBALS['query'] .= "WHERE `ApplicationID`=$application_id ";
            $GLOBALS['query'] .= "AND `RequirementID`=$requirement_id";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if(has_no_db_error('getting submitted requirement information')) {
                if(mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    $file_name = $row_z['Filename'];
                    $validation_code = $row_z['ValidationCode'];
                    $is_verified = intval($row_z['IsVerified']);
                }
            }
            else {
                require INDEX . 'php/ajax/__fin.php';
                exit();
            }

            return array(
                'file_name' => $file_name,
                'validation_code' => $validation_code,
                'is_verified' => $is_verified
            );
        }
    }

?>
