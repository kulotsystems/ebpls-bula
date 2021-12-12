<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        echo "<pre>";
        require '../inc/LIDS_BARANGAY.php';
        print_r(belongs_to_poblacion(21));
        echo "</pre>";

    }
    require '__fin.php';

?>