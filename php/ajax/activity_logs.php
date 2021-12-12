<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {
        require INDEX . "php/inc/LIDS_CITIZEN.php";

        // FUNCTION: GET ITEM OF 1 ACTIVITY LOG
        function get_system_log_item($system_log_id) {
            $arr_data = array();

            $GLOBALS['query']  = "SELECT `CitizenID`, `UserTypeAcronym`, `UserTypeTitle`, `Action`, `Tab`, `Item`, DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt ";
            $GLOBALS['query'] .= "FROM `system_logs` WHERE `ID`=$system_log_id";
            $result = mysqli_query($GLOBALS['con'], $GLOBALS['query']);
            if(has_no_db_error('getting system log item data')) {

                $row = mysqli_fetch_assoc($result);
                $citizen = get_citizen_info($row['CitizenID'], 'for getting system logs');
                $action = $row['Action'];
                $phrase = '';
                if ($action == 'INSERT')
                    $phrase = "<span class='text-success'>ADDED</span>";
                else if ($action == 'UPDATE')
                    $phrase = "<span class='text-primary'>UPDATED</span>";
                else if ($action == 'DELETE')
                    $phrase = "<span class='text-danger'>REMOVED</span>";
                else
                    $phrase = "<span class='text-secondary'>" . $action . "</span>";
                $tab = '';
                if($row['Tab'] == 'LINES_OF_BUSINESS')
                    $tab = 'LINE OF BUSINESS';
                else
                    $tab = rtrim(implode(' ', explode('_', $row['Tab'])), 'S');
                if($action != 'CHANGE PASSWORD')
                    $phrase .= " <span class='text-info'>" . $tab . "</span>";

                $arr_item = json_decode($row['Item'], true);
                $item = "<b style='font-weight: bold;'>" . $arr_item['item_maintitle'] . "</b>";
                if ($arr_item['item_subtitle'] != '')
                    $item .= "<b> &middot; </b>" . $arr_item['item_subtitle'];

                $arr_data = array(
                    'item_id' => $system_log_id,
                    'item_avatar' => $citizen['avatar'],
                    'item_maintitle' => $phrase,
                    'item_subtitle' => $item,
                    'item_update_date' => $row['UpdatedAt']
                );
            }
            return $arr_data;
        }


        // GET ALL ACTIVITY LOGS
        if(isset($_POST['get_activity_logs'])) {
            $last_item_id = trim($_POST['last_item']);
            $active_item_id = intval($_POST['active_item']);

            // check if active item exits
            $query = "SELECT `ID` FROM `system_logs` WHERE `ID`=$active_item_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking of active system log item exists')) {
                $active_item_exists = (mysqli_num_rows($result) > 0);

                $query = "SELECT `ID` FROM `system_logs` ORDER BY UNIX_TIMESTAMP(`UpdatedAt`) DESC";
                $result = mysqli_query($con, $query);
                if (has_no_db_error('getting all system logs')) {
                    $arr_system_logs = array();
                    $total_items = mysqli_num_rows($result);
                    $did_passed_last_item = false;
                    $did_passed_active_item = false;
                    $ctr = 1;
                    $item_limit = intval($_POST['item_limit']);
                    while ($row = mysqli_fetch_assoc($result)) {
                        $item_id = intval($row['ID']);
                        if ($last_item_id == '') {
                            // no last item found -> means on load
                            if($active_item_exists) {
                                // active item exists
                                array_push($arr_system_logs, get_system_log_item($item_id));
                                $ctr += 1;

                                if($item_id == $active_item_id)
                                    $did_passed_active_item = true;

                                if ($ctr > $item_limit && $did_passed_active_item) break;
                            }
                            else {
                                // active item does not exist
                                array_push($arr_system_logs, get_system_log_item($item_id));
                                $ctr += 1;
                                if ($ctr > $item_limit) break;
                            }
                        }
                        else {
                            // has last item found
                            // initiate get item when already passed the last item
                            if ($did_passed_last_item) {
                                array_push($arr_system_logs, get_system_log_item($item_id));
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
                        'menu_href' => $_POST['get_activity_logs'],
                        'items' => $arr_system_logs,
                        'total_items' => $total_items
                    );
                }
            }
        }


        // GET DATA OF 1 ACTIVITY LOG
        else if(isset($_POST['get_activity_log_data'])) {
            $system_log_id = intval($_POST['get_activity_log_data']);

            $query  = "SELECT `CitizenID`, ";
            $query .= "`UserTypeAcronym`, ";
            $query .= "`UserTypeTitle`, ";
            $query .= "`Action`, ";
            $query .= "`Location`, ";
            $query .= "`Menu`, ";
            $query .= "`Tab`, ";
            $query .= "`Item`, ";
            $query .= "`ItemData`, ";
            $query .= "DATE_FORMAT(`CreatedAt`, '%M %e, %Y &middot; %h:%i %p') AS CreatedAt ";
            $query .= "FROM `system_logs` ";
            $query .= "WHERE `ID`=$system_log_id";

            $result = mysqli_query($con, $query);
            if(has_no_db_error('getting system log data')) {
                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = 'SYSTEM LOG NOT FOUND';
                else {
                    $row = mysqli_fetch_assoc($result);
                    $citizen = get_citizen_info($row['CitizenID'], 'for getting system log data');

                    $tab_title = '';
                    if($row['Tab'] == 'LINES_OF_BUSINESS')
                        $tab_title = 'line of business';
                    else
                        $tab_title = strtolower(rtrim(implode(' ', explode('_', $row['Tab'])), 'S'));

                    $action_title = '';
                    if($row['Action'] == 'INSERT')
                        $action_title = 'added';
                    else if($row['Action'] == 'UPDATE')
                        $action_title = 'updated';
                    else if($row['Action'] == 'DELETE')
                        $action_title = 'removed';

                    $response['success']['data'] = array(
                        'user_account' => array(
                            'item_id' => intval($row['CitizenID']),
                            'item_avatar' => $citizen['avatar'],
                            'item_maintitle' => $citizen['full_name'],
                            'item_subtitle' =>  '(' . $row['UserTypeAcronym'] . ') ' . $row['UserTypeTitle'],
                            'item_update_date' => ''
                        ),
                        'action' => $row['Action'],
                        'action_title' => $action_title,
                        'location' => $row['Location'],
                        'menu' => $row['Menu'],
                        'tab' => $row['Tab'],
                        'tab_title' => $tab_title,
                        'item' => json_decode($row['Item'], true),
                        'item_data' => json_decode($row['ItemData'], true),
                        'created_date' => $row['CreatedAt']
                    );
                }
            }
        }
    }
    require '__fin.php';

?>