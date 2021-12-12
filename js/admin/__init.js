/**
 * admin/__init.js :: global variables and functions
 *
 */

var header, content, tab, item;
var arrMainItemsHTML = [];
var activeSidebarMenuItem;
var activeContentTabItem;
var activeCardMainItem;
var activeSearchFormGroup;
var activeUploadFormGroup;
var isLiveClick;

var routes = {};
const STR_TAB_DASHBOARD = 'DASHBOARD';
const STR_TAB_UPDATES = 'UPDATES';
const STR_TAB_ACTIVITY_LOGS = 'ACTIVITY_LOGS';
const STR_TAB_USER_ACCOUNTS = 'USER_ACCOUNTS';
const STR_TAB_USER_TYPES = 'USER_TYPES';
const STR_TAB_CITIZENS = 'CITIZENS';
const STR_TAB_BUSINESS_SIZES = 'BUSINESS_SIZES';
const STR_TAB_TAX_OPTIONS = 'TAX_OPTIONS';
const STR_TAB_LINES_OF_BUSINESS = 'LINES_OF_BUSINESS';
const STR_TAB_REQUIREMENT_ITEMS = 'REQUIREMENT_ITEMS';
const STR_TAB_FEE_ITEMS = 'FEE_ITEMS';
const STR_TAB_NEW_APPLICATIONS = '[NEW]_APPLICATIONS';
const STR_TAB_RENEWAL_APPLICATIONS = '[REN]_APPLICATIONS';
const STR_TAB_NEW_VERIFICATIONS = '[NEW]_VERIFICATIONS';
const STR_TAB_RENEWAL_VERIFICATIONS = '[REN]_VERIFICATIONS';
const STR_TAB_NEW_INVOICES = '[NEW]_PAYMENT_INVOICES';
const STR_TAB_RENEWAL_INVOICES = '[REN]_PAYMENT_INVOICES';
const STR_TAB_NEW_PERMITS = '[NEW]_BUSINESS_PERMITS';
const STR_TAB_RENEWAL_PERMITS = '[REN]_BUSINESS_PERMITS';
const STR_TAB_APPLICATION_SETTINGS = 'APPLICATION_SETTINGS';
const STR_TAB_SYSTEM_SETTINGS = 'SYSTEM_SETTINGS';
const STR_TAB_REPORTS = 'REPORTS';
const STR_QUICKVIEW_SEARCH_CITIZEN = 'SEARCH FOR CITIZEN';
const STR_QUICKVIEW_SEARCH_CORPORATE_OWNER = 'SEARCH FOR CORPORATE OWNER';
const STR_QUICKVIEW_UPLOAD_CORPORATE_OWNER_PHOTO = 'UPLOAD CORPORATE OWNER PHOTO';
const STR_QUICKVIEW_SEARCH_BARANGAY = 'SEARCH FOR BARANGAY';
const STR_QUICKVIEW_SEARCH_LINE_OF_BUSINESS = 'SEARCH LINE OF BUSINESS';
const STR_QUICKVIEW_UPLOAD_REQUIREMENT = 'UPLOAD REQUIREMENT';
const STR_QUICKVIEW_VIEW_REQUIREMENT = 'VIEW REQUIREMENT';

var prevItemData = '';
var itemHeight = 60;
var performedDBSearch = false;
var isFromTabClick = false;
var isFromMenuClick = false;
$(function() {
    header = body.find('.header');
    content = body.find('.content');

    routes[STR_TAB_UPDATES] = {
        title: STR_TAB_UPDATES.split("_").join(" "),
        path: index + 'php/ajax/updates.php',
        prepare_param: 'get_updates',
        select_param: 'get_update_data',
        search_param: 'search_update'
    };

    routes[STR_TAB_ACTIVITY_LOGS] = {
        title: STR_TAB_ACTIVITY_LOGS.split("_").join(" "),
        path: index + 'php/ajax/activity_logs.php',
        prepare_param: 'get_activity_logs',
        select_param: 'get_activity_log_data',
        search_param: 'search_activity_log'
    };

    routes[STR_TAB_USER_ACCOUNTS] = {
        title: STR_TAB_USER_ACCOUNTS.split("_").join(" "),
        path: index + 'php/ajax/user_accounts.php',
        prepare_param: 'get_user_accounts',
        create_param: 'create_new_useraccount',
        select_param: 'get_user_account_data',
        delete_param: 'delete_useraccount',
        search_param: 'search_useraccount'
    };

    routes[STR_TAB_USER_TYPES] = {
        title: STR_TAB_USER_TYPES.split("_").join(" "),
        path: index + 'php/ajax/user_types.php',
        prepare_param: 'get_user_types',
        create_param: 'create_new_usertype',
        select_param: 'get_user_type_data',
        delete_param: 'delete_usertype',
        search_param: 'search_usertype'
    };

    routes[STR_TAB_CITIZENS] = {
        title: STR_TAB_CITIZENS.split("_").join(" "),
        path: index + 'php/ajax/citizens.php',
        prepare_param: 'get_citizens',
        select_param: 'get_citizen_data',
        search_param: 'search_citizen'
    };

    routes[STR_TAB_BUSINESS_SIZES] = {
        title: STR_TAB_BUSINESS_SIZES.split("_").join(" "),
        path: index + 'php/ajax/business_sizes.php',
        prepare_param: 'get_business_sizes',
        create_param: 'create_new_business_size',
        select_param: 'get_business_size_data',
        delete_param: 'delete_business_size',
        search_param: 'search_business_size'
    };

    routes[STR_TAB_LINES_OF_BUSINESS] = {
        title: STR_TAB_LINES_OF_BUSINESS.split("_").join(" "),
        path: index + 'php/ajax/business_lines.php',
        prepare_param: 'get_lines_of_business',
        create_param: 'create_new_line_of_business',
        select_param: 'get_line_of_business_data',
        delete_param: 'delete_line_of_business',
        search_param: 'search_line_of_business'
    };

    routes[STR_TAB_REQUIREMENT_ITEMS] = {
        title: STR_TAB_REQUIREMENT_ITEMS.split("_").join(" "),
        path: index + 'php/ajax/requirements.php',
        prepare_param: 'get_requirements',
        create_param: 'create_new_requirement',
        select_param: 'get_requirement_data',
        delete_param: 'delete_requirement',
        search_param: 'search_requirement'
    };

    routes[STR_TAB_FEE_ITEMS] = {
        title: STR_TAB_FEE_ITEMS.split("_").join(" "),
        path: index + 'php/ajax/fees.php',
        prepare_param: 'get_fees',
        create_param: 'create_new_fee',
        select_param: 'get_fee_data',
        delete_param: 'delete_fee',
        search_param: 'search_fee'
    };

    routes[STR_TAB_NEW_APPLICATIONS] = {
        title: STR_TAB_NEW_APPLICATIONS.split("_").join(" "),
        path: index + 'php/ajax/applications.php',
        prepare_param: 'get_new_applications',
        create_param: 'create_new_new_application',
        select_param: 'get_new_application_data',
        delete_param: 'delete_new_application',
        submit_param: 'submit_new_forverification',
        search_param: 'search_new_application'
    };

    routes[STR_TAB_RENEWAL_APPLICATIONS] = {
        title: STR_TAB_RENEWAL_APPLICATIONS.split("_").join(" "),
        path: index + 'php/ajax/applications.php',
        prepare_param: 'get_renewal_applications',
        create_param: 'create_new_renewal_application',
        select_param: 'get_renewal_application_data',
        delete_param: 'delete_renewal_application',
        submit_param: 'submit_renewal_forverification',
        search_param: 'search_renewal_application'
    };

    routes[STR_TAB_NEW_VERIFICATIONS] = {
        title: STR_TAB_NEW_VERIFICATIONS.split("_").join(" "),
        path: index + 'php/ajax/applications.php',
        prepare_param: 'get_new_verifications',
        select_param: 'get_new_verification_data',
        delete_param: 'delete_new_verification',
        submit_param: 'submit_new_forinvoice',
        search_param: 'search_new_verification'
    };

    routes[STR_TAB_RENEWAL_VERIFICATIONS] = {
        title: STR_TAB_RENEWAL_VERIFICATIONS.split("_").join(" "),
        path: index + 'php/ajax/applications.php',
        prepare_param: 'get_renewal_verifications',
        select_param: 'get_renewal_verification_data',
        delete_param: 'delete_renewal_verification',
        submit_param: 'submit_renewal_forinvoice',
        search_param: 'search_renewal_verification'
    };

    routes[STR_TAB_NEW_INVOICES] = {
        title: STR_TAB_NEW_INVOICES.split("_").join(" "),
        path: index + 'php/ajax/applications.php',
        prepare_param: 'get_new_invoices',
        select_param: 'get_new_invoice_data',
        delete_param: 'delete_new_invoice',
        submit_param: 'submit_new_forpermit',
        search_param: 'search_new_invoice'
    };

    routes[STR_TAB_RENEWAL_INVOICES] = {
        title: STR_TAB_RENEWAL_INVOICES.split("_").join(" "),
        path: index + 'php/ajax/applications.php',
        prepare_param: 'get_renewal_invoices',
        select_param: 'get_renewal_invoice_data',
        delete_param: 'delete_renewal_invoice',
        submit_param: 'submit_renewal_forpermit',
        search_param: 'search_renewal_invoice'
    };

    routes[STR_TAB_NEW_PERMITS] = {
        title: STR_TAB_NEW_PERMITS.split("_").join(" "),
        path: index + 'php/ajax/applications.php',
        prepare_param: 'get_new_permits',
        select_param: 'get_new_permit_data',
        search_param: 'search_new_permit'
    };

    routes[STR_TAB_RENEWAL_PERMITS] = {
        title: STR_TAB_RENEWAL_PERMITS.split("_").join(" "),
        path: index + 'php/ajax/applications.php',
        prepare_param: 'get_renewal_permits',
        select_param: 'get_renewal_permit_data',
        search_param: 'search_renewal_permit'
    };

    routes[STR_TAB_TAX_OPTIONS] = {
        title: STR_TAB_TAX_OPTIONS.split("_").join(" "),
        path: index + 'php/ajax/business_tax_options.php',
        prepare_param: 'get_business_tax_options',
        select_param: 'get_business_tax_option_data',
        search_param: 'search_business_tax_option'
    };

    routes[STR_TAB_APPLICATION_SETTINGS] = {
        title: STR_TAB_APPLICATION_SETTINGS.split("_").join(" "),
        path: index + 'php/ajax/settings.php',
        prepare_param: 'get_application_settings',
        select_param: 'get_application_setting_data',
        search_param: 'search_application_setting'
    };

    routes[STR_TAB_SYSTEM_SETTINGS] = {
        title: STR_TAB_SYSTEM_SETTINGS.split("_").join(" "),
        path: index + 'php/ajax/settings.php',
        prepare_param: 'get_system_settings',
        select_param: 'get_system_setting_data',
        search_param: 'search_system_setting'
    };

    routes[STR_TAB_REPORTS] = {
        title: STR_TAB_REPORTS.split("_").join(" "),
        path: index + 'php/ajax/reports.php',
        prepare_param: 'get_reports',
        select_param: 'get_report_data',
        search_param: 'search_report'
    };

    // EVENT: POSITION ELEMENTS ON RESIZE
    var prevWindowWidth = window.innerWidth;
    var prevWindowHeight = window.innerHeight;
    var tmrResize;
    window.onresize = function() {
        if(window.innerWidth != prevWindowWidth) {
            // there was a change in width
            positionElements();
        }

        if(window.innerHeight != prevWindowHeight) {
            // no change in width (height only)
            positionElements(false);
            // try to fetch items again when window height is increased
            if (window.innerHeight > prevWindowHeight) {
                if(!isMobile() || window.innerWidth > 767) {
                    if (tab != undefined) {
                        var divMainItems = body.find(".content-tab-pane#tab" + tab).find('.div-main-items');
                        if (divMainItems.length > 0) {
                            clearTimeout(tmrResize);
                            tmrResize = setTimeout(function () {
                                var totalItemsHeight = 0;
                                var divMainItemsHeight = parseFloat(divMainItems.css('height'));
                                divMainItems.find('.card-main-item').each(function (i) {
                                    totalItemsHeight += parseFloat($(this).css('height'));
                                });
                                if (totalItemsHeight < divMainItemsHeight) {
                                    enumerate(true);
                                }
                            }, 480);
                        }
                    }
                }
            }
        }
        prevWindowWidth = window.innerWidth;
        prevWindowHeight = window.innerHeight;
    };

    // EVENT: USER LOGOUT
    $('#btnShowLogoutPrompt').on('click', function() {
        showConfirmDialog("CONFIRM LOGOUT", "<span style='font-size: 1.2em'>Do you really want to logout?</span>");
        confirmYes(function() {
            Pace.restart();
            $.ajax({
                type: 'POST',
                url: index + 'php/ajax/login.php',
                data: {
                    logout_user: 1
                },
                success: function(data) {
                    var respose = JSON.parse(data);
                    if(respose.success == "1") {
                        hideConfirmDialog(function() {
                            body.fadeOut();
                            window.open(index + 'admin/index.php?logout', '_self');
                        });
                    }
                    Pace.stop();
                },
                error: function(data) {
                    alert("UNABLE TO LOGOUT\n\nError " + data.status + " (" + data.statusText + ")");
                    Pace.stop();
                    window.location.reload();
                }
            });
        });
    });

    // EVENT: USER MODIFY PASSWORD
    $('#btnModifyPassword').on('click', function() {
        var divModifyPassword = body.find('#div-modify-password');
        var proceed = false;
        if(divModifyPassword == null) {
            proceed = true;
        }
        else {
            divModifyPassword.each(function(i) {
                $(this).remove();
            });
            proceed = true;
        }
        if(proceed) {
            var h = "";
            h += "<div class='modal fade slide-right' id='div-modify-password' tabindex='-1' role='dialog' aria-hidden='true' data-keyboard='false' data-backdrop='static' style='z-index: 1041'>";
                h += "<div class='modal-dialog modal-lg'>";
                    h += "<div class='modal-content'>";
                        h += "<div class='modal-header clearfix text-left'>";
                            h += "<p class='dialog-title text-bold text-montserrat' style='font-size: 1.6em !important'>MODIFY USER PASSWORD</p>";
                            h += "<p class='dialog-message w-100'></p>";
                        h += "</div>";
                        h += "<div class='modal-body'>";
                            h += "<div class='row'>";
                                h += "<div class='col-sm-12'>";
                                    var userImgSRC = body.find('#imgProfile').attr('src');
                                    var userFullname = body.find('#spAdminFirstname').text() + " " + body.find('#spAdminMiddleName').text() + body.find('#spAdminLastName').text();
                                    var userTitle = body.find('#spUserTitle').text().trim();
                                    var userUsertype = body.find('#spAdminUserTitle').attr('data-original-title').trim();
                                    h += "<div class='card social-card share no-margin no-border w-100 active'>";
                                        h += "<div class='card-header clearfix no-border no-border-radius overflow-hidden'>";
                                            h += "<div class='item-avatar user-pic'><img alt='(img)' width='33' height='33' src='" + userImgSRC + "' style='width: 60px; height: 60px;'></div>";
                                            h += "<h3 class='no-wrap text-montserrat no-padding no-margin'><span class='main-title'>" + userFullname + "</span></h3>";
                                            h += "<h5 class='no-wrap sub-title no-padding no-margin'>(" + userTitle + ") " + userUsertype + "</h5>";
                                        h += "</div>";
                                    h += "</div>";
                                    h += "<br>";
                                    h += "<div class='form-group-attached'>";
                                        h += "<div class='row clearfix'>";
                                            h += "<div class='col-md-12'>";
                                                h += "<div class='form-group form-group-default input-group no-border-radius'>";
                                                    h += "<div class='form-input-group'>";
                                                        h += "<label class='inline fade'>OLD PASSWORD</label>";
                                                         h += "<input type='password' class='form-control monospace txt-old-password'>";
                                                    h += "</div>";
                                                    h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                                        h += "<button class='btn btn-default btn-xs cursor-pointer btn-toggle-password' tabindex='-1'><span class='fa fa-eye-slash'></span></button>";
                                                    h += "</div>";
                                                h += "</div>";
                                            h += "</div>";
                                        h += "</div>";
                                        h += "<div class='row clearfix'>";
                                            h += "<div class='col-md-12'>";
                                                h += "<div class='form-group form-group-default input-group no-border-radius'>";
                                                    h += "<div class='form-input-group'>";
                                                        h += "<label class='inline fade'>NEW PASSWORD</label>";
                                                         h += "<input type='password' class='form-control monospace txt-new-password'>";
                                                    h += "</div>";
                                                    h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                                        h += "<button class='btn btn-default btn-xs cursor-pointer btn-toggle-password' tabindex='-1'><span class='fa fa-eye-slash'></span></button>";
                                                    h += "</div>";
                                                h += "</div>";
                                            h += "</div>";
                                        h += "</div>";
                                        h += "<div class='row clearfix'>";
                                            h += "<div class='col-md-12'>";
                                                h += "<div class='form-group form-group-default input-group no-border-radius'>";
                                                    h += "<div class='form-input-group'>";
                                                        h += "<label class='inline fade'>CONFIRM NEW PASSWORD</label>";
                                                         h += "<input type='password' class='form-control monospace txt-confirm-new-password'>";
                                                    h += "</div>";
                                                    h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                                        h += "<button class='btn btn-default btn-xs cursor-pointer btn-toggle-password' tabindex='-1'><span class='fa fa-eye-slash'></span></button>";
                                                    h += "</div>";
                                                h += "</div>";
                                            h += "</div>";
                                        h += "</div>";
                                    h += "</div>";
                                h += "</div>";
                            h += "</div>";
                            h += "<div class='row'>";
                                h += "<div class='col-md-12'>";
                                    h += "<span class='label label-danger' id='lblModifyPasswordLabel' style='visibility: hidden'></span>";
                                h += "</div>";
                                h += "<div class='col-sm-12' align='right'>";
                                    h += "<button class='btn btn-default btn-rounded' id='btnModifyPasswordCancel' data-dismiss='modal' aria-hidden='true'>Cancel</button> ";
                                    h += "<button class='btn btn-success btn-rounded' id='btnModifyPasswordOK'><span class='fas fa-thumbs-up'></span> OK </button>";
                                h += "</div>";
                            h += "</div>";
                        h += "</div>";
                    h += "</div>";
                h += "</div>";
            h += "</div>";
            body.append(h);
            setTimeout(function() {
                divModifyPassword = body.find('#div-modify-password');
                divModifyPassword.modal().show(function() {
                    setTimeout(function() {
                        var txtOldPassword = body.find('.txt-old-password');
                        txtOldPassword.focus();
                        txtOldPassword.select();
                    }, 1);
                });
            }, 1);
        }
    });

    // EVENT: USER btnModifyPasswordOK BTN CLICK
    body.delegate('#btnModifyPasswordOK', 'click', function() {
        var btnModifyPasswordOK = $(this);
        var btnModifyPasswordCancel = body.find('#btnModifyPasswordCancel');
        var lblModifyPasswordLabel = body.find('#lblModifyPasswordLabel');
        var txtOldPassword = body.find('.txt-old-password');
        var txtNewPassword = body.find('.txt-new-password');
        var txtConfirmNewPassword = body.find('.txt-confirm-new-password');
        var strOldPassword = txtOldPassword.val();
        var strNewPassword = txtNewPassword.val();
        var strConfirmNewPassword = txtConfirmNewPassword.val();

        function enableModalButtons() {
            disableButton(btnModifyPasswordOK, false);
            disableButton(btnModifyPasswordCancel, false);
            var fa = btnModifyPasswordOK.find('.fas');
            if (fa.hasClass('fa-circle-notch')) {
                fa.removeClass('fa-circle-notch');
                fa.removeClass('fa-spin');
                fa.addClass('fa-thumbs-up');
            }
        }

        function disableModalButtons() {
            disableButton(btnModifyPasswordOK, true);
            disableButton(btnModifyPasswordCancel, true);
            var fa = btnModifyPasswordOK.find('.fas');
            if (fa.hasClass('fa-thumbs-up')) {
                fa.removeClass('fa-thumbs-up');
                fa.addClass('fa-circle-notch');
                fa.addClass('fa-spin');
            }
        }


        disableModalButtons();
        if(strOldPassword != "" && txtNewPassword != "" && strConfirmNewPassword != "") {
            lblModifyPasswordLabel.css({'visibility':'hidden'});
            if(strNewPassword != strConfirmNewPassword) {
                lblModifyPasswordLabel.css({'visibility':'visible'});
                lblModifyPasswordLabel.html("<span class='fa fa-exclamation-triangle'></span> NEW PASSWORDS DO NOT MATCH");
                txtConfirmNewPassword.focus();
                enableModalButtons();
            }
            else {
                Pace.restart();
                $.ajax({
                    type: 'POST',
                    url: index + 'php/ajax/user_accounts.php',
                    data: {
                        change_user_account_old_password: strOldPassword,
                        change_user_account_new_password: strNewPassword,
                        tab: STR_TAB_USER_ACCOUNTS,
                        menu: '',
                        location: ''
                    },
                    success: function (data) {
                        var response = JSON.parse(data);
                        if (response.error != '') {
                            showMessageDialog(response.error, '', function () {
                                window.location.reload();
                            });
                        }
                        else {
                            if (response.success.message != '')
                                showMessageDialog(response.success.message, response.success.sub_message);
                            else {
                                if(response.success.data != '') {
                                    lblModifyPasswordLabel.css({'visibility':'visible'});
                                    lblModifyPasswordLabel.html("<span class='fa fa-exclamation-triangle'></span> INCORRECT OLD PASSWORD");
                                    txtOldPassword.focus();
                                    txtOldPassword.select();
                                }
                                else {
                                    body.find('#div-modify-password').modal().hide(function() {
                                        showMessageDialog("PASSWORD CHANGED SUCCESSFULLY", "<span style='font-size: 1.2em'>You have successfully changed your password.<br>You need to login again.</span>", function() {
                                            window.location.reload();
                                        });
                                    });
                                }
                            }
                        }
                        Pace.stop();
                        enableModalButtons();
                    },
                    error: function (data) {
                        alert("UNABLE TO CHANGE USER PASSWORD\n\nError " + data.status + " (" + data.statusText + ")");
                        Pace.stop();
                        window.location.reload();
                    }
                });
            }
        }
        else {
            if(strOldPassword == "") {
                lblModifyPasswordLabel.html("<span class='fa fa-exclamation-triangle'></span> ENTER YOUR OLD PASSWORD");
                txtOldPassword.focus();
                txtOldPassword.select();
            }
            else if(strNewPassword == "") {
                lblModifyPasswordLabel.html("<span class='fa fa-exclamation-triangle'></span> ENTER YOUR NEW PASSWORD");
                txtNewPassword.focus();
                txtNewPassword.select();
            }
            else if(strConfirmNewPassword == "") {
                lblModifyPasswordLabel.html("<span class='fa fa-exclamation-triangle'></span> CONFIRM YOUR NEW PASSWORD");
                txtConfirmNewPassword.focus();
                txtConfirmNewPassword.select();
            }
            enableModalButtons();
        }
    });

    // EVENT: {txt-change-password} keyup
    body.delegate('.txt-old-password, .txt-new-password, .txt-confirm-new-password', 'keydown', function() {
       var lblModifyPasswordLabel = body.find('#lblModifyPasswordLabel');
        if(lblModifyPasswordLabel.css('visibility') == 'visible')
            lblModifyPasswordLabel.css({'visibility':'hidden'});
    });

    positionElements();
    setTimeout(function() {
        body.hide();
        body.removeClass('hidden');
        body.fadeIn(1500);
    }, 1);
});

// position elements
function positionElements(canHidePanes) {
    var windowWidth = window.innerWidth;
    var windowHeight = window.innerHeight;
    var headerHeight = parseFloat(header.css('height'));

    content.css({
        'padding-top' :  headerHeight.toString() + 'px'
    });

    if(windowWidth >= 992) {
        if (banner1.hasClass('hidden'))
            banner1.removeClass('hidden');

        body.find('.toggle-sidebar').each(function(i) {
            $(this).attr('data-toggle', '');
            if($(this).hasClass('cursor-pointer'))
                $(this).removeClass('cursor-pointer');
        });
    }
    else {
        if(body.hasClass('sidebar-open')) {
            if(!banner1.hasClass('hidden'))
                banner1.addClass('hidden');
        }

        body.find('.toggle-sidebar').each(function(i) {
            $(this).attr('data-toggle', 'sidebar');
            if(!$(this).hasClass('cursor-pointer'))
                $(this).addClass('cursor-pointer');
        });
    }

    // adjust main content
    var divJumbotron = body.find('.jumbotron');
    var mainContent = body.find('.main-content');
    if(divJumbotron.length > 0 && mainContent.length > 0) {
        var jumbotronHeight = parseFloat(divJumbotron.css('height'));
        var mainContentHeight = windowHeight - (jumbotronHeight + headerHeight);
        mainContent.css({
            'height' : mainContentHeight.toString() + 'px'
        });
    }

    // adjust main form wizard
    var mainFormWizard = body.find('.main-form-wizard');
    if(mainFormWizard.length > 0) {
        var formWizardHeaderHeight = 0;
        if(windowWidth >= 768)
            formWizardHeaderHeight = parseFloat(mainFormWizard.find('.nav-tabs').css('height'));
        else
            formWizardHeaderHeight = parseFloat(mainFormWizard.find('.nav-tab-dropdown').css('height'));
        var formWizardTabContentHeight = mainContentHeight - formWizardHeaderHeight - 1;
        var formWizardTabContentWidth = parseFloat(mainFormWizard.css('width'));
        mainFormWizard.find('.tab-content').css({
            'height' :  formWizardTabContentHeight.toString() + 'px'
        });

        // adjust pane on form-wizard
        var pane = mainFormWizard.find('.pane');

        if(pane.length > 0) {
            var paneHeight = formWizardTabContentHeight;
            pane.css({
                'height' : paneHeight.toString() + 'px'
            });

            // adjust pane left and pane right
            var paneLeft = pane.find('.pane-left');
            var paneRight = pane.find('.pane-right');
            var paneLeftWidth = parseFloat(paneLeft.css('width'));
            var paneRightWidth = parseFloat(paneRight.css('width'));

            if(paneLeft.length > 0) {
                paneLeft.css({
                    'height': paneHeight.toString() + 'px'
                });

                // adjust card block div-main-items
                var divMainItemsHeader = paneLeft.find('.div-main-items-header');
                var divMainItems = paneLeft.find('.div-main-items');

                var divMainItemsHeaderHeight = parseFloat(divMainItemsHeader.css('height'));
                if(divMainItemsHeaderHeight <= 0)
                    divMainItemsHeaderHeight = 45;
                var divMainItemsHeight = paneHeight - divMainItemsHeaderHeight;
                divMainItems.css({
                    'height' : divMainItemsHeight.toString() + 'px'
                });

            }
            if(paneRight.length > 0) {
                paneRight.css({
                    'height': paneHeight.toString() + 'px'
                });

                // adjust card block item-content
                var divItemContentHeader = paneRight.find('.item-content-header');
                var divItemContent = paneRight.find('.item-content');

                var divItemContentHeaderHeight = parseFloat(divItemContentHeader.css('height'));
                if(divItemContentHeaderHeight <= 0)
                    divItemContentHeaderHeight = 45;
                var divItemContentHeight = paneHeight - divItemContentHeaderHeight;
                divItemContent.css({
                    'height' : divItemContentHeight.toString() + 'px'
                });
            }

            // adjust quick view
            var quickView = body.find('#quickview');
            if(quickView.length > 0) {

                var quickViewTop = headerHeight + jumbotronHeight + formWizardHeaderHeight;
                var quickViewWidth = paneLeftWidth;
                if (windowWidth >= 1200) {
                    var sidebarWidth = parseFloat(body.find('.page-sidebar').css('width'));
                    quickViewWidth = (windowWidth - sidebarWidth) * 0.25;
                }
                if (windowWidth >= 768 && windowWidth <= 1199) {
                    quickViewWidth = windowWidth * 0.25;
                }
                if (windowWidth <= 767) {
                    quickViewWidth = windowWidth * 0.45;
                }
                if (windowWidth <= 480) {
                    quickViewWidth = windowWidth * 0.60;
                }
                if (windowWidth <= 256) {
                    quickViewWidth = windowWidth;
                }

                var quickViewHeight = windowHeight - quickViewTop;
                var isQuickViewOpen = quickView.hasClass('open');

                if (quickViewWidth > 0) {
                    quickView.css({
                        'top': quickViewTop.toString() + 'px',
                        'width': quickViewWidth.toString() + 'px',
                        'height': quickViewHeight.toString() + 'px',
                        'right': '-' + quickViewWidth.toString() + 'px'
                    });

                    // adjust quickview-content-body
                    var quickViewContentHead = quickView.find('.quickview-content-head');
                    var quickViewContentBody = quickView.find('.quickview-content-body');
                    if (quickViewContentHead.length > 0 && quickViewContentBody.length > 0) {
                        var quickViewNavTabsHeight = parseFloat(quickView.find('.quickview-title-bar').css('height'));
                        var quickViewContentHeadHeight = parseFloat(quickViewContentHead.css('height'));
                        var quickViewContentBodyHeight = quickViewHeight - (quickViewNavTabsHeight + quickViewContentHeadHeight);
                        quickViewContentBody.css({
                            'height': quickViewContentBodyHeight.toString() + 'px'
                        });
                    }
                }
                else {
                    quickView.css({
                        'top': quickViewTop.toString() + 'px',
                        'width': quickViewWidth.toString() + 'px',
                        'height': quickViewHeight.toString() + 'px',
                        'right': '-100px'
                    });
                }
            }
        }
    }

    if(canHidePanes == null)
        canHidePanes = true;

    if(canHidePanes) {
        hideOrShowPanes();
    }

    if(windowWidth > 767) {
        steadyTabContent();

        // if active main item's content is not shown, select it
        var divContentTab = body.find('.content-tab-pane#tab' + tab);
        var divMainItems = divContentTab.find('.div-main-items');
        var divContent = divContentTab.find('.item-content');
        var activeItem = divMainItems.find('.card-main-item.active');
        if(activeItem.length > 0) {
            if(divContent.html() == "") {
                isFromMenuClick = false;
                isFromTabClick = false;
                select(activeItem);
            }
        }
    }

    // apply tooltips
    applyTooltips();
}

// decide to hide/show panes
function hideOrShowPanes() {
    if (window.innerWidth <= 767) {
        // show .pane-right-col when there is an active .card-main-item.
        var divContentTab = body.find('.content-tab-pane#tab' + tab);
        if(divContentTab != undefined) {
            if (divContentTab.find('.card-main-item.active').length > 0) {
                hidePaneLeftCol();
            }
            else {
                showPaneLeftCol();
            }
        }
        else {
            showPaneLeftCol();
        }
    }
    else
        showBothPaneCol();
}

// hide left pane
function hidePaneLeftCol() {
    var divContentTab = body.find('.content-tab-pane#tab' + tab);
    var paneLeftCol = divContentTab.find('.pane-left-col');
    var paneRightCol = divContentTab.find('.pane-right-col');
    if(paneLeftCol.length > 0 && paneRightCol.length > 0) {
        if(!paneLeftCol.hasClass('hidden'))
            paneLeftCol.addClass('hidden');
        if(paneRightCol.hasClass('hidden'))
            paneRightCol.removeClass('hidden');
    }
}

// show left pane
function showPaneLeftCol() {
    var divContentTab = body.find('.content-tab-pane#tab' + tab);
    var paneLeftCol = divContentTab.find('.pane-left-col');
    var paneRightCol = divContentTab.find('.pane-right-col');
    if(paneLeftCol.length > 0 && paneRightCol.length > 0) {
        if(paneLeftCol.hasClass('hidden'))
            paneLeftCol.removeClass('hidden');
        if(!paneRightCol.hasClass('hidden'))
            paneRightCol.addClass('hidden');
    }
}

// steady tab content
function steadyTabContent() {
    var tabContent = body.find('.tab-content');
    tabContent.css({
        '-webkit-transition': 'all 0s ease',
        'transition': 'all 0s ease'
    });
    tabContent.removeClass('slide-left');
    tabContent.removeClass('slide-right');
}

// slide tab content
function slideTabContent(strDirection) {
    if(window.innerWidth <= 767) {
        var tabContent = body.find('.tab-content');
        steadyTabContent();

        tabContent.addClass('slide-' + strDirection);
        tabContent.addClass('sliding');
        setTimeout(function () {
            tabContent.css({
                '-webkit-transition': 'all 0.3s ease',
                'transition': 'all 0.3s ease'
            });
            tabContent.removeClass("sliding");
        }, 100);
    }
}

// show left and right pane
function showBothPaneCol() {
    var divContentTab = body.find('.content-tab-pane#tab' + tab);
    var paneLeftCol = divContentTab.find('.pane-left-col');
    var paneRightCol = divContentTab.find('.pane-right-col');
    if(paneLeftCol.length > 0 && paneRightCol.length > 0) {
        if(paneLeftCol.hasClass('hidden'))
            paneLeftCol.removeClass('hidden');
        if(paneRightCol.hasClass('hidden'))
            paneRightCol.removeClass('hidden');
    }
}

// render date pickers
function renderDatePickers() {
    var container = $('.bootstrap-iso form');
    container = container.length > 0 ? container.parent() : "body";
    $('input.date-picker').each(function(i) {
        var d = $(this).val();
        if($(this).hasClass('date-picker-no-year')) {
            $(this).datepicker({
                format: 'MM d',
                container: container,
                todayHighlight: true,
                autoclose: true
            }).datepicker('setDate', new Date(d)).on('show', function() {
                // remove the year from the date title before the datepicker show
                var datePickerSwitch = $(".datepicker-days .datepicker-switch");
                var dateText  = datePickerSwitch.text();
                var dateTitle = dateText.substr(0, dateText.length - 5);
                datePickerSwitch.text(dateTitle);
            });
        }
        else {
            $(this).datepicker({
                format: 'MM d, yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true
            }).datepicker('setDate', new Date(d));
        }
    });
}

// display cbo details
function displayCBODetails(cbo) {
    var divDetails = body.find(cbo.attr('cbo-toggle-details'));
    divDetails.html(cbo.children('option').filter(':selected').attr('data-desc'));
}

// disable or enable a button
function disableButton(btn, bool) {
    if(btn != null) {
        if (btn.length > 0) {
            btn.attr('disabled', bool);
            btn.prop('disabled', bool);
        }
    }
}

// disable or enable an input
function disableInput(inp, bool) {
    if(inp != null) {
        inp.attr('readonly', bool);
        inp.prop('readonly', bool);
        inp.attr('disabled', bool);
        inp.prop('disabled', bool);
    }
}

// get element's form state
function getFormState(div) {
    var str = "";

    // input elements
    div.find('input').each(function(i) {
        var e = $(this);
        var t = e.attr('type');
        var v = '';
        if(t != undefined) {
            if(t == 'text')
                v = e.val().trim();
            else if(t == 'radio' || t == 'checkbox')
                v = e.prop('checked').toString();
            else
                v = e.val();
        }
        else {
            v = e.val();
        }
        str += v;
    });

    // text areas
    div.find('textarea').each(function(i) {
        str += $(this).val().trim();
    });

    // combo boxes
    div.find('select').each(function(i) {
        str += $(this).val().trim();
    });

    // images
    div.find('img').each(function(i) {
        var src = $(this).attr('src');
        if(src != undefined)
            str += src;
        else
            str += '[src]';
    });

    // label-opts
    div.find('.label-opt').each(function(i) {
        str += $(this).attr('class');
    });

    return str;
}

// apply select color
function applyCboColor(e) {
    var colorClass = e.find('option:selected').attr('data-color');
    var arrColorClass = ['text-default', 'text-primary', 'text-info', 'text-success', 'text-warning', 'text-danger'];
    for(var i=0 ;i<arrColorClass.length; i++) {
        if(e.hasClass(arrColorClass[i]))
            e.removeClass(arrColorClass[i]);
    }
    e.addClass(colorClass);
}

// push a node to a given object when the node is not null
function pushNode(object, str_index, node) {
    if(node != null)
        object[str_index] = node;
}

// search for .sp-amount and format them properly
function formatAmountElements() {
    body.find('.sp-amount').each(function() {
        var h = "";
        if($(this).hasClass('sp-currency'))
            h += "&#8369; ";
        h += applyCommas($(this).text());
        $(this).html(h);
    });
}

// generate document header html
function generateDocHeader() {
    var h = "";
    h += "<div id='doc-header' style='display: none'>";
        h += "<table style='width: 100%'><tr>";
        /*h += "<td align='left' style='padding-left: 60px'>";
            h += "<img src='" + app_url + "ui/pages/assets/img/lgu_logo_1.png' style='width: 80px'>";
        h += "</td>";*/
        h += "<td align='center'>";
            h += "<ul class='no-padding no-margin' style='list-style-type: none'>";
                h += "<li style='line-height: 1'>Republic of the Philippines</li>";
                h += "<li style='line-height: 1'>Province of " + province + "</li>";
                h += "<li style='line-height: 1'>" + lgu_type + " of " + lgu + "</li>";
                h += "<li style='line-height: 1'><h5 class='no-margin text-bold'>OFFICE OF THE MUNICIPAL MAYOR</h5></li>";
                h += "<li style='line-height: 1'><b>Permits and License Division</b></li>";
            h += "</ul>";
        h += "</td>";
        /*h += "<td align='right' style='padding-right: 60px'>";
            h += "<img src='" + app_url + "ui/pages/assets/img/lgu_logo_2.png' style='width: 85px'>";
        h += "</td>";*/
        h += "</tr></table>";
        h += "<hr style='border: 2px solid #ccc'>";
        h += "<br>";
    h += "</div>";
    return h;
}

// generate document footer html
function generateDocFooter() {
    var h = "<br>";
    h += "<div id='doc-footer' style='display: none'>";
        h += "<div class='row no-margin' style='border: 1px solid #f0f0f0; padding-bottom: 8px'>";
            h += "<div class='col-md-12'>";
                var date = new Date();
                h += "<h6 class='font-montserrat float-right' style='margin-bottom: 0; display: inline; color: #777'><small>" + date.toDateString() + "</small></h6>";
                h += "<h4 class='font-montserrat all-caps text-bold' style='margin-bottom: 0'>PREPARED BY:</h4>";
                h += "<table style='width: 100%'><tr>";
                    h += "<td style='width: 48px !important'>";
                        h += "<img src='" + body.find('#imgProfile').attr('src').toString() + "' style='width: 54px; height: 54px; border-radius: 50%'>";
                    h += "</td>";
                    h += "<td align='left'>";
                        h += "<ul class='no-margin no-padding' style='list-style-type: none'>";
                            h += "<li style='line-height: 1'><h6 class='no-margin text-bold'>" + body.find('#spAdminFirstname').text().toString() + " " + body.find('#spAdminMiddleName').text().toString() + body.find('#spAdminLastName').text().toString() + "</h6></li>";
                            h += "<li style='line-height: 1'>" + body.find('#spAdminUserTitle').attr('data-original-title').toString() + "</li>";
                            h += "<li style='line-height: 1'><small>ELECTRONIC BUSINESS PERMT AND LICENSING SYSTEM</small></li>";
                        h += "</ul>";
                    h += "</td>";
                h += "</tr></table>";
            h += "</div>";
        h += "</div>";
    h += "</div>";
    return h;
}