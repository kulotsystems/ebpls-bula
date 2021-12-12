<?php
    define('INDEX', '../../');
    $page = 'invoice';
    require INDEX . "php/__init.php";
?>
<!DOCTYPE html>
<html lang='en'>
<head>
    <title><?php echo APP_NAME ?> | PAYMENT INVOICE</title>
    <link href='<?php echo INDEX; ?>ui/pages/assets/img/app_logo_3.png' rel='icon' type='image/vnd.microsoft.icon' />
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name='description' content='Payment Invoice | Electronic Business Permit and Licensing System'>
    <?php require INDEX . "php/admin.user_verifier.php"; ?>
    <link rel='stylesheet' href='<?php echo INDEX; ?>ui/pages/assets/plugins/bootstrap/css/bootstrap.min.css'>
    <link rel='stylesheet' href='<?php echo INDEX; ?>ui/pages/pages/css/themes/retro.css'>
    <link rel='stylesheet' href='<?php echo INDEX; ?>css/fonts.css'>
    <link rel='stylesheet' href='<?php echo INDEX; ?>css/custom.css?<?php echo CURRENT_TIME; ?>'>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="print.css" media="print">
</head>
<body class='bg-white'>
    <div class='page'>
        <div class='p-invoice'></div>
    </div>
</body>
</html>
<?php require INDEX . "php/__fin.php"; ?>