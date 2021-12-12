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
    <meta name='description' content='2019 Business Permit | Electronic Business Permit and Licensing System'>
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
            width: 8.5in;
            height: 11in;
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
            font-size: 1.3em;
        }

        .p-business-line-desc {
            line-height: 22px;
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
            <img class='p-img' src='<?php echo INDEX; ?>/inc/permits/img/[Nabua] 2019.jpg'>
            <img class='p-field p-citizen-avatar'         data-w='20.00' data-h='15.45' data-x='75.25' data-y='04.15' src='<?php echo INDEX; ?>img/_.jpg'>
            <div class='p-field p-permit-number'          data-w='18.16' data-h='02.30' data-x='17.14' data-y='18.45' data-value='permit_no'><table><tr><td align='right' class='padding-right-10 text-bold'>[PERMIT NO]</td></tr></table></div>
            <div class='p-field p-permit-date date-only'  data-w='23.10' data-h='02.27' data-x='12.20' data-y='21.64' data-value='invoice.fees_payment_invoice.or_date'><table><tr><td align='right' class='padding-right-10 text-bold'>[PERMIT DATE]</td></tr></table></div>
            <div class='p-field p-business-name'          data-w='90.24' data-h='04.94' data-x='05.02' data-y='25.30' data-value='invoice.verification.application.business_name'><table><tr><td align='center' class='text-bold padding-left-5 text-uppercase padding-right-5'>[BUSINESS NAME]</td></tr></table></div>
            <div class='p-field p-applicant-name'         data-w='64.71' data-h='01.97' data-x='26.90' data-y='36.52' data-value='invoice.verification.application.citizen_full_name'><table><tr><td align='left' class='padding-left-10 text-bold text-uppercase'>[NAME OF APPLICANT]</td></tr></table></div>
            <div class='p-field p-business-location'      data-w='64.71' data-h='01.97' data-x='26.90' data-y='38.64' data-value='invoice.verification.application.barangay_address'><table><tr><td align='left' class='padding-left-10 text-bold text-uppercase'>[LOCATION OF BUSINESS]</td></tr></table></div>
            <div class='p-field p-applicant-address'      data-w='64.71' data-h='01.97' data-x='26.90' data-y='40.76' data-value='invoice.verification.application.home_address'><table><tr><td align='left' class='padding-left-10 text-bold text-uppercase'>[RESIDENCES / ADDRESS]</td></tr></table></div>
            <div class='p-field p-business-line'          data-w='50.00' data-h='01.97' data-x='41.61' data-y='42.88' data-value='invoice.verification.application.business_name'><table><tr><td align='left' class='padding-left-10 text-uppercase text-bold text-uppercase'>[BUSINESS NAME]</td></tr></table></div>
            <div class='p-field p-business-line-desc'     data-w='68.82' data-h='04.09' data-x='23.10' data-y='47.12' data-value='invoice.verification.application.business_activities[0].business_line_title'><table><tr><td align='left' class='text-bold text-italic text-uppercase' valign='top'>[LINE OF BUSINESS]</td></tr></table></div>
            <div class='p-field p-issue-day day-only'     data-w='06.31' data-h='01.97' data-x='24.08' data-y='74.70' data-value='invoice.fees_payment_invoice.or_date'><table><tr><td align='center' class='text-bold'>1st</td></tr></table></div>
            <div class='p-field p-issue-month month-only' data-w='20.94' data-h='01.97' data-x='36.47' data-y='74.70' data-value='invoice.fees_payment_invoice.or_date'><table><tr><td align='center' class='text-bold'>January</td></tr></table></div>
            <div class='p-field p-mayors-permit-fee'      data-w='11.22' data-h='01.52' data-x='69.29' data-y='79.73'><table><tr><td align='right' class='sm padding-right-5 text-bold'>&#8369; 0.00</td></tr></table></div>
            <div class='p-field p-or-number'              data-w='12.04' data-h='01.52' data-x='68.51' data-y='81.42' data-value='invoice.fees_payment_invoice.or_no'><table><tr><td align='right' class='sm padding-right-5 text-bold'>0000000000</td></tr></table></div>
            <div class='p-field p-issued-on date-only'    data-w='17.65' data-h='01.52' data-x='62.98' data-y='83.12' data-value='invoice.fees_payment_invoice.or_date'><table><tr><td align='right' class='sm padding-right-5 text-bold'>[OR DATE]</td></tr></table></div>
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