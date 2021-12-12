/**
 * REMOVE ITEM
 * Delete the active item
 * @param  {node} e [the active $('.btn-new-item') element]
 */
function remove(e) {

    // get active menu and active tab details
    var sidebarMenuHref = activeSidebarMenuItem.attr('data-href');
    var sidebarMenuText = activeSidebarMenuItem.find('.sidebar-menu-item-title').text();
    var tabHref = activeContentTabItem.attr('href');
    var tabTitle = activeContentTabItem.find('.tab-title').html();
    var tabIdentifier = activeContentTabItem.attr('data-identifier');

    // get the tab content
    var divContentTab = body.find('.content-tab-pane#tab' + tab);

    // retrieve active item
    activeCardMainItem = divContentTab.find('.card-main-item.active');

    if(activeCardMainItem != null) {
        var route = routes[tabIdentifier];
        if(route != undefined) {

            // ask to delete
            showConfirmDialog("REMOVE FROM " + tabTitle, "Are you sure you want to remove the following from " + tabTitle + "?" + "<div class='card social-card share no-margin no-border w-100 active'>" + activeCardMainItem.html() + "</div>");
            confirmYes(function () {

                // get locationPath (ex. users_1_2)
                var locationPath = "";
                var arrWindowLocation = window.location.toString().split("dashboard.php?");
                if(arrWindowLocation[1] != undefined) {
                    locationPath = arrWindowLocation[1];
                }

                // configure AJAX request depending on active menu and active tab
                var strAjaxURL = route.path;
                var objAjaxData = {};
                objAjaxData[route.delete_param] = activeCardMainItem.attr('data-id');
                objAjaxData['location'] = locationPath;
                objAjaxData['menu'] = sidebarMenuText;
                objAjaxData['tab'] = tabIdentifier;

                // initiate AJAX request
                if (strAjaxURL != undefined) {
                    Pace.restart();
                    $.ajax({
                        type: 'POST',
                        url: strAjaxURL,
                        data: objAjaxData,
                        success: function (data) {
                            var response = JSON.parse(data);
                            if (response.error != '') {
                                hideConfirmDialog(function () {
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
                                    if (response.success.data == '1') {
                                        hideConfirmDialog(function () {
                                            // fade the $('.item-content')
                                            var divContentTab = body.find('.content-tab-pane#tab' + tab);
                                            var divItemContent = divContentTab.find('.item-content');

                                            divItemContent.find('.main-row').fadeOut(319);

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
                                                if(tabIdentifier == STR_TAB_NEW_VERIFICATIONS)
                                                    refreshMainItemsHTML(routes[STR_TAB_NEW_APPLICATIONS].title);
                                                else if(tabIdentifier == STR_TAB_RENEWAL_VERIFICATIONS)
                                                    refreshMainItemsHTML(routes[STR_TAB_RENEWAL_APPLICATIONS].title);
                                                else if(tabIdentifier == STR_TAB_NEW_INVOICES)
                                                    refreshMainItemsHTML(routes[STR_TAB_NEW_VERIFICATIONS].title);
                                                else if(tabIdentifier == STR_TAB_RENEWAL_INVOICES)
                                                    refreshMainItemsHTML(routes[STR_TAB_RENEWAL_VERIFICATIONS].title);
                                                else if(tabIdentifier == STR_TAB_NEW_PERMITS)
                                                    refreshMainItemsHTML(routes[STR_TAB_NEW_INVOICES].title);
                                                else if(tabIdentifier == STR_TAB_RENEWAL_PERMITS)
                                                    refreshMainItemsHTML(routes[STR_TAB_RENEWAL_INVOICES].title);

                                            });
                                        });
                                    }
                                }
                            }
                            Pace.stop();
                        },
                        error: function (data) {
                            alert("UNABLE TO REMOVE FROM " + tabTitle + "\n\nError " + data.status + " (" + data.statusText + ")");
                            Pace.stop();
                            window.location.reload();
                        }
                    });
                }
            });
        }
    }

}