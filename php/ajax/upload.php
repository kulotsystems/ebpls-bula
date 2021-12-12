<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        if(isset($_FILES['fileIMG'])) {

            // Check $_FILES['fileIMG']['error'] value.
            $err = $_FILES['fileIMG']['error'];
            if($err != UPLOAD_ERR_OK) {
                if($err == UPLOAD_ERR_FORM_SIZE)
                    $response['success']['sub_message'] = "The file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form.";
                else if($err == UPLOAD_ERR_INI_SIZE)
                    $response['success']['sub_message'] = "The file exceeds the upload_max_filesize directive in php.ini.";
                else if($err == UPLOAD_ERR_PARTIAL)
                    $response['success']['sub_message'] = "The file was only partially uploaded.";
                else if($err != UPLOAD_ERR_NO_TMP_DIR)
                    $response['success']['sub_message'] = "Missing a temporary folder.";
                else if($err != UPLOAD_ERR_CANT_WRITE)
                    $response['success']['sub_message'] = "Failed to write file to disk.";
                else if($err != UPLOAD_ERR_EXTENSION)
                    $response['success']['sub_message'] = "A PHP extension stopped the file upload.";
                else if($err != UPLOAD_ERR_NO_FILE)
                    $response['success']['sub_message'] = "An unknown error occured.";

                if($response['success']['sub_message'] != '')
                    $response['success']['message'] = 'UNABLE TO UPLOAD FILE';
            }
            else {
                $dir = INDEX . 'img';
                $d = '';
                if (isset($_POST['fileREQ']))
                    $d = 'reqs';
                else if (isset($_POST['fileUSER']))
                    $d = 'users';

                // go to img dir
                chdir($dir);
                if (!file_exists($d))
                    mkdir($d);
                chdir($d);

                // get the file_extension and file_extension of the uploaded file
                $the_photo = $_FILES['fileIMG'];
                $fname = $the_photo['name'];
                $file_name = "";
                $file_extension = "";
                $length = strlen($fname);
                for ($i = ($length - 1); $i >= 0; $i--) {
                    if (substr($fname, $i, 1) == ".") {
                        $file_extension = strtolower(substr($fname, $i + 1, $length - ($i + 1)));
                        $file_name = substr($fname, 0, $i);
                        break;
                    }
                }

                 // check file type
                $allowed_file_types = array('jpg', 'jpeg', 'png', 'gif');
                if (!in_array(strtolower($file_extension), $allowed_file_types)) {
                    $response['success']['message'] = 'UNABLE TO UPLOAD FILE';
                    $response['success']['sub_message'] = "Please choose a file with the following file types:<br>{ " . implode(', ', $allowed_file_types) . " }";
                } else {

                    // get final file name
                    $final_file_name = "";
                    $ctr = 0;
                    while (true) {
                        $suffix = ($ctr <= 0) ? '' : '_' . $ctr;
                        $final_file_name = $file_name . $suffix . '.' . $file_extension;
                        if (!file_exists($final_file_name)) {
                            break;
                        }
                        $ctr += 1;
                    }

                    // finally . . .
                    move_uploaded_file($the_photo['tmp_name'], $final_file_name);
                    $response['success']['data'] = $final_file_name;
                }
            }
        }
    }
    require '__fin.php';

?>