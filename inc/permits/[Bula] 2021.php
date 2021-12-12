<?php
    define('INDEX', '../../');
    $page = 'permit';
    require INDEX . "php/__init.php";
?>
<!DOCTYPE html>
<html lang='en'>
<head>
    <title><?php echo APP_NAME ?> | BUSINESS PERMIT</title>
    <link href='<?php echo INDEX; ?>ui/pages/assets/img/app_logo_3.png' rel='icon' type='image/vnd.microsoft.icon' />
    <meta http-equiv='content-type' content='text/html;charset=UTF-8' />
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='description' content='2021 Business Permit | Electronic Business Permit and Licensing System'>
    <?php require INDEX . "php/admin.user_verifier.php"; ?>
    <style>
        * {
            padding: 0;
            margin: 0;
            font-family: sans-serif;
        }

        .padding-left-5 {
            padding-left: 5px;
        }

        .padding-right-5 {
            padding-right: 5px;
        }

        .padding-left-10 {
            padding-left: 10px;
        }

        .padding-right-10 {
            padding-right: 10px;
        }

        .text-bold {
            font-weight: bold;
        }

        .text-italic {
            font-style: italic;
        }

        .text-uppercase {
            text-transform: uppercase;
        }

        .page {
            width: 8.27in;
            height: 11.69in;
            position: relative;
        }

        .page > .p-img {
            height: 100%;
        }

        .p-field {
            position: absolute;
        }

        div.p-field > table {
            width: 100%;
            height: 100%;
        }

        div.p-field > table td {
            font-size: 0.9em;
        }

        div.p-field > table td.sm {
            font-size: 0.8em;
        }

        div.p-field > table td.xs {
            font-size: 0.6em;
        }

        .p-business-name {
            font-size: 1.4em;
        }

        .p-permit-number,
        .p-permit-date,
        .p-permit-expiration,
        .p-application-type,
        .p-plate-number {
            font-size: 1.5em;
        }

        .p-business-line {
            font-size: 2.1em;
        }

        .p-business-line-desc {
            line-height: 25px;
            font-size: 1.3em;
        }

        @media print {
            html, body {
                overflow: hidden;
            }
        }
    </style>
</head>
<body>
    <div align='center'>
        <div class='page'>
            <img class='p-img' src='<?php echo INDEX; ?>/inc/permits/img/[Bula] 2021.jpg'>
            <img class='p-field p-citizen-avatar'        data-w='23.03' data-h='16.27' data-x='05.21' data-y='27.79' src='<?php echo INDEX; ?>img/_.jpg'>
            <div class='p-field p-applicant-name'        data-w='55.09' data-h='02.64' data-x='05.21' data-y='49.00' data-value='invoice.verification.application.citizen_full_name'><table><tr><td align='center' class='padding-left-10 text-bold text-uppercase' valign='bottom'>[NAME OF APPLICANT]</td></tr></table></div>
            <div class='p-field p-business-name'         data-w='55.09' data-h='04.90' data-x='05.21' data-y='51.90' data-value='invoice.verification.application.business_name'><table><tr><td align='center' class='text-bold padding-left-5 text-uppercase padding-right-5'>[BUSINESS NAME]</td></tr></table></div>
            <div class='p-field p-business-barangay'     data-w='55.09' data-h='02.64' data-x='05.21' data-y='57.00' data-value='invoice.verification.application.barangay_address'><table><tr><td align='center' class='padding-left-10 text-bold' valign='top'>[LOCATION OF BUSINESS]</td></tr></table></div>
            <div class='p-field p-business-line-desc'    data-w='40.89' data-h='09.15' data-x='14.99' data-y='64.00' data-value='invoice.verification.application.business_activities[0].business_line_title'><table><tr><td align='center' class='padding-left-10 text-uppercase text-bold'>[LINE OF BUSINESS]</td></tr></table></div>
            <div class='p-field p-fee-or-number-label'   data-w='12.53' data-h='02.09' data-x='05.12' data-y='78.33'><table><tr><td align='left' class='text-bold'>OR No.</td><td align='right' class='text-bold'>:</td></tr></table></div>
            <div class='p-field p-fee-or-number'         data-w='24.20' data-h='02.09' data-x='18.12' data-y='78.33' data-value='invoice.fees_payment_invoice.or_no'><table><tr><td align='left' class='text-bold'>0000000000</td></tr></table></div>
            <div class='p-field p-fee-or-date-label'     data-w='12.53' data-h='02.09' data-x='05.12' data-y='80.45'><table><tr><td align='left' class='text-bold'>OR Date</td><td align='right' class='text-bold'>:</td></tr></table></div>
            <div class='p-field p-fee-or-date date-only' data-w='24.20' data-h='02.09' data-x='18.12' data-y='80.45' data-value='invoice.fees_payment_invoice.or_date'><table><tr><td align='left' class='text-bold'>[OR DATE]</td></tr></table></div>
            <div class='p-field p-fee-or-no-label'       data-w='12.53' data-h='02.09' data-x='05.12' data-y='82.58'><table><tr><td align='left' class='text-bold'>OR Amount</td><td align='right' class='text-bold'>:</td></tr></table></div>
            <div class='p-field div-amount'              data-w='24.20' data-h='02.09' data-x='18.12' data-y='82.58' data-value='invoice.verification.fees.total_fee'><table><tr><td align='left' class='text-bold'>[OR AMOUNT]</td></tr></table></div>
            <div class='p-field p-permit-number'         data-w='29.65' data-h='04.99' data-x='66.90' data-y='49.67' data-value='permit_no'><table><tr><td align='center' class='text-bold'>[PERMIT NO]</td></tr></table></div>
            <div class='p-field p-permit-date date-only' data-w='29.65' data-h='04.99' data-x='66.90' data-y='59.45' data-value='invoice.fees_payment_invoice.or_date'><table><tr><td align='center' class='text-bold'>[PERMIT DATE]</td></tr></table></div>
            <div class='p-field p-permit-expiration'     data-w='29.65' data-h='04.99' data-x='66.90' data-y='68.20'><table><tr><td align='center' class='text-bold'>December 31, 2021</td></tr></table></div>
            <div class='p-field p-application-type'      data-w='29.65' data-h='04.99' data-x='66.90' data-y='77.70' data-value='invoice.verification.application.application_type'><table><tr><td align='center' class='text-bold'>[APPLICATION TYPE]</td></tr></table></div>
            <div class='p-field p-plate-number'          data-w='21.47' data-h='04.30' data-x='37.50' data-y='92.40' data-value='plate_no'><table><tr><td align='center' class='text-bold'>[PLATE NO]</td></tr></table></div>
        </div>
    </div>

    <script src='<?php echo INDEX; ?>ui/pages/assets/plugins/jquery/jquery-1.11.1.min.js'></script>
    <script>
        $(function() {
            $('.p-field').each(function() {
                $(this).css({
                    'left' : $(this).attr('data-x') + '%',
                    'top' : $(this).attr('data-y') + '%',
                    'width' : $(this).attr('data-w') + '%',
                    'height' : $(this).attr('data-h') + '%'
                });
            });
        });
    </script>
</body>
</html>
<?php require INDEX . "php/__fin.php"; ?>