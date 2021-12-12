<?php

    define('INDEX', '../');
    $dir = 'admin';
    $page = '';
    $tab = '1';
    $item = '0';

    require INDEX . "php/__init.php";
    foreach ($_GET as $page => $val) {
        break;
    }
    $arr_page = explode("_", $page);
    if(sizeof($arr_page) > 1) {
        $page = $arr_page[0];
        $tab = $arr_page[1];
        if(sizeof($arr_page) > 2) {
            $item = $arr_page[2];
        }
    }

    require INDEX . "ui/meta.admin.menu.php";
    $is_page_found = false;
    for($i=0; $i<sizeof($arr_menu_items); $i++) {
        if($arr_menu_items[$i]['href'] == $page) {
            $arr_menu_items[$i]['status'] = ' active';
            $arr_menu_items[$i]['tab'] = $tab;
            $is_page_found = true;
            break;
        }
    }
    if(!$is_page_found) {
        $page = 'home';
        $arr_menu_items[0]['status'] = ' active';
    }
    require INDEX . "php/admin.user_verifier.php";
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title><?php echo APP_NAME ?></title>
        <?php require INDEX . "ui/imports.global.php"; ?>
        <?php require INDEX . "ui/scripts.global.top.php"; ?>
        <?php require INDEX . "ui/scripts.admin.php"; ?>
    </head>
    <body class="fixed-header menu-pin menu-behind overflow-hidden hidden" data-app='<?php echo APP_NAME; ?>' data-app-url='<?php echo EBPLS; ?>' data-index='<?php echo INDEX; ?>' data-page='<?php echo $page; ?>' data-dir='<?php echo $dir; ?>' data-lgu-type='<?php echo LGU_TYPE; ?>' data-lgu='<?php echo LGU_NAME; ?>' data-province='<?php echo LGU_PROVINCE; ?>' data-region='<?php echo LGU_REGION; ?>'  data-citizen-avatar-dir='<?php echo EGOV2_CITIZEN_AVATAR_DIR;?>' data-os='<?php echo OS; ?>' data-browser='<?php echo BROWSER; ?>'>
        <?php require INDEX . "ui/layout.sidebar.php"; ?>
        <?php require INDEX . "ui/layout.main.php"; ?>
        <?php require INDEX . "inc/popups/popups.html"; ?>
        <?php require INDEX . "ui/scripts.global.bottom.php"; ?>
    </body>
</html>
<?php
     /*****************************************************
     *                                                    *
     *  When you've been fighting for it all your life    *
     *  You've been struggling to make things right       *
     *  That's how a superhero learns to fly              *
     *  Every day, every hour, turn the pain into power!  *
     *                                                    *
     *****************************************************/
     require INDEX . "php/__fin.php";

?>