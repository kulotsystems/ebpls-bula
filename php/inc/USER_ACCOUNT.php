<?php

    /**
     * get_user_account_info
     *
     * Get all user_account information
     * @param int $citizen_id - the citizen id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_user_account_info')) {
        function get_user_account_info($citizen_id, $str_purpose) {
            $citizen_id = intval($citizen_id);
            $GLOBALS['query']  = "SELECT `UserTypeID`, `Username`, `Password`, `IsActive`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt ";
            $GLOBALS['query'] .= "FROM `users` WHERE `CitizenID`=$citizen_id";
            $resultz = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting user account information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($resultz) > 0) {
                    $rowz = mysqli_fetch_assoc($resultz);

                    require INDEX . "php/inc/LIDS_CITIZEN.php";
                    $citizen = get_citizen_info($citizen_id, 'for getting user account information');

                    require INDEX . "php/inc/USER_TYPE.php";
                    $user_type = get_user_type_info($rowz['UserTypeID'], false, 'for getting user account information');

                    require INDEX . "php/inc/DATA_SHIFT.php";
                    $arr_password = explode('ebpls', $rowz['Password']);
                    $password = '';
                    if(sizeof($arr_password) > 1)
                        $password =  data_shift($arr_password[1], false);

                    $arr = array(
                        'user_type' => $user_type,
                        'citizen' => $citizen,
                        'username' => $rowz['Username'],
                        'password' => $password,
                        'is_active' => $rowz['IsActive'],
                        'date_created' => $rowz['CreatedAt'],
                        'date_updated' => $rowz['UpdatedAt']
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
     * get_application_verifier_user_accounts
     *
     * Get all user accounts which can verify business application
     * @param int $application_id - the application id
     * @param string $application_type - NEW or RENEWAL
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_application_verifier_user_accounts')) {
        function get_application_verifier_user_accounts($application_id, $application_type, $str_purpose) {
            require INDEX . 'php/inc/USER_TYPE.php';
            $arr_verifier_user_types = get_application_verifier_user_types($application_type, 'for getting application verifier user accounts');
            $arr = array();
            for($i=0; $i<sizeof($arr_verifier_user_types); $i++) {
                $usertype_id = $arr_verifier_user_types[$i]['usertype_id'];
                $usertype_acronym = $arr_verifier_user_types[$i]['usertype_acronym'];
                $usertype_title = $arr_verifier_user_types[$i]['usertype_title'];

                $GLOBALS['query']  = "SELECT `CitizenID` FROM `users` ";
                $GLOBALS['query'] .= "WHERE `UserTypeID`=$usertype_id ";
                $GLOBALS['query'] .= "AND `IsActive`=1";
                $result = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                if(has_no_db_error('getting application verifier user accounts ' . $str_purpose)) {
                    require INDEX . 'php/inc/LIDS_CITIZEN.php';
                    while($row = mysqli_fetch_assoc($result)) {
                        $citizen = get_citizen_info($row['CitizenID'], 'for getting application verifier user accounts');
                        $is_logged_in = ($GLOBALS['arr_admin_details']['citizen_id'] == $citizen['id']) ? '1' : '0';

                        array_push($arr, array(
                            'id' => $citizen['id'],
                            'fullname' => $citizen['full_name'],
                            'avatar' => $citizen['avatar'],
                            'usertype_acronym' => $usertype_acronym,
                            'usertype_title' => $usertype_title,
                            'is_logged_in' => $is_logged_in,
                            'approval' => get_application_approval($application_id, $citizen['id'])
                        ));
                    }
                }
            }
            return $arr;
        }
    }

    /**
     * get_application_approval
     *
     * Get the approval information of an application
     * @param int $application_id - the application id
     * @param int $citizen_id - the citizen id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_application_approval')) {
        function get_application_approval($application_id, $citizen_id) {
            $is_approved = '';
            $remarks = '';
            $date_updated = 0;
            $GLOBALS['query']  = "SELECT `IsApproved`, `Remarks`, `UpdatedAt` ";
            $GLOBALS['query'] .= "FROM `applications_approval` ";
            $GLOBALS['query'] .= "WHERE `ApplicationID`=$application_id ";
            $GLOBALS['query'] .= "AND `CitizenID`=$citizen_id ";
            $GLOBALS['query'] .= "ORDER BY `UpdatedAt` DESC";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if(has_no_db_error('getting application approval information')) {
                if(mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    $is_approved = intval($row_z['IsApproved']);
                    $remarks = $row_z['Remarks'];
                    $date_updated = $row_z['UpdatedAt'];
                }
            }
            else {
                require INDEX . 'php/ajax/__fin.php';
                exit();
            }

            return array(
                'is_approved' => $is_approved,
                'remarks' => $remarks,
                'date_updated' => $date_updated
            );
        }
    }


?>
