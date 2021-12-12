/**
 * ENUMERATE ITEMS
 * Prepare the items in $('.div-main-items') depending on the active $('.content-tab') item
 * @param  {boolean} isFromResize [if the caller is from window height resize]
 * @param  {boolean} isFromSearch [if the caller is from window height resize]
 * @param  {function} callback [the function to execute after preparing the items]
 */
function enumerate(isFromResize, isFromSearch, callback) {
    if(isFromResize == undefined)
        isFromResize = false;
    if(isFromSearch == undefined)
        isFromSearch = false;
    else {
        if(isFromSearch) {
            isLiveClick = true;
        }
    }

    var isMainItemsRefetched = false;
    var doneScrollBottom = false;

    // hide or show panes
    if(!isFromSearch && !isFromTabClick) {
        hideOrShowPanes();
    }

    // set activeCardMainItem to null
    activeCardMainItem = null;

    // get active menu and tab data
    var sidebarMenuHref = activeSidebarMenuItem.attr('data-href');
    var tabHref = activeContentTabItem.attr('href');
    var tabTitle = activeContentTabItem.find('.tab-title').html();
    var tabIdentifier = activeContentTabItem.attr('data-identifier');

    if(tabIdentifier != STR_TAB_DASHBOARD) {
        // stop graph rendering
        stopGraphRender();

        // update document title
        if(tabTitle != undefined)
            document.title = app + " | " + activeSidebarMenuItem.find('.sidebar-menu-item-title').text() + " (" + tabTitle + ")";

        // append wait message
        function appendWaitMessage() {
            if(divMainItems.find('.card-wait').length <= 0) {
                var h = "";
                h += "<div class='card social-card share no-margin no-border w-100 card-wait'>";
                    h += "<div class='card-header clearfix no-border no-border-radius overflow-hidden'>";
                        h += "<h5 class='text-montserrat no-wrap'><span class='fas fa-circle-notch fa-spin'></span> GETTING <span class='text-info'>" + tabTitle + "</span></h5>";
                        h += "<h6 class='no-wrap text-uppercase sub-title'>PLEASE WAIT...</h6>";
                    h += "</div>";
                h += "</div>";
                divMainItems.append(h);
            }
            positionElements(false);
        }

        // remove wait message
        function removeWaitMessage() {
            var cardWait = divMainItems.find('.card-wait');
            if(cardWait.length > 0 ) {
                cardWait.remove();
            }
        }

        // append last item marker
        function appendLastItemMarker() {
            if(divMainItems.find('.card-last-item').length <= 0) {
                var html = "<div class='card social-card card-last-item share no-margin no-border w-100'></div>";
                divMainItems.append(html);
            }
        }

        // remove last item marker
        function removeLastItemMarker() {
            var cardLastItem = divMainItems.find('.card-last-item');
            if(cardLastItem.length > 0 ) {
                cardLastItem.remove();
            }
        }

        // get items div
        var divContentTab = body.find(".content-tab-pane" + tabHref);
        var divMainItems = divContentTab.find('.div-main-items');

        // try to retrieve cached mainItemsHTML of the active tab
        var isCachedMainItemsFound = false;
        var isMainItemsNeedRefresh = true;
        var mainItemsHTML = "";
        if(!isFromSearch) {
            if (!isFromResize) {
                divMainItems.html("");
                for (var i = 0; i < arrMainItemsHTML.length; i++) {
                    if (arrMainItemsHTML[i]['href'] == sidebarMenuHref) {
                        for (var j = 0; j < arrMainItemsHTML[i]['tabs'].length; j++) {
                            if (arrMainItemsHTML[i]['tabs'][j]['title'] == tabTitle) {
                                isCachedMainItemsFound = true;
                                if (!arrMainItemsHTML[i]['tabs'][j]['need_refresh']) {
                                    isMainItemsNeedRefresh = false;
                                    mainItemsHTML = arrMainItemsHTML[i]['tabs'][j]['html'];
                                }
                                break;
                            }
                        }
                        break;
                    }
                }
            }
        }

        // decide on how to write the items
        if (isCachedMainItemsFound) {
            // MAIN ITEMS FOUND
            if (isMainItemsNeedRefresh) {
                // BUT NEEDS REFRESH
                getMainItemsFromDB();
            }
            else {
                renderMainItemsHTML();
            }
        }
        else {
            // MAIN ITEMS NOT FOUND
            getMainItemsFromDB();
        }


        /**
         * RENDER mainItemsHTML
         * Write mainItemsHTML to $('.div-main-items') of the active tab
         */
        var tmrRender;
        function renderMainItemsHTML() {

            // remove wait message
            removeWaitMessage();

            // remove last item marker
            removeLastItemMarker();

            // append the mainItemsHTML
            divMainItems.append(mainItemsHTML);

            // append the last item maker
            appendLastItemMarker();

            tmrRender = setInterval(function() {
                if(divMainItems.find('.card-last-item').length > 0) {

                    // stop tmrRender
                    clearInterval(tmrRender);

                    // re-number items
                    reNumberItems();

                    // cache the mainItemsHTML
                    cacheMainItemsHTML();

                    // reset item height
                    var cardMainItems = divMainItems.find('.card-main-item').last();
                    if(itemHeight == 60) {
                        if(cardMainItems.length > 0) {
                            itemHeight = parseFloat(cardMainItems.css('height'));
                        }
                    }

                    // select the active item
                    var activeItem = activeSidebarMenuItem.attr('data-tab-' + tab + '-active-item');
                    var cardMainItem = divMainItems.find(".card-main-item[data-id='" + activeItem + "']");
                    if(cardMainItem.length > 0) {
                        if(!isFromResize) {
                            if (!isMainItemsRefetched) {
                                divMainItems.css({
                                    'scroll-behavior': 'auto'
                                });
                                doneScrollBottom = true;
                                scrollTo(divMainItems, cardMainItem[0].offsetTop - parseFloat(cardMainItem.css('height')) - 1, function () {
                                    if(isFromSearch)
                                        cardMainItem.click();
                                    else
                                        select(cardMainItem);
                                });
                            }
                        }
                    }

                    if(!isLiveClick) {
                        if (window.innerWidth <= 767) {
                            if (isFromSearch) {
                                hidePaneLeftCol();
                            }
                            else {
                                showPaneLeftCol();
                            }
                        }
                    }

                    if(mainItemsHTML != "")
                        doneScrollBottom = false;

                    if(!isFromSearch) {
                        divMainItems.off();
                    }

                    divMainItems.on('scroll', function() {
                        if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
                            if(!doneScrollBottom || isFromSearch) {
                                doneScrollBottom = true;
                                divMainItems.css({
                                    'scroll-behavior': 'smooth'
                                });
                                isMainItemsRefetched = true;
                                mainItemsHTML = "";
                                getMainItemsFromDB();
                            }
                        }
                    });

                    // scroll one item down when items are refetched
                    if(isMainItemsRefetched) {
                        if(divMainItems[0].scrollTop + itemHeight < divMainItems[0].scrollHeight)
                            divMainItems[0].scrollTop += itemHeight;
                    }

                    positionElements(false);

                    // ALWAYS SELECT 1ST ITEMS ON SELECTED TABS
                    if(tabTitle == 'UPDATES') {
                        var arrCardItems = divMainItems.find('.card-main-item');
                        arrCardItems.each(function(i) {
                            if(!$(this).hasClass('active')) {
                                $(this).click();
                                return 0;
                            }
                        });
                    }
                }
            }, 1);

            if(callback != null) {
                callback();
            }
        }

        /**
         * GET Main Items
         * Retrieve the main items from Database via AJAX Request
         */
        function getMainItemsFromDB() {
            var route = routes[tabIdentifier];
            if(route != undefined) {

                // append wait message
                appendWaitMessage();

                // toggle global boolean variable
                performedDBSearch = true;

                // disable btn-search and other control buttons
                var btnSearch = divContentTab.find('.btn-search-item');
                if(isFromSearch) {
                    if (btnSearch.length > 0) {
                        var fa = btnSearch.find('.fas');
                        if (fa.hasClass('fa-search')) {
                            fa.removeClass('fa-search');
                            fa.addClass('fa-circle-notch');
                            fa.addClass('fa-spin');
                        }
                    }
                }
                var btnNew = divContentTab.find('.btn-new-item');
                var btnSave = divContentTab.find('.btn-save-item');
                var btnSubmit = divContentTab.find('.btn-save-item');
                var btnDelete = divContentTab.find('.btn-delete-item');
                var btnPrint = divContentTab.find('.btn-print-item');
                var txtFindInPage = divContentTab.find('.txt-find-in-page');
                disableButton(btnNew, true);
                disableButton(btnSearch, true);
                disableButton(btnSave, true);
                disableButton(btnSubmit, true);
                disableButton(btnDelete, true);
                disableButton(btnPrint, true);
                disableInput(txtFindInPage, true);

                // get the active item
                var activeItemID = activeSidebarMenuItem.attr('data-tab-' + tab + '-active-item');
                if(activeItemID == undefined) {
                    activeItemID = '0';
                }

                // get the last item
                var lastItemID = '';
                if(!isFromSearch) {
                    var cardItems = divMainItems.find('.card-main-item');
                    if (cardItems.length > 0) {
                        lastItemID = cardItems.last().attr('data-id');
                    }
                }

                // compute for the item limit
                var itemLimit = parseInt(parseFloat(divContentTab.css('height')) / itemHeight) + 1;
                if(itemLimit <= 2 || itemLimit != itemLimit)
                    itemLimit = 30; // just in case :)

                // configure AJAX request depending on active menu and active tab
                var strAjaxURL = route.path;
                var objAjaxData = {};
                objAjaxData[route.prepare_param] = activeSidebarMenuItem.attr('data-href');
                objAjaxData['last_item'] = lastItemID;
                objAjaxData['active_item'] = activeItemID;
                objAjaxData['item_limit'] = itemLimit;


                // initiate AJAX request
                if (strAjaxURL != undefined) {
                    if(!isMainItemsRefetched && !isFromResize) {
                        Pace.restart();
                    }
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
                                    var menuHref = response.success.data.menu_href;

                                    // :: this is to prevent writing items on the same tab but different menu
                                    if (activeSidebarMenuItem.attr('data-href') == menuHref) {

                                        var items = response.success.data.items;
                                        for (var i = 0; i < items.length; i++) {
                                            var objItem = items[i];
                                            var classHidden = isMainItemsRefetched ? ' hidden' : '';
                                            if(divMainItems.find(".card-main-item[data-id='" + objItem.item_id + "']").length <= 0) {
                                                mainItemsHTML += generateItemHTML(objItem, i + 1, false);
                                            }
                                        }

                                        // set total item
                                        setTotalItems(response.success.data.total_items);

                                        // initiate RENDER mainItemsHTML
                                        renderMainItemsHTML();

                                        // reset btn-search and other buttons
                                        if(isFromSearch) {
                                            if (btnSearch.length > 0) {
                                                var fa = btnSearch.find('.fas');
                                                if (fa.hasClass('fa-spin')) {
                                                    fa.removeClass('fa-circle-notch');
                                                    fa.removeClass('fa-spin');
                                                    fa.addClass('fa-search');
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if(!isMainItemsRefetched && !isFromResize) {
                                Pace.stop();
                            }

                            // toggle global boolean variable
                            performedDBSearch = false;

                            // enable control buttons
                            disableButton(btnNew, false);
                            disableButton(btnSearch, false);
                            disableButton(btnSave, false);
                            disableButton(btnSubmit, false);
                            disableButton(btnDelete, false);
                            disableButton(btnPrint, false);
                            disableInput(txtFindInPage, false);
                        },
                        error: function (data) {
                            alert("UNABLE TO GET " + tabTitle + "\n\nError " + data.status + " (" + data.statusText + ")");
                            if(!isMainItemsRefetched && !isFromResize) {
                                Pace.stop();
                                window.location.reload();
                            }
                            // toggle global boolean variable
                            performedDBSearch = false;
                        }
                    });
                }
            }
        }
    }
    else {
        // disable period buttons
        var divContentTab = body.find('.content-tab-pane#tab' + tab);
        var btnGroupDashboardPeriod = divContentTab.find('.btn-group-dashboard-period');
        btnGroupDashboardPeriod.find('button').each(function(i) {
            disableButton($(this), true);
        });

        // render graph in dashboard
        setTimeout(function() {
            renderGraphData();
        }, 320);

        if (callback != null)
            callback();
    }
}


/**
 * GENERATE ITEM HTML
 * Write the item data on a $('.card-main-item')
 * @param  {object} objItem [the item object from database]
 * @param  {int} n [the number of the item]
 * @param  {boolean} isForLogs [if the generated item is for system log]
 */
function generateItemHTML(objItem, n, isForLogs) {

    if(isForLogs == undefined)
        isForLogs = false;

    var cardClass = ' card-main-item';
    if(isForLogs)
        cardClass = ' active';

    var html = "<div class='card social-card" + cardClass + " share no-margin no-border w-100 card-" + activeContentTabItem.attr('data-identifier') + "' data-id='" + objItem.item_id + "'>";
        html += "<div class='card-header clearfix no-border no-border-radius overflow-hidden'>";
        if(objItem.item_avatar != undefined) {
            if (objItem.item_avatar != '') {
                var avatarDir = citizenAvatarDir;
                if(objItem.item_avatar == '_.jpg')
                    avatarDir = index + 'img/';
                html += "<div class='item-avatar user-pic'>";
                html += "<img alt='(img)' width='33' height='33' src='" + avatarDir + objItem.item_avatar + "'>";
                html += "</div>";
            }
        }
        if(objItem.item_maintitle != undefined) {
            html += "<h5 class='no-wrap text-montserrat'>";
                if(!isForLogs) {
                    html += "<small class='item-number'>" + n.toString() + "</small>. ";
                }
                html += "<span class='main-title'>" + objItem.item_maintitle + "</span>";
            html += "</h5>";
        }
        if(objItem.item_subtitle != undefined) {
            if(objItem.item_subtitle == '')
                objItem.item_subtitle = '&nbsp;';
            html += "<h6 class='no-wrap sub-title'>" + objItem.item_subtitle + "</h6>";
        }
        if(objItem.item_update_date != undefined) {
            html += "<div class='icon-title label-hidden-bottom-right item-date'>" + objItem.item_update_date + "</div>";
        }
        html += "</div>";
    html += "</div>";
    return html;

}


/**
 * CACHE MAIN ITEMS HTML
 * Write the item data on a $('.card-main-item')
 */
function cacheMainItemsHTML() {

    var sidebarMenuHref = activeSidebarMenuItem.attr('data-href');
    var tabTitle = activeContentTabItem.find('.tab-title').html();
    var tabHref = activeContentTabItem.attr('href');
    var mainItemsHTML = body.find(".content-tab-pane" + tabHref).find('.div-main-items').html();


    // cache the mainItemsHTML of the active tab
    for(var i=0; i<arrMainItemsHTML.length; i++) {
        if(arrMainItemsHTML[i]['href'] == sidebarMenuHref) {
            var isTabCacheFound = false;
            for(var j=0; j<arrMainItemsHTML[i]['tabs'].length; j++) {
                if(arrMainItemsHTML[i]['tabs'][j]['title'] == tabTitle) {
                    arrMainItemsHTML[i]['tabs'][j]['need_refresh'] = false;
                    arrMainItemsHTML[i]['tabs'][j]['html'] = mainItemsHTML;
                    isTabCacheFound = true;
                    break;
                }
            }
            if(!isTabCacheFound) {
                arrMainItemsHTML[i]['tabs'].push({
                    'title' : tabTitle,
                    'need_refresh' : false,
                    'html' : mainItemsHTML
                });
            }

            break;
        }
    }

}


/**
 * REFRESH MAIN ITEMS HTML
 * Set 'need_refresh' to true of a specific tab
 * @param  {string} strTab [the tab title]
 */
function refreshMainItemsHTML(strTab) {
    for(var i=0; i<arrMainItemsHTML.length; i++) {
        for(var j=0; j<arrMainItemsHTML[i]['tabs'].length; j++) {
            if(arrMainItemsHTML[i]['tabs'][j]['title'] == strTab) {
                arrMainItemsHTML[i]['tabs'][j]['need_refresh'] = true;
            }
        }
    }
}

/**
 * RENUMBER ITEMS
 * Renumber current items
 */
function reNumberItems() {

    var divTabPane = body.find(".content-tab-pane#tab" + tab);
    var divMainItem = divTabPane.find('.div-main-items');
    var totalItems = 0;
    divMainItem.find('.card-main-item').each(function (i) {
        $(this).find('.item-number').html((i + 1).toString());
        totalItems += 1;
    });

    var spItemDisplayedTotal = divTabPane.find('.item-displayed-total');
    var spItemTotal = divTabPane.find('.item-total');
    var p = spItemDisplayedTotal.parent();
    if(p.hasClass('hidden')) {
        p.hide();
        p.removeClass('hidden');
        p.fadeIn(480);
    }
    spItemDisplayedTotal.html(applyCommas(totalItems.toString(), true));
    spItemTotal.html(applyCommas(activeSidebarMenuItem.attr('data-tab-' + tab + '-total').toString(), true));

}


/**
 * SET TOTAL ITEMS
 * Set the total items
 * @param  {string} str [an actual number, '+1', or '-1']
 */
function setTotalItems(str) {

    var currentItemTotal = parseInt(activeSidebarMenuItem.attr('data-tab-' + tab + '-total'));
    if(currentItemTotal == null || currentItemTotal != currentItemTotal) { // NaN
        currentItemTotal = 0;
    }

    if(str == '+1')
        currentItemTotal += 1;
    else if(str == '-1')
        currentItemTotal -= 1;
    else
        currentItemTotal = parseInt(str);

    activeSidebarMenuItem.attr('data-tab-' + tab + '-total', currentItemTotal.toString());

}


