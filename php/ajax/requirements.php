<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        // FUNCTION: GET ITEM OF 1 REQUIREMENT
        function get_requirement_item($requirement_id) {
            require INDEX . 'php/inc/REQUIREMENT.php';
            $requirement = get_requirement_info($requirement_id, false, 'for getting requirement item data');
            return array(
                'item_id' => $requirement_id,
                'item_avatar' => '',
                'item_maintitle' => $requirement['title'],
                'item_subtitle' => $requirement['desc'],
                'item_update_date' => $requirement['date_updated']
            );
        }


        // FUNCTION: GET DATA OF 1 REQUIREMENT
        function get_requirement_data($requirement_id) {
            require INDEX . 'php/inc/REQUIREMENT.php';
            require INDEX . 'php/inc/BUSINESS_LINE.php';
            $requirement = get_requirement_info($requirement_id, true, 'for getting requirement data');
            return array(
                'title' => $requirement['title'],
                'desc' => $requirement['desc'],
                'validation_code_title' => $requirement['validation_code_title'],
                'is_for_upload' => $requirement['for_upload'],
                'collect_after' => $requirement['collect_after'],
                'is_for_poblacion_only' => $requirement['is_for_poblacion_only'],
                'classifications' => $requirement['classifications'],
                'lines_of_business' => get_all_lines_of_business('for getting requirement data', true)
            );
        }


        // GET ALL REQUIREMENTS
        if(isset($_POST['get_requirements'])) {
            $last_item_id = trim($_POST['last_item']);
            $active_item_id = intval($_POST['active_item']);

            // check if active item exits
            $query = "SELECT `ID` FROM `requirements` WHERE `ID`=$active_item_id";
            $result = mysqli_query($con, $query);
            if(has_no_db_error('checking if active requirement item exists')) {
                $active_item_exists = (mysqli_num_rows($result) > 0);

                $query = "SELECT `ID` ";
                $query .= "FROM `requirements` ";
                $query .= "WHERE 1 ";
                $query .= "ORDER BY `Title`, `Description`";
                $result = mysqli_query($con, $query);
                if (has_no_db_error('getting all requirements')) {
                    $arr_requirements = array();
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
                                array_push($arr_requirements, get_requirement_item($item_id));
                                $ctr += 1;

                                if($item_id == $active_item_id)
                                    $did_passed_active_item = true;

                                if ($ctr > $item_limit && $did_passed_active_item) break;
                            }
                            else {
                                // active item does not exist
                                array_push($arr_requirements, get_requirement_item($item_id));
                                $ctr += 1;
                                if ($ctr > $item_limit) break;
                            }
                        }
                        else {
                            // has last item found
                            // initiate get item when already passed the last item
                            if ($did_passed_last_item) {
                                array_push($arr_requirements, get_requirement_item($item_id));
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
                        'menu_href' => $_POST['get_requirements'],
                        'items' => $arr_requirements,
                        'total_items' => $total_items
                    );
                }
            }
        }


        // GET DATA OF 1 REQUIREMENT
        else if(isset($_POST['get_requirement_data'])) {
            $requirement_id = intval($_POST['get_requirement_data']);
            $response['success']['data'] = get_requirement_data($requirement_id);
        }


        // CREATE NEW REQUIREMENT
        else if(isset($_POST['create_new_requirement'])) {
            $requirement_title = '[new requirement]';
            $query = "INSERT INTO `requirements`(`Title`) VALUES('$requirement_title')";
            mysqli_query($con, $query);
            if (has_no_db_error('creating new requirement')) {
                $id = intval(mysqli_insert_id($con));

                // get the insert date
                $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `requirements` WHERE `ID`=$id";
                $result = mysqli_query($con, $query);
                $row = mysqli_fetch_assoc($result);

                $response['success']['data'] = array(
                    'item_id' => $id,
                    'item_avatar' => '',
                    'item_maintitle' => $requirement_title,
                    'item_subtitle' => '',
                    'item_update_date' => $row['UpdatedAt']
                );

                // append to system log (INSERT)
                append_to_system_log(array(
                    'action' => 'INSERT',
                    'item' => get_requirement_item($id),
                    'item_data' => get_requirement_data($id)
                ));
            }
        }


        // SAVE REQUIREMENT
        else if(isset($_POST['save_requirement'])) {
            $requirement_id = intval($_POST['save_requirement']);

            // check if the requirement is valid
            $query = "SELECT `ID` FROM `requirements` WHERE `ID`=$requirement_id";
            $result = mysqli_query($con, $query);
            if (has_no_db_error('checking if requirement exists')) {
                if (mysqli_num_rows($result) <= 0)
                    $response['error'] = 'REQUIREMENT NOT FOUND';
                else {
                    $item = get_requirement_item($requirement_id);
                    $requirement_title = mysqli_real_escape_string($con, strip_tags(trim($_POST['title'])));

                    // check if requirement title is available
                    $can_proceed = true;
                    if($requirement_title != '[new requirement]') {
                        $query = "SELECT `ID` FROM `requirements` WHERE `Title`='$requirement_title' ";
                        $query .= "AND `ID`!=$requirement_id";
                        $result = mysqli_query($con, $query);
                        if (has_no_db_error('checking requirement redundancy')) {
                            if(mysqli_num_rows($result) > 0) {
                                $response['success']['message'] = 'UNABLE TO SAVE REQUIREMENT';
                                $response['success']['sub_message'] = '<span style="font-size: 1.2em">There is already a <span class="text-info">REQUIREMENT</span> named <span class="text-danger">' . $requirement_title . '.</span></span>';
                                $can_proceed = false;
                            }
                        }
                    }
                    if($can_proceed) {
                        $requirement_desc = mysqli_real_escape_string($con, strip_tags(trim($_POST['desc'])));
                        $validation_code_title = mysqli_real_escape_string($con, strip_tags(trim($_POST['validation_code_title'])));
                        $is_need_for_upload = intval($_POST['is_for_upload']);
                        $collect_after = mysqli_real_escape_string($con, strip_tags(trim($_POST['collect_after'])));
                        $is_for_poblacion_only = intval($_POST['is_for_poblacion_only']);
                        $arr_classifications = array();
                        if (isset($_POST['classifications'])) {
                            $arr_classifications = $_POST['classifications'];
                        }

                        // update requirement record
                        $query  = "UPDATE `requirements` ";
                        $query .= "SET `Title`='$requirement_title', ";
                        $query .= "`Description`='$requirement_desc', ";
                        $query .= "`ValidationCodeTitle`='$validation_code_title', ";
                        $query .= "`IsForUpload`=$is_need_for_upload, ";
                        $query .= "`CollectAfter`='$collect_after', ";
                        $query .= "`IsForPoblacionOnly`=$is_for_poblacion_only ";
                        $query .= "WHERE `ID`=$requirement_id";
                        mysqli_query($con, $query);
                        if (has_no_db_error('saving requirement')) {

                            // update classifications
                            $can_proceed = true;
                            for($i=0; $i<sizeof($arr_classifications); $i++) {
                                $business_line_id = intval($arr_classifications[$i]['business_line_id']);
                                $application_type = mysqli_real_escape_string($con, $arr_classifications[$i]['application_type']);
                                $is_required = intval($arr_classifications[$i]['is_required']);

                                // check if classification exists
                                $query  = "SELECT `ID` FROM `requirements_classification` ";
                                $query .= "WHERE `ApplicationType`='$application_type' ";
                                $query .= "AND `BusinessLineID`=$business_line_id ";
                                $query .= "AND `RequirementID`=$requirement_id";
                                $result = mysqli_query($con, $query);
                                if(!has_no_db_error('checking if requirement classification exists'))
                                    $can_proceed = false;
                                else {
                                    if($is_required == 1) {
                                        if(mysqli_num_rows($result) <= 0) {
                                            $query  = "INSERT INTO `requirements_classification`(`ApplicationType`, `BusinessLineID`, `RequirementID`) ";
                                            $query .= "VALUES('$application_type', $business_line_id, $requirement_id)";
                                            mysqli_query($con, $query);
                                            if(!has_no_db_error('adding requirement classification'))
                                                $can_proceed = false;
                                        }
                                    }
                                    else {
                                        if(mysqli_num_rows($result) > 0) {
                                            $row = mysqli_fetch_assoc($result);
                                            $classification_id = intval($row['ID']);

                                            $query  = "DELETE FROM `requirements_classification` ";
                                            $query .= "WHERE `ID`=$classification_id";
                                            mysqli_query($con, $query);
                                            if(!has_no_db_error('removing requirement classification'))
                                                $can_proceed = false;
                                        }
                                    }
                                }
                            }

                            if($can_proceed) {
                                // get update date
                                $query = "SELECT DATE_FORMAT(`UpdatedAt`, '%M %e, %Y &middot; %h:%i %p') AS UpdatedAt FROM `requirements` WHERE `ID`=$requirement_id";
                                $result = mysqli_query($con, $query);
                                while ($row = mysqli_fetch_assoc($result)) {
                                    $response['success']['data'] = $row['UpdatedAt'];
                                    break;
                                }

                                // append to system log (UPDATE)
                                append_to_system_log(array(
                                    'action' => 'UPDATE',
                                    'item' => $item,
                                    'item_data' => get_requirement_data($requirement_id)
                                ));
                            }
                        }
                    }
                }
            }
        }


        // DELETE REQUIREMENT
        else if(isset($_POST['delete_requirement'])) {
            $requirement_id = intval($_POST['delete_requirement']);

            // check if the requirement is valid
            $query = "SELECT `ID` FROM `requirements` WHERE `ID`=$requirement_id";
            $result = mysqli_query($con, $query);
            if (has_no_db_error('checking if requirement exists')) {
                if(mysqli_num_rows($result) <= 0)
                    $response['error'] = 'REQUIREMENT NOT FOUND';
                else {

                    // todo: check for associated data

                    $item = get_requirement_item($requirement_id);
                    $item_data = get_requirement_data($requirement_id);
                    $query = "DELETE FROM `requirements` WHERE ID=$requirement_id";
                    mysqli_query($con, $query);
                    if (has_no_db_error('deleting requirement')) {
                        $response['success']['data'] = '1';

                        // append to system log (DELETE)
                        append_to_system_log(array(
                            'action' => 'DELETE',
                            'item' => $item,
                            'item_data' => $item_data
                        ));
                    }
                }
            }
        }
    }
    require '__fin.php';

?>