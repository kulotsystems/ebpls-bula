<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        // FUNCTION: GET ITEM OF 1 APPLICATION
        function get_application_item($application_id, $stage) {
            require INDEX . 'php/inc/APPLICATION.php';
            $application = get_application_info($application_id, false, $stage, 'for application item data');
            return array(
                'item_id' => $application_id,
                'item_avatar' => $application['business']['citizen']['avatar'],
                'item_maintitle' => $application['business']['business_name'],
                'item_subtitle' => $application['business']['citizen']['full_name'],
                'item_update_date' => $application['date_created']
            );
        }


        // FUNCTION: GET ITEM OF 1 VERIFICATION
        function get_verification_item($application_id) {
            return get_application_item($application_id, 'verification');
        }


        // FUNCTION: GET ITEM OF 1 INVOICE
        function get_invoice_item($application_id) {
            return get_application_item($application_id, 'invoice');
        }


        // FUNCTION: GET ITEM OF 1 PERMIT
        function get_permit_item($application_id) {
            return get_application_item($application_id, 'permit');
        }


        // FUNCTION: GET DATA OF 1 APPLICATION
        function get_application_data($application_id, $stage) {
            require INDEX . 'php/inc/APPLICATION.php';
            require INDEX . 'php/inc/BUSINESS_TYPE.php';
            require INDEX . 'php/inc/PAYMENT_MODE.php';
            $application = get_application_info($application_id, true, $stage, 'for getting application data');
            if(sizeof($application) > 0) {
                $business = $application['business'];
                $citizen = $business['citizen'];
                $corporate_owner = $business['corporate_owner'];
                $arr = array(
                    'application_type' => $application['application_type'],
                    'citizen_id' => $citizen['id'],
                    'citizen_avatar' => $citizen['avatar'],
                    'citizen_full_name' => $citizen['full_name'],
                    'citizen_gender' => $citizen['gender'],
                    'citizen_tin' => $citizen['tin'],
                    'corporate_owner_id' => $corporate_owner['id'],
                    'corporate_owner_fullname' => $corporate_owner['full_name'],
                    'corporate_owner_avatar' => $corporate_owner['avatar'],
                    'corporate_owner_tin' => $corporate_owner['tin'],
                    'corporate_owner_address' => $corporate_owner['full_address'],
                    'business_name' => $business['business_name'],
                    'trade_name' => $business['trade_name'],
                    'business_type_id' => $business['business_type']['id'],
                    'business_types' => get_all_business_types('for getting application data'),
                    'payment_mode_id' => $application['payment_mode_id'],
                    'payment_modes' => get_all_payment_modes('for getting application data'),
                    'dti_number' => $application['dti_number'],
                    'dti_date' => $application['dti_date'],
                    'cda_number' => $application['cda_number'],
                    'cda_date' => $application['cda_date'],
                    'sec_number' => $application['sec_number'],
                    'sec_date' => $application['sec_date'],
                    'active_number' => $application['active_number'],
                    'street_address' => $business['street_address'],
                    'barangay_id' => $business['barangay']['id'],
                    'barangay_address' => $business['barangay']['name'] . ', ' . $business['barangay']['muncity']['name'] . ', ' . $business['barangay']['muncity']['province']['name'],
                    'belongs_to_poblacion' => $business['belongs_to_poblacion'],
                    'business_email' => $business['email'],
                    'business_mobile_num' => $business['mobile_num'],
                    'business_tel_num' => $business['tel_num'],
                    'home_address' => $citizen['full_address'],
                    'home_contact_num' => $citizen['contact_num'],
                    'emergency_person' => $citizen['emergency_person'],
                    'emergency_contact_num' => $citizen['emergency_contact_num'],
                    'total_male_emp' => $application['total_male_emp'],
                    'total_male_emp_lgu' => $application['total_male_emp_lgu'],
                    'total_female_emp' => $application['total_female_emp'],
                    'total_female_emp_lgu' => $application['total_female_emp_lgu'],
                    'total_employees' => intval($application['total_male_emp']) + intval($application['total_female_emp']),
                    'business_area' => $application['business_area'],
                    'is_renting' => $application['is_reting'],
                    'monthly_rental' => $application['monthly_rental'],
                    'lessor_fullname' => $application['lessor_fullname'],
                    'lessor_address' => $application['lessor_address'],
                    'lessor_contact_num' => $application['lessor_contact_num'],
                    'lessor_email' => $application['lessor_email'],
                    'business_activities' => $application['business_activities'],
                    'total_business_tax' => $application['total_business_tax'],
                    'total_asset' => $application['total_asset'],
                    'date_created' => $application['date_created'],
                    'date_updated' => $application['date_updated']
                );
                return $arr;
            }
            else
                return array();
        }


        // FUNCTION: GET DATA OF 1 VERIFICATION
        function get_verification_data($application_id, $consider_invoice = false) {
            $arr = array();
            if($consider_invoice) {
                $GLOBALS['query']  = "SELECT `ID`, `VerificationData`, `FEES_PaymentInvoiceID`";
                $GLOBALS['query'] .= "FROM `applications_forinvoice` ";
                $GLOBALS['query'] .= "WHERE `ApplicationID`=$application_id";
                $result = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                if(has_no_db_error('getting verification data from invoice')) {
                    if(mysqli_num_rows($result) > 0) {
                        $row = mysqli_fetch_assoc($result);

                        $GLOBALS['query']  = "SELECT `PaymentInvoiceID` FROM `applications_forinvoice_tax_invoices` ";
                        $GLOBALS['query'] .= "WHERE `ApplicationForInvoiceID`=" . $row['ID'];
                        $result2 = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                        if(has_no_db_error('getting tax invoice ids from ebpls')) {
                            $arr_tax_invoice_ids = array();
                            while($row2 = mysqli_fetch_assoc($result2)) {
                                array_push($arr_tax_invoice_ids, $row2['PaymentInvoiceID']);
                            }
                            $arr = json_decode($row['VerificationData'], true);
                            $arr['application']['fees_payment_invoice_id'] = $row['FEES_PaymentInvoiceID'];
                            $arr['application']['tax_payment_invoice_id'] = $arr_tax_invoice_ids;
                        }
                    }
                }
                else {
                    require INDEX . 'php/ajax/__fin.php';
                    exit();
                }
            }
            else {
                $application = get_application_data($application_id, 'verification');
                if (sizeof($application) > 0) {
                    require INDEX . 'php/inc/USER_ACCOUNT.php';
                    require INDEX . 'php/inc/BUSINESS_SIZE.php';
                    require INDEX . 'php/inc/TAX_OPTION.php';
                    require INDEX . 'php/inc/FEE.php';
                    require INDEX . 'php/inc/REQUIREMENT.php';

                    $business_size = get_application_business_size($application['total_employees'], $application['total_asset'], 'for getting verification information');

                    $arr = array(
                        'application' => $application,
                        'business_size' => $business_size,
                        'verifiers' => get_application_verifier_user_accounts($application_id, $application['application_type'], 'for getting verification information'),
                        'tax_penalty' => get_application_tax_penalty($application['application_type'], $application['date_updated'], $application['total_business_tax'], 'for getting verification information'),
                        'fees' => get_application_fees(
                            $application['application_type'], $application['business_activities'], $business_size, $application['total_employees'], $application['business_area'], $application['belongs_to_poblacion'], 'for getting verification information',

                        ),
                        'requirements' => get_application_requirements($application_id, $application['application_type'], $application['business_activities'], $application['belongs_to_poblacion'], 'for getting verification information')
                    );
                }
            }
            return $arr;
        }


        // FUNCTION: GET DATA OF 1 INVOICE
        function get_invoice_data($application_id)
        {
            $verification = get_verification_data($application_id, true);
            if (sizeof($verification) > 0) {
                $application = $verification['application'];
                if (sizeof($application) > 0) {

                    $GLOBALS['query'] = "SELECT `ID` FROM `applications_forinvoice` WHERE `ApplicationID`=$application_id";
                    $result = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                    if (has_no_db_error('getting ID of applications_forinvoice')) {
                        $row = mysqli_fetch_assoc($result);
                        $application_for_invoice_id = $row['ID'];
                        $GLOBALS['query'] = "SELECT `PaymentInvoiceID` FROM `applications_forinvoice_tax_invoices` ";
                        $GLOBALS['query'] .= "WHERE `ApplicationForInvoiceID`=$application_for_invoice_id";
                        $result2 = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                        if (has_no_db_error('for getting tax payment invoice ids from ebpls in getting data of 1 invoice')) {
                            require INDEX . 'php/inc/PAYMENT_MODE.php';
                            $payment_mode = get_payment_mode_info($application['payment_mode_id'], 'for getting tax payment invoice ids from ebpls in getting data of 1 invoice');
                            require INDEX . 'php/inc/POPS_PAYMENT_INVOICE.php';
                            $arr_tax_payment_invoice_info = array();
                            $total_amount_without_penalty = 0;
                            while ($row2 = mysqli_fetch_assoc($result2)) {
                                $payment_invoice_info = get_payment_invoice_info($row2['PaymentInvoiceID'], true, 'for getting payment invoice data');
                                array_push($arr_tax_payment_invoice_info, $payment_invoice_info);
                                if(isset($payment_invoice_info['total_amount_without_penalty'])) {
                                    $total_amount_without_penalty += $payment_invoice_info['total_amount_without_penalty'];
                                }
                            }
                            $business_tax_balance_without_penalty = $application['total_business_tax'] - $total_amount_without_penalty;
                            $business_tax_payment_status_code = 0;
                            $business_tax_payment_status_text = "";
                            if($business_tax_balance_without_penalty <= 0) {
                                $business_tax_payment_status_code = 1;
                                $business_tax_payment_status_text = "<span class='text-success'>FULLY PAID</span>";
                            }
                            else if($business_tax_balance_without_penalty < $application['total_business_tax']) {
                                $business_tax_payment_status_code = -1;
                                $business_tax_payment_status_text = "<span class='text-primary'>PARTIALLY PAID</span>";
                            }
                            else if($business_tax_balance_without_penalty >= $application['total_business_tax']) {
                                $business_tax_payment_status_code = 0;
                                $business_tax_payment_status_text = "<span class='text-danger'>UNPAID</span>";
                            }

                            return array(
                                'verification' => $verification,
                                'fees_payment_invoice' => get_payment_invoice_info($application['fees_payment_invoice_id'], true, 'for getting payment invoice data'),
                                'tax_payment_invoice' => array(
                                    'payment_mode' => $payment_mode['title'],
                                    'payment_invoices' => $arr_tax_payment_invoice_info,
                                    'business_tax_balance_without_penalty' => $business_tax_balance_without_penalty,
                                    'status_code' => $business_tax_payment_status_code,
                                    'status_text' => $business_tax_payment_status_text
                                )
                            );
                        }
                    }
                }
            }
            else {
                return array();
            }
        }


        // FUNCTION: GET DATA OF 1 PERMIT
        function get_permit_data($application_id) {
            $arr = array();
            $invoice = get_invoice_data($application_id);
            if(sizeof($invoice) > 0) {
                // get permit no.
                $GLOBALS['query']  = "SELECT `ID`, ";
                $GLOBALS['query'] .= "`PermitFile`, ";
                $GLOBALS['query'] .= "`PermitNumberPrefix`, ";
                $GLOBALS['query'] .= "`PermitNumber`, ";
                $GLOBALS['query'] .= "`PlateNumberPrefix`, ";
                $GLOBALS['query'] .= "`PlateNumber`, ";
                $GLOBALS['query'] .= "DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt ";
                $GLOBALS['query'] .= "FROM `applications_forpermit` ";
                $GLOBALS['query'] .= "WHERE `ApplicationID`=$application_id";
                $result = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                if(has_no_db_error('getting permit number')) {
                    if(mysqli_num_rows($result) > 0) {
                        $row = mysqli_fetch_assoc($result);
                        $arr = array(
                            'permit_no' => $row['PermitNumberPrefix'] . $row['PermitNumber'],
                            'plate_no' => $row['PlateNumberPrefix'] . $row['PlateNumber'],
                            'permit_file' => $row['PermitFile'] . '.php',
                            'created_at' => $row['CreatedAt'],
                            'invoice' => $invoice
                        );
                    }
                }
                else {
                    require INDEX . 'php/ajax/__fin.php';
                    exit();
                }
            }
            return $arr;
        }


        // GET ALL APPLICATIONS
        if(isset($_POST['get_new_applications'])
            || isset($_POST['get_renewal_applications'])
            || isset($_POST['get_new_verifications'])
            || isset($_POST['get_renewal_verifications'])
            || isset($_POST['get_new_invoices'])
            || isset($_POST['get_renewal_invoices'])
            || isset($_POST['get_new_permits'])
            || isset($_POST['get_renewal_permits'])) {
            $application_type = '';
            $menu_href = '';
            $stage = '';
            if (isset($_POST['get_new_applications'])) {
                $application_type = 'NEW';
                $menu_href = $_POST['get_new_applications'];
                $stage = 'edit';
            }
            else if(isset($_POST['get_renewal_applications'])) {
                $application_type = 'RENEWAL';
                $menu_href = $_POST['get_renewal_applications'];
                $stage = 'edit';
            }

            else if (isset($_POST['get_new_verifications'])) {
                $application_type = 'NEW';
                $menu_href = $_POST['get_new_verifications'];
                $stage = 'verification';
            }
            else if(isset($_POST['get_renewal_verifications'])) {
                $application_type = 'RENEWAL';
                $menu_href = $_POST['get_renewal_verifications'];
                $stage = 'verification';
            }
            else if (isset($_POST['get_new_invoices'])) {
                $application_type = 'NEW';
                $menu_href = $_POST['get_new_invoices'];
                $stage = 'invoice';
            }
            else if(isset($_POST['get_renewal_invoices'])) {
                $application_type = 'RENEWAL';
                $menu_href = $_POST['get_renewal_invoices'];
                $stage = 'invoice';
            }
            else if (isset($_POST['get_new_permits'])) {
                $application_type = 'NEW';
                $menu_href = $_POST['get_new_permits'];
                $stage = 'permit';
            }
            else if(isset($_POST['get_renewal_permits'])) {
                $application_type = 'RENEWAL';
                $menu_href = $_POST['get_renewal_permits'];
                $stage = 'permit';
            }

            $last_item_id = trim($_POST['last_item']);
            $active_item_id = intval($_POST['active_item']);

            // check if active item exits
            $query = "SELECT `ID` FROM `applications` WHERE `ID`=$active_item_id AND `ApplicationType`='$application_type'";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking if active application item exists')) {
                $active_item_exists = (mysqli_num_rows($result) > 0);
                $other_table = 'applications_for';
                if (isset($_POST['get_new_applications']) || isset($_POST['get_renewal_applications']))
                    $other_table .= 'edit';
                else if (isset($_POST['get_new_verifications']) || isset($_POST['get_renewal_verifications']))
                    $other_table .= 'verification';
                else if (isset($_POST['get_new_invoices']) || isset($_POST['get_renewal_invoices']))
                    $other_table .= 'invoice';
                else if (isset($_POST['get_new_permits']) || isset($_POST['get_renewal_permits']))
                    $other_table .= 'permit';

                $query = "SELECT `applications`.`ID` ";
                $query .= "FROM `applications`, `$other_table` ";
                $query .= "WHERE `applications`.`ID`=`$other_table`.`ApplicationID` ";
                $query .= "AND `$other_table`.`IsPresent`=1 ";
                $query .= "AND `applications`.`ApplicationType`='$application_type' ";
                $query .= "ORDER BY UNIX_TIMESTAMP(`applications`.`CreatedAt`) DESC, UNIX_TIMESTAMP(`applications`.`UpdatedAt`) DESC";
                $result = mysqli_query($con, $query);
                if (has_no_db_error('getting all new applications')) {
                    $arr_applications = array();
                    $total_items = mysqli_num_rows($result);
                    $item_limit = intval($_POST['item_limit']);
                    $did_passed_last_item = false;
                    $did_passed_active_item = false;
                    $ctr = 1;
                    while ($row = mysqli_fetch_assoc($result)) {
                        $item_id = intval($row['ID']);
                        if ($last_item_id == '') {
                            // no last item found -> means on load
                            if($active_item_exists) {
                                // active item exists
                                array_push($arr_applications, get_application_item($item_id, $stage));
                                $ctr += 1;

                                if($item_id == $active_item_id)
                                    $did_passed_active_item = true;

                                if ($ctr > $item_limit && $did_passed_active_item) break;
                            }
                            else {
                                // active item does not exist
                                array_push($arr_applications, get_application_item($item_id, $stage));
                                $ctr += 1;
                                if ($ctr > $item_limit) break;
                            }
                        }
                        else {
                            // has last item found
                            // initiate get item when already passed the last item
                            if ($did_passed_last_item) {
                                array_push($arr_applications, get_application_item($item_id, $stage));
                                $ctr += 1;
                            }
                            else {
                                if ($item_id == intval($last_item_id))
                                    $did_passed_last_item = true;
                            }
                            if ($ctr > $item_limit) break;
                        }
                    }

                    $response['success']['data'] = array(
                        'menu_href' => $menu_href,
                        'items' => $arr_applications,
                        'total_items' => $total_items
                    );
                }
            }
        }


        // GET DATA OF 1 APPLICATION
        else if(isset($_POST['get_new_application_data']) ||  isset($_POST['get_renewal_application_data'])) {
            $application_id = 0;
            if (isset($_POST['get_new_application_data'])) {
                $application_id = intval($_POST['get_new_application_data']);
            }
            else if(isset($_POST['get_renewal_application_data'])) {
                $application_id = intval($_POST['get_renewal_application_data']);
            }
            $response['success']['data'] = get_application_data($application_id, 'edit');
        }


        // GET DATA OF 1 VERIFICATION
        else if(isset($_POST['get_new_verification_data']) || isset($_POST['get_renewal_verification_data'])) {
            $application_id = 0;
            if (isset($_POST['get_new_verification_data'])) {
                $application_id = intval($_POST['get_new_verification_data']);
            }
            else if(isset($_POST['get_renewal_verification_data'])) {
                $application_id = intval($_POST['get_renewal_verification_data']);
            }
            $response['success']['data'] = get_verification_data($application_id);
        }


        // GET DATA OF 1 INVOICE
        else if(isset($_POST['get_new_invoice_data']) || isset($_POST['get_renewal_invoice_data'])) {
            $application_id = 0;
            if (isset($_POST['get_new_invoice_data'])) {
                $application_id = intval($_POST['get_new_invoice_data']);
            }
            else if(isset($_POST['get_renewal_invoice_data'])) {
                $application_id = intval($_POST['get_renewal_invoice_data']);
            }
            $response['success']['data'] = get_invoice_data($application_id);
        }


        // GET DATA OF 1 PERMIT
        else if(isset($_POST['get_new_permit_data']) || isset($_POST['get_renewal_permit_data'])) {
            $application_id = 0;
            if (isset($_POST['get_new_permit_data'])) {
                $application_id = intval($_POST['get_new_permit_data']);
            }
            else if(isset($_POST['get_renewal_permit_data'])) {
                $application_id = intval($_POST['get_renewal_permit_data']);
            }
            $response['success']['data'] = get_permit_data($application_id);
        }


        // CREATE APPLICATION
        else if(isset($_POST['create_new_new_application']) || isset($_POST['create_new_renewal_application'])) {
            $business_name = '[business_name]';

            // get default citizen
            $citizen_id = 0;
            require INDEX . 'php/inc/LIDS_CITIZEN.php';
            $citizen = get_citizen_info($citizen_id, 'for creating business');

            // insert business record
            $query = "INSERT INTO `businesses`(`BusinessName`, `CitizenID`) VALUES('$business_name', " . $citizen['id'] . ")";
            mysqli_query($con, $query);
            if (has_no_db_error('creating business')) {
                $business_id = intval(mysqli_insert_id($con));

                $application_type = '';
                if(isset($_POST['create_new_new_application']))
                    $application_type = 'NEW';
                else if($_POST['create_new_renewal_application'])
                    $application_type = 'RENEWAL';

                // insert application record
                $query = "INSERT INTO `applications`(`ApplicationType`, `BusinessID`, `DTIRegDate`, `CDARegDate`, `SECRegDate`) VALUES('$application_type', $business_id, CURRENT_DATE, CURRENT_DATE, CURRENT_DATE )";
                mysqli_query($con, $query);
                if (has_no_db_error('creating application')) {
                    $application_id = intval(mysqli_insert_id($con));

                    // insert into applications_foredit
                    $query  = "INSERT INTO `applications_foredit`(`ApplicationID`, `IsPresent`) ";
                    $query .= "VALUES($application_id, 1)";
                    mysqli_query($con, $query);
                    if (has_no_db_error('creating applications foredit')) {


                        // get very first business line
                        $business_line_id = 0;
                        $query = "SELECT `ID` FROM `business_lines` WHERE 1 ORDER BY `BusinessLine` LIMIT 1";
                        $result = mysqli_query($con, $query);
                        if (has_no_db_error('getting first line of business')) {
                            if (mysqli_num_rows($result) > 0) {
                                $row = mysqli_fetch_assoc($result);
                                $business_line_id = intval($row['ID']);
                            }
                        }

                        // insert to business activities
                        $query = "INSERT INTO `business_activities`(`ApplicationID`, `BusinessLineID`) ";
                        $query .= "VALUES($application_id, $business_line_id)";
                        mysqli_query($con, $query);
                        if (has_no_db_error('creating business activity')) {

                            // get the insert date
                            $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `applications` WHERE `ID`=$application_id";
                            $result = mysqli_query($con, $query);
                            $row = mysqli_fetch_assoc($result);

                            $response['success']['data'] = array(
                                'item_id' => $application_id,
                                'item_avatar' => $citizen['avatar'],
                                'item_maintitle' => $business_name,
                                'item_subtitle' => $citizen['full_name'],
                                'item_update_date' => $row['UpdatedAt']
                            );

                            // append to system log (INSERT)
                            append_to_system_log(array(
                                'action' => 'INSERT',
                                'item' => get_application_item($application_id, 'edit'),
                                'item_data' => get_application_data($application_id, 'edit')
                            ));
                        }
                    }
                }
            }
        }


        // SAVE APPLICATION
        else if(isset($_POST['save_application'])) {
            $application_id = intval($_POST['save_application']);

            // check if the application is valid
            $query = "SELECT `ID`, `BusinessID` FROM `applications` WHERE `ID`=$application_id";
            $result = mysqli_query($con, $query);
            if (has_no_db_error('checking if application exists')) {
                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = 'BUSINESS APPLICATION NOT FOUND';
                else {
                    $item = get_application_item($application_id, 'edit');

                    // check if business name is available
                    $row = mysqli_fetch_assoc($result);
                    $business_id = intval($row['BusinessID']);
                    $business_name = mysqli_real_escape_string($con, strip_tags(trim($_POST['business_name'])));
                    $can_proceed = true;
                    if($business_name != '[business_name]') {
                        $query = "SELECT `ID` FROM `businesses` WHERE `BusinessName`='$business_name' ";
                        $query .= "AND `ID`!=$business_id";
                        $result = mysqli_query($con, $query);
                        if (has_no_db_error('checking business name redundancy')) {
                            if(mysqli_num_rows($result) > 0) {
                                $response['success']['message'] = 'UNABLE TO SAVE APPLICATION';
                                $response['success']['sub_message'] = '<span style="font-size: 1.2em">There is already a <span class="text-info">BUSINESS</span> named <span class="text-danger">' . $business_name . '.</span></span>';
                                $can_proceed = false;
                            }
                        }
                    }

                    if($can_proceed) {
                        $application_type = mysqli_real_escape_string($con, strip_tags(trim($_POST['application_type'])));
                        $citizen_id = intval($_POST['citizen_id']);
                        $trade_name = mysqli_real_escape_string($con, strip_tags(trim($_POST['trade_name'])));
                        $business_type_id = intval($_POST['business_type_id']);
                        $payment_mode_id = intval($_POST['payment_mode_id']);
                        $dti_number = mysqli_real_escape_string($con, strip_tags(trim($_POST['dti_number'])));
                        $cda_number = mysqli_real_escape_string($con, strip_tags(trim($_POST['cda_number'])));
                        $sec_number = mysqli_real_escape_string($con, strip_tags(trim($_POST['sec_number'])));
                        $dti_date = mysqli_real_escape_string($con, strip_tags(trim($_POST['dti_date'])));
                        $cda_date = mysqli_real_escape_string($con, strip_tags(trim($_POST['cda_date'])));
                        $sec_date = mysqli_real_escape_string($con, strip_tags(trim($_POST['sec_date'])));
                        $corporate_owner_id = intval($_POST['corporate_owner_id']);
                        $corporate_owner_avatar = mysqli_real_escape_string($con, strip_tags(trim($_POST['corporate_owner_avatar'])));
                        $corporate_owner_fullname = mysqli_real_escape_string($con, strip_tags(trim($_POST['corporate_owner_fullname'])));
                        $corporate_owner_tin = mysqli_real_escape_string($con, strip_tags(trim($_POST['corporate_owner_tin'])));
                        $corporate_owner_address = mysqli_real_escape_string($con, strip_tags(trim($_POST['corporate_owner_address'])));
                        $active_number = mysqli_real_escape_string($con, strip_tags(trim($_POST['active_reg_number'])));
                        $street_address = mysqli_real_escape_string($con, strip_tags(trim($_POST['street_address'])));
                        $barangay_id = intval($_POST['barangay_id']);
                        $business_email = mysqli_real_escape_string($con, strip_tags(trim($_POST['business_email'])));
                        $business_mobile_num = mysqli_real_escape_string($con, strip_tags(trim($_POST['business_mobile_num'])));
                        $business_tel_num = mysqli_real_escape_string($con, strip_tags(trim($_POST['business_tel_num'])));
                        $total_male_emp = intval($_POST['total_male_emp']);
                        $total_male_emp_lgu = intval($_POST['total_male_emp_lgu']);
                        $total_female_emp = intval($_POST['total_female_emp']);
                        $total_female_emp_lgu = intval($_POST['total_female_emp_lgu']);
                        $business_area = floatval($_POST['business_area']);
                        $is_renting = intval($_POST['is_renting']);
                        $monthly_rent = floatval($_POST['monthly_rent']);
                        $lessor_fullname = mysqli_real_escape_string($con, strip_tags(trim($_POST['lessor_fullname'])));
                        $lessor_contact_num = mysqli_real_escape_string($con, strip_tags(trim($_POST['lessor_contact_num'])));
                        $lessor_address = mysqli_real_escape_string($con, strip_tags(trim($_POST['lessor_address'])));
                        $lessor_email = mysqli_real_escape_string($con, strip_tags(trim($_POST['lessor_email'])));
                        $business_activities = array();
                        if(isset($_POST['business_activities'])) {
                            $business_activities = $_POST['business_activities'];
                        }

                        // update business information
                        $query  = "UPDATE `businesses` SET ";
                        $query .= "`CitizenID`=$citizen_id, ";
                        $query .= "`CorporateCitizenID`=$corporate_owner_id, ";
                        $query .= "`CorporateFullname`='$corporate_owner_fullname', ";
                        $query .= "`CorporateAvatar`='$corporate_owner_avatar', ";
                        $query .= "`CorporateTIN`='$corporate_owner_tin', ";
                        $query .= "`CorporateAddress`='$corporate_owner_address', ";
                        $query .= "`BusinessName`='$business_name', ";
                        $query .= "`TradeName`='$trade_name', ";
                        $query .= "`BusinessTypeID`=$business_type_id, ";
                        $query .= "`StreetAddress`='$street_address', ";
                        $query .= "`BrgyID`=$barangay_id, ";
                        $query .= "`TelNum`='$business_tel_num', ";
                        $query .= "`MobileNum`='$business_mobile_num', ";
                        $query .= "`Email`='$business_email' ";
                        $query .= "WHERE `ID`=$business_id";
                        mysqli_query($con, $query);
                        if(has_no_db_error('updating business information')) {

                            // update application information
                            $query  = "UPDATE `applications` ";
                            $query .= "SET `PaymentModeID`=$payment_mode_id, ";
                            $query .= "`DTIRegNumber`='$dti_number', ";
                            $query .= "`DTIRegDate`=STR_TO_DATE('$dti_date', '%M %e, %Y'), ";
                            $query .= "`CDARegNumber`='$cda_number', ";
                            $query .= "`CDARegDate`=STR_TO_DATE('$cda_date', '%M %e, %Y'), ";
                            $query .= "`SECRegNumber`='$sec_number', ";
                            $query .= "`SECRegDate`=STR_TO_DATE('$sec_date', '%M %e, %Y'), ";
                            $query .= "`ActiveRegNumber`='$active_number', ";
                            $query .= "`TotalMaleEmployees`=$total_male_emp, ";
                            $query .= "`TotalMaleEmployeesFromLGU`=$total_male_emp_lgu, ";
                            $query .= "`TotalFemaleEmployees`=$total_female_emp, ";
                            $query .= "`TotalFemaleEmployeesFromLGU`=$total_female_emp_lgu, ";
                            $query .= "`BusinessAreaSqM`=$business_area, ";
                            $query .= "`IsRenting`=$is_renting, ";
                            $query .= "`LessorFullName`='$lessor_fullname', ";
                            $query .= "`LessorAddress`='$lessor_address', ";
                            $query .= "`LessorContactNum`='$lessor_contact_num', ";
                            $query .= "`LessorEmail`='$lessor_email', ";
                            $query .= "`MonthlyRental`=$monthly_rent ";
                            $query .= "WHERE ID=$application_id";
                            mysqli_query($con, $query);
                            if(has_no_db_error('updating application information')) {

                                // gather previous business activities
                                $query  = "SELECT `BusinessLineID` FROM `business_activities` ";
                                $query .= "WHERE `ApplicationID`=$application_id";
                                $result = mysqli_query($con, $query);
                                if(!has_no_db_error('getting previous business activities'))
                                    $can_proceed = false;
                                else {

                                    $arr_prev_bus_activities = array();
                                    while($row = mysqli_fetch_assoc($result)) {
                                        array_push($arr_prev_bus_activities, intval($row['BusinessLineID']));
                                    }

                                    // save current business activities
                                    $arr_current_bus_activities = array();
                                    for ($i = 0; $i < sizeof($business_activities); $i++) {
                                        $business_activity = $business_activities[$i];
                                        $business_line_id = intval($business_activity['business_line_id']);
                                        array_push($arr_current_bus_activities, $business_line_id);
                                        $units = intval($business_activity['units']);
                                        $capitalization = 0;
                                        $gross_sales_essential = 0;
                                        $gross_sales_non_essential = 0;

                                        if (isset($business_activity['capitalization']))
                                            $capitalization = floatval($business_activity['capitalization']);
                                        if (isset($business_activity['gross_sales_essential']))
                                            $gross_sales_essential = floatval($business_activity['gross_sales_essential']);
                                        if (isset($business_activity['gross_sales_non_essential']))
                                            $gross_sales_non_essential = floatval($business_activity['gross_sales_non_essential']);


                                        // insert | update business activity
                                        $query  = "SELECT `ID` FROM `business_activities` ";
                                        $query .= "WHERE `BusinessLineID`=$business_line_id ";
                                        $query .= "AND `ApplicationID`=$application_id";
                                        $result = mysqli_query($con, $query);
                                        if(has_no_db_error('checking if business activity already exists')) {
                                            if(mysqli_num_rows($result) > 0) { // update
                                                $row = mysqli_fetch_assoc($result);
                                                $bus_activity_id = intval($row['ID']);
                                                $query  = "UPDATE `business_activities` ";
                                                $query .= "SET `Units`=$units, ";
                                                $query .= "`Capitalization`=$capitalization, ";
                                                $query .= "`GrossSalesEssential`=$gross_sales_essential, ";
                                                $query .= "`GrossSalesNonEssential`=$gross_sales_non_essential ";
                                                $query .= "WHERE `ID`=$bus_activity_id";
                                                mysqli_query($con, $query);
                                                if(!has_no_db_error('updating business activity')) {
                                                    $can_proceed = false;
                                                }
                                            }
                                            else { // insert
                                                $query  = "INSERT INTO `business_activities`(`ApplicationID`, `BusinessLineID`, `Units`, `Capitalization`, `GrossSalesEssential`, `GrossSalesNonEssential`) ";
                                                $query .= "VALUES($application_id, $business_line_id, $units, $capitalization, $gross_sales_essential, $gross_sales_non_essential)";
                                                mysqli_query($con, $query);
                                                if(!has_no_db_error('adding business activity')) {
                                                    $can_proceed = false;
                                                }
                                            }
                                        }
                                    }

                                    // delete not included business activities
                                    if($can_proceed) {
                                        for($i=0; $i<sizeof($arr_prev_bus_activities); $i++) {
                                            if(!in_array($arr_prev_bus_activities[$i], $arr_current_bus_activities)) {
                                                $query  = "DELETE FROM `business_activities` ";
                                                $query .= "WHERE `BusinessLineID`=" . $arr_prev_bus_activities[$i] . " ";
                                                $query .= "AND `ApplicationID`=$application_id";
                                                mysqli_query($con, $query);
                                                if(!has_no_db_error('removing not included business activities')) {
                                                    $can_proceed = false;
                                                    break;
                                                }
                                            }
                                        }
                                    }

                                    if($can_proceed) {

                                        // get update date
                                        $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `applications` WHERE `ID`=$application_id";
                                        $result = mysqli_query($con, $query);
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            $response['success']['data'] = $row['UpdatedAt'];
                                            break;
                                        }

                                        // append to system log (UPDATE)
                                        append_to_system_log(array(
                                            'action' => 'UPDATE',
                                            'item' => $item,
                                            'item_data' => get_application_data($application_id, 'edit')
                                        ));

                                    }
                                }
                            }
                        }
                    }
                }
            }
        }


        // DELETE APPLICATION
        else if(isset($_POST['delete_new_application']) || isset($_POST['delete_renewal_application'])) {
            $application_id = 0;
            if(isset($_POST['delete_new_application'])) {
                $application_id = intval($_POST['delete_new_application']);
            }
            else if(isset($_POST['delete_renewal_application'])) {
                $application_id = intval($_POST['delete_renewal_application']);
            }

            // check if application is valid
            $query = "SELECT `ID`, `BusinessID` FROM `applications` WHERE `ID`=$application_id";
            $result = mysqli_query($con, $query);
            if (has_no_db_error('checking if application exists')) {
                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = 'BUSINESS APPLICATION NOT FOUND';
                else {
                    $item = get_application_item($application_id, 'edit');
                    $item_data = get_application_data($application_id, 'edit');

                    $row = mysqli_fetch_assoc($result);
                    $business_id = intval($row['BusinessID']);

                    // delete the business of this application
                    // if there are no other applications associated with it
                    $can_proceed = true;
                    $query  = "SELECT `ID` FROM `applications` ";
                    $query .= "WHERE `BusinessID`=$business_id ";
                    $query .= "AND `ID`!=$application_id";
                    $result = mysqli_query($con, $query);

                    if(!has_no_db_error('checking for other associated business applications'))
                        $can_proceed = false;
                    else {
                        if(mysqli_num_rows($result) > 0) {

                            // only delete application data
                            $query = "DELETE FROM `applications` WHERE ID=$application_id";
                            mysqli_query($con, $query);
                            if(!has_no_db_error('deleting business application'))
                                $can_proceed = false;
                        }

                        else {

                            // delete business data
                            $query = "DELETE FROM `businesses` WHERE ID=$business_id";
                            mysqli_query($con, $query);
                            if(!has_no_db_error('deleting business'))
                                $can_proceed = false;

                        }
                    }
                    if($can_proceed) {
                        $response['success']['data'] = '1';

                        // append to system log (DELETE)
                        append_to_system_log(array(
                            'action' => 'DELETE',
                            'item' => $item,
                            'item_data' => $item_data
                        ));
                    }
                }
            }
        }


        // CREATE VERIFICATION
        else if(isset($_POST['submit_new_forverification']) || isset($_POST['submit_renewal_forverification'])) {
            $application_id = 0;
            if (isset($_POST['submit_new_forverification']))
                $application_id = intval($_POST['submit_new_forverification']);
            else if(isset($_POST['submit_renewal_forverification']))
                $application_id = intval($_POST['submit_renewal_forverification']);

            $application = get_application_data($application_id, 'edit');
            if(sizeof($application) <= 0)
                $response['error'] = 'BUSINESS APPLICATION NOT FOUND';
            else {
                if ($application['citizen_id'] == '0')
                    $response['success']['sub_message'] = "Please search for another <span class='text-info'>CITIZEN</span>.";
                else if ($application['business_name'] == '[business_name]')
                    $response['success']['sub_message'] = "Please provide the proper <span class='text-info'>BUSINESS NAME</span>.";
                else if ($application['total_employees'] <= 0)
                    $response['success']['sub_message'] = "Please specify the <span class='text-primary'>NUMBER OF EMPLOYEES</span>.";
                /*else if ($application['business_area'] <= 0)
                    $response['success']['sub_message'] = "Please specify the <span class='text-info'>BUSINESS AREA</span>.";*/
                else if ($application['is_renting'] == 1) {
                    if ($application['monthly_rental'] <= 0)
                        $response['success']['sub_message'] = "Please specify the <span class='text-info'>MONTHLY RENT</span>.";
                    else if ($application['lessor_fullname'] == '')
                        $response['success']['sub_message'] = "Please specify the <span class='text-info'>LESSOR FULL NAME</span>.";
                    else if ($application['lessor_address'] == '')
                        $response['success']['sub_message'] = "Please specify the <span class='text-info'>LESSOR ADDRESS</span>.";
                }

                if ($response['success']['sub_message'] == '') {
                    for($i=0; $i<sizeof($application['business_activities']); $i++) {
                        $business_activity = $application['business_activities'][$i];

                        /*
                        if ($business_activity['units'] <= 0) {
                            $response['success']['sub_message'] = "Please specify the <span class='text-info'>NUMBER OF UNITS</span> for <span class='text-primary'>" . $business_activity['business_line_title'] . ".</span>";
                            break;
                        }*/
                        if ($application['application_type'] == 'NEW') {
                            if ($business_activity['capitalization'] <= 0) {
                                $response['success']['sub_message'] = "Please specify the <span class='text-info'>CAPITALIZATION</span> for <span class='text-primary'>" . $business_activity['business_line_title'] . ".</span>";
                                break;
                            }
                        }
                        else if ($application['application_type'] == 'RENEWAL') {
                            if($business_activity['gross_sales_combined'] <= 0) {
                                $response['success']['sub_message'] = "Please specify the <span class='text-info'>GROSS SALES</span> for <span class='text-primary'>" . $business_activity['business_line_title'] . ".</span>";
                                break;
                            }
                        }
                    }
                }

                if($response['success']['sub_message'] != '') {
                    // return error
                    $response['success']['message'] = 'UNABLE TO SUBMIT FOR VERIFICATION';
                    $response['success']['sub_message'] = '<span style="font-size: 1.2em">' . $response['success']['sub_message'] . '</span>';
                }
                else {
                    // do submission
                    $query = "SELECT `ApplicationID` FROM `applications_forverification` WHERE `ApplicationID`=$application_id";
                    $result = mysqli_query($con, $query);
                    if(has_no_db_error('checking if application is already submitted')) {
                        if(mysqli_num_rows($result) > 0)
                            $response['error'] = 'APPLICATION ALREADY SUBMITTED!';
                        else {
                            $query  = "INSERT INTO `applications_forverification`(`ApplicationID`, `IsPresent`) ";
                            $query .= "VALUES($application_id, 1)";
                            mysqli_query($con, $query);
                            if(has_no_db_error('inserting verification')) {
                                $query  = "UPDATE `applications_foredit` ";
                                $query .= "SET `IsPresent`=0 ";
                                $query .= "WHERE `ApplicationID`=$application_id";
                                mysqli_query($con, $query);
                                if(has_no_db_error('clearing application for edit')) {
                                    $response['success']['data'] = '1';

                                    // append to system log (INSERT)
                                    append_to_system_log(array(
                                        'action' => 'INSERT',
                                        'item' => get_verification_item($application_id),
                                        'item_data' => get_verification_data($application_id)
                                    ));
                                }
                            }
                        }
                    }
                }
            }
        }


        // SAVE VERIFICATION
        else if(isset($_POST['save_verification'])) {
            $application_id = intval($_POST['save_verification']);

            // check if verification is valid
            $query  = "SELECT `IsPresent` FROM `applications_forverification` ";
            $query .= "WHERE `ApplicationID`=$application_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking if verification exists')) {
                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = 'APPLICATION VERIFICATION NOT FOUND';
                else {
                    $row = mysqli_fetch_assoc($result);
                    if(intval($row['IsPresent']) == 0)
                        $response['error'] = 'APPLICATION VERIFICATION ALREADY SUBMITTED';
                    else {
                        $item = get_verification_item($application_id);
                        $application_type = mysqli_real_escape_string($con, strip_tags(trim($_POST['application_type'])));
                        $can_proceed = true;

                        // save submitted requirements
                        $arr_requirements = array();
                        require INDEX . 'php/inc/REQUIREMENT.php';
                        if(isset($_POST['submitted_requirements']))
                            $arr_requirements = $_POST['submitted_requirements'];
                        for($i=0; $i<sizeof($arr_requirements); $i++) {
                            $requirement_id = intval($arr_requirements[$i]['requirement_id']);
                            $file_name = mysqli_real_escape_string($con, strip_tags(trim($arr_requirements[$i]['file_name'])));
                            $validation_code = mysqli_real_escape_string($con, strip_tags(trim($arr_requirements[$i]['validation_code'])));
                            $is_verified = intval($arr_requirements[$i]['is_verified']);

                            // insert or update submitted requirement
                            $submitted_requirement = get_application_submitted_requirement($application_id, $requirement_id);
                            if($submitted_requirement['file_name'] == '' && $submitted_requirement['validation_code'] == '') {
                                // insert submitted requirement
                                $query  = "INSERT INTO `applications_requirement`(`ApplicationID`, `RequirementID`, `Filename`, `ValidationCode`, `IsVerified`) ";
                                $query .= "VALUES($application_id, $requirement_id, '$file_name', '$validation_code', $is_verified)";
                                mysqli_query($con, $query);
                                if(!has_no_db_error('inserting submitted requirement')) {
                                    $can_proceed = false;
                                    break;
                                }
                            }
                            else {
                                // update submitted requirement
                                if($submitted_requirement['file_name'] != '_.png' && $file_name != '_.png') {
                                    if($submitted_requirement['file_name'] != $file_name && $file_name != '') {

                                        // delete previously submitted requirement file
                                        chdir(INDEX . 'img/reqs');
                                        if(file_exists($submitted_requirement['file_name']))
                                            unlink($submitted_requirement['file_name']);
                                    }
                                }
                                $query  = "UPDATE `applications_requirement` ";
                                $query .= "SET `Filename`='$file_name', ";
                                $query .= "`ValidationCode`='$validation_code', ";
                                $query .= "`IsVerified`=$is_verified ";
                                $query .= "WHERE `ApplicationID`=$application_id ";
                                $query .= "AND `RequirementID`=$requirement_id";
                                mysqli_query($con, $query);
                                if(!has_no_db_error('updating submitted requirement')) {
                                    $can_proceed = false;
                                    break;
                                }
                            }
                        }

                        // save application approvals
                        if($can_proceed) {
                            // save application approvals
                            require INDEX . 'php/inc/USER_ACCOUNT.php';
                            $arr_approvals = array();
                            if(isset($_POST['approvals']))
                                $arr_approvals = $_POST['approvals'];

                            for($i=0; $i<sizeof($arr_approvals); $i++) {
                                $citizen_id = intval($arr_approvals[$i]['citizen_id']);
                                $is_approved = intval($arr_approvals[$i]['is_approved']);
                                $remarks = mysqli_real_escape_string($con, strip_tags(trim($arr_approvals[$i]['remarks'])));

                                // insert or update application approval
                                $application_approval = get_application_approval($application_id, $citizen_id);
                                if($application_approval['is_approved'] == '' && $application_approval['remarks'] == '') {
                                    // insert approval
                                    $query  = "INSERT INTO `applications_approval`(`CitizenID`, `ApplicationID`, `IsApproved`, `Remarks`) ";
                                    $query .= "VALUES($citizen_id, $application_id, $is_approved, '$remarks')";
                                    mysqli_query($con, $query);
                                    if(!has_no_db_error('inserting application approval')) {
                                        $can_proceed = false;
                                        break;
                                    }
                                }
                                 else {
                                    // update approval
                                    $query  = "UPDATE `applications_approval` ";
                                    $query .= "SET `IsApproved`=$is_approved, ";
                                    $query .= "`Remarks`='$remarks' ";
                                    $query .= "WHERE `CitizenID`=$citizen_id ";
                                    $query .= "AND `ApplicationID`=$application_id ";
                                    $query .= "AND `UpdatedAt`='" . $application_approval['date_updated'] . "'";
                                    mysqli_query($con, $query);
                                    if(!has_no_db_error('updating application approval')) {
                                        $can_proceed = false;
                                        break;
                                    }
                                }
                            }
                        }

                        if($can_proceed) {

                            // get update date
                            $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `applications_forverification` WHERE `ApplicationID`=$application_id";
                            $result = mysqli_query($con, $query);
                            while ($row = mysqli_fetch_assoc($result)) {
                                $response['success']['data'] = $row['UpdatedAt'];
                                break;
                            }

                            // append to system log (UPDATE)
                            append_to_system_log(array(
                                'action' => 'UPDATE',
                                'item' => $item,
                                'item_data' => get_verification_data($application_id)
                            ));
                        }
                    }
                }
            }
        }


        // DELETE VERIFICATION
        else if(isset($_POST['delete_new_verification']) || isset($_POST['delete_renewal_verification'])) {
            $application_id = 0;
            $application_type = '';
            if(isset($_POST['delete_new_verification'])) {
                $application_id = intval($_POST['delete_new_verification']);
                $application_type = 'NEW';
            }
            else if(isset($_POST['delete_renewal_verification'])) {
                $application_id = intval($_POST['delete_renewal_verification']);
                $application_type = 'RENEWAL';
            }

            // check if verification is valid
            $query = "SELECT `ApplicationID`, `IsPresent` FROM `applications_forverification` WHERE `ApplicationID`=$application_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking if verification is valid')) {
                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = '[' . $application_type . '] VERIFICATION NOT FOUND';
                else {
                    $row = mysqli_fetch_assoc($result);
                    if(intval($row['IsPresent']) != 1)
                        $response['error'] = '[' . $application_type . '] VERIFICATION ALREADY SUBMITTED';
                    else {
                        $item = get_verification_item($application_id);
                        $item_data = get_verification_data($application_id);

                        $query = "DELETE FROM `applications_approval` WHERE `ApplicationID`=$application_id";
                        mysqli_query($con, $query);
                        if (has_no_db_error('deleting from application approvals')) {
                            $query = "DELETE FROM `applications_forverification` WHERE `ApplicationID`=$application_id";
                            mysqli_query($con, $query);
                            if (has_no_db_error('deleting from application for verification')) {
                                $query = "UPDATE `applications_foredit` ";
                                $query .= "SET `IsPresent`=1 ";
                                $query .= "WHERE `ApplicationID`=$application_id";
                                mysqli_query($con, $query);
                                if (has_no_db_error('inserting to application for edit')) {
                                    $response['success']['data'] = '1';

                                    // append to system log (DELETE)
                                    append_to_system_log(array(
                                        'action' => 'DELETE',
                                        'item' => $item,
                                        'item_data' => $item_data
                                    ));
                                }
                            }
                        }
                    }
                }
            }
        }


        // CREATE INVOICE
        else if(isset($_POST['submit_new_forinvoice']) || isset($_POST['submit_renewal_forinvoice'])) {
            $application_id = 0;
            $is_renewal = 0;
            if (isset($_POST['submit_new_forinvoice'])) {
                $application_id = intval($_POST['submit_new_forinvoice']);
            }
            else if(isset($_POST['submit_renewal_forinvoice'])) {
                $application_id = intval($_POST['submit_renewal_forinvoice']);
                $is_renewal = 1;
            }

            $verification = get_verification_data($application_id);
            if(sizeof($verification) <= 0)
                $response['error'] = 'APPLICATION VERIFICATION NOT FOUND';
            else {

                // check submitted requirements
                for($i=0; $i<sizeof($verification['requirements']); $i++) {
                    $requirement = $verification['requirements'][$i];
                    if($requirement['collect_after'] == 'APPLICATION') {
                        $submitted = $requirement['submitted'];
                        if ($submitted['validation_code'] == '') {
                            $response['success']['sub_message'] = "Please enter the " . $requirement['validation_code_title'] . " for <span class='text-primary'>" . $requirement['title'] . "</span>.";
                            break;
                        } else if ($requirement['for_upload'] == 1 && $submitted['file_name'] == '') {
                            $response['success']['sub_message'] = "<span style='font-size: 1.2em;'>Please upload the file for <span class='text-primary'>" . $requirement['title'] . "</span></span>.";
                            break;
                        } else if ($submitted['is_verified'] != 1) {
                            $response['success']['sub_message'] = "<span style='font-size: 1.2em'>The requirement <span class='text-primary'>" . $requirement['title'] . "</span> is <span class='text-danger'>not yet verified.</span></span>";
                            break;
                        }
                    }
                }
                if ($response['success']['sub_message'] == '') {

                    // check application approvals
                    for($i=0; $i<sizeof($verification['verifiers']); $i++) {
                        $verifier = $verification['verifiers'][$i];
                        $approval = $verifier['approval'];
                        if($approval['is_approved'] != 1) {
                            $response['success']['sub_message'] = "<span class='text-danger' style='font-size: 1.2em'>STILL NEED TO BE VERIFIED BY THE FOLLOWING USER:</span>" .
                              "<div class='card social-card active share no-margin no-border w-100'>" .
                              "<div class='card-header clearfix no-border no-border-radius overflow-hidden'>" .
                              "<div class='item-avatar user-pic'><img alt='(img)' width='33' height='33' src='" . EGOV2_CITIZEN_AVATAR_DIR . $verifier['avatar'] . "'></div>" .
                              "<h5 class='no-wrap text-montserrat'><span class='main-title'>" . $verifier['fullname'] . "</span></h5>" .
                              "<h6 class='no-wrap sub-title'>(" . $verifier['usertype_acronym'] . ") " . $verifier['usertype_title'] . "</h6>" .
                              "</div>" .
                              "</div>";
                            if($approval['remarks'] != '') {
                                $response['success']['sub_message'] .= "<br><br><span class='text-info' style='font-size: 1.2em'>REMARKS:</span><br>" . $approval['remarks'];
                            }
                            break;
                        }
                    }
                }

                if($response['success']['sub_message'] != '')
                    $response['success']['message'] = 'UNABLE TO SUBMIT FOR INVOICE';
                else {

                    // create payment invoice for APPLICABLE FEES
                    $query  = "INSERT INTO `paymentinvoice`(`CitizenID`, `Date`, `PaymentFor`, `Amount`, `isEBPLSrenewal`) ";
                    $query .= "VALUES(" . $verification['application']['citizen_id'] . ", NOW(), 'eBPLS', " . $verification['fees']['total_fee'] . ", $is_renewal)";
                    mysqli_query($con_lids, $query);
                    if(has_no_db_error('inserting payment invoice')) {
                        $payment_invoice_id = mysqli_insert_id($con_lids);

                        // insert payment invoice summary for APPLICABLE FEES
                        $can_proceed = true;
                        for($i=0; $i<sizeof($verification['fees']['fee_classifications']); $i++) {
                            $fee = $verification['fees']['fee_classifications'][$i];
                            $fee_desc = mysqli_real_escape_string($con_lids, $fee['fee']);

                            $query  = "SELECT `OtherFeeID` FROM `otherfee` ";
                            $query .= "WHERE `FeeDesc`='" . $fee_desc . "'";
                            $result = mysqli_query($con_lids, $query);
                            if(!has_no_db_error('checking if other fee exists')) {
                                $can_proceed = false;
                                break;
                            }
                            else {
                                $other_fee_id = 0;
                                if(mysqli_num_rows($result) <= 0) {
                                    // insert other fee
                                    $query  = "INSERT INTO `otherfee`(`FeeDesc`) VALUES('" . $fee_desc . "')";
                                    mysqli_query($con_lids, $query);
                                    if(!has_no_db_error('inserting other fee')) {
                                        $can_proceed = false;
                                        break;
                                    }
                                    else
                                        $other_fee_id = mysqli_insert_id($con_lids);
                                }
                                else {
                                    // get other fee id
                                    $row = mysqli_fetch_assoc($result);
                                    $other_fee_id = $row['OtherFeeID'];
                                }

                                // insert payment invoice summary now!
                                $query = "INSERT INTO `paymentinvoicesummary`(`PaymentInvoiceID`, `OtherFeeID`, `Qty`, `Amount`) ";
                                $query .= "VALUES($payment_invoice_id, $other_fee_id, 1, " . $fee['amount'] . ")";
                                mysqli_query($con_lids, $query);
                                if(!has_no_db_error('inserting payment invoice summary')) {
                                    $can_proceed = false;
                                    break;
                                }
                            }
                        }

                        // create payment invoice for BUSINESS TAX
                        if($can_proceed) {
                            require INDEX . 'php/inc/PAYMENT_MODE.php';
                            $final_business_tax = $verification['application']['total_business_tax'];
                            $payment_mode = get_payment_mode_info($verification['application']['payment_mode_id'], 'for creating business tax invoice');
                            $is_quarterly = (strtoupper($payment_mode['title']) == 'QUARTERLY') ? 1 : 0;

                            $arr_business_taxes = array();
                            if($is_quarterly) {
                                // QUARTERLY
                                /*$tax_amount = ($final_business_tax / 4);
                                for($i=0; $i<4; $i++) {
                                    array_push($arr_business_taxes, array(
                                        'tax_amount' => $tax_amount,
                                        'is_quarterly' => $is_quarterly,
                                        'invoice_id' => 0
                                    ));
                                }*/
                                array_push($arr_business_taxes, array(
                                    'tax_amount' => $final_business_tax,
                                    'is_quarterly' => $is_quarterly,
                                    'invoice_id' => 0
                                ));
                            }
                            else {
                                // ANUALLY
                                array_push($arr_business_taxes, array(
                                    'tax_amount' => $final_business_tax,
                                    'is_quarterly' => $is_quarterly,
                                    'invoice_id' => 0
                                ));
                            }

                            $can_proceed = true;
                            for($i=0; $i<sizeof($arr_business_taxes); $i++) {
                                $tax_amount = $arr_business_taxes[$i]['tax_amount'];
                                $is_quarterly = $arr_business_taxes[$i]['is_quarterly'];

                                if($tax_amount > 0) {
                                    $query = "INSERT INTO `paymentinvoice`(`CitizenID`, `Date`, `PaymentFor`, `Amount`, `isEBPLSrenewal`) ";
                                    $query .= "VALUES(" . $verification['application']['citizen_id'] . ", NOW(), 'eBPLS:TAX', " . $tax_amount . ", $is_renewal)";
                                    mysqli_query($con_lids, $query);
                                    if (has_no_db_error('inserting business tax payment invoice to pops')) {
                                        $arr_business_taxes[$i]['invoice_id'] = mysqli_insert_id($con_lids);
                                    }
                                    else {
                                        $can_proceed = false;
                                        break;
                                    }
                                }
                            }

                            // do submission
                            if($can_proceed) {
                                $query = "SELECT `ApplicationID` FROM `applications_forinvoice` WHERE `ApplicationID`=$application_id";
                                $result = mysqli_query($con, $query);
                                if (has_no_db_error('checking if application is already invoiced')) {
                                    if (mysqli_num_rows($result) > 0)
                                        $response['error'] = 'APPLICATION ALREADY INVOICED!';
                                    else {
                                        $verification_data = get_verification_data($application_id);
                                        array_walk($verification_data, 'utf8encode');

                                        $application_forinvoice_id = 0;
                                        $query = "INSERT INTO `applications_forinvoice`(`ApplicationID`, `IsPresent`, `VerificationData`, `FEES_PaymentInvoiceID`) ";
                                        $query .= "VALUES($application_id, 1, '" . mysqli_real_escape_string($con, json_encode($verification_data)) . "', $payment_invoice_id)";
                                        mysqli_query($con, $query);
                                        if (has_no_db_error('inserting payment invoice')) {
                                            $application_forinvoice_id = mysqli_insert_id($con);
                                            $can_proceed = true;
                                            $arr_tax_payment_invoice_ids = array();
                                            for($i=0; $i<sizeof($arr_business_taxes); $i++) {
                                                $query = "INSERT INTO `applications_forinvoice_tax_invoices`(`ApplicationForInvoiceID`, `PaymentInvoiceID`) ";
                                                $query .= "VALUES($application_forinvoice_id, " . $arr_business_taxes[$i]['invoice_id'] . ")";
                                                mysqli_query($con, $query);
                                                if (has_no_db_error('recording business tax payment invoice to ebpls')) {
                                                    array_push($arr_tax_payment_invoice_ids, $arr_business_taxes[$i]['invoice_id']);
                                                }
                                                else {
                                                    $can_proceed = false;
                                                    break;
                                                }
                                            }

                                            if($can_proceed) {
                                                $query = "UPDATE `applications_forverification` ";
                                                $query .= "SET `IsPresent`=0 ";
                                                $query .= "WHERE `ApplicationID`=$application_id";
                                                mysqli_query($con, $query);
                                                if (has_no_db_error('clearing verification')) {

                                                    $response['success']['data'] = array(
                                                        'payment_invoice_id_fee' => $payment_invoice_id,
                                                        'total_fees' => $verification['fees']['total_fee'],
                                                        'payment_invoice_id_tax' => $arr_tax_payment_invoice_ids,
                                                        'total_tax' => $final_business_tax
                                                    );

                                                    // append to system log (INSERT)
                                                    append_to_system_log(array(
                                                        'action' => 'INSERT',
                                                        'item' => get_invoice_item($application_id),
                                                        'item_data' => get_invoice_data($application_id)
                                                    ));
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }


        // DELETE INVOICE
        else if(isset($_POST['delete_new_invoice']) || isset($_POST['delete_renewal_invoice'])) {
            $application_id = 0;
            $application_type = '';
            if(isset($_POST['delete_new_invoice'])) {
                $application_id = intval($_POST['delete_new_invoice']);
                $application_type = 'NEW';
            }
            else if(isset($_POST['delete_renewal_invoice'])) {
                $application_id = intval($_POST['delete_renewal_invoice']);
                $application_type = 'RENEWAL';
            }

            // check if verification is valid
            $query = "SELECT `ApplicationID`, `IsPresent`, `FEES_PaymentInvoiceID` FROM `applications_forinvoice` WHERE `ApplicationID`=$application_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking if payment invoice is valid')) {
                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = '[' . $application_type . '] INVOICE NOT FOUND';
                else {
                    $row = mysqli_fetch_assoc($result);
                    if(intval($row['IsPresent']) != 1)
                        $response['error'] = '[' . $application_type . '] INVOICE ALREADY SUBMITTED';
                    else {
                        $item = get_invoice_item($application_id);
                        $item_data = get_invoice_data($application_id);

                        // cancel payment invoice
                        require INDEX . 'php/inc/POPS_PAYMENT_INVOICE.php';
                        cancel_payment_invoice($row['FEES_PaymentInvoiceID'], 'for removing payment invoice');

                        $tax_payment_invoice = $item_data['tax_payment_invoice'];
                        for($i=0; $i<sizeof($tax_payment_invoice['payment_invoices']); $i++) {
                            if(isset($tax_payment_invoice['payment_invoices'][$i]['id'])) {
                                cancel_payment_invoice($tax_payment_invoice['payment_invoices'][$i]['id'], 'for removing payment invoice');
                            }
                        }

                        $query = "DELETE FROM `applications_forinvoice` WHERE `ApplicationID`=$application_id";
                        mysqli_query($con, $query);
                        if (has_no_db_error('deleting from application for invoice')) {
                            $query = "UPDATE `applications_forverification` ";
                            $query .= "SET `IsPresent`=1 ";
                            $query .= "WHERE `ApplicationID`=$application_id";
                            mysqli_query($con, $query);
                            if (has_no_db_error('inserting to application for verification')) {
                                $response['success']['data'] = '1';

                                // append to system log (DELETE)
                                append_to_system_log(array(
                                    'action' => 'DELETE',
                                    'item' => $item,
                                    'item_data' => $item_data
                                ));
                            }
                        }
                    }
                }
            }
        }


        // CREATE PERMIT
        else if(isset($_POST['submit_new_forpermit']) || isset($_POST['submit_renewal_forpermit'])) {
            $application_id = 0;
            if (isset($_POST['submit_new_forpermit']))
                $application_id = intval($_POST['submit_new_forpermit']);
            else if (isset($_POST['submit_renewal_forpermit']))
                $application_id = intval($_POST['submit_renewal_forpermit']);

            $invoice = get_invoice_data($application_id);
            if(sizeof($invoice) <= 0)
                $response['error'] = 'PAYMENT INVOICE NOT FOUND';
            else {

                // ====================================================================================
                // process requirements that was just collected during invoice
                $updated_verification_data = array();
                if(isset($_POST['additional_data'])) {
                    if(isset($_POST['additional_data']['submitted_requirements'])) {
                        require INDEX . 'php/inc/REQUIREMENT.php';
                        $arr_requirements = $_POST['additional_data']['submitted_requirements'];
                        for($i=0; $i<sizeof($arr_requirements); $i++) {
                            $requirement_id = intval($arr_requirements[$i]['requirement_id']);
                            $file_name = mysqli_real_escape_string($con, strip_tags(trim($arr_requirements[$i]['file_name'])));
                            $validation_code = mysqli_real_escape_string($con, strip_tags(trim($arr_requirements[$i]['validation_code'])));
                            $is_verified = intval($arr_requirements[$i]['is_verified']);

                            // delete previously submitted requirement
                            $query  = "DELETE FROM `applications_requirement` ";
                            $query .= "WHERE `ApplicationID`=$application_id AND ";
                            $query .= "`RequirementID`=$requirement_id";
                            mysqli_query($con, $query);
                            if(!has_no_db_error('deleting previously submitted requirement')) {
                                $can_proceed = false;
                                break;
                            }

                            // insert submitted requirement
                            $query  = "INSERT INTO `applications_requirement`(`ApplicationID`, `RequirementID`, `Filename`, `ValidationCode`, `IsVerified`) ";
                            $query .= "VALUES($application_id, $requirement_id, '$file_name', '$validation_code', $is_verified)";
                            mysqli_query($con, $query);
                            if(!has_no_db_error('inserting submitted requirement')) {
                                $can_proceed = false;
                                break;
                            }
                        }

                        // update applications_forinvoice's VerificationData
                        $updated_verification_data = get_verification_data($application_id);
                        $query  = "UPDATE `applications_forinvoice` ";
                        $query .= "SET `VerificationData`='" .  mysqli_real_escape_string($con, json_encode($updated_verification_data)) . "' ";
                        $query .= "WHERE `ApplicationID`=$application_id";
                        mysqli_query($con, $query);
                        if(!has_no_db_error('updating json verification data')) {
                            exit();
                        }
                    }
                }
                // ====================================================================================

                // check if the fees are already paid
                if(isset($invoice['fees_payment_invoice'])) {
                    if($invoice['fees_payment_invoice']['or_no'] == '')
                        $response['success']['sub_message'] = "<span style='font-size: 1.2em'>THE <span class='text-danger'>APPLICABLE FEES</span> ARE NOT YET SETTLED.</span>";
                }
                // check if the business tax is already paid
                if($response['success']['sub_message'] == '') {
                    if($invoice['verification']['application']['total_business_tax'] > 0) {
                        if (isset($invoice['tax_payment_invoice']['payment_invoices'])) {
                            $is_tax_paid = false;
                            for ($i = 0; $i < sizeof($invoice['tax_payment_invoice']['payment_invoices']); $i++) {
                                if ($invoice['tax_payment_invoice']['payment_invoices'][$i]['or_no'] != '') {
                                    $is_tax_paid = true;
                                    break;
                                }
                            }

                            if (!$is_tax_paid) {
                                $response['success']['sub_message'] = "<span style='font-size: 1.2em'>THE <span class='text-danger'>BUSINESS TAX</span> IS NOT YET SETTLED.</span>";
                            }
                        }
                    }
                }
                // check submitted requirements
                if($response['success']['sub_message'] == '') {
                    if (sizeof($updated_verification_data) > 0) {
                        for ($i = 0; $i < sizeof($updated_verification_data['requirements']); $i++) {
                            $requirement = $updated_verification_data['requirements'][$i];
                            if ($requirement['collect_after'] == 'PAYMENT') {
                                $submitted = $requirement['submitted'];
                                if ($submitted['validation_code'] == '') {
                                    $response['success']['sub_message'] = "Please enter the " . $requirement['validation_code_title'] . " for <span class='text-primary'>" . $requirement['title'] . "</span>.";
                                    break;
                                }
                                else if ($requirement['for_upload'] == 1 && $submitted['file_name'] == '') {
                                    $response['success']['sub_message'] = "<span style='font-size: 1.2em;'>Please upload the file for <span class='text-primary'>" . $requirement['title'] . "</span></span>.";
                                    break;
                                }
                                else if ($submitted['is_verified'] != 1) {
                                    $response['success']['sub_message'] = "<span style='font-size: 1.2em'>The requirement <span class='text-primary'>" . $requirement['title'] . "</span> is <span class='text-danger'>not yet verified.</span></span>";
                                    break;
                                }
                            }
                        }
                    }
                }
                if($response['success']['sub_message'] != '')
                    $response['success']['message'] = 'UNABLE TO GENERATE BUSINESS PERMIT';
                else {

                    // do submission
                    $query = "SELECT `ApplicationID` FROM `applications_forpermit` WHERE `ApplicationID`=$application_id";
                    $result = mysqli_query($con, $query);
                    if(has_no_db_error('checking if permit is already generated')) {
                        if (mysqli_num_rows($result) > 0)
                            $response['error'] = 'BUSINESS PERMIT ALREADY GENERATED!';
                        else {
                            require INDEX . 'php/inc/SETTING.php';
                            $business_permit_setting = get_business_permit_setting('for creating business permit');

                            $query  = "INSERT INTO `applications_forpermit`(";
                            $query .= "`ApplicationID`, ";
                            $query .= "`IsPresent`, ";
                            $query .= "`PermitFile`, ";
                            $query .= "`PermitNumberPrefix`, ";
                            $query .= "`PermitNumber`, ";
                            $query .= "`PlateNumberPrefix`, ";
                            $query .= "`PlateNumber`) ";
                            $query .= "VALUES(";
                            $query .= "$application_id, ";
                            $query .= "1, ";
                            $query .= "'" . PERMIT_FILE . "', ";
                            $query .= "'" . $business_permit_setting['permit_no_prefix'] . "', ";
                            $query .= "'" . sprintf("%0" . $business_permit_setting['permit_no_digits'] . "d", $business_permit_setting['permit_no_next']) . "', ";
                            $query .= "'" . $business_permit_setting['plate_no_prefix'] . "', ";
                            $query .= "'" . sprintf("%0" . $business_permit_setting['plate_no_digits'] . "d", $business_permit_setting['plate_no_next']) . "')";
                            mysqli_query($con, $query);
                            if(has_no_db_error('inserting business permit')) {
                                $query  = "UPDATE `applications_forinvoice` ";
                                $query .= "SET `IsPresent`=0 ";
                                $query .= "WHERE `ApplicationID`=$application_id";
                                mysqli_query($con, $query);
                                if(has_no_db_error('clearing payment invoice')) {

                                    // increment permit number
                                    write_setting_data(1, 'permit_no_next', ($business_permit_setting['permit_no_next'] + 1), 'for generating business permit');

                                    // increment plate number
                                    write_setting_data(1, 'plate_no_next', ($business_permit_setting['plate_no_next'] + 1), 'for generating business permit');

                                    // append to system log (INSERT)
                                    append_to_system_log(array(
                                        'action' => 'INSERT',
                                        'item' => get_permit_item($application_id),
                                        'item_data' => get_permit_data($application_id)
                                    ));
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    require '__fin.php';
?>