<?php

    /**
     * get_business_info
     *
     * Get all business information
     * @param int $business_id - the business id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_business_info')) {
        function get_business_info($business_id, $str_purpose) {
            $business_id = intval($business_id);
            $GLOBALS['query'] = "SELECT `CitizenID`, `CorporateCitizenID`, `CorporateFullname`, `CorporateAvatar`, `CorporateTIN`, `CorporateAddress`, `BusinessName`, `TradeName`, `BusinessTypeID`, `StreetAddress`, `BrgyID`, `TelNum`, `MobileNum`, `Email`, DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `businesses` ";
            $GLOBALS['query'] .= "WHERE `ID`=$business_id";
            $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if (has_no_db_error('getting business information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);

                    require INDEX . 'php/inc/LIDS_CITIZEN.php';
                    require INDEX . 'php/inc/LIDS_BARANGAY.php';
                    require INDEX . 'php/inc/BUSINESS_TYPE.php';

                    $citizen = get_citizen_info($row_z['CitizenID'], 'for getting business information');
                    $corporate_owner = array();
                    if($row_z['CorporateCitizenID'] > 0) {
                        $corporate_owner = get_citizen_info($row_z['CorporateCitizenID'], 'for getting corporate owner');
                    }
                    else {
                        $corporate_owner = array(
                            'id' => 0,
                            'full_name' => $row_z['CorporateFullname'],
                            'avatar' => $row_z['CorporateAvatar'],
                            'full_address' => $row_z['CorporateAddress'],
                            'tin' => $row_z['CorporateTIN']
                        );
                    }
                    $barangay = get_barangay_info($row_z['BrgyID'], 'for getting business information');
                    $business_type = get_business_type_info($row_z['BusinessTypeID'], 'for getting business information');
                    $arr = array(
                        'id' => $business_id,
                        'citizen' => $citizen,
                        'corporate_owner' => $corporate_owner,
                        'business_name' => $row_z['BusinessName'],
                        'trade_name' => $row_z['TradeName'],
                        'business_type' => $business_type,
                        'street_address' => $row_z['StreetAddress'],
                        'barangay' => $barangay,
                        'belongs_to_poblacion' => belongs_to_poblacion($barangay['id']),
                        'tel_num' => $row_z['TelNum'],
                        'mobile_num' => $row_z['MobileNum'],
                        'email' => $row_z['Email'],
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
