<?php

    /**
     * get_all_user_access
     *
     * Get all user access and its data
     *
     * @return array
     *
     */
    if(!function_exists('get_all_user_access')) {
        function get_all_user_access() {
            $arr = array();
            require INDEX . 'ui/meta.admin.menu.php';
            for($i=0; $i<sizeof($arr_menu_items); $i++) {
                $arr_tabs = $arr_menu_items[$i]['tabs'];
                for($j=0; $j<sizeof($arr_tabs); $j++) {
                    array_push($arr, $arr_tabs[$j]);
                }
            }
            return $arr;
        }
    }

?>
