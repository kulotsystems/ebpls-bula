<?php
    define('INDEX', '../');
    $dir  = 'admin';
    $page = 'report';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>REPORT</title>
    <?php define('CURRENT_TIME', time()); ?>
    <?php require INDEX . "ui/imports.global.php"; ?>
    <?php require INDEX . "ui/scripts.global.top.php"; ?>
    <style>
        tr, th, td {
            vertical-align: middle !important;
        }

        thead td {
            font-weight: bold;
        }

        tbody td {
            color: #000 !important;
            text-transform: uppercase !important;
        }
    </style>
</head>
<body style="padding-top: 15px;" class="bg-white">
<div style="padding: 15px; !important;">
<?php
if(isset($_GET['r'])) {
    require '../php/db/open.php';
    $report_id = $_GET['r'];
    $from      = $_GET['from'];
    $to        = $_GET['to'];

    $query  = "SELECT * FROM `reports` WHERE `ID`=$report_id";
    $result = mysqli_query($con, $query);
    while($row = mysqli_fetch_assoc($result)) {
        $report_title       = $row['Title'];
        $report_description = $row['Description'];

        // BUSINESS REGISTRATION MONITORING
        if($report_id == 1) {
            echo "<table class='table table-bordered table-sm bg-white table-hover'>";
                echo "<thead>";
                    echo "<tr>";
                        echo "<td align='center' colspan='15'>";
                            echo "<h3 class='no-margin'>" . $report_title . "</h3>";
                            echo "<p class='no-margin'>" . $from . " - " . $to . "</p>";
                        echo "</td>";
                    echo "</tr>";
                    echo "<tr>";
                        echo "<td rowspan='3'></td>";
                        echo "<td rowspan='3' align='center'>PERMIT NO.</td>";
                        echo "<td rowspan='2' colspan='2' align='center'>BUSINESS PLATE NO.</td>";
                        echo "<td rowspan='3' align='center'>NAME OF TAX PAYER</td>";
                        echo "<td rowspan='3' align='center'>BUSINESS NAME</td>";
                        echo "<td rowspan='3' align='center'>BUSINESS ADDRESS</td>";
                        echo "<td rowspan='3' align='center'>MOBILE NO.</td>";
                        echo "<td rowspan='3' align='center'>EMAIL ADDRESS</td>";
                        echo "<td rowspan='3' align='center'>CAPITALIZATION</td>";
                        echo "<td rowspan='3' align='center'>GROSS SALE</td>";
                        echo "<td colspan='4' align='center'>NO. OF WORKERS</td>";
                    echo "</tr>";
                    echo "<tr>";
                        echo "<td colspan='2' align='center'>NEW</td>";
                        echo "<td colspan='2' align='center'>RENEWAL</td>";
                    echo "</tr>";
                    echo "<tr>";
                        echo "<td align='center'>NEW</td>";
                        echo "<td align='center'>RENEWAL</td>";
                        echo "<td align='center'>M</td>";
                        echo "<td align='center'>F</td>";
                        echo "<td align='center'>M</td>";
                        echo "<td align='center'>F</td>";
                    echo "</tr>";
                echo "</thead>";
                echo "<tbody>";
                    $GLOBALS['query']  = "SELECT ";
                    $GLOBALS['query'] .= " `applications`.`ApplicationType`, ";
                    $GLOBALS['query'] .= " `applications_forinvoice`.`ID` AS ForInvoiceID, ";
                    $GLOBALS['query'] .= " `applications_forinvoice`.`VerificationData`, ";
                    $GLOBALS['query'] .= " `applications_forinvoice`.`FEES_PaymentInvoiceID`, ";
                    $GLOBALS['query'] .= " `applications_forpermit`.`PermitNumberPrefix`, ";
                    $GLOBALS['query'] .= " `applications_forpermit`.`PermitNumber`, ";
                    $GLOBALS['query'] .= " `applications_forpermit`.`PlateNumberPrefix`, ";
                    $GLOBALS['query'] .= " `applications_forpermit`.`PlateNumber` ";
                    $GLOBALS['query'] .= "FROM ";
                    $GLOBALS['query'] .= " `applications`, `applications_forinvoice`, `applications_forpermit` ";
                    $GLOBALS['query'] .= "WHERE ";
                    $GLOBALS['query'] .= " `applications`.`ID`=`applications_forinvoice`.`ApplicationID` AND ";
                    $GLOBALS['query'] .= " `applications`.`ID`=`applications_forpermit`.`ApplicationID` AND ";
                    $GLOBALS['query'] .= " `applications_forpermit`.`CreatedAt` BETWEEN '" . date('Y-m-d', strtotime($from)) . " 00:00:00' AND '" . date('Y-m-d', strtotime($to)) . " 23:59:59' ";
                    $result_z = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
                    $ctr = 0;
                    $total_total_capitalization     = 0;
                    $total_total_gross_sales        = 0;
                    $total_male_employees_new       = 0;
                    $total_female_employees_new     = 0;
                    $total_male_employees_renewal   = 0;
                    $total_female_employees_renewal = 0;
                    while($row_z = mysqli_fetch_assoc($result_z)) {
                        $ctr += 1;
                        $verification_data = json_decode($row_z['VerificationData'], true);
                        echo "<tr>";
                            echo "<td align='right'>" .  $ctr. ".</td>";
                            echo "<td align='center'>" . trim($row_z['PermitNumberPrefix'] . ' ' . $row_z['PermitNumber'])  . "</td>";
                            echo "<td align='center'>";
                                if($row_z['ApplicationType'] == 'NEW')
                                    echo trim($row_z['PlateNumberPrefix'] . ' ' . $row_z['PlateNumber']);
                            echo "</td>";
                            echo "<td align='center'>";
                                if($row_z['ApplicationType'] == 'RENEWAL')
                                    echo trim($row_z['PlateNumberPrefix'] . ' ' . $row_z['PlateNumber']);
                            echo "</td>";
                            echo "<td>";
                                if($verification_data['application']['corporate_owner_fullname'] != '') {
                                    echo $verification_data['application']['corporate_owner_fullname'] . "<br>" . "<small>(" . $verification_data['application']['citizen_full_name'] . ")</small>";
                                }
                                else {
                                    echo $verification_data['application']['citizen_full_name'];
                                }
                            echo "</td>";
                            echo "<td>";
                                if($verification_data['application']['trade_name'] != '') {
                                    echo $verification_data['application']['trade_name'];
                                }
                                else {
                                    echo $verification_data['application']['business_name'];
                                }
                            echo "</td>";
                            echo "<td>" . (explode(', ', $verification_data['application']['barangay_address'])[0]) . "</td>";
                            echo "<td>";
                                if($verification_data['application']['business_mobile_num'] != '')
                                    echo $verification_data['application']['business_mobile_num'];
                                else
                                    echo $verification_data['application']['home_contact_num'];
                            echo "</td>";
                            echo "<td>";
                                echo $verification_data['application']['business_email'];
                            echo "</td>";
                            echo "<td align='right'>";
                                if($row_z['ApplicationType'] == 'NEW') {
                                    $total_capitalization = 0;
                                    for($x=0; $x<sizeof($verification_data['application']['business_activities']); $x++) {
                                        $total_capitalization += $verification_data['application']['business_activities'][$x]['capitalization'];
                                    }
                                    echo number_format($total_capitalization, 2);
                                    $total_total_capitalization += $total_capitalization;
                                }
                            echo "</td>";
                            echo "<td align='right'>";
                                if($row_z['ApplicationType'] == 'RENEWAL') {
                                    $total_gross_sales = 0;
                                    for($x=0; $x<sizeof($verification_data['application']['business_activities']); $x++) {
                                        $total_gross_sales += $verification_data['application']['business_activities'][$x]['gross_sales_essential'];
                                    }
                                    echo number_format($total_gross_sales, 2);
                                    $total_total_gross_sales += $total_gross_sales;
                                }
                            echo "</td>";

                            echo "<td align='right'>";
                                if($row_z['ApplicationType'] == 'NEW') {
                                    echo $verification_data['application']['total_male_emp'];
                                    $total_male_employees_new += $verification_data['application']['total_male_emp'];
                                }
                            echo "</td>";
                            echo "<td align='right'>";
                                if($row_z['ApplicationType'] == 'NEW') {
                                    echo $verification_data['application']['total_female_emp'];
                                    $total_female_employees_new += $verification_data['application']['total_female_emp'];
                                }
                            echo "</td>";
                            echo "<td align='right'>";
                                if($row_z['ApplicationType'] == 'RENEWAL') {
                                    echo $verification_data['application']['total_male_emp'];
                                    $total_male_employees_renewal += $verification_data['application']['total_male_emp'];
                                }
                            echo "</td>";
                            echo "<td align='right'>";
                                if($row_z['ApplicationType'] == 'RENEWAL') {
                                    echo $verification_data['application']['total_female_emp'];
                                    $total_female_employees_renewal += $verification_data['application']['total_female_emp'];
                                }
                            echo "</td>";
                        echo "</tr>";
                    }
                    echo "<tr>";
                        echo "<td colspan='9'></td>";
                        echo "<td align='right'><b>" . number_format($total_total_capitalization, 2) . "</b></td>";
                        echo "<td align='right'><b>" . number_format($total_total_gross_sales, 2) . "</b></td>";
                        echo "<td align='right'><b>" . $total_male_employees_new . "</b></td>";
                        echo "<td align='right'><b>" . $total_female_employees_new . "</b></td>";
                        echo "<td align='right'><b>" . $total_male_employees_renewal . "</b></td>";
                        echo "<td align='right'><b>" . $total_female_employees_renewal . "</b></td>";
                    echo "</tr>";
                    echo "<tr>";
                        echo "<td colspan='11'></td>";
                        echo "<td colspan='2' align='center'><b>" . ($total_male_employees_new + $total_female_employees_new) . "</b></td>";
                        echo "<td colspan='2' align='center'><b>" . ($total_male_employees_renewal + $total_female_employees_renewal) . "</b></td>";

                    echo "</tr>";
                echo "</tbody>";
            echo "</table>";
        }

        break;
    }
    require '../php/db/close.php';
}
?>
</div>
</body>
</html>