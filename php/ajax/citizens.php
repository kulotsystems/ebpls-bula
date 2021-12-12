<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        // FUNCTION: GET ITEM OF 1 CITIZEN
        function get_citizen_item($citizen_id) {
            require INDEX . "php/inc/LIDS_CITIZEN.php";
            $citizen = get_citizen_info($citizen_id, 'for getting citizen item data');
            return array(
                'item_id' => $citizen_id,
                'item_avatar' => $citizen['avatar'],
                'item_maintitle' => $citizen['full_name'],
                'item_subtitle' => str_pad($citizen_id, 10, "0", STR_PAD_LEFT) . " &middot; " . $citizen['address_line2'],
                'item_update_date' => $citizen['id_release_date'],
            );
        }


        // FUNCTION: GET DATA OF 1 CITIZEN
        function get_citizen_data($citizen_id) {
            require INDEX . "php/inc/LIDS_CITIZEN.php";
            return get_citizen_info($citizen_id, 'for getting citizen data');
        }


        // GET ALL CITIZENS
        if(isset($_POST['get_citizens'])) {
            $last_item_id = trim($_POST['last_item']);
            $active_item_id = intval($_POST['active_item']);

            // check if active item exits
            $query = "SELECT `CitizenID` FROM `citizen` WHERE `CitizenID`=$active_item_id";
            $result = mysqli_query($con_lids, $query);
            if(has_no_db_error('checking if active citizen item exists')) {
                $active_item_exists = (mysqli_num_rows($result) > 0);
                $item_limit = intval($_POST['item_limit']);

                $query = "SELECT ";
                $query .= "`CitizenID` ";
                $query .= "FROM `citizen` ";
                $query .= "WHERE 1 ";
                $query .= "ORDER BY `CitizenID` DESC, UNIX_TIMESTAMP(`IDreleaseDate`) DESC";

                $result = mysqli_query($con_lids, $query);
                if (has_no_db_error('getting all citizens')) {
                    $arr_citizens = array();
                    $total_items = mysqli_num_rows($result);
                    $did_passed_last_item = false;
                    $did_passed_active_item = false;
                    $ctr = 1;
                    while ($row = mysqli_fetch_assoc($result)) {
                        $item_id = intval($row['CitizenID']);

                        if ($last_item_id == '') {
                            // no last item found -> means on load
                            if($active_item_exists) {
                                // active item exists
                                array_push($arr_citizens, get_citizen_item($item_id));
                                $ctr += 1;

                                if($item_id == $active_item_id)
                                    $did_passed_active_item = true;

                                if ($ctr > $item_limit && $did_passed_active_item) break;
                            }
                            else {
                                // active item does not exist
                                array_push($arr_citizens, get_citizen_item($item_id));
                                $ctr += 1;
                                if ($ctr > $item_limit) break;
                            }
                        }
                        else {
                            // has last item found
                            // initiate get item when already passed the last item
                            if ($did_passed_last_item) {
                                array_push($arr_citizens, get_citizen_item($item_id));
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
                        'menu_href' => $_POST['get_citizens'],
                        'items' => $arr_citizens,
                        'total_items' => $total_items
                    );
                }
            }
        }


        // GET DATA OF 1 CITIZEN
        else if(isset($_POST['get_citizen_data'])) {
            $citizen_id = intval($_POST['get_citizen_data']);
            $response['success']['data'] = get_citizen_data($citizen_id);
        }
    }
    require '__fin.php';

?>