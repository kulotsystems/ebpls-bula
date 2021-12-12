/**
 * SUBMIT ITEM
 * Verify the active item
 * @param  {node} e [the active $('.btn-verify-item') element]
 */
function submitItem(e) {

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

    // reset save button
    var btnSaveItem = divContentTab.find('.btn-save-item');
    if(btnSaveItem.length > 0) {
        var fa = btnSaveItem.find('.fas');
        if (fa.hasClass('fa-check')) {
            fa.removeClass('fa-check');
            fa.addClass('fa-save');
        }
    }

    if(activeCardMainItem != null) {

        // get currentItemData
        var currentItemData = getFormState(divItemContent);
        if(prevItemData != currentItemData && (tabIdentifier != STR_TAB_NEW_INVOICES && tabIdentifier != STR_TAB_RENEWAL_INVOICES)) {
            //showMessageDialog("SAVE BEFORE SUBMIT", "<span style='font-size: 1.2em'>You need to <span class='text-success'><span class='fa fa-save'></span> SAVE</span> the changes you have made from <span class='text-info'>" + tabTitle + "</span> before submission.</span>");
            save(divContentTab.find('.btn-save'), function() {
                submitItem(e);
            });
        }
        else {
            var route = routes[tabIdentifier];
            if (route != undefined) {

                // ask to submit
                var strSubmitTo = '';
                if(tabIdentifier == STR_TAB_NEW_APPLICATIONS || tabIdentifier == STR_TAB_RENEWAL_APPLICATIONS)
                    strSubmitTo = 'VERIFICATION';
                else if(tabIdentifier == STR_TAB_NEW_VERIFICATIONS || tabIdentifier == STR_TAB_RENEWAL_VERIFICATIONS)
                    strSubmitTo = 'INVOICE';
                else if(tabIdentifier == STR_TAB_NEW_INVOICES || tabIdentifier == STR_TAB_RENEWAL_INVOICES)
                    strSubmitTo = 'PERMIT';
                showConfirmDialog("CONFIRM SUBMISSION", "<span style='font-size: 1.2em'>Are you sure you want to submit the following from " + tabTitle + " for " + strSubmitTo + "?</span>" + "<div class='card social-card share no-margin no-border w-100 active'>" + activeCardMainItem.html() + "</div>");
                confirmYes(function () {

                    // get locationPath (ex. users_1_2)
                    var locationPath = "";
                    var arrWindowLocation = window.location.toString().split("dashboard.php?");
                    if (arrWindowLocation[1] != undefined) {
                        locationPath = arrWindowLocation[1];
                    }

                    // configure AJAX request depending on active menu and active tab
                    var strAjaxURL = route.path;
                    var objAjaxData = {};
                    objAjaxData[route.submit_param] = activeCardMainItem.attr('data-id');
                    objAjaxData['location'] = locationPath;
                    objAjaxData['menu'] = sidebarMenuText;
                    if(tabIdentifier == STR_TAB_NEW_APPLICATIONS)
                        objAjaxData['tab'] = STR_TAB_NEW_VERIFICATIONS;
                    else if(tabIdentifier == STR_TAB_RENEWAL_APPLICATIONS)
                        objAjaxData['tab'] = STR_TAB_RENEWAL_VERIFICATIONS;
                    else if(tabIdentifier == STR_TAB_NEW_VERIFICATIONS)
                        objAjaxData['tab'] = STR_TAB_NEW_INVOICES;
                    else if(tabIdentifier == STR_TAB_RENEWAL_VERIFICATIONS)
                        objAjaxData['tab'] = STR_TAB_RENEWAL_INVOICES;
                    else if(tabIdentifier == STR_TAB_NEW_INVOICES)
                        objAjaxData['tab'] = STR_TAB_NEW_PERMITS;
                    else if(tabIdentifier == STR_TAB_RENEWAL_INVOICES)
                        objAjaxData['tab'] = STR_TAB_RENEWAL_PERMITS;

                    // =================================================================================================
                    // get requirements that was just collected during invoice
                    // and append it to objAjaxData['additional_data']
                    objAjaxData['additional_data'] = {};
                    var arrSubmittedRequirements   = [];
                    if(tabIdentifier == STR_TAB_NEW_INVOICES || tabIdentifier == STR_TAB_RENEWAL_INVOICES) {
                        divItemContent.find('.btn-upload-requirement').each(function() {
                            var divRequirement = $(this).parent().parent().parent().parent().parent();
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
                    }
                    objAjaxData['additional_data']['submitted_requirements'] = arrSubmittedRequirements;
                    // =================================================================================================

                    // initiate AJAX request
                    if (strAjaxURL != '') {
                        Pace.restart();
                        $.ajax({
                            type: 'POST',
                            url: strAjaxURL,
                            data: objAjaxData,
                            success: function (data) {
                                var response = JSON.parse(data);
                                if (response.error != '') {
                                    hideConfirmDialog(function() {
                                        showMessageDialog(response.error, '', function () {
                                            window.location.reload();
                                        });
                                    });
                                }
                                else {
                                    if (response.success.message != '') {
                                        hideConfirmDialog(function () {
                                            showMessageDialog(response.success.message, response.success.sub_message);
                                        });
                                    }
                                    else {

                                        hideConfirmDialog(function () {
                                            var a;
                                            if(tabIdentifier == STR_TAB_NEW_APPLICATIONS)
                                                a = body.find("a.content-tab[data-identifier='" + STR_TAB_NEW_VERIFICATIONS + "']");
                                            else if(tabIdentifier == STR_TAB_RENEWAL_APPLICATIONS)
                                                a = body.find("a.content-tab[data-identifier='" + STR_TAB_RENEWAL_VERIFICATIONS + "']");
                                            else if(tabIdentifier == STR_TAB_NEW_VERIFICATIONS)
                                                a = body.find("a.content-tab[data-identifier='" + STR_TAB_NEW_INVOICES + "']");
                                            else if(tabIdentifier == STR_TAB_RENEWAL_VERIFICATIONS)
                                                a = body.find("a.content-tab[data-identifier='" + STR_TAB_RENEWAL_INVOICES + "']");
                                            else if(tabIdentifier == STR_TAB_NEW_INVOICES)
                                                a = body.find("a.content-tab[data-identifier='" + STR_TAB_NEW_PERMITS + "']");
                                            else if(tabIdentifier == STR_TAB_RENEWAL_INVOICES)
                                                a = body.find("a.content-tab[data-identifier='" + STR_TAB_RENEWAL_PERMITS + "']");

                                            var msgTitle = "SUCCESSFULLY SUBMITTED";
                                            var msgBody = "<span style='font-size: 1.2em'>The following from <span class='text-info'>" + tabTitle + "</span> was successfully submitted for " + strSubmitTo + ":</span>" + "<div class='card social-card share no-margin no-border w-100 active'>" + activeCardMainItem.html() + "</div>";

                                            if(tabIdentifier == STR_TAB_NEW_VERIFICATIONS || tabIdentifier == STR_TAB_RENEWAL_VERIFICATIONS) {
                                                msgBody += "<div class='col-md-12 form-group-attached-white'>";
                                                    msgBody += "<div class='row clearfix' style='display:block'>";
                                                        msgBody += "<div class='form-group form-group-default input-group input-group-currency no-margin'>";
                                                            msgBody += "<div class='form-input-group'>";
                                                                msgBody += "<label><span class='label-label'>TOTAL FEES : PAYMENT INVOICE " + response.success.data.payment_invoice_id_fee + "</span></label>";
                                                                msgBody += "<input type='text' class='form-control txt-amount' value='" + applyCommas(response.success.data.total_fees) + "' readonly disabled>";
                                                            msgBody += "</div>";
                                                            msgBody += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                                        msgBody += "</div>";
                                                    msgBody += "</div>";
                                                    msgBody += "<div class='row clearfix' style='display:block'>";
                                                        msgBody += "<div class='form-group form-group-default input-group input-group-currency no-margin'>";
                                                            msgBody += "<div class='form-input-group'>";
                                                                msgBody += "<label><span class='label-label'>BUSINESS TAX : PAYMENT INVOICE " + response.success.data.payment_invoice_id_tax + "</span></label>";
                                                                msgBody += "<input type='text' class='form-control txt-amount' value='" + applyCommas(response.success.data.total_tax) + "' readonly disabled>";
                                                            msgBody += "</div>";
                                                            msgBody += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                                        msgBody += "</div>";
                                                    msgBody += "</div>";
                                                msgBody += "</div>";
                                            }

                                            if(a.length > 0) {
                                                showConfirmDialog(msgTitle, msgBody + "<br><br><span style='font-size: 1.2em'>Would you like to proceed to the <span class='text-success text-master'>" + a.find('.tab-title').text() + "</span>?</span>");
                                                confirmYes(function() {
                                                    hideConfirmDialog(function() {
                                                        a.click();
                                                    });
                                                });
                                            }
                                            else {
                                                showMessageDialog(msgTitle, msgBody);
                                            }

                                            // fade the $('.item-content')
                                            var divContentTab = body.find('.content-tab-pane#tab' + tab);
                                            var divItemContent = divContentTab.find('.item-content');
                                            divItemContent.find('*').fadeOut(319);

                                            // fade the $('.card-main-item')
                                            activeCardMainItem.fadeOut(320, function () {
                                                activeCardMainItem.remove();
                                                activeCardMainItem = null;

                                                // clear the $('.item-content')
                                                divItemContent.html("");

                                                // remove the data-tab-#-active item in active sidebar menu
                                                activeSidebarMenuItem.attr('data-tab-' + tab + '-active-item', '0');

                                                // on mobile view, show the left pane
                                                if (window.innerWidth <= 767) {
                                                    showPaneLeftCol();
                                                    slideTabContent('right');
                                                }

                                                // hide item controls
                                                var itemControls = divContentTab.find('.item-controls');
                                                if(itemControls.length > 0) {
                                                    if (!itemControls.hasClass('hidden')) {
                                                        itemControls.fadeOut(240, function() {
                                                            itemControls.addClass('hidden');
                                                        });
                                                    }
                                                }

                                                // update total item
                                                setTotalItems('-1');

                                                // re-number items
                                                reNumberItems();

                                                // re-cache items
                                                cacheMainItemsHTML();

                                                // refresh necessary tabs
                                                refreshMainItemsHTML(routes[STR_TAB_ACTIVITY_LOGS].title);
                                                if(tabIdentifier == STR_TAB_NEW_APPLICATIONS)
                                                    refreshMainItemsHTML(routes[STR_TAB_NEW_VERIFICATIONS].title);
                                                else if(tabIdentifier == STR_TAB_RENEWAL_APPLICATIONS)
                                                    refreshMainItemsHTML(routes[STR_TAB_RENEWAL_VERIFICATIONS].title);
                                                else if(tabIdentifier == STR_TAB_NEW_VERIFICATIONS)
                                                    refreshMainItemsHTML(routes[STR_TAB_NEW_INVOICES].title);
                                                else if(tabIdentifier == STR_TAB_RENEWAL_VERIFICATIONS)
                                                    refreshMainItemsHTML(routes[STR_TAB_RENEWAL_INVOICES].title);
                                                else if(tabIdentifier == STR_TAB_NEW_INVOICES)
                                                    refreshMainItemsHTML(routes[STR_TAB_NEW_PERMITS].title);
                                                else if(tabIdentifier == STR_TAB_RENEWAL_INVOICES)
                                                    refreshMainItemsHTML(routes[STR_TAB_RENEWAL_PERMITS].title);
                                            });
                                        });
                                    }
                                }
                                Pace.stop();
                            },
                            error: function (data) {
                                alert("UNABLE TO SUBMIT FROM " + tabTitle + "\n\nError " + data.status + " (" + data.statusText + ")");
                                Pace.stop();
                                window.location.reload();
                            }
                        });
                    }
                });
            }
        }
    }

}