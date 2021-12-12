<?php
    define('INDEX', '../');
    $dir = 'admin';
    $page = 'index';
    require INDEX . "php/__init.php";
    require INDEX . "php/admin.user_verifier.php";
    $animation_mode = (isset($_GET['logout'])) ? 'static' : 'animate';
?>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title><?php echo APP_NAME; ?> | Login</title>
        <?php $_SESSION[SESSION_LOGIN_ACCESS_KEY]=CURRENT_TIME; ?>
        <?php require INDEX . "ui/imports.global.php"; ?>
        <link rel="stylesheet" href="<?php echo INDEX; ?>ui/pages/assets/plugins/frozencloud/css/egov-animate.css?<?php echo CURRENT_TIME; ?>">
        <script src="<?php echo INDEX; ?>ui/pages/assets/plugins/jquery/jquery-1.11.1.min.js"></script>
        <script src="<?php echo INDEX; ?>ui/pages/assets/plugins/pace/pace.min.js"></script>
        <script src="<?php echo INDEX; ?>ui/pages/assets/plugins/frozencloud/js/egov-animate.js?<?php echo CURRENT_TIME; ?>"></script>
        <script src="<?php echo INDEX; ?>ui/pages/assets/plugins/tether/js/tether.min.js"></script>
        <script src="<?php echo INDEX; ?>ui/pages/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="<?php echo INDEX; ?>js/__init.js"></script>
        <script src="<?php echo INDEX; ?>inc/popups/popups.js?<?php echo CURRENT_TIME; ?>"></script>
        <script src="<?php echo INDEX; ?>js/admin/login.js?<?php echo CURRENT_TIME; ?>"></script>

    </head>
    <!--<body class="hidden" background="<?php echo INDEX; ?>ui/pages/assets/img/cover.jpg" style="box-sizing: border-box; background-size: cover; background-blend-mode: overlay; background-repeat: no-repeat;" data-index='<?php echo INDEX; ?>' data-page='<?php echo $page; ?>' data-dir='<?php echo $dir; ?>' data-animation-mode='<?php echo $animation_mode; ?>'  data-os='<?php echo OS; ?>' data-browser='<?php echo BROWSER; ?>'>-->
    <body class="hidden" style="box-sizing: border-box; background-size: cover; background-blend-mode: overlay; background-repeat: no-repeat;" data-index='<?php echo INDEX; ?>' data-page='<?php echo $page; ?>' data-dir='<?php echo $dir; ?>' data-animation-mode='<?php echo $animation_mode; ?>'  data-os='<?php echo OS; ?>' data-browser='<?php echo BROWSER; ?>'>
    <div class="lock-container full-height">
        <br class="hidden-md-up">
        <br class="hidden-md-up">
        <br class="hidden-md-up">
        <br class="hidden-md-up">
        <div class="full-height sm-p-t-50 align-items-center d-md-flex">
            <div class="row full-width no-margin padding-15 padding-top-30 padding-bottom-30 border-radius-4">

                <div class="col-md-6">
                    <div class="col-banner hidden">
                        <?php $banner_text_class = 'text-black'; $app_logo = 'app_logo_1.png'; $brand_id = 'banner1'; require INDEX . "ui/layout.banner.php"; ?>
                    </div>
                    <div id="splash-screen"></div>
                </div>

                <div class="col-md-6 col-form hidden">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group form-group-default sm-m-t-30">
                                <label>Username</label>
                                <div class="controls">
                                    <input type="text" name="usermane" id="usermane" placeholder="Username" class="form-control" required autofocus>
                                </div>
                            </div>
                            <div class="form-group form-group-default sm-m-t-30">
                                <label>Password</label>
                                <div class="controls">
                                    <input type="password" name="paswsord" id="paswsord" placeholder="Password" class="form-control" required>
                                </div>
                            </div>
                            <button name="loign" id="loign" class="btn btn-success"><span class="fas fa-arrow-right"></span> Login</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php require INDEX . "inc/popups/popups.html"; ?>
    </div>
    </body>
</html>
<?php require INDEX . "php/__fin.php"; ?>