<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        // FUNCTION: GET ITEM OF 1 UPDATE
        function get_update_item($update_id) {
            require INDEX . 'php/inc/UPDATE.php';
            $update = get_update_info($update_id, false, 'for getting update item data');
            return array(
                'item_id' => $update_id,
                'item_avatar' => '',
                'item_maintitle' => $update['period'],
                'item_subtitle' => '',
                'item_update_date' => $update['date_updated']
            );
        }


        // FUNCTION: GET DATA OF 1 UPDATE
        function get_update_data($update_id) {
            require INDEX . 'php/inc/UPDATE.php';
            $update = get_update_info($update_id, true, 'for getting update data');
            return array(
                'id' => $update['id'],
                'period' => $update['period'],
                'updates' => $update['updates']
            );
        }


        // GET ALL UPDATES
        if(isset($_POST['get_updates'])) {
            $last_item_id = trim($_POST['last_item']);
            $active_item_id = intval($_POST['active_item']);

            // check if active item exits
            $query = "SELECT `ID` FROM `updates_periods` WHERE `ID`=$active_item_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking if active update item exists')) {
                $active_item_exists = (mysqli_num_rows($result) > 0);

                $query = "SELECT `ID` ";
                $query .= "FROM `updates_periods` ";
                $query .= "ORDER BY `CreatedAt` DESC";
                $result = mysqli_query($con, $query);
                if (has_no_db_error('getting all updates')) {
                    $arr_updates = array();
                    $total_items = mysqli_num_rows($result);
                    $item_limit = intval($_POST['item_limit']);
                    $did_passed_last_item = false;
                    $did_passed_active_item = false;
                    $ctr = 1;
                    while ($row = mysqli_fetch_assoc($result)) {
                        $item_id = intval($row['ID']);
                        if ($last_item_id == '') {
                            // no last item found -> means on load
                            if($active_item_exists) {
                                // active item exists
                                array_push($arr_updates, get_update_item($item_id));
                                $ctr += 1;

                                if($item_id == $active_item_id)
                                    $did_passed_active_item = true;

                                if ($ctr > $item_limit && $did_passed_active_item) break;
                            }
                            else {
                                // active item does not exist
                                array_push($arr_updates, get_update_item($item_id));
                                $ctr += 1;
                                if ($ctr > $item_limit) break;
                            }
                        }
                        else {
                            // has last item found
                            // initiate get item when already passed the last item
                            if ($did_passed_last_item) {
                                array_push($arr_updates, get_update_item($item_id));
                                $ctr += 1;
                            }
                            else {
                                if ($item_id == intval($last_item_id))
                                    $did_passed_last_item = true;
                            }
                            if ($ctr > $item_limit) break;
                        }
                    }

                    $response['success']['data'] = array(
                        'menu_href' => $_POST['get_updates'],
                        'items' => $arr_updates,
                        'total_items' => $total_items
                    );
                }
            }
        }


        // GET DATA OF 1 UPDATE
        else if(isset($_POST['get_update_data'])) {
            $update_id = intval($_POST['get_update_data']);
            $response['success']['data'] = get_update_data($update_id);
        }

    }
    require '__fin.php';

?>