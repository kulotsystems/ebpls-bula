<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        // FUNCTION: GET ITEM OF 1 REPORT
        function get_report_item($report_id) {
            require INDEX . 'php/inc/REPORT.php';
            $report = get_report_info($report_id, 'for getting report item data');
            return array(
                'item_id' => $report_id,
                'item_avatar' => '',
                'item_maintitle' => $report['title'],
                'item_subtitle' => $report['desc'],
                'item_update_date' => $report['date_updated']
            );
        }


        // FUNCTION: GET DATA OF 1 REPORT
        function get_report_data($report_id) {
            require INDEX . 'php/inc/REPORT.php';
            $report = get_report_info($report_id, 'for getting report data');
            return array(
                'id' => $report['id'],
                'title' => $report['title'],
                'desc' => $report['desc']
            );
        }


        // GET ALL REPORTS
        if(isset($_POST['get_reports'])) {
            $last_item_id = trim($_POST['last_item']);
            $active_item_id = intval($_POST['active_item']);

            $param = $_POST['get_reports'];

            // check if active item exits
            $query = "SELECT `ID` FROM `reports` WHERE `ID`=$active_item_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking if active report item exists')) {
                $active_item_exists = (mysqli_num_rows($result) > 0);

                $query = "SELECT `ID` ";
                $query .= "FROM `reports` ";
                $query .= "ORDER BY `ID`";
                $result = mysqli_query($con, $query);
                if (has_no_db_error('getting all reports')) {
                    $arr_reports = array();
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
                                array_push($arr_reports, get_report_item($item_id));
                                $ctr += 1;

                                if($item_id == $active_item_id)
                                    $did_passed_active_item = true;

                                if ($ctr > $item_limit && $did_passed_active_item) break;
                            }
                            else {
                                // active item does not exist
                                array_push($arr_reports, get_report_item($item_id));
                                $ctr += 1;
                                if ($ctr > $item_limit) break;
                            }
                        }
                        else {
                            // has last item found
                            // initiate get item when already passed the last item
                            if ($did_passed_last_item) {
                                array_push($arr_reports, get_report_item($item_id));
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
                        'menu_href' => $param,
                        'items' => $arr_reports,
                        'total_items' => $total_items
                    );
                }
            }
        }


        // GET DATA OF 1 REPORT
        else if(isset($_POST['get_report_data'])) {
            $report_id = intval($_POST['get_report_data']);
            $response['success']['data'] = get_report_data($report_id);
        }
    }
    require '__fin.php';

?>