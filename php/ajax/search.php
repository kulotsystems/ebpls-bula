<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        // SEARCH CITIZEN
        if(isset($_POST['search_citizen'])) {
            $q = mysqli_real_escape_string($con_lids, $_POST['search_citizen']);
            $query  = "SELECT `CitizenID` FROM `citizen` ";
            $query .= "WHERE `CitizenID`=" . intval($q) . " ";
            $query .= "OR `FirstName` LIKE '%$q%' ";
            $query .= "OR `MiddleName` LIKE '%$q%' ";
            $query .= "OR `LastName` LIKE '%$q%' ";
            $query .= "OR CONCAT(`FirstName`, ' ', `LastName`) LIKE '%$q%' ";
            $query .= "OR CONCAT(`FirstName`, ' ', `MiddleName`, ' ', `LastName`) LIKE '%$q%' ";
            $query .= "OR CONCAT(`FirstName`, ' ', MID(`MiddleName`, 1, 1), '. ', `LastName`) LIKE '%$q%' ";
            $query .= "OR CONCAT(`LastName`, ' ', `FirstName`) LIKE '%$q%' ";
            $query .= "OR CONCAT(`LastName`, ', ', `FirstName`) LIKE '%$q%' ";
            $query .= "OR CONCAT(`LastName`, ', ', `FirstName`, ' ', `MiddleName`) LIKE '%$q%' ";
            $query .= "OR CONCAT(`LastName`, ', ', `FirstName`, ' ', MID(`MiddleName`, 1, 1), '.') LIKE '%$q%' ";
            $query .= "ORDER BY `LastName`, `FirstName`, `MiddleName` ";
            $query .= "LIMIT 20";
            $result = mysqli_query($con_lids, $query);

            if(has_no_db_error('searching citizen')) {
                require INDEX . "php/inc/LIDS_CITIZEN.php";
                $arr_citizens = array();

                while($row = mysqli_fetch_assoc($result)) {
                    $citizen = get_citizen_info($row['CitizenID'], 'for searching citizen');
                    array_push($arr_citizens, array(
                        'id' => intval($row['CitizenID']),
                        'main_title' => $citizen['full_name'],
                        'avatar' => $citizen['avatar'],
                        'sub_title' => $citizen['barangay_address'],
                        'meta_data' => array(
                            array(
                                'class_name' => 'gender',
                                'value' => $citizen['gender']
                            ),
                            array(
                                'class_name' => 'tin',
                                'value' => $citizen['tin']
                            ),
                            array(
                                'class_name' => 'contact-num',
                                'value' => $citizen['contact_num']
                            ),
                            array(
                                'class_name' => 'emergency-person',
                                'value' => $citizen['emergency_person']
                            ),
                            array(
                                'class_name' => 'emergency-contact-num',
                                'value' => $citizen['emergency_contact_num']
                            )
                        )
                    ));
                }
                $response['success']['data'] = $arr_citizens;
            }
        }

        // SEARCH BARANGAY
        else if(isset($_POST['search_barangay'])) {
            $q = mysqli_real_escape_string($con_lids, $_POST['search_barangay']);
            $muncity_desc = (LGU_TYPE == 'City') ? LGU_NAME . ' City' :  LGU_NAME;

            $query  = "SELECT `brgy`.`BrgyID` FROM `brgy`, `muncity`, `province`, `region` ";
            $query .= "WHERE (`brgy`.`BrgyID`=" . intval($q) . " ";
            $query .= "OR `brgy`.`BrgyDesc` LIKE '%$q%') ";
            $query .= "AND `muncity`.`MunCityDesc`='$muncity_desc' ";
            $query .= "AND `province`.`ProvinceDesc`='" . LGU_PROVINCE . "' ";
            $query .= "AND `region`.`RegionDesc`='" . LGU_REGION . "' ";
            $query .= "AND `brgy`.`MunCityID`=`muncity`.`MunCityID` ";
            $query .= "AND `muncity`.`ProvinceID`=`province`.`ProvinceID` ";
            $query .= "AND `province`.`RegionID`=`region`.`RegionID` ";
            $query .= "ORDER BY `brgy`.`BrgyDesc`";

            $result = mysqli_query($con_lids, $query);
            if(has_no_db_error('searching barangay')) {
                require INDEX . "php/inc/LIDS_BARANGAY.php";
                $arr_barangays = array();

                while($row = mysqli_fetch_assoc($result)) {
                    $barangay = get_barangay_info($row['BrgyID'], 'for searching barangay');
                    if(sizeof($barangay) > 0) {
                        array_push($arr_barangays, array(
                            'id' => intval($row['BrgyID']),
                            'main_title' => $barangay['name'],
                            'sub_title' => $barangay['muncity']['name'] . ', ' . $barangay['muncity']['province']['name']
                        ));
                    }
                }
                $response['success']['data'] = $arr_barangays;
            }
        }

        // SEARCH LINE OF BUSINESS
        else if(isset($_POST['search_line_of_business'])) {
            $q = mysqli_real_escape_string($con, $_POST['search_line_of_business']);
            $query  = "SELECT `ID` FROM `business_lines` ";
            $query .= "WHERE `ID`=" . intval($q) . " ";
            $query .= "OR `BusinessLine` LIKE '%$q%' ";
            $query .= "ORDER BY `BusinessLine`, `Description` ";
            $query .= "LIMIT 20";

            $result = mysqli_query($con, $query);
            if(has_no_db_error('searching line of business')) {
                require INDEX . "php/inc/BUSINESS_LINE.php";
                $arr_line_of_business = array();

                while($row = mysqli_fetch_assoc($result)) {
                    $line_of_business = get_line_of_business_info($row['ID'], false, 'for searching line of business');
                    if(sizeof($line_of_business) > 0) {
                        array_push($arr_line_of_business, array(
                            'id' => $line_of_business['id'],
                            'main_title' => $line_of_business['title'],
                            'sub_title' => $line_of_business['desc']
                        ));
                    }
                }
                $response['success']['data'] = $arr_line_of_business;
            }
        }

        // SEARCH BUSINESS SIZE
        else if(isset($_POST['search_business_size'])) {
            $q = mysqli_real_escape_string($con, $_POST['search_business_size']);
            $query  = "SELECT `ID` FROM `business_sizes` ";
            $query .= "WHERE `ID`=" . intval($q) . " ";
            $query .= "OR `Title` LIKE '%$q%' ";
            $query .= "ORDER BY `Title`, `Description` ";
            $query .= "LIMIT 20";

            $result = mysqli_query($con, $query);
            if(has_no_db_error('searching business size')) {
                require INDEX . "php/inc/BUSINESS_SIZE.php";
                $arr_business_size = array();

                while($row = mysqli_fetch_assoc($result)) {
                    $business_size = get_business_size_info($row['ID'], 'for searching business size');
                    if(sizeof($business_size) > 0) {
                        array_push($arr_business_size, array(
                            'id' => $business_size['id'],
                            'main_title' => $business_size['title'],
                            'sub_title' => $business_size['desc']
                        ));
                    }
                }
                $response['success']['data'] = $arr_business_size;
            }
        }

        // SEARCH TAX OPTIONS
        else if(isset($_POST['search_business_tax_option'])) {
            $q = mysqli_real_escape_string($con, $_POST['search_business_tax_option']);
            $query  = "SELECT `ID` FROM `taxes_option` ";
            $query .= "WHERE `ID`=" . intval($q) . " ";
            $query .= "OR `Title` LIKE '%$q%' ";
            $query .= "ORDER BY `Title`, `Description` ";
            $query .= "LIMIT 20";

            $result = mysqli_query($con, $query);
            if(has_no_db_error('searching tax option')) {
                require INDEX . "php/inc/TAX_OPTION.php";
                $arr_tax_option = array();

                while($row = mysqli_fetch_assoc($result)) {
                    $tax_option = get_tax_option_info($row['ID'], 'for searching tax option');
                    if(sizeof($tax_option) > 0) {
                        array_push($arr_tax_option, array(
                            'id' => $tax_option['id'],
                            'main_title' => $tax_option['title'],
                            'sub_title' => $tax_option['desc']
                        ));
                    }
                }
                $response['success']['data'] = $arr_tax_option;
            }
        }

        // SEARCH FEE ITEMS
        else if(isset($_POST['search_fee'])) {
            $q = mysqli_real_escape_string($con, $_POST['search_fee']);
            $query  = "SELECT `ID` FROM `fees` ";
            $query .= "WHERE `ID`=" . intval($q) . " ";
            $query .= "OR `Title` LIKE '%$q%' ";
            $query .= "ORDER BY `Title`, `Description` ";
            $query .= "LIMIT 20";

            $result = mysqli_query($con, $query);
            if(has_no_db_error('searching fee item')) {
                require INDEX . "php/inc/FEE.php";
                $arr_fee = array();

                while($row = mysqli_fetch_assoc($result)) {
                    $fee = get_fee_info($row['ID'], false, 'for searching fee item');
                    if(sizeof($fee) > 0) {
                        array_push($arr_fee, array(
                            'id' => $fee['id'],
                            'main_title' => $fee['title'],
                            'sub_title' => $fee['desc']
                        ));
                    }
                }
                $response['success']['data'] = $arr_fee;
            }
        }

        // SEARCH REQUIREMENTS
        else if(isset($_POST['search_requirement'])) {
            $q = mysqli_real_escape_string($con, $_POST['search_requirement']);
            $query  = "SELECT `ID` FROM `requirements` ";
            $query .= "WHERE `ID`=" . intval($q) . " ";
            $query .= "OR `Title` LIKE '%$q%' ";
            $query .= "ORDER BY `Title`, `Description` ";
            $query .= "LIMIT 20";

            $result = mysqli_query($con, $query);
            if(has_no_db_error('searching requirement item')) {
                require INDEX . "php/inc/REQUIREMENT.php";
                $arr_requirement = array();

                while($row = mysqli_fetch_assoc($result)) {
                    $requirement = get_requirement_info($row['ID'], false, 'for searching requirement item');
                    if(sizeof($requirement) > 0) {
                        array_push($arr_requirement, array(
                            'id' => $requirement['id'],
                            'main_title' => $requirement['title'],
                            'sub_title' => $requirement['desc']
                        ));
                    }
                }
                $response['success']['data'] = $arr_requirement;
            }
        }

        // SEARCH APPLICATION
        else if(
            isset($_POST['search_new_application']) ||
            isset($_POST['search_renewal_application']) ||
            isset($_POST['search_new_verification']) ||
            isset($_POST['search_renewal_verification']) ||
            isset($_POST['search_new_invoice']) ||
            isset($_POST['search_renewal_invoice']) ||
            isset($_POST['search_new_permit']) ||
            isset($_POST['search_renewal_permit'])) {

            $q = '';
            $application_type = '';
            $application_table = '';
            if(isset($_POST['search_new_application'])) {
                $q = mysqli_real_escape_string($con, $_POST['search_new_application']);
                $application_type = 'NEW';
                $application_table = 'applications_foredit';
            }
            else if(isset($_POST['search_renewal_application'])) {
                $q = mysqli_real_escape_string($con, $_POST['search_renewal_application']);
                $application_type = 'RENEWAL';
                $application_table = 'applications_foredit';
            }
            else if(isset($_POST['search_new_verification'])) {
                $q = mysqli_real_escape_string($con, $_POST['search_new_verification']);
                $application_type = 'NEW';
                $application_table = 'applications_forverification';
            }
            else if(isset($_POST['search_renewal_verification'])) {
                $q = mysqli_real_escape_string($con, $_POST['search_renewal_verification']);
                $application_type = 'RENEWAL';
                $application_table = 'applications_forverification';
            }
            else if(isset($_POST['search_new_invoice'])) {
                $q = mysqli_real_escape_string($con, $_POST['search_new_invoice']);
                $application_type = 'NEW';
                $application_table = 'applications_forinvoice';
            }
            else if(isset($_POST['search_renewal_invoice'])) {
                $q = mysqli_real_escape_string($con, $_POST['search_renewal_invoice']);
                $application_type = 'RENEWAL';
                $application_table = 'applications_forinvoice';
            }
            else if(isset($_POST['search_new_permit'])) {
                $q = mysqli_real_escape_string($con, $_POST['search_new_permit']);
                $application_type = 'NEW';
                $application_table = 'applications_forpermit';
            }
            else if(isset($_POST['search_renewal_permit'])) {
                $q = mysqli_real_escape_string($con, $_POST['search_renewal_permit']);
                $application_type = 'RENEWAL';
                $application_table = 'applications_forpermit';
            }

            $arr_applications = array();

            // search by citizen name
            $arr_citizen_id = array();
            $query  = "SELECT `CitizenID` FROM `citizen` ";
            $query .= "WHERE `CitizenID`=" . intval($q) . " ";
            $query .= "OR `FirstName` LIKE '%$q%' ";
            $query .= "OR `MiddleName` LIKE '%$q%' ";
            $query .= "OR `LastName` LIKE '%$q%' ";
            $query .= "OR CONCAT(`FirstName`, ' ', `LastName`) LIKE '%$q%' ";
            $query .= "OR CONCAT(`FirstName`, ' ', `MiddleName`, ' ', `LastName`) LIKE '%$q%' ";
            $query .= "OR CONCAT(`FirstName`, ' ', MID(`MiddleName`, 1, 1), '. ', `LastName`) LIKE '%$q%' ";
            $query .= "OR CONCAT(`LastName`, ' ', `FirstName`) LIKE '%$q%' ";
            $query .= "OR CONCAT(`LastName`, ', ', `FirstName`) LIKE '%$q%' ";
            $query .= "OR CONCAT(`LastName`, ', ', `FirstName`, ' ', `MiddleName`) LIKE '%$q%' ";
            $query .= "OR CONCAT(`LastName`, ', ', `FirstName`, ' ', MID(`MiddleName`, 1, 1), '.') LIKE '%$q%' ";
            $query .= "ORDER BY `LastName`, `FirstName`, `MiddleName` ";
            $query .= "LIMIT 20";
            $result = mysqli_query($con_lids, $query);

            if(has_no_db_error('searching `" . $application_table . "` by citizen name')) {
                while($row = mysqli_fetch_assoc($result)) {
                    array_push($arr_citizen_id, $row['CitizenID']);
                }
            }

            // search by business name, trade name
            $arr_stage = explode('_for', $application_table);
            $query  = "SELECT ";
            $query .= "`applications`.`ID` ";
            $query .= "FROM `businesses`, `applications`, `$application_table` ";
            $query .= "WHERE ";
            $query .= "`applications`.`ApplicationType`='$application_type' AND ";
            $query .= "`businesses`.`ID`=`applications`.`BusinessID` AND ";
            $query .= "`applications`.`ID`=`$application_table`.`ApplicationID` AND ";
            $query .= "`$application_table`.`IsPresent`=1 AND ";
            $query .= "(";
            $query .= "`businesses`.`BusinessName` LIKE '%$q%' OR ";
            $query .= "`businesses`.`TradeName` LIKE '%$q%'";
            if(sizeof($arr_citizen_id) > 0) {
                $query .= " OR `businesses`.`CitizenID` IN(" . implode(',', $arr_citizen_id) . ")";
            }
            $query .= ") ";
            $query .= "ORDER BY `businesses`.`BusinessName`, `businesses`.`TradeName`";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('searching `" . $application_table . "` by business/trade name')) {
                while($row = mysqli_fetch_assoc($result)) {
                    array_push($arr_applications, $row['ID']);
                }
            }




            $arr_searched_applications = array();
            require INDEX . 'php/inc/APPLICATION.php';
            for($i=0; $i<sizeof($arr_applications); $i++) {
                $application = get_application_info($arr_applications[$i], false, $arr_stage[1], 'for searching `" . $application_table . "`');
                array_push($arr_searched_applications, array(
                    'id' => $application['id'],
                    'avatar' => $application['business']['citizen']['avatar'],
                    'main_title' => $application['business']['business_name'],
                    'sub_title' => $application['business']['citizen']['full_name']
                ));
            }
            $response['success']['data'] = $arr_searched_applications;
        }
    }
    require '__fin.php';

?>