<?php

    require INDEX . 'php/db/close.php';
    require INDEX . 'php/db/lids/close.php';

    array_walk($GLOBALS['response'], 'utf8encode');
    echo json_encode($GLOBALS['response']);
?>