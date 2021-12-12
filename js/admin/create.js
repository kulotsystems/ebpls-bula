/**
 * CREATE ITEM
 * Create a new item
 * @param  {node} e [the active $('.btn-new-item') element]
 */
function create(e) {

    // get active menu and active tab details
    var sidebarMenuHref = activeSidebarMenuItem.attr('data-href');
    var sidebarMenuText = activeSidebarMenuItem.find('.sidebar-menu-item-title').text();
    var tabHref = activeContentTabItem.attr('href');
    var tabTitle = activeContentTabItem.find('.tab-title').html();
    var tabIdentifier = activeContentTabItem.attr('data-identifier');

    var route = routes[tabIdentifier];
    if(route != undefined) {

        // get locationPath (ex. users_1_2)
        var locationPath = "";
        var arrWindowLocation = window.location.toString().split("dashboard.php?");
        if(arrWindowLocation[1] != undefined) {
            locationPath = arrWindowLocation[1];
        }

        // configure AJAX request depending on active menu and active tab
        var strAjaxURL = route.path;
        var objAjaxData = {};

        objAjaxData[route.create_param] = 1;
        objAjaxData['location'] = locationPath;
        objAjaxData['menu'] = sidebarMenuText;
        objAjaxData['tab'] = tabIdentifier;

        // initiate AJAX request
        if (strAjaxURL != undefined) {
            // disable the $('.btn-new-item')
            e.prop('disabled', true);
            e.attr('disabled', true);
            var fa = e.find('.fas');
            if (fa.hasClass('fa-plus-circle')) {
                fa.removeClass('fa-plus-circle');
                fa.addClass('fa-circle-notch');
                fa.addClass('fa-spin');
            }

            Pace.restart();
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
                        if (response.success.message != '')
                            showMessageDialog(response.success.message, response.success.sub_message);
                        else {
                            var objItem = response.success.data;

                            var divContentTab = body.find(".content-tab-pane" + tabHref);
                            var divMainItems = divContentTab.find('.div-main-items');

                            // generate item html
                            var itemHTML = generateItemHTML(objItem, 0);
                            divMainItems.prepend(itemHTML);

                            // update total item
                            setTotalItems('+1');

                            // renumber items
                            reNumberItems();

                            // cache the new items html
                            cacheMainItemsHTML();

                            // refresh necessary tabs
                            refreshMainItemsHTML(routes[STR_TAB_ACTIVITY_LOGS].title);

                            // select the new item
                            isLiveClick = true;
                            var newCardItem = divMainItems.find(".card-main-item[data-id='" + objItem.item_id + "']");
                            if(window.innerWidth <= 767) {
                                divMainItems.css({
                                    'scroll-behavior': 'auto'
                                });
                            }
                            else {
                                divMainItems.css({
                                    'scroll-behavior': 'smooth'
                                });
                            }

                            divMainItems[0].scrollTop = 0;
                            isFromMenuClick = false;
                            isFromTabClick = false;
                            select(newCardItem);
                        }
                    }
                    Pace.stop();

                    // enable the $('.btn-new-item') again
                    e.prop('disabled', false);
                    e.prop('disabled', false);
                    fa = e.find('.fas');
                    if (fa.hasClass('fa-circle-notch')) {
                        fa.removeClass('fa-circle-notch');
                        fa.removeClass('fa-spin');
                        fa.addClass('fa-plus-circle');
                    }
                },
                error: function (data) {
                    alert("UNABLE TO CREATE NEW " + tabTitle + "\n\nError " + data.status + " (" + data.statusText + ")");
                    Pace.stop();
                    window.location.reload();
                }
            });
        }
    }

}