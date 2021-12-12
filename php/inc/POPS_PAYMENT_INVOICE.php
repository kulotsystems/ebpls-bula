<?php

    /**
     * get_payment_invoice_info
     *
     * Get all payment invoice information
     * @param int $payment_invoice_id - the payment invoice id
     * @param boolean $include_invoice_summary - include invoice summary or not
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('get_payment_invoice_info')) {
        function get_payment_invoice_info($payment_invoice_id, $include_invoice_summary, $str_purpose) {
            $payment_invoice_id = intval($payment_invoice_id);

            $GLOBALS['query']  = "SELECT `CitizenID`, DATE_FORMAT(`Date`, '%M %e, %Y &middot; %h:%i %p') AS InvoiceDate, `Amount`, `isCancelled`, `isQuarterly`, `PaymentFor` ";
            $GLOBALS['query'] .= "FROM `paymentinvoice` ";
            $GLOBALS['query'] .= "WHERE `PaymentInvoiceID`=$payment_invoice_id";
            $result_z = mysqli_query($GLOBALS['con_lids'], $GLOBALS['query']);
            if (has_no_db_error('getting payment invoice information ' . $str_purpose)) {
                $arr = array();
                if (mysqli_num_rows($result_z) > 0) {
                    $row_z = mysqli_fetch_assoc($result_z);
                    require INDEX . 'php/inc/LIDS_CITIZEN.php';

                    // get payment invoice summary
                    $arr_invoice_summary = array();
                    if($include_invoice_summary) {
                        $GLOBALS['query'] = "SELECT `otherfee`.`FeeDesc`, `paymentinvoicesummary`.`Amount` ";
                        $GLOBALS['query'] .= "FROM `otherfee`, `paymentinvoicesummary`, `paymentinvoice` ";
                        $GLOBALS['query'] .= "WHERE `otherfee`.`OtherFeeID`=`paymentinvoicesummary`.`OtherFeeID` ";
                        $GLOBALS['query'] .= "AND `paymentinvoicesummary`.`PaymentInvoiceID`=`paymentinvoice`.`PaymentInvoiceID` ";
                        $GLOBALS['query'] .= "AND `paymentinvoice`.`PaymentInvoiceID`=$payment_invoice_id ";
                        $GLOBALS['query'] .= "ORDER BY `otherfee`.`FeeDesc`";
                        $result_2z = mysqli_query($GLOBALS['con_lids'], $GLOBALS['query']);

                        if (has_no_db_error('getting payment invoice summary')) {
                            while ($row_2z = mysqli_fetch_assoc($result_2z)) {
                                array_push($arr_invoice_summary, array(
                                    'other_fee' => $row_2z['FeeDesc'],
                                    'amount' => $row_2z['Amount']
                                ));
                            }
                        }
                        else {
                            require INDEX . 'php/ajax/__fin.php';
                            exit();
                        }
                    }

                    // get payment invoice status | OR data
                    $invoice_status = '<span class="text-danger">UNPAID</span>';
                    if($row_z['isCancelled'] == 1)
                        $invoice_status = '<span class="text-info">CANCELLED</span>';
                    $or_no = '';
                    $or_char = '';
                    $or_date = '';
                    $amount_tendered = 0;
                    $penalty = 0;
                    $change = 0;
                    $amount_without_penalty = 0;
                    $amount_with_penalty = 0;

                    $total_penalty = 0;
                    $total_amount_without_penalty = 0;
                    $total_amount_with_penalty = 0;

                    $arr_related_or = array();
                    $GLOBALS['query']  = "SELECT `ORno`, `ORchar`, `AmountTendered`, `Penalty`, `Change`, DATE_FORMAT(`Date`, '%M %e, %Y &middot; %h:%i %p') AS ORDate ";
                    $GLOBALS['query'] .= "FROM `officialreceipt` ";
                    $GLOBALS['query'] .= "WHERE `PaymentInvoiceID`=$payment_invoice_id ";
                    $GLOBALS['query'] .= "ORDER BY UNIX_TIMESTAMP(`Date`) ";
                    $GLOBALS['query'] .= "LIMIT 1";
                    $result_2z = mysqli_query($GLOBALS['con_lids'], $GLOBALS['query']);
                    if(has_no_db_error('getting OR data')) {
                        if(mysqli_num_rows($result_2z) > 0) {
                            $row_2z = mysqli_fetch_assoc($result_2z);

                            // === GET RELATED O.R. =====================
                            $can_proceed = true;
                            $GLOBALS['query']  = "SELECT `ORno`, `ORchar`, ";
                            $GLOBALS['query'] .= "`AmountTendered`, `Penalty`, `Change`, DATE_FORMAT(`Date`, '%M %e, %Y &middot; %h:%i %p') AS ORDate ";
                            $GLOBALS['query'] .= "FROM `officialreceipt` ";
                            $GLOBALS['query'] .= "WHERE `PaymentInvoiceID`=$payment_invoice_id ";
                            $GLOBALS['query'] .= "AND `ORno`!=" . $row_2z['ORno'] . " ";
                            $GLOBALS['query'] .= "ORDER BY UNIX_TIMESTAMP(`Date`) ";

                            $result_3z = mysqli_query($GLOBALS['con_lids'], $GLOBALS['query']);
                            if(has_no_db_error('getting related OR data')) {
                                while($row_3z = mysqli_fetch_assoc($result_3z)) {
                                    $related_amount_without_penalty = $row_3z['AmountTendered'] - $row_3z['Change'] - $row_3z['Penalty'];
                                    $related_amount_with_penalty = $row_3z['AmountTendered'] - $row_3z['Change'];
                                    array_push($arr_related_or, array(
                                        'or_no' => $row_3z['ORno'],
                                        'or_char' => $row_3z['ORchar'],
                                        'amount_tendered' => $row_3z['AmountTendered'],
                                        'penalty' => $row_3z['Penalty'],
                                        'change' => $row_3z['Change'],
                                        'amount_without_penalty' => $related_amount_without_penalty,
                                        'amount_with_penalty' => $related_amount_with_penalty,
                                        'or_date' => $row_3z['ORDate']
                                    ));

                                    $total_penalty += $row_3z['Penalty'];
                                    $total_amount_without_penalty += $related_amount_without_penalty;
                                    $total_amount_with_penalty += $related_amount_with_penalty;
                                }
                            }
                            else {
                                $can_proceed = false;
                            }
                            // ===================== GET RELATED O.R. ===


                            if($can_proceed) {
                                $or_no = $row_2z['ORno'];
                                $or_char = $row_2z['ORchar'];
                                $or_date = $row_2z['ORDate'];
                                $amount_tendered = $row_2z['AmountTendered'];
                                $penalty = $row_2z['Penalty'];
                                $change = $row_2z['Change'];
                                $amount_without_penalty = $amount_tendered - $change - $penalty;
                                $amount_with_penalty = $amount_tendered - $change;

                                $total_penalty += $penalty;
                                $total_amount_without_penalty += $amount_without_penalty;
                                $total_amount_with_penalty += $amount_with_penalty;


                                if ($or_no != '') {
                                    $invoice_status = '<span class="text-success">PAID</span>';
                                }
                            }
                        }
                    }
                    else {
                        require INDEX . 'php/ajax/__fin.php';
                        exit();
                    }

                    $citizen = get_citizen_info($row_z['CitizenID'], 'for getting payment invoice information');
                    $arr = array(
                        'id' => sprintf("%010d", $payment_invoice_id),
                        'citizen' => array(
                            'fullname' => $citizen['full_name'],
                            'avatar' => $citizen['avatar'],
                            'address1' => $citizen['address_line1'],
                            'address2' => $citizen['address_line2'],
                            'tin' => $citizen['tin'],
                        ),
                        'invoice_date' => $row_z['InvoiceDate'],
                        'amount' => $row_z['Amount'],
                        'is_cancelled' => $row_z['isCancelled'],
                        'is_quarterly' => $row_z['isQuarterly'],
                        'status' => $invoice_status,
                        'or_no' => $or_no,
                        'or_char' => $or_char,
                        'amount_tendered' => $amount_tendered,
                        'penalty' => $penalty,
                        'change' => $change,
                        'amount_without_penalty' => $amount_without_penalty,
                        'amount_with_penalty' => $amount_with_penalty,
                        'or_date' => $or_date,
                        'invoice_summary' => $arr_invoice_summary,
                        'related_or' => $arr_related_or,
                        'total_penalty' => $total_penalty,
                        'total_amount_without_penalty' => $total_amount_without_penalty,
                        'total_amount_with_penalty' => $total_amount_with_penalty
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
     * cancel_payment_invoice
     *
     * Cancel payment invoice
     * @param int $payment_invoice_id - the payment invoice id
     * @param string $str_purpose - the usage of the query result (ex. for business application)
     *
     * @return array
     *
     */
    if(!function_exists('cancel_payment_invoice')) {
        function cancel_payment_invoice($payment_invoice_id, $str_purpose) {
            $payment_invoice_id = intval($payment_invoice_id);

            $GLOBALS['query']  = "UPDATE `paymentinvoice` ";
            $GLOBALS['query'] .= "SET `isCancelled`=1 ";
            $GLOBALS['query'] .= "WHERE `PaymentInvoiceID`=$payment_invoice_id";
            mysqli_query($GLOBALS['con_lids'], $GLOBALS['query']);
            if(!has_no_db_error('cancelling payment invoice ' . $str_purpose)) {
                require INDEX . 'php/ajax/__fin.php';
                exit();
            }
        }
    }
?>
