<?php

    /**
     * get_user_type_info
     *
     * Get all user_type information
     * @param int $usertype_id - the user type id
     * @param boolean $include_user_access - include user access or not
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */

    if(!function_exists('get_user_type_info')) {
        function get_user_type_info($usertype_id, $include_user_access, $str_purpose) {
            $usertype_id = intval($usertype_id);
            $GLOBALS['query'] = "SELECT `Acronym`, `Title`, `Description`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `user_types` WHERE `ID`=$usertype_id";
            $resultz = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting user type information ' . $str_purpose)) {
                $arr = array();

                if (mysqli_num_rows($resultz) > 0) {
                    $rowz = mysqli_fetch_assoc($resultz);

                    // get user access
                    $arr_user_access = array();
                    if($include_user_access) {
                        require INDEX . 'php/inc/USER_ACCESS.php';
                        $arr_tabs = get_all_user_access();

                        for($i=0; $i<sizeof($arr_tabs); $i++) {
                            $proceed = false;
                            if($arr_tabs[$i]['for_devs_only']) {
                                if($GLOBALS['arr_admin_details']['citizen_id'] == 1) {
                                    $proceed = true;
                                }
                            }
                            else {
                                $proceed = true;
                            }
                            if($proceed) {
                                $user_access_icon = $arr_tabs[$i]['tab_icon'];
                                $user_access_title = $arr_tabs[$i]['tab_text'];
                                $user_access_desc = $arr_tabs[$i]['desc'];
                                $for_devs_only = ($arr_tabs[$i]['for_devs_only']) ? '1' : '0';
                                $is_checked = 0;
                                $GLOBALS['query'] = "SELECT `Access` FROM `user_types` ";
                                $GLOBALS['query'] .= "WHERE `ID`=$usertype_id";
                                $result = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                                if (has_no_db_error('getting access of a user type')) {
                                    $row = mysqli_fetch_assoc($result);
                                    $arr_access = json_decode($row['Access']);
                                    if (in_array($user_access_title, $arr_access)) {
                                        $is_checked = 1;
                                    }
                                }
                                array_push($arr_user_access, array(
                                    'icon' => $user_access_icon,
                                    'title' => $user_access_title,
                                    'desc' => $user_access_desc,
                                    'checked' => $is_checked,
                                    'for_devs_only' => $for_devs_only
                                ));
                            }
                        }

                    }

                    $arr = array(
                        'id' => $usertype_id,
                        'acronym' => $rowz['Acronym'],
                        'title' => $rowz['Title'],
                        'desc' => $rowz['Description'],
                        'date_created' => $rowz['CreatedAt'],
                        'date_updated' => $rowz['UpdatedAt'],
                        'access' => $arr_user_access
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
     * get_all_user_types
     *
     * Get all user_types and its data
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_all_user_types')) {
        function get_all_user_types($str_purpose) {
            $arr = array();
            $GLOBALS['query'] = "SELECT `ID` FROM `user_types` WHERE 1 ORDER BY `Acronym`, `Title`";
            $resultz = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting all user types ' . $str_purpose)) {
                while ($rowz = mysqli_fetch_assoc($resultz)) {
                    array_push($arr, get_user_type_info($rowz['ID'], true, 'for getting all user types'));
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
     * get_application_verifier_user_types
     * (except for SYSTEM ADMINISTRATOR)
     *
     * Get all user type which can verify business application
     * @param string $application_type - NEW or RENEWAL
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_application_verifier_user_types')) {
        function get_application_verifier_user_types($application_type, $str_purpose) {
            $arr = array();
            $verification_tab = ($application_type == 'NEW') ? '[NEW] VERIFICATIONS' : '[RENEWAL] VERIFICATIONS';
            $GLOBALS['query']  = "SELECT `ID`, `Acronym`, `Title`, `Access` FROM `user_types` WHERE 1";
            $result = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if(has_no_db_error('getting all user types and system access ' . $str_purpose)) {
                while($row = mysqli_fetch_assoc($result)) {
                    $arr_access = json_decode($row['Access']);
                    if(in_array($verification_tab, $arr_access)) {
                        if(strtoupper($row['Title']) != 'SYSTEM ADMINISTRATOR') {
                            array_push($arr, array(
                                'usertype_id' => intval($row['ID']),
                                'usertype_acronym' => $row['Acronym'],
                                'usertype_title' => $row['Title']
                            ));
                        }
                    }
                }
            }

            return $arr;
        }
    }

?>
