/**
 * SAVE ITEM
 * Save changes to the active item
 * @param  {node} e [the active $('.btn-save-item') element]
 * @param  {function} callback [the function to execute after the save operation]
 */
function save(e, callback) {
    if(e != null) {
        if(e.length > 0) {
            // get active menu and active tab details
            var sidebarMenuHref = activeSidebarMenuItem.attr('data-href');
            var sidebarMenuText = activeSidebarMenuItem.find('.sidebar-menu-item-title').text();
            var tabTitle = activeContentTabItem.find('.tab-title').html();
            var tabIdentifier = activeContentTabItem.attr('data-identifier');

            // get the tab content
            var divContentTab = body.find('.content-tab-pane#tab' + tab);

            // retrieve active item
            activeCardMainItem = divContentTab.find('.card-main-item.active');

            // get the item content
            var divItemContent = divContentTab.find('.item-content');

            if(activeCardMainItem != null) {
                // rewrite input fields values to remove html tags
                var dummyDiv = $("<div></div>");
                divItemContent.find("input[type='text']").each(function() {
                    dummyDiv.html($(this).val().trim());
                    $(this).val(dummyDiv.text());
                });
                divItemContent.find("textarea").each(function() {
                    dummyDiv.html($(this).val().trim());
                    $(this).val(dummyDiv.text());
                });

                // get currentItemData
                var currentItemData = getFormState(divItemContent);

                if(prevItemData == currentItemData) {
                    // reset the $('.btn-save-item')
                    e.prop('disabled', false);
                    e.prop('disabled', false);
                    fa = e.find('.fas');
                    fa.removeClass('fa-circle-notch');
                    fa.removeClass('fa-spin');
                    fa.removeClass('fa-check');
                    fa.addClass('fa-save');
                    e.blur();
                }
                else {
                    var route = routes[tabIdentifier];
                    if (route != undefined) {

                        // check for required fields
                        var canProceed = true;
                        divContentTab.find('.required').each(function(i) {
                            if(canProceed) {
                                var e = $(this).find('input');
                                if (e.length > 0) {
                                    if (e.val().trim() == '')
                                        canProceed = false;
                                }
                                else {
                                    e = $(this).find('textarea');
                                    if (e.length > 0) {
                                        if (e.val().trim() == '')
                                            canProceed = false;
                                    }
                                }
                                if (!canProceed) {
                                    if(!isFromTabClick) {
                                        showMessageDialog("NOTICE", "<span style='font-size: 1.2em'><span class='text-info'>\"" + e.parent().find('label').text() + "\"</span> IS <span class='text-danger'>REQUIRED.</span></span>", function () {
                                            e.focus();
                                        });
                                    }
                                    else {
                                        prevItemData = currentItemData;
                                    }
                                    return 0;
                                }
                            }
                        });

                        // check for .form-group-search
                        if(canProceed) {
                            divContentTab.find('.form-group-search').each(function (i) {
                                if(!$(this).hasClass('form-group-corporate-owner')) {
                                    var dataID = removeCommas($(this).attr('data-id'));
                                    var label = $(this).find('label').text();
                                    if (dataID <= 0) {
                                        if(!isFromTabClick) {
                                            showMessageDialog("NOTICE", "<span class='font-size: 1.2em'><span class='text-danger'>PLEASE SEARCH FOR ANOTHER </span><span class='text-info'>\"" + label + "\"</span></span>");
                                        }
                                        else {
                                            prevItemData = currentItemData;
                                        }
                                        canProceed = false;
                                        return 0;
                                    }
                                }
                            });
                        }

                        // check for .form-group-upload
                        /*if(canProceed) {
                            divContentTab.find('.form-group-upload').each(function (i) {
                                var fileName = $(this).find('.txt-file-name').val().trim();
                                var label = $(this).find('label').attr('data-item');
                                if(fileName == "") {
                                    if(!isFromTabClick) {
                                        showMessageDialog("NOTICE", "<span class='font-size: 1.2em'><span class='text-danger'>PLEASE UPLOAD THE FILE FOR </span><span class='text-info'>\"" + label + "\"</span></span>");
                                    }
                                    else {
                                        prevItemData = currentItemData;
                                    }
                                    canProceed = false;
                                    return 0;
                                }
                            });
                        }*/

                        // check for valid emails
                        if(canProceed) {
                            divContentTab.find("input[type='email']").each(function(i) {
                                var txt = $(this);
                                var val = txt.val().trim();
                                if(val != '') {
                                    if(!validateEmail(val)) {
                                        if(!isFromTabClick) {
                                            var label = txt.parent().find('label').text();
                                            showMessageDialog("NOTICE", "<span class='font-size: 1.2em'><span class='text-danger'>PLEASE ENTER A VALID EMAIL FOR </span><span class='text-info'>\"" + label + "\"</span></span>", function () {
                                                txt.focus();
                                            });
                                        }
                                        else {
                                            prevItemData = currentItemData;
                                        }
                                        canProceed = false;
                                        return 0;
                                    }
                                }
                            });
                        }

                        // check for input[data-low-of]
                        if(canProceed) {
                            divItemContent.find('input[data-low-of]').each(function (i) {
                                var txtLow = $(this);
                                var txtHigh = divItemContent.find(txtLow.attr('data-low-of'));
                                var lowVal = removeCommas(txtLow.val());
                                var highVal = removeCommas(txtHigh.val());
                                if (highVal != -1) {
                                    if (lowVal > highVal) {
                                        if(!isFromTabClick) {
                                            var lowLabel = txtLow.parent().find('label').find('.label-label').text();
                                            var highLabel = txtHigh.parent().find('label').find('.label-label').text();
                                            var noticeStr = "<span style='font-size: 1.2em;'><span class='text-info'>\"" + lowLabel + "\"</span> <span class='text-danger'>CANNOT BE HIGHER THAN</span> <span class='text-info'>\"" + highLabel + "\"</span></span>";
                                            if (highLabel != 'TOTAL MALE EMPLOYEES' && highLabel != 'TOTAL FEMALE EMPLOYEES') {
                                                noticeStr += "<br><br>If your maximum value is infinite, input <span class='text-danger'>-1</span> as maximum.";
                                            }
                                            showMessageDialog("NOTICE", noticeStr, function () {
                                                txtLow.focus();
                                            });
                                        }
                                        else {
                                            prevItemData = currentItemData;
                                        }
                                        canProceed = false;
                                        return 0;
                                    }
                                }
                            });
                        }

                        // check for input[data-low-of-date]
                        if(canProceed) {
                            divItemContent.find('input[data-low-of-date]').each(function (i) {
                                var txtLow = $(this);
                                var txtHigh = divItemContent.find(txtLow.attr('data-low-of-date'));
                                var lowVal = new Date(txtLow.val());
                                var highVal = new Date(txtHigh.val());

                                if (lowVal > highVal) {
                                    if(!isFromTabClick) {
                                        var lowLabel = txtLow.parent().find('label').text();
                                        var highLabel = txtHigh.parent().find('label').text();
                                        var noticeStr = "<span style='font-size: 1.2em;'><span class='text-info'>\"" + lowLabel + "\"</span> <span class='text-danger'>CANNOT BE HIGHER THAN</span> <span class='text-info'>\"" + highLabel + "\"</span></span>";
                                        showMessageDialog("NOTICE", noticeStr, function () {
                                            txtLow.focus();
                                        });
                                    }
                                    else {
                                        prevItemData = currentItemData;
                                    }
                                    canProceed = false;
                                    return 0;
                                }
                            });
                        }

                        if(canProceed) {

                            // get locationPath (ex. users_1_2)
                            var locationPath = "";
                            var arrWindowLocation = window.location.toString().split("dashboard.php?");
                            if (arrWindowLocation[1] != undefined) {
                                locationPath = arrWindowLocation[1];
                            }

                            // configure AJAX request depending on active menu and active tab
                            var strAjaxURL = route.path;
                            var objAjaxData = {};

                            if (tabIdentifier == STR_TAB_USER_TYPES) {
                                var arrAccess = [];
                                divItemContent.find('.chk-access').each(function (i) {
                                    if ($(this).prop('checked')) {
                                        arrAccess.push($(this).attr('data-title'));
                                    }
                                });
                                objAjaxData = {
                                    save_usertype: activeCardMainItem.attr('data-id'),
                                    acronym: divItemContent.find('.txt-acronym').val().trim(),
                                    title: divItemContent.find('.txt-title').val().trim(),
                                    desc: divItemContent.find('.txt-desc').val().trim(),
                                    access: arrAccess
                                };
                            }

                            else if (tabIdentifier == STR_TAB_USER_ACCOUNTS) {
                                objAjaxData = {
                                    save_useraccount: activeCardMainItem.attr('data-id'),
                                    citizen_id: divItemContent.find('.form-group-citizen').attr('data-id'),
                                    is_active: (divItemContent.find('.chk-user-active').prop('checked')) ? '1' : '0',
                                    username: divItemContent.find('.txt-username').val().trim(),
                                    password: divItemContent.find('.txt-password').val(),
                                    usertype_id: divItemContent.find('.cbo-usertype').val()
                                };
                            }

                            else if (tabIdentifier == STR_TAB_LINES_OF_BUSINESS) {
                                var divTaxBracketsNew = divItemContent.find('.div-tax-brackets-new');
                                var divTaxBracketsRenewal = divItemContent.find('.div-tax-brackets-renewal');

                                var newTaxStatus = divTaxBracketsNew.find('.cbo-tax-status').val();
                                var renewalTaxStatus = divTaxBracketsRenewal.find('.cbo-tax-status').val();

                                var arrNewTaxBrackets = [];
                                if(newTaxStatus == '3' || newTaxStatus == '9') {
                                    divTaxBracketsNew.find('.form-group-tax-bracket').each(function(i) {
                                        arrNewTaxBrackets.push({
                                            order: i.toString(),
                                            id: $(this).attr('data-id'),
                                            asset_min: removeCommas($(this).find('.txt-amount-asset-minimum').val()),
                                            asset_max: removeCommas($(this).find('.txt-amount-asset-maximum').val()),
                                            tax_value: removeCommas($(this).find('.txt-amount-tax-value').val()),
                                            is_by_percentage: ($(this).find('.chk-is-by-percentage').prop('checked')) ? '1' : '0',
                                            percentage: removeCommas($(this).find('.txt-amount-tax-percentage').val()),
                                            of_tax_variable: parseInt($(this).find('.cbo-of-tax-variable-id').val()),
                                            in_excess_of: removeCommas($(this).find('.txt-in-excess-of').val()),
                                            additional_tax: removeCommas($(this).find('.txt-additional-tax-amount').val())
                                        });
                                    });
                                }
                                var arrRenewalTaxBrackets = [];
                                if(renewalTaxStatus == '4' || renewalTaxStatus == '5' || renewalTaxStatus == '6' || renewalTaxStatus == '9') {
                                    divTaxBracketsRenewal.find('.form-group-tax-bracket').each(function(i) {
                                        arrRenewalTaxBrackets.push({
                                            order: i.toString(),
                                            id: $(this).attr('data-id'),
                                            asset_min: removeCommas($(this).find('.txt-amount-asset-minimum').val()),
                                            asset_max: removeCommas($(this).find('.txt-amount-asset-maximum').val()),
                                            tax_value: removeCommas($(this).find('.txt-amount-tax-value').val()),
                                            is_by_percentage: ($(this).find('.chk-is-by-percentage').prop('checked')) ? '1' : '0',
                                            percentage: removeCommas($(this).find('.txt-amount-tax-percentage').val()),
                                            of_tax_variable: parseInt($(this).find('.cbo-of-tax-variable-id').val()),
                                            in_excess_of: removeCommas($(this).find('.txt-in-excess-of').val()),
                                            additional_tax: removeCommas($(this).find('.txt-additional-tax-amount').val())
                                        });
                                    });
                                }

                                objAjaxData = {
                                    save_line_of_business: activeCardMainItem.attr('data-id'),
                                    title: divItemContent.find('.txt-title').val().trim(),
                                    desc: divItemContent.find('.txt-desc').val().trim(),
                                    new_tax_status: newTaxStatus,
                                    renewal_tax_status: renewalTaxStatus,
                                    new_tax_fixed: removeCommas(divTaxBracketsNew.find('.txt-amount-fixed-new').val()),
                                    renewal_tax_fixed: removeCommas(divTaxBracketsRenewal.find('.txt-amount-fixed-renewal').val()),
                                    new_tax_brackets: arrNewTaxBrackets,
                                    renewal_tax_brackets: arrRenewalTaxBrackets
                                };
                            }

                            else if(tabIdentifier == STR_TAB_TAX_OPTIONS) {
                                var taxOptionID = activeCardMainItem.attr('data-id');
                                objAjaxData = {
                                    save_business_tax_option: taxOptionID,
                                    title: divItemContent.find('.txt-title').val().trim(),
                                    desc: divItemContent.find('.txt-desc').val().trim()
                                };

                                if(taxOptionID == '1') { // TAX PENALTY
                                    objAjaxData['new_date_start'] = divItemContent.find('.txt-new-date-start').val().trim();
                                    objAjaxData['new_date_end'] = divItemContent.find('.txt-new-date-end').val().trim();
                                    objAjaxData['new_tax_penalty'] = removeCommas(divItemContent.find('.txt-new-percentage').val().trim());
                                    objAjaxData['renewal_date_start'] = divItemContent.find('.txt-renewal-date-start').val().trim();
                                    objAjaxData['renewal_date_end'] = divItemContent.find('.txt-renewal-date-end').val().trim();
                                    objAjaxData['renewal_tax_penalty'] = removeCommas(divItemContent.find('.txt-renewal-percentage').val().trim());
                                }
                            }

                            else if (tabIdentifier == STR_TAB_REQUIREMENT_ITEMS) {
                                var arrClassifications = [];
                                divItemContent.find('.chk-require-requirement').each(function () {
                                    var obj = {};
                                    obj['business_line_id'] = $(this).parent().parent().parent().parent().parent().parent().parent().attr('data-id');
                                    obj['application_type'] = 'NEW';
                                    if ($(this).hasClass('chk-requirement-renewal')) {
                                        obj['application_type'] = 'RENEWAL';
                                    }
                                    obj['is_required'] = ($(this).prop('checked')) ? '1' : '0';
                                    arrClassifications.push(obj);
                                });

                                objAjaxData = {
                                    save_requirement: activeCardMainItem.attr('data-id'),
                                    title: divItemContent.find('.txt-title').val().trim(),
                                    desc: divItemContent.find('.txt-desc').val().trim(),
                                    validation_code_title: divItemContent.find('.txt-validation-code-title').val().trim(),
                                    is_for_upload: (divItemContent.find('.chk-for-upload').prop('checked')) ? '1' : '0',
                                    collect_after: divItemContent.find('.cbo-collect-after').val().trim(),
                                    is_for_poblacion_only: (divItemContent.find('.chk-for-poblacion-only').prop('checked')) ? '1' : '0',
                                    classifications: arrClassifications
                                };
                            }

                            else if (tabIdentifier == STR_TAB_FEE_ITEMS) {
                                var arrClassifications = [];
                                divItemContent.find(".cbo-fee-status[data-toggle-one-cbo]").each(function () {
                                    var obj = {};
                                    var feeVariableID = $(this).val();
                                    var rootRow = $(this).parent().parent();
                                    var rootFormAttached = rootRow.parent().parent().parent().parent().parent();
                                    var rootFormGroupBusinessSizes;

                                    obj['business_line_id'] = rootFormAttached.attr('data-id');
                                    obj['application_type'] = 'NEW';
                                    if ($(this).hasClass('cbo-fee-status-renewal')) {
                                        obj['application_type'] = 'RENEWAL';
                                        rootFormGroupBusinessSizes = rootFormAttached.find('.form-group-business-size-fee-amount-renewal');
                                    }
                                    else {
                                        rootFormGroupBusinessSizes = rootFormAttached.find('.form-group-business-size-fee-amount-new');
                                    }
                                    obj['fee_variable_id'] = feeVariableID;
                                    obj['fee_amount'] = removeCommas(rootRow.find('.form-group-fee-amount').find('.txt-amount').val());
                                    obj['business_size_fees'] = [];
                                    if(feeVariableID == '3') {
                                        rootFormGroupBusinessSizes.each(function (i) {
                                            var obj2 = {};
                                            obj2['id'] = $(this).attr('data-id');
                                            obj2['amount'] = removeCommas($(this).find('.txt-amount').val());
                                            obj['business_size_fees'].push(obj2);
                                        });
                                    }
                                    arrClassifications.push(obj);
                                });

                                objAjaxData = {
                                    save_fee: activeCardMainItem.attr('data-id'),
                                    title: divItemContent.find('.txt-title').val().trim(),
                                    desc: divItemContent.find('.txt-desc').val().trim(),
                                    is_multiple_collection: (divItemContent.find('.chk-multiple-collection').prop('checked')) ? '1' : '0',
                                    is_for_poblacion_only: (divItemContent.find('.chk-for-poblacion-only').prop('checked')) ? '1' : '0',
                                    classifications: arrClassifications
                                };
                            }

                            else if(tabIdentifier == STR_TAB_BUSINESS_SIZES) {
                                objAjaxData = {
                                    save_business_size: activeCardMainItem.attr('data-id'),
                                    title: divItemContent.find('.txt-title').val().trim(),
                                    desc: divItemContent.find('.txt-desc').val().trim(),
                                    asset_limit_from: removeCommas(divItemContent.find('.txt-asset-limit-from').val()),
                                    asset_limit_to: removeCommas(divItemContent.find('.txt-asset-limit-to').val()),
                                    total_workers_from: removeCommas(divItemContent.find('.txt-total-workers-from').val(), true),
                                    total_workers_to: removeCommas(divItemContent.find('.txt-total-workers-to').val(), true)
                                };
                            }

                            else if(tabIdentifier == STR_TAB_NEW_APPLICATIONS || tabIdentifier == STR_TAB_RENEWAL_APPLICATIONS) {
                                var formGroupRegNumber = divItemContent.find('.form-group-reg-number');
                                var formGroupRegDate = divItemContent.find('.form-group-reg-date');
                                var arrBusActivities = [];
                                var applicationType = '';
                                if(tabIdentifier == STR_TAB_NEW_APPLICATIONS) {
                                    applicationType = 'NEW';
                                    divItemContent.find('.txt-line-of-business').each(function(i) {
                                        var p = $(this).parent().parent().parent().parent().parent();
                                        arrBusActivities.push({
                                            business_line_id: p.find('.form-group-line-of-business').attr('data-id'),
                                            units: removeCommas(p.find('.txt-units').val(), true),
                                            capitalization: removeCommas(p.find('.txt-capitalization').val())
                                        });
                                    });
                                }
                                else if(tabIdentifier == STR_TAB_RENEWAL_APPLICATIONS){
                                    applicationType = 'RENEWAL';
                                    divItemContent.find('.txt-line-of-business').each(function(i) {
                                        var p = $(this).parent().parent().parent().parent().parent();
                                        arrBusActivities.push({
                                            business_line_id: p.find('.form-group-line-of-business').attr('data-id'),
                                            units: removeCommas(p.find('.txt-units').val(), true),
                                            gross_sales_essential: removeCommas(p.find('.txt-gross-sales-essential').val()),
                                            gross_sales_non_essential: removeCommas(p.find('.txt-gross-sales-non-essential').val())
                                        });
                                    });
                                }
                                var activeRegNumber = '';
                                divItemContent.find(".label-opt[data-ref='application_reg']").each(function(i) {
                                    if($(this).hasClass('badge-success')) {
                                        activeRegNumber = $(this).text().trim();
                                        return 0;
                                    }
                                });

                                objAjaxData = {
                                    save_application: activeCardMainItem.attr('data-id'),
                                    application_type: applicationType,
                                    citizen_id: divItemContent.find('.form-group-citizen').attr('data-id'),
                                    business_name: divItemContent.find('.txt-business-name').val().trim(),
                                    trade_name: divItemContent.find('.txt-trade-name').val().trim(),
                                    business_type_id: divItemContent.find('.cbo-business-type').val(),
                                    payment_mode_id: divItemContent.find('.cbo-payment-mode').val(),
                                    dti_number: formGroupRegNumber.attr('data-DTI'),
                                    cda_number: formGroupRegNumber.attr('data-CDA'),
                                    sec_number: formGroupRegNumber.attr('data-SEC'),
                                    dti_date: formGroupRegDate.attr('data-DTI'),
                                    cda_date: formGroupRegDate.attr('data-CDA'),
                                    sec_date: formGroupRegDate.attr('data-SEC'),
                                    corporate_owner_id: divItemContent.find('.form-group-corporate-owner').attr('data-id'),
                                    corporate_owner_avatar: divItemContent.find('.form-group-corporate-owner .img-citizen-avatar').attr('data-src'),
                                    corporate_owner_fullname: divItemContent.find('.form-group-corporate-owner .txt-corporate-owner-name').val(),
                                    corporate_owner_tin: divItemContent.find('.txt-corporate-owner-tin').val(),
                                    corporate_owner_address: divItemContent.find('.txt-corporate-owner-address').val(),
                                    active_reg_number: activeRegNumber,
                                    street_address: divItemContent.find('.txt-street-address').val().trim(),
                                    barangay_id: divItemContent.find('.form-group-barangay').attr('data-id'),
                                    business_email: divItemContent.find('.txt-business-email').val().trim(),
                                    business_mobile_num: divItemContent.find('.txt-business-mobile-num').val().trim(),
                                    business_tel_num: divItemContent.find('.txt-business-tel-num').val().trim(),
                                    total_male_emp: removeCommas(divItemContent.find('.txt-total-male-employees').val(), true),
                                    total_male_emp_lgu: removeCommas(divItemContent.find('.txt-total-male-employees-lgu').val(), true),
                                    total_female_emp: removeCommas(divItemContent.find('.txt-total-female-employees').val(), true),
                                    total_female_emp_lgu: removeCommas(divItemContent.find('.txt-total-female-employees-lgu').val(), true),
                                    business_area: removeCommas(divItemContent.find('.txt-business-area').val()),
                                    is_renting: (divItemContent.find('.chk-is-renting').prop('checked')) ? '1' : '0',
                                    monthly_rent: removeCommas(divItemContent.find('.txt-amount-rent').val()),
                                    lessor_fullname: divItemContent.find('.txt-lessor-fullname').val().trim(),
                                    lessor_contact_num: divItemContent.find('.txt-lessor-contact-num').val().trim(),
                                    lessor_address: divItemContent.find('.txt-lessor-address').val().trim(),
                                    lessor_email: divItemContent.find('.txt-lessor-email').val().trim(),
                                    business_activities: arrBusActivities
                                };
                            }

                            else if(tabIdentifier == STR_TAB_NEW_VERIFICATIONS || tabIdentifier == STR_TAB_RENEWAL_VERIFICATIONS) {
                                var applicationType = '';
                                if(tabIdentifier == STR_TAB_NEW_VERIFICATIONS) {
                                    applicationType = 'NEW';
                                }
                                else if(tabIdentifier == STR_TAB_RENEWAL_VERIFICATIONS){
                                    applicationType = 'RENEWAL';
                                }

                                // get submitted requirements
                                var arrSubmittedRequirements = [];
                                divItemContent.find('.form-group-attached-requirement').each(function(i) {
                                    var divRequirement = $(this);
                                    var fileName = '';
                                    var txtFileName = divRequirement.find('.txt-file-name');
                                    if(txtFileName.length > 0) {
                                        fileName = txtFileName.val().trim();
                                    }
                                     arrSubmittedRequirements.push({
                                         requirement_id: divRequirement.attr('data-id'),
                                         file_name: fileName,
                                         validation_code: divRequirement.find('.txt-requirement-validation-code').val().trim(),
                                         is_verified: (divRequirement.find('.chk-verified').prop('checked')) ? '1' : '0'
                                     });
                                });

                                // get approvals
                                var arrApprovals = [];
                                divItemContent.find('.form-group-attached-approval').each(function(data) {
                                    var divApproval = $(this);
                                    arrApprovals.push({
                                        citizen_id: divApproval.find('.form-group-citizen').attr('data-id'),
                                        is_approved: (divApproval.find('.chk-is-approved').prop('checked')) ? '1' : '0',
                                        remarks: divApproval.find('.txt-remarks').val().trim()
                                    });
                                });

                                objAjaxData = {
                                    save_verification: activeCardMainItem.attr('data-id'),
                                    application_type: applicationType,
                                    submitted_requirements: arrSubmittedRequirements,
                                    approvals: arrApprovals
                                };
                            }

                            else if(tabIdentifier == STR_TAB_APPLICATION_SETTINGS || tabIdentifier == STR_TAB_SYSTEM_SETTINGS) {
                                var settingID = activeCardMainItem.attr('data-id');
                                objAjaxData = {
                                    save_setting: settingID,
                                    title: divItemContent.find('.txt-title').val().trim(),
                                    desc: divItemContent.find('.txt-desc').val().trim()
                                };

                                if(settingID == '1') { // BUSINESS PERMIT SETTINGS
                                    objAjaxData['permit_no_prefix'] = divItemContent.find('.txt-permit-no-prefix').val().trim();
                                    objAjaxData['permit_no_next'] = removeCommas(divItemContent.find('.txt-permit-no-next').val().trim(), true);
                                    objAjaxData['permit_no_digits'] = removeCommas(divItemContent.find('.txt-permit-no-digits').val().trim(), true);
                                    objAjaxData['plate_no_prefix'] = divItemContent.find('.txt-plate-no-prefix').val().trim();
                                    objAjaxData['plate_no_next'] = removeCommas(divItemContent.find('.txt-plate-no-next').val().trim(), true);
                                    objAjaxData['plate_no_digits'] = removeCommas(divItemContent.find('.txt-plate-no-digits').val().trim(), true);
                                }
                            }
                            // append persistent parameters to ajax data
                            objAjaxData['location'] = locationPath;
                            objAjaxData['menu'] = sidebarMenuText;
                            objAjaxData['tab'] = tabIdentifier;

                            // initiate AJAX request
                            if (strAjaxURL != '') {

                                // disable the $('.btn-save-item')
                                e.prop('disabled', true);
                                e.attr('disabled', true);
                                var fa = e.find('.fas');
                                if (fa.hasClass('fa-save') || fa.hasClass('fa-check')) {
                                    fa.removeClass('fa-save');
                                    fa.removeClass('fa-check');
                                    fa.addClass('fa-circle-notch');
                                    fa.addClass('fa-spin');
                                }

                                Pace.restart();
                                performedDBSearch = true;

                                // disable btn-search and other control buttons
                                var btnNew = divContentTab.find('.btn-new-item');
                                var btnSearch = divContentTab.find('.btn-search-item');
                                var btnSave = divContentTab.find('.btn-save-item');
                                var btnSubmit = divContentTab.find('.btn-save-item');
                                var btnDelete = divContentTab.find('.btn-delete-item');
                                var btnPrint = divContentTab.find('.btn-print-item');
                                disableButton(btnNew, true);
                                disableButton(btnSearch, true);
                                disableButton(btnSave, true);
                                disableButton(btnSubmit, true);
                                disableButton(btnDelete, true);
                                disableButton(btnPrint, true);
                                $.ajax({
                                    type: 'POST',
                                    url: strAjaxURL,
                                    data: objAjaxData,
                                    success: function (data) {
                                        var response = JSON.parse(data);
                                        if (response.error != '') {
                                            showMessageDialog(response.error, '', function () {
                                                window.location.reload();
                                            });
                                        }
                                        else {
                                            if (response.success.message != '') {
                                                showMessageDialog(response.success.message, response.success.sub_message);

                                                // enable the $('.btn-save-item')
                                                e.prop('disabled', false);
                                                e.prop('disabled', false);
                                                fa = e.find('.fas');
                                                if (fa.hasClass('fa-circle-notch')) {
                                                    fa.removeClass('fa-circle-notch');
                                                    fa.removeClass('fa-spin');
                                                    fa.addClass('fa-save');
                                                }
                                            }
                                            else {
                                                // update activeCardMainItem
                                                var updateDate = '';
                                                if(tabIdentifier == STR_TAB_LINES_OF_BUSINESS) {
                                                    var r = response.success.data;
                                                    updateDate = r.update_date;

                                                    // update new tax brackets id on UI
                                                    var divTaxBracketsNew = divItemContent.find('.div-tax-brackets-new');
                                                    for(var i=0; i<r.new_tax_brackets_id_new.length; i++) {
                                                        divTaxBracketsNew.find('.form-group-tax-bracket').each(function(j) {
                                                            if(j == parseInt(r.new_tax_brackets_id_new[i].order)) {
                                                                $(this).attr('data-id', r.new_tax_brackets_id_new[i].new_id);
                                                                return 0;
                                                            }
                                                        });
                                                    }

                                                    // update renewal tax brackets id on UI
                                                    var divTaxBracketsRenewal = divItemContent.find('.div-tax-brackets-renewal');
                                                    for(var i=0; i<r.new_tax_brackets_id_renewal.length; i++) {
                                                        divTaxBracketsRenewal.find('.form-group-tax-bracket').each(function(j) {
                                                            if(j == parseInt(r.new_tax_brackets_id_renewal[i].order)) {
                                                                $(this).attr('data-id', r.new_tax_brackets_id_renewal[i].new_id);
                                                                return 0;
                                                            }
                                                        });
                                                    }
                                                }
                                                else {
                                                    updateDate = response.success.data;
                                                }


                                                activeCardMainItem.find('.item-date').html(updateDate);

                                                var txtItemMainTitle = divItemContent.find('.item-main-title');
                                                if (txtItemMainTitle.length > 0) {
                                                    if (!txtItemMainTitle.hasClass('cbo')) {
                                                        activeCardMainItem.find('.main-title').html(txtItemMainTitle.val());
                                                        divItemContent.find('.sp-item-main-title').html(txtItemMainTitle.val());
                                                    }
                                                    else {
                                                        activeCardMainItem.find('.main-title').html(txtItemMainTitle.children('option').filter(':selected').text());
                                                        divItemContent.find('.sp-item-main-title').html(txtItemMainTitle.children('option').filter(':selected').text());
                                                    }
                                                }

                                                var txtItemSubTitle = divItemContent.find('.item-sub-title');
                                                if (txtItemSubTitle.length > 0) {
                                                    var strSubtitle = "";
                                                    if (!txtItemSubTitle.hasClass('cbo'))
                                                        strSubtitle = txtItemSubTitle.val();
                                                    else
                                                        strSubtitle = txtItemSubTitle.children('option').filter(':selected').text();

                                                    if(strSubtitle.length <= 0)
                                                        strSubtitle = "&nbsp;";
                                                    activeCardMainItem.find('.sub-title').html(strSubtitle);
                                                }

                                                var imgItemAvatar = divItemContent.find('.img-item-avatar');
                                                if (imgItemAvatar.length > 0) {
                                                    activeCardMainItem.find('.item-avatar > img').attr('src', imgItemAvatar.attr('src'));
                                                }

                                                // refresh necessary tabs
                                                if (tabIdentifier == STR_TAB_USER_TYPES) {
                                                    refreshMainItemsHTML(routes[STR_TAB_USER_ACCOUNTS].title);
                                                }
                                                else if (tabIdentifier == STR_TAB_USER_ACCOUNTS) {
                                                    activeCardMainItem.attr('data-id', divItemContent.find('.form-group-citizen').attr('data-id'));
                                                }
                                                refreshMainItemsHTML(routes[STR_TAB_ACTIVITY_LOGS].title);

                                                // refresh active tab on sidebar menu
                                                activeSidebarMenuItem.attr('data-tab-' + tab + '-active-item', activeCardMainItem.attr('data-id'));

                                                // cache the items
                                                cacheMainItemsHTML();

                                                // enable the $('.btn-save-item')
                                                e.prop('disabled', false);
                                                e.prop('disabled', false);
                                                fa = e.find('.fas');
                                                if (fa.hasClass('fa-circle-notch')) {
                                                    fa.removeClass('fa-circle-notch');
                                                    fa.removeClass('fa-spin');
                                                    fa.addClass('fa-check');
                                                }

                                                // update prevItemData
                                                prevItemData = currentItemData;
                                            }
                                        }
                                        Pace.stop();

                                        performedDBSearch = false;
                                        disableButton(btnNew, false);
                                        disableButton(btnSearch, false);
                                        disableButton(btnSave, false);
                                        disableButton(btnSubmit, false);
                                        disableButton(btnDelete, false);
                                        disableButton(btnPrint, false);

                                        if (callback != null)
                                            callback();
                                    },
                                    error: function (data) {
                                        alert("UNABLE TO SAVE " + tabTitle + "\n\nError " + data.status + " (" + data.statusText + ")");
                                        Pace.stop();
                                        window.location.reload();
                                    }
                                });
                            }
                        }
                    }
                }
            }
        }
        else if(callback != null)
            callback();
    }
    else if(callback != null)
        callback();
}