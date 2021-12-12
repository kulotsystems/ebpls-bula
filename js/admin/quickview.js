/**
 * OPEN QUICK VIEW
 * Show the quick view that displays more information or options
 * @param  {string} strTitle [the title of the quickview]
 *
 */
function showQuickview(strTitle) {

    var divQuickview = body.find('#quickview');
    if(divQuickview.length > 0) {
        if(!divQuickview.hasClass('open')) {

            // get active menu and active tab details
            var sidebarMenuHref = activeSidebarMenuItem.attr('data-href');
            var sidebarMenuText = activeSidebarMenuItem.find('.sidebar-menu-item-title').text();
            var tabHref = activeContentTabItem.attr('href');
            var tabTitle = activeContentTabItem.find('.tab-title').html();
            var tabIdentifier = activeContentTabItem.attr('data-identifier');

            // MODIFY QUICKVIEW HTML
            divQuickview.find('.quickview-title').html(strTitle);
            var divQuickviewContentHead = divQuickview.find('.quickview-content-head');
            var divQuickviewContentBody = divQuickview.find('.quickview-content-body');
            var headHTML = "";
            var bodyHTML = "";

            // ITEM SEARCH
            if(strTitle == '<b>SEARCH:</b> ' + tabTitle) {
                searchPlaceholder = "";
                headHTML += "<div class='input-group' style='padding: 2px'>";
                    headHTML += "<input type='text' class='txt-quickview-search form-control' style='background: #fff' placeholder='" + searchPlaceholder + "'>";
                    headHTML += "<div class='input-group-btn'>";
                        headHTML += "<button class='btn btn-success btn-quickview-search'><span class='fas fa-search'></span></button>";
                    headHTML += "</div>";
                headHTML += "</div>";

                divQuickviewContentHead.html(headHTML);
                divQuickviewContentBody.html(bodyHTML);
                divQuickviewContentHead.find('.txt-quickview-search').focus();
            }

            // RECORD SEARCH
            else if(strTitle == STR_QUICKVIEW_SEARCH_CITIZEN || strTitle == STR_QUICKVIEW_SEARCH_CORPORATE_OWNER || strTitle == STR_QUICKVIEW_SEARCH_BARANGAY || strTitle == STR_QUICKVIEW_SEARCH_LINE_OF_BUSINESS) {
                var searchPlaceholder = '';
                if(strTitle == STR_QUICKVIEW_SEARCH_CITIZEN || strTitle == STR_QUICKVIEW_SEARCH_CORPORATE_OWNER)
                    searchPlaceholder = 'Citizen ID / Name';
                else if(strTitle == STR_QUICKVIEW_SEARCH_BARANGAY)
                    searchPlaceholder = 'Barangay Name';
                else if(STR_QUICKVIEW_SEARCH_LINE_OF_BUSINESS)
                    searchPlaceholder = 'Line of Business';

                headHTML += "<div class='input-group' style='padding: 2px'>";
                    headHTML += "<input type='text' class='txt-quickview-search form-control' style='background: #fff' placeholder='" + searchPlaceholder + "'>";
                    headHTML += "<div class='input-group-btn'>";
                        headHTML += "<button class='btn btn-success btn-quickview-search'><span class='fas fa-search'></span></button>";
                    headHTML += "</div>";
                headHTML += "</div>";

                divQuickviewContentHead.html(headHTML);
                divQuickviewContentBody.html(bodyHTML);
                divQuickviewContentHead.find('.txt-quickview-search').focus();
            }

            // UPLOAD
            else if(strTitle == STR_QUICKVIEW_UPLOAD_REQUIREMENT || strTitle == STR_QUICKVIEW_VIEW_REQUIREMENT || strTitle == STR_QUICKVIEW_UPLOAD_CORPORATE_OWNER_PHOTO) {
                var uploadPlaceholder = '';
                if(strTitle == STR_QUICKVIEW_UPLOAD_REQUIREMENT || strTitle == STR_QUICKVIEW_UPLOAD_CORPORATE_OWNER_PHOTO)
                    uploadPlaceholder = '(NO FILE)';

                var itemTitle = '';
                var itemFilename = '';
                var dispItemFilename = '';
                var itemSRC = '';
                if(strTitle == STR_QUICKVIEW_UPLOAD_REQUIREMENT || strTitle == STR_QUICKVIEW_VIEW_REQUIREMENT) {
                    itemTitle = activeUploadFormGroup.find('.txt-upload-item-title').val();
                    itemFilename = activeUploadFormGroup.find('.txt-file-name').val();
                    dispItemFilename = (itemFilename != '_.png') ? itemFilename : '';
                    if(itemFilename == '') {
                        itemFilename = '';
                        itemSRC = index + 'img/reqs/_.png';
                    }
                    else
                        itemSRC = index + 'img/reqs/' + itemFilename;
                }
                else if(strTitle == STR_QUICKVIEW_UPLOAD_CORPORATE_OWNER_PHOTO) {
                    itemTitle = activeUploadFormGroup.find('.txt-corporate-owner-name').val();
                    itemSRC = activeUploadFormGroup.find('.img-item-avatar').attr('src');
                    itemFilename = activeUploadFormGroup.find('.img-item-avatar').attr('data-src');
                    dispItemFilename = (itemFilename != '_.jpg') ? itemFilename : '';
                }

                headHTML += "<p class='text-montserrat text-bold no-margin' style='padding: 5px; font-size: 1.3em'>" + itemTitle + "</p>";
                if(strTitle == STR_QUICKVIEW_UPLOAD_REQUIREMENT || strTitle == STR_QUICKVIEW_UPLOAD_CORPORATE_OWNER_PHOTO) {
                    headHTML += "<form method='post' action='" + index + "php/ajax/upload.php" + "' enctype='multipart/form-data'>";
                        headHTML += "<input type='file' id='fileIMG' name='fileIMG' class='hidden' accept='image/*'>";
                        if(strTitle == STR_QUICKVIEW_UPLOAD_REQUIREMENT)
                            headHTML += "<input type='text' class='hidden' name='fileREQ' id='fileREQ' value='1'>";
                        else if(strTitle == STR_QUICKVIEW_UPLOAD_CORPORATE_OWNER_PHOTO)
                            headHTML += "<input type='text' class='hidden' name='fileUSER' id='fileUSER' value='1'>";
                    headHTML += "</form>";

                    headHTML += "<div class='input-group' style='padding: 2px; width: 100%'>";
                        headHTML += "<input type='text' class='txt-upload-filename form-control text-center' style='background: #fff; width: 80%' placeholder='" + uploadPlaceholder + "' value='" + dispItemFilename + "' readonly disabled>";
                        headHTML += "<div class='input-group-btn' style='width: 20%'>";
                            headHTML += "<label for='fileIMG' class='btn btn-success btn-upload-browse no-padding-left no-padding-right' style='width: 100%'><span class='fas fa-ellipsis-h'></span></label>";
                        headHTML += "</div>";
                    headHTML += "</div>";

                    headHTML += "<div class='btn-group' style='padding: 2px; width: 100%'>";
                        headHTML += "<button class='btn btn-default btn-upload-cancel' style='width: 40%'>CLOSE</button>";
                        headHTML += "<button class='btn btn-default btn-upload-clear' style='width: 40%'>CLEAR</button>";
                        headHTML += "<button class='btn btn-success btn-upload-update no-padding' style='width: 20%'><b>OK</b></button>";
                    headHTML += "</div>";
                }

                bodyHTML += "<div style='padding: 2px 3px 2px 2px'>";
                    bodyHTML += "<div style='position: relative; width: 100%'>";
                        bodyHTML += "<img class='item-img' style='width: 100%' src='" + itemSRC + "' data-src='" + itemFilename + "'  alt='[" + itemTitle + "]'>";
                        bodyHTML += "<div class='opac hidden' style='width: 100%; height: 100%; position: absolute; z-index: 1; opacity: 0.5; background: #000; left: 0; top: 0'></div>";
                        bodyHTML += "<div class='loader hidden' style='width: 100%; height: 100%; position: absolute; z-index: 2; left: 0; top: 0;'>";
                            bodyHTML += "<table class='w-100 h-100'><tr><td align='center' class='text-white'>";
                                bodyHTML += "<p class='text-montserrat text-bold'><span class='fas fa-circle-notch fa-spin' style='font-size: 1.5em'></span><br><span class='upload-status'></span></p>";
                            bodyHTML += "</td></tr></table>";
                        bodyHTML += "</div>";
                    bodyHTML += "</div>";
                bodyHTML += "</div>";

                divQuickviewContentHead.html(headHTML);
                divQuickviewContentBody.html(bodyHTML);
            }

            // OPEN QUICKVIEW
            body.append("<div id='quickview-opac' class='hidden'></div>");
            var quickviewOpac = body.find('#quickview-opac');
            quickviewOpac.hide();
            quickviewOpac.removeClass('hidden');
            quickviewOpac.fadeIn(240);
            divQuickview.addClass('open');
        }
    }
}


/**
 * CLOSE QUICK VIEW
 * Hide the quick view
 */
function hideQuickview(callback) {

    var divQuickview = body.find('#quickview');
    if(divQuickview.length > 0) {
        if(divQuickview.hasClass('open')) {
            var quickviewOpac = body.find('#quickview-opac');
            if(quickviewOpac.length > 0) {
                quickviewOpac.fadeOut(240, function () {
                    quickviewOpac.remove();
                    if(callback != undefined) {
                        callback();
                    }
                });
            }

            divQuickview.removeClass('open');
        }
    }

}


$(function() {

    // EVENT: QUICKVIEW TOGGLE BTN CLICK
    body.delegate('.quickview-toggle', 'click', function() {
        hideQuickview();
    });

    function quickviewSearch() {
        var divQuickview = body.find('#quickview');
        var txtQuickviewSearch = divQuickview.find('.txt-quickview-search');
        var btnQuickviewSearch = divQuickview.find('.btn-quickview-search');
        var quickviewTitle = divQuickview.find('.quickview-title').html();
        var quickviewContentBody = divQuickview.find('.quickview-content-body');

        // disable or enable search controls
        function disableSearchControls(bool) {
            txtQuickviewSearch.attr('disabled', bool);
            txtQuickviewSearch.prop('disabled', bool);
            txtQuickviewSearch.attr('readonly', bool);
            txtQuickviewSearch.prop('readonly', bool);

            btnQuickviewSearch.attr('disabled', bool);
            btnQuickviewSearch.prop('disabled', bool);
            var fa = btnQuickviewSearch.find('.fas');

            if(bool) {
                if (fa.hasClass('fa-search')) {
                    fa.removeClass('fa-search');
                    fa.addClass('fa-circle-notch');
                    fa.addClass('fa-spin');
                }
            }
            else {
                if (fa.hasClass('fa-circle-notch')) {
                    fa.removeClass('fa-circle-notch');
                    fa.removeClass('fa-spin');
                    fa.addClass('fa-search');
                }
                txtQuickviewSearch.focus();
            }
        }

        var q = txtQuickviewSearch.val().trim();
        if(q != "") {
            // disable search controls
            disableSearchControls(true);

            // get active menu and active tab details
            var sidebarMenuHref = activeSidebarMenuItem.attr('data-href');
            var sidebarMenuText = activeSidebarMenuItem.find('.sidebar-menu-item-title').text();
            var tabHref = activeContentTabItem.attr('href');
            var tabTitle = activeContentTabItem.find('.tab-title').html();
            var tabIdentifier = activeContentTabItem.attr('data-identifier');

            // show wait message
            var html = "<div class='card social-card share no-margin no-border w-100 card-search-wait'>";
                html += "<div class='card-header clearfix no-border no-border-radius overflow-hidden'>";
                    html += "<h5 class='text-montserrat no-wrap'><span class='fas fa-circle-notch fa-spin'></span> SEARCHING</h5>";
                    html += "<h6 class='no-wrap text-uppercase sub-title'>PLEASE WAIT...</h6>";
                html += "</div>";
            html += "</div>";
            quickviewContentBody.html(html);


            // configure AJAX request search data depending on quickviewTitle
            var objAjaxData = {};
            if(quickviewTitle == '<b>SEARCH:</b> ' + tabTitle)
                objAjaxData[routes[tabIdentifier].search_param] = q;
            else if(quickviewTitle == STR_QUICKVIEW_SEARCH_CITIZEN || quickviewTitle == STR_QUICKVIEW_SEARCH_CORPORATE_OWNER)
                objAjaxData = { search_citizen: q };
            else if(quickviewTitle == STR_QUICKVIEW_SEARCH_BARANGAY)
                objAjaxData = { search_barangay: q };
            else if(quickviewTitle == STR_QUICKVIEW_SEARCH_LINE_OF_BUSINESS)
                objAjaxData = { search_line_of_business: q };

            // initiate AJAX request
            Pace.restart();
            $.ajax({
                type: 'POST',
                url: index + 'php/ajax/search.php',
                data: objAjaxData,
                success: function(data) {
                    var response = JSON.parse(data);
                    if(response.error != '') {
                        showMessageDialog(response.error, '', function () {
                            window.location.reload();
                        });
                    }
                    else {
                        if(response.success.message != '')
                            showMessageDialog(response.success.message, response.success.sub_message);
                        else {
                            var cardWait = quickviewContentBody.find('.card-search-wait');
                            cardWait.fadeOut(319);
                            setTimeout(function() {
                                cardWait.remove();
                                var arrResults = response.success.data;
                                var html = "";
                                if(arrResults.length <= 0) { // no results
                                    html += "<div style='padding: 2px'><div class='alert alert-danger'><p class='text-montserrat text-bold'>" + quickviewTitle + "</p> No record found for <b><i>" + q + "</i></b>.</div></div>";
                                }
                                else {
                                    for(var i=0; i<arrResults.length; i++) {
                                        var result = arrResults[i];

                                        html += "<div class='card social-card card-searched-item share no-margin no-border w-100' data-id='" + result.id + "'>";
                                            html += "<div class='card-header clearfix no-border no-border-radius overflow-hidden'>";
                                            if(result.avatar != undefined) {
                                                html += "<div class='user-pic'>";
                                                    var avatarDir = citizenAvatarDir;
                                                    if(result.avatar == '_.jpg')
                                                         avatarDir = index + 'img/';
                                                    html += "<img alt='(img)' width='33' height='33' src='" + avatarDir + result.avatar + "' data-src='" + result.avatar + "'>";
                                                html += "</div>";
                                            }
                                            if(result.main_title != undefined) {
                                                html += "<h5 class='text-montserrat no-wrap'>";
                                                    html += "<small class='item-number'>" + (i + 1).toString() + "</small>. <span class='main-title'>" + result.main_title + "</span>";
                                                html += "</h5>";
                                            }
                                            if(result.sub_title != undefined) {
                                                html += "<h6 class='no-wrap sub-title'>" + result.sub_title + "</h6>";
                                            }
                                            if(result.meta_data != undefined) {
                                                for(var j=0; j<result.meta_data.length; j++) {
                                                    var metaData = result.meta_data[j];
                                                    html += "<div class='" + metaData.class_name + " hidden'>" + metaData.value + "</div>";
                                                }
                                            }
                                            html += "</div>";
                                        html += "</div>";
                                    }
                                }
                                quickviewContentBody.html(html);
                            }, 320);
                        }
                    }
                    disableSearchControls(false);
                    Pace.stop();
                },
                error: function(data) {
                    alert("ERROR (" + quickviewTitle + ")\n\nError " + data.status + " (" + data.statusText + ")");
                    disableSearchControls(false);
                    Pace.stop();
                    window.location.reload();
                }
            });
        }
        else {
            txtQuickviewSearch.focus();
            btnQuickviewSearch.blur();
        }
    }

    // EVENT: QUICKVIEW SEARCH BTN CLICK
    body.delegate('.btn-quickview-search', 'click', function() {
        quickviewSearch($(this).parent().parent());
    });

    // EVENT: QUICKVIEW SEARCH TXT ENTER
    body.delegate('.txt-quickview-search', 'keyup', function(e) {
        if(e.keyCode == 13) {
            quickviewSearch($(this).parent());
        }
    });

    // EVENT: CARD SEARCHED CLICK
    body.delegate('.card-searched-item', 'click', function() {
        var divQuickview = body.find('#quickview');
        var quickviewTitle = divQuickview.find('.quickview-title').html();

        // get active menu and active tab details
        var sidebarMenuHref = activeSidebarMenuItem.attr('data-href');
        var sidebarMenuText = activeSidebarMenuItem.find('.sidebar-menu-item-title').text();
        var tabHref = activeContentTabItem.attr('href');
        var tabTitle = activeContentTabItem.find('.tab-title').html();
        var tabIdentifier = activeContentTabItem.attr('data-identifier');

        if(quickviewTitle == '<b>SEARCH:</b> ' + tabTitle) {
            var searchedItemID = $(this).attr('data-id');

            // find the searched item id in the current .div-main-items
            var divContentTab = body.find('.content-tab-pane#tab' + tab);
            var divMainItems = divContentTab.find('.div-main-items');
            var divContent = divContentTab.find('.item-content');
            var targetCardMainItem = divMainItems.find(".card-main-item[data-id='" + searchedItemID + "']");
            var isTargetFound = false;
            if(targetCardMainItem != null) {
                if(targetCardMainItem.length > 0) {
                    isTargetFound = true;
                    hideQuickview(function() {
                        divMainItems.find('.card-main-item.active').removeClass('active');
                        divMainItems.css({'scroll-behavior':'unset'});
                        scrollTo(divMainItems, targetCardMainItem[0].offsetTop - parseFloat(targetCardMainItem.css('height')) - 1);
                        setTimeout(function() {
                            //select(targetCardMainItem);
                            targetCardMainItem.click();
                            divMainItems.css({'scroll-behavior':'smooth'});
                        }, 1);
                    });
                }
            }
            if(!isTargetFound) {
                activeSidebarMenuItem.attr('data-tab-' + activeSidebarMenuItem.attr('data-tab') + '-active-item', searchedItemID);
                refreshMainItemsHTML(tabIdentifier);
                hideQuickview(function () {
                    if(divMainItems.hasClass('overflow-y-auto')) {
                        divMainItems.removeClass('overflow-y-auto');
                        divMainItems.addClass('overflow-hidden');
                    }
                    divMainItems.css({'opacity':'0.3'});
                    divContent.css({'opacity':'0.3'});
                    divMainItems.css({'scroll-behavior':'unset'});
                    enumerate(false, true, function() {
                        if(divMainItems.hasClass('overflow-hidden')) {
                            divMainItems.removeClass('overflow-hidden');
                            divMainItems.addClass('overflow-y-auto');
                        }
                        divMainItems.css({'opacity':'1.0'});
                        divContent.css({'opacity':'1.0'});
                        divMainItems.css({'scroll-behavior':'smooth'});
                    });
                });
            }
        }
        else if(quickviewTitle == STR_QUICKVIEW_SEARCH_CITIZEN || quickviewTitle == STR_QUICKVIEW_SEARCH_CORPORATE_OWNER) {
            if(quickviewTitle == STR_QUICKVIEW_SEARCH_CITIZEN) {
                activeSearchFormGroup.attr('data-id', $(this).attr('data-id'));
                var citizenAvatar = activeSearchFormGroup.find('.img-citizen-avatar');
                citizenAvatar.attr('src', $(this).find('.user-pic > img').attr('src'));
                citizenAvatar.attr('data-src', $(this).find('.user-pic > img').attr('data-src'));
                activeSearchFormGroup.find('.txt-citizen-name').val($(this).find('.main-title').text());
                body.find('input.txt-citizen-address').val($(this).find('.sub-title').text());
                body.find('input.txt-citizen-gender').val($(this).find('.gender').text());
                body.find('input.txt-citizen-tin').val($(this).find('.tin').text());
                body.find('input.txt-citizen-contact-num').val($(this).find('.contact-num').text());
                body.find('input.txt-citizen-emergency-person').val($(this).find('.emergency-person').text());
                body.find('input.txt-citizen-emergency-contact-num').val($(this).find('.emergency-contact-num').text());
            }
            else if(quickviewTitle == STR_QUICKVIEW_SEARCH_CORPORATE_OWNER) {
                activeSearchFormGroup.attr('data-id', $(this).attr('data-id'));
                var citizenAvatar = activeSearchFormGroup.find('.img-citizen-avatar');
                citizenAvatar.attr('src', $(this).find('.user-pic > img').attr('src'));
                citizenAvatar.attr('data-src', $(this).find('.user-pic > img').attr('data-src'));
                activeSearchFormGroup.find('.txt-corporate-owner-name').val($(this).find('.main-title').text());
                body.find('input.txt-corporate-owner-tin').val($(this).find('.tin').text());
                body.find('input.txt-corporate-owner-address').val($(this).find('.sub-title').text());
            }
            hideQuickview();
        }
        else if(quickviewTitle == STR_QUICKVIEW_SEARCH_BARANGAY) {
            activeSearchFormGroup.attr('data-id', $(this).attr('data-id'));
            activeSearchFormGroup.find('.txt-barangay-address').val($(this).find('.main-title').text() + ", " + $(this).find('.sub-title').text());
            hideQuickview();
        }
        else if(quickviewTitle == STR_QUICKVIEW_SEARCH_LINE_OF_BUSINESS) {
            activeSearchFormGroup.attr('data-id', $(this).attr('data-id'));
            activeSearchFormGroup.find('.txt-line-of-business').val($(this).find('.main-title').text());
            hideQuickview();
        }
    });

    // EVENT: #fileIMG INPUT FILE CHANGE
    body.delegate('#fileIMG', 'change', function() {
        var divQuickview = body.find('#quickview');
        var quickviewTitle = divQuickview.find('.quickview-title').html();
        var divOpac = divQuickview.find('.opac');
        var divLoader = divQuickview.find('.loader');
        var btnUploadBrowse = divQuickview.find('.btn-upload-browse');
        var btnUploadUpdate = divQuickview.find('.btn-upload-update');
        var uploadStatus = divQuickview.find('.upload-status');


        function showUploadLoader() {
            if(divOpac.hasClass('hidden'))
                divOpac.removeClass('hidden');
            if(divLoader.hasClass('hidden'))
                divLoader.removeClass('hidden');

            btnUploadBrowse.attr('for', '');
            var fas = btnUploadBrowse.find('.fas');
            if(fas.hasClass('fa-search')) {
                fas.removeClass('fa-search');
                fas.addClass('fa-circle-notch');
                fas.addClass('fa-spin');
            }

            btnUploadUpdate.prop('disabled', true);
            btnUploadUpdate.prop('attr', true);
        }

        function hideUploadLoader() {
            if(!divOpac.hasClass('hidden'))
                divOpac.addClass('hidden');
            if(!divLoader.hasClass('hidden'))
                divLoader.addClass('hidden');

            btnUploadBrowse.attr('for', 'fileIMG');
            var fas = btnUploadBrowse.find('.fas');
            if(fas.hasClass('fa-circle-notch')) {
                fas.removeClass('fa-circle-notch');
                fas.removeClass('fa-spin');
                fas.addClass('fa-search');
            }

            btnUploadUpdate.prop('disabled', false);
            btnUploadUpdate.prop('attr', false);
        }

        Pace.restart();
        showUploadLoader();
        $(this).parent().ajaxForm({
            beforeSend: function() {
                uploadStatus.html("TRANSFERRING <br>0%");
            },
            uploadProgress: function(event, position, total, percentComplete) {
                uploadStatus.html("TRANSFERRING <br>" + percentComplete.toString() + "%");
                if(percentComplete >= 100) {
                    uploadStatus.html("UPLOADING<br>PLEASE WAIT...");
                }
            },
            success: function(data) {
                var response = JSON.parse(data);
                if (response.error != '') {
                    showMessageDialog(response.error, '', function () {
                        window.location.reload();
                    });
                }
                else {
                    if (response.success.message != '') {
                        showMessageDialog(response.success.message, response.success.sub_message);
                        hideUploadLoader();
                    }
                    else {
                        var itemFilename = response.success.data;
                        if(itemFilename != '') {
                            var itemSrc = '';
                            if (quickviewTitle == STR_QUICKVIEW_UPLOAD_REQUIREMENT) {
                                itemSrc = index + 'img/reqs/' + itemFilename;
                            }
                            else if (quickviewTitle == STR_QUICKVIEW_UPLOAD_CORPORATE_OWNER_PHOTO) {
                                itemSrc = index + 'img/users/' + itemFilename;
                            }
                            var itemIMG = divQuickview.find('.item-img');
                            itemIMG.attr('src', itemSrc);
                            itemIMG.attr('data-src', itemFilename);

                            uploadStatus.html("FETCHING FILE<br>PLEASE WAIT...");
                            itemIMG.off();
                            itemIMG.one("load", function () {
                                var itemTXT = divQuickview.find('.txt-upload-filename');
                                itemTXT.val(response.success.data);

                                hideUploadLoader();
                            });
                        }
                        else
                            hideUploadLoader();
                    }
                }
            },
            error: function(data) {
                alert("UNABLE TO UPLOAD REQUIREMENT\n\nError " + data.status + " (" + data.statusText + ")");
                Pace.stop();
                hideUploadLoader();
                window.location.reload();
            }
        }).submit();
    });

    // EVENT: .btn-upload-cancel BUTTON CLICK
    body.delegate('.btn-upload-cancel', 'click', function() {
        var divQuickview = body.find('#quickview');
        if(divQuickview.find('.btn-upload-update').prop('disabled')) {
            showConfirmDialog('CANCELLING UPLOAD', '<span style="font-size: 1.2em">Are you sure to cancel the current upload operation?</span>');
            confirmYes(function() {
                hideConfirmDialog(function() {
                    hideQuickview();
                });
            });
        }
        else
            hideQuickview();
    });

    // EVENT: .btn-upload-clear BUTTON CLICK
    body.delegate('.btn-upload-clear', 'click', function() {
        var divQuickview = body.find('#quickview');
        var quickviewTitle = divQuickview.find('.quickview-title').html();
        var defaultDir = '';
        var defaultPhoto = '';
        if(quickviewTitle == STR_QUICKVIEW_UPLOAD_REQUIREMENT) {
            defaultDir = index + 'img/reqs/';
            defaultPhoto = '_.png';
        }
        else if(quickviewTitle == STR_QUICKVIEW_UPLOAD_CORPORATE_OWNER_PHOTO) {
            defaultDir = index + 'img/users/';
            defaultPhoto = '_.jpg';
        }

        var txtFilename = divQuickview.find('.txt-upload-filename');
        var imgItem = divQuickview.find('.item-img');

        txtFilename.val("");
        imgItem.attr('src', defaultDir + defaultPhoto);
        imgItem.attr('data-src', defaultPhoto);
    });

    // EVENT: .btn-upload-update BUTTON CLICK
    body.delegate('.btn-upload-update', 'click', function() {
        var divQuickview = body.find('#quickview');
        var quickviewTitle = divQuickview.find('.quickview-title').html();
        var fileName = divQuickview.find('.item-img').attr('data-src');
        if(quickviewTitle == STR_QUICKVIEW_UPLOAD_REQUIREMENT) {
            if(fileName == "_.png")
                fileName = "";
            activeUploadFormGroup.find('.txt-file-name').val(fileName);
        }
        else if(quickviewTitle == STR_QUICKVIEW_UPLOAD_CORPORATE_OWNER_PHOTO) {
            var itemIMG = activeUploadFormGroup.find('.img-item-avatar');
            itemIMG.attr('src', index + 'img/users/' + fileName);
            itemIMG.attr('data-src', fileName);
            itemIMG.parent().parent().parent().attr('data-id', '0');
        }
        hideQuickview();
    });
});