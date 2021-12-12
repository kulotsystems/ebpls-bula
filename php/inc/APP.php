<?php

    define('STR_TIMEZONE', 'Asia/Manila');
    date_default_timezone_set(STR_TIMEZONE);
    define('CURRENT_TIME', time());

    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
    define('EGOV2', $protocol . $_SERVER['HTTP_HOST'] . '/egov2/');
    define('EGOV2_CITIZEN_AVATAR_DIR', EGOV2 . 'assets/avatar/');
    define('EGOV2_PATH', INDEX . '../egov2/');
    define('EGOV2_AVATAR_PATH', EGOV2_PATH . 'assets/avatar/');

    define('EBPLS', $protocol . $_SERVER['HTTP_HOST'] . '/ebpls/');
    define('APP_NAME', 'eGov eBPLS');
    define('APP_TITLE_1', 'Electronic Business Permit');
    define('APP_TITLE_2', 'and Licensing System');

    define('LGU_REGION', 'Region V: Bicol Region');
    define('LGU_PROVINCE', 'Camarines Sur');
    define('LGU_NAME', 'Bula');
    define('LGU_TYPE', 'Municipality');
    define('LGU_POSTAL_CODE', '4430');
    define('PERMIT_FILE', '2021');


    // GET OS AND BROWSER OF THE CLIENT : https://stackoverflow.com/questions/18070154/get-operating-system-info
    $user_agent   = $_SERVER['HTTP_USER_AGENT'];
    $os_platform  = "Unknown OS Platform";
    $os_array     = array(
        '/windows nt 10/i'      =>  'Windows 10',
        '/windows nt 6.3/i'     =>  'Windows 8.1',
        '/windows nt 6.2/i'     =>  'Windows 8',
        '/windows nt 6.1/i'     =>  'Windows 7',
        '/windows nt 6.0/i'     =>  'Windows Vista',
        '/windows nt 5.2/i'     =>  'Windows Server 2003/XP x64',
        '/windows nt 5.1/i'     =>  'Windows XP',
        '/windows xp/i'         =>  'Windows XP',
        '/windows nt 5.0/i'     =>  'Windows 2000',
        '/windows me/i'         =>  'Windows ME',
        '/win98/i'              =>  'Windows 98',
        '/win95/i'              =>  'Windows 95',
        '/win16/i'              =>  'Windows 3.11',
        '/macintosh|mac os x/i' =>  'Mac OS X',
        '/mac_powerpc/i'        =>  'Mac OS 9',
        '/linux/i'              =>  'Linux',
        '/ubuntu/i'             =>  'Ubuntu',
        '/iphone/i'             =>  'iPhone',
        '/ipod/i'               =>  'iPod',
        '/ipad/i'               =>  'iPad',
        '/android/i'            =>  'Android',
        '/blackberry/i'         =>  'BlackBerry',
        '/webos/i'              =>  'Mobile'
    );
    foreach ($os_array as $regex => $value) {
        if (preg_match($regex, $user_agent)) {
            $os_platform = $value;
        }
    }

    $browser       = "Unknown Browser";
    $browser_array = array(
        '/msie/i'      => 'Internet Explorer',
        '/firefox/i'   => 'Firefox',
        '/safari/i'    => 'Safari',
        '/chrome/i'    => 'Chrome',
        '/edge/i'      => 'Edge',
        '/opera/i'     => 'Opera',
        '/netscape/i'  => 'Netscape',
        '/maxthon/i'   => 'Maxthon',
        '/konqueror/i' => 'Konqueror',
        '/mobile/i'    => 'Handheld Browser'
    );

    foreach ($browser_array as $regex => $value) {
        if (preg_match($regex, $user_agent)) {
            $browser = $value;
        }
    }

    define('OS', $os_platform);
    define('BROWSER', $browser)

?>