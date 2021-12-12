<?php

    /**
     * get_citizen_info
     *
     * Get all citizen information
     * @param int $citizen_id - the CitizenID
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */

    if(!function_exists('get_citizen_info')) {
        function get_citizen_info($citizen_id, $str_purpose)
        {
            $citizen_id = intval($citizen_id);
            $GLOBALS['query'] = "SELECT ";
            $GLOBALS['query'] .= "`FirstName`, ";
            $GLOBALS['query'] .= "`MiddleName`, ";
            $GLOBALS['query'] .= "`LastName`, ";
            $GLOBALS['query'] .= "`isMale`, ";
            $GLOBALS['query'] .= "`BloodType`, ";
            $GLOBALS['query'] .= "DATE_FORMAT(`DateOfBirth`, '%M %e, %Y') AS DateOfBirth, ";
            $GLOBALS['query'] .= "`PlaceOfBirth`, ";
            $GLOBALS['query'] .= "`ContactNumber`, ";
            $GLOBALS['query'] .= "`HouseNo`, ";
            $GLOBALS['query'] .= "`streetAddress`, ";
            $GLOBALS['query'] .= "`BrgyID`, ";
            $GLOBALS['query'] .= "`Citizenship`, ";
            $GLOBALS['query'] .= "`CivilStatus`, ";
            $GLOBALS['query'] .= "`TIN`, ";
            $GLOBALS['query'] .= "`Profession/Occupation/Business`, ";
            $GLOBALS['query'] .= "`EmergFullName`, ";
            $GLOBALS['query'] .= "`EmergAddress`, ";
            $GLOBALS['query'] .= "`EmergContNum`, ";
            $GLOBALS['query'] .= "`EmergRelationship`, ";
            $GLOBALS['query'] .= "DATE_FORMAT(`IDreleaseDate`, '%M %e, %Y') AS IDreleaseDate, ";
            $GLOBALS['query'] .= "`Avatar`, ";
            $GLOBALS['query'] .= "`isPaid`, ";
            $GLOBALS['query'] .= "`isReprint`, ";
            $GLOBALS['query'] .= "`isCancelled`, ";
            $GLOBALS['query'] .= "`isIndigent` ";
            $GLOBALS['query'] .= "FROM `citizen` ";
            $GLOBALS['query'] .= "WHERE `CitizenID`=$citizen_id";

            $result_z = mysqli_query($GLOBALS['con_lids'], $GLOBALS['query']);
            if (has_no_db_error('getting citizen information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    require INDEX . 'php/inc/LIDS_BARANGAY.php';
                    $barangay = get_barangay_info($row_z['BrgyID'], 'for getting citizen information');

                    $first_name = $row_z['FirstName'];
                    $middle_name = $row_z['MiddleName'];
                    $last_name = $row_z['LastName'];
                    $middle_initial = ($middle_name != '') ? ' ' . substr($middle_name, 0, 1) . '.' : '';
                    $full_name = $first_name . $middle_initial . ' ' . $last_name;
                    $full_name_reverse = $last_name . ', ' . $first_name . $middle_initial;

                    $avatar = $row_z['Avatar'];
                    if($avatar == null)
                        $avatar = 'NOAVATAR.jpg';
                    else {
                        if(!file_exists(EGOV2_AVATAR_PATH . $avatar)) {
                            $avatar = 'NOAVATAR.jpg';
                        }
                    }
                    $gender = (intval($row_z['isMale'])) ? 'Male' : 'Female';

                    $house_no = $row_z['HouseNo'];
                    $street = $row_z['streetAddress'];

                    $address_line_1 = '';
                    $barangay_address = '';
                    if ($house_no != '' && intval($house_no) > 0)
                        $address_line_1 .= $house_no . ' ';
                    if ($street != '') {
                        $address_line_1 .= $street;
                        if(strpos(strtolower($street), ' st.') < 0) {
                            $address_line_1 .= ' St.,';
                        }
                        $address_line_1 .= ', ';
                    }
                    $address_line_1 .= $barangay['name'];
                    $barangay_address .= $barangay['name'] . ", ";


                    $address_line_2 = $barangay['muncity']['name'] . ', ' . $barangay['muncity']['province']['name'];
                    $barangay_address .= $barangay['muncity']['name'] . ', ' . $barangay['muncity']['province']['name'];
                    $address_complete = $address_line_1 . ', ' . $address_line_2;

                    $arr = array(
                        'id' => $citizen_id,
                        'first_name' => strtoupper($first_name),
                        'middle_name' => strtoupper($middle_name),
                        'last_name' => strtoupper($last_name),
                        'full_name' => strtoupper($full_name),
                        'full_name_reverse' => strtoupper($full_name_reverse),
                        'gender' => $gender,
                        'blood_type' => $row_z['BloodType'],
                        'date_of_birth' => $row_z['DateOfBirth'],
                        'place_of_birth' => $row_z['PlaceOfBirth'],
                        'contact_num' => $row_z['ContactNumber'],
                        'address_line1' => $address_line_1,
                        'address_line2' => $address_line_2,
                        'full_address' => $address_complete,
                        'barangay_address' => $barangay_address,
                        'citizenship' => $row_z['Citizenship'],
                        'civil_status' => $row_z['CivilStatus'],
                        'tin' => $row_z['TIN'],
                        'profession' => $row_z['Profession/Occupation/Business'],
                        'emergency_person' => strtoupper($row_z['EmergFullName']),
                        'emergency_address' => $row_z['EmergAddress'],
                        'emergency_contact_num' => $row_z['EmergContNum'],
                        'emergency_relationship' => $row_z['EmergRelationship'],
                        'id_release_date' => $row_z['IDreleaseDate'],
                        'avatar' => $avatar,
                        'is_paid' => ($row_z['isPaid'] == 1) ? 'Yes' : 'No',
                        'is_reprint' => ($row_z['isReprint'] == 1) ? 'Yes' : 'No',
                        'is_cancelled' => ($row_z['isCancelled'] == 1) ? 'Yes' : 'No',
                        'is_indigent' => ($row_z['isIndigent'] == 1) ? 'Yes' : 'No'
                    );
                }
                else {
                    $arr = array(
                        'id' => 0,
                        'first_name' => '[CITIZEN_FIRSTNAME]',
                        'middle_name' => '[CITIZEN_MIDDLENAME]',
                        'last_name' => '[CITIZEN_LASTNAME]',
                        'full_name' => '[NO CITIZEN]',
                        'full_name_reverse' => '[NO CITIZEN]',
                        'gender' => '',
                        'blood_type' => '',
                        'date_of_birth' => '',
                        'place_of_birth' => '',
                        'contact_num' => '',
                        'address_line1' => '',
                        'address_line2' => '',
                        'full_address' => '',
                        'citizenship' => '',
                        'civil_status' => '',
                        'tin' => '',
                        'profession' => '',
                        'emergency_person' => '',
                        'emergency_address' => '',
                        'emergency_contact_num' => '',
                        'emergency_relationship' => '',
                        'id_release_date' => '',
                        'avatar' => '_.jpg',
                        'is_paid' => '',
                        'is_reprint' => '',
                        'is_cancelled' => '',
                        'is_indigent' => ''
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
