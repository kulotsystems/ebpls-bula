/**
 * admin/__main.js :: UI event handlers
 *
 */

$(function() {


    $('body').delegate('#cbo-fee-settings', 'change', function() {
        var cbo = $(this);
        var business_line_id = parseInt(cbo.val());

        Pace.restart();
        $.ajax({
            type: 'POST',
            url: index + 'php/ajax/business_lines.php',
            data: {
                get_fee_settings_for: business_line_id,
                fee_id: body.find('.content-tab-pane#tab' + tab).find('.card-main-item.active').attr('data-id')
            },
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
                        var o = generateBusinessFeeSettings(response.success.data);
                        var divGenerated = body.find('#generated-fees-settings');
                        divGenerated.html(o.h);
                        for(var i=0; i<o.v.length; i++) {
                            divGenerated.find(o.v[i][0]).val(o.v[i][1]);
                        }
                    }
                }
                Pace.stop();
            },
            error: function(data) {
                alert("UNABLE TO GET FEE SETTINGS\n\nError " + data.status + " (" + data.statusText + ")");
                Pace.stop();
            }
        });
    });



    // GET THE ACTIVE TAB
    activeSidebarMenuItem = body.find(".sidebar-menu-item.active");

    // INITIALIZE ITEMS CACHE
    arrMainItemsHTML = [];
    var sidebarMenuItems = $('.sidebar-menu-item');
    sidebarMenuItems.each(function(i) {
        var href = $(this).attr('data-href');
        arrMainItemsHTML.push({
            'href' : href,
            'tabs' : []
        });
    });


    // FUNCTION: SIDEBAR MENU CLICK HANDLER
    function sidebarMenuClick(e) {
        isFromTabClick = false;
        isFromMenuClick = true;
        function proceedSidebarClick() {
            var sidebar = e.parent();
            var prevMenuItem = sidebar.find('li.active');
            prevMenuItem.removeClass('active');
            prevMenuItem.find('.icon-thumbnail').removeClass('bg-success');
            e.addClass('active');
            e.find('.icon-thumbnail').addClass('bg-success');
            page = e.attr('data-href');
            tab = e.attr('data-tab');
            body.attr('data-page', page);
            activeSidebarMenuItem = e;
            if(!isLiveClick) {
                activeSidebarMenuItem.attr('data-tab-' + tab + '-active-item', item);
            }
            load();
        }

        // check for unsaved data first
        var divContentTab = body.find('.content-tab-pane#tab' + tab);
        var divItemContent = divContentTab.find('.item-content');
        var currentItemData = getFormState(divItemContent);
        if(currentItemData != "") {
            if(currentItemData != prevItemData) {
                // made changes to current item
                var tabTitle = activeContentTabItem.find('.tab-title').html();
                var h = "<div class='card social-card share no-margin no-border w-100 active'>" + divContentTab.find('.card-main-item.active').html() + "</div>";

                showConfirmDialog("SAVE CONFIRMATION", "<span style='font-size: 1.2em'>Do you want to save the changes you made to this item under " + tabTitle + "?</span>" + h + "<br>Your changes will be lost of you don't save it.");
                confirmYes(function() {
                    save(divContentTab.find('.btn-save-item'), function() {
                        sidebarMenuClick(e);
                    });
                    hideConfirmDialog();
                });
                confirmNo(function() {
                    proceedSidebarClick();
                });
            }
            else {
                // didn't made changes to current item
                proceedSidebarClick();
            }
        }
        else {
            proceedSidebarClick();
        }
    }


    // EVENT: SIDEBAR MENU CLICK
    sidebarMenuItems.on('click', function() {
        if(!$(this).hasClass('active')) {
            isLiveClick = true;
            sidebarMenuClick($(this));
        }
        else {
            if(window.innerWidth <= 991) {
                $('[data-pages="sidebar"]').data('pg.sidebar').toggleSidebar();
            }
        }
    });


    // EVENT: CLICK ACTIVE MENU ON PAGE LOAD
    if(activeSidebarMenuItem.length > 0) {
        isLiveClick = false;
        sidebarMenuClick(activeSidebarMenuItem);
    }


    // EVENT: BROWSER BACK OR FORWARD BUTTON
    window.onpopstate = function(event) {
        var arrWindowLocation = document.location.toString().split("?");
        page = 'home';
        tab = '1';
        item = '0';
        if(arrWindowLocation.length > 1) {
            var arrParameter = arrWindowLocation[1].split("=");
            var arrPage = arrParameter[0].split("_");
            if(arrPage.length > 1) {
                page = arrPage[0];
                tab = arrPage[1];
                if(arrPage.length > 2) {
                    item = arrPage[2];
                }
            }
        }

        var sidebarMenuItem = body.find(".sidebar-menu-item[data-href='" + page + "']");
        if(sidebarMenuItem.length < 1) {
            sidebarMenuItem = body.find(".sidebar-menu-item[data-href='home']");
        }
        sidebarMenuItem.attr('data-tab', tab);
        isLiveClick = false;
        sidebarMenuClick(sidebarMenuItem);
    };


    // EVENT: TAB CLICK
    body.delegate('.content-tab', 'click', function() {
        var t = $(this);
        if(!t.hasClass('active')) {
            isFromTabClick = true;
            function proceedTabClick() {
                activeContentTabItem = t;
                var arrHref = activeContentTabItem.attr('href').split("tab");
                tab = arrHref[1];
                var divContentTab = body.find(".content-tab-pane[id='tab" + tab + "']");
                if(activeContentTabItem.attr('data-identifier') != STR_TAB_DASHBOARD) {
                    divContentTab.find('.item-content').html("");
                }
                activeSidebarMenuItem = body.find(".sidebar-menu-item.active");
                if (activeSidebarMenuItem.length > 0) {
                    activeSidebarMenuItem.attr('data-tab', tab);
                    var activeItem = '1';
                    try {
                        activeItem = activeSidebarMenuItem.attr('data-tab-' + tab + '-active-item');
                    } catch (e) { }

                    var cardMainItem = divContentTab.find(".card-main-item[data-id='" + activeItem + "']");
                    if (cardMainItem.length > 0) {
                        setTimeout(function () {
                            //cardMainItem.click();
                            select(cardMainItem);
                            isLiveClick = true;
                            enumerate();
                        }, 100);
                    }
                    else {
                        var currentLocation = document.location.toString();
                        isLiveClick = true;
                        enumerate();
                        var newLocation = document.location.toString();
                        if (currentLocation == newLocation) {
                            history.pushState(null, null, "dashboard.php?" + page + "_" + tab);
                        }
                    }
                }
            }

            // check for unsaved data first
            var divContentTab = body.find('.content-tab-pane#tab' + tab);
            var divItemContent = divContentTab.find('.item-content');
            var currentItemData = getFormState(divItemContent);
            if (currentItemData != "") {
                if (currentItemData != prevItemData) {
                    // made changes to current item
                    save(divContentTab.find('.btn-save-item'), function () {
                        proceedTabClick();
                        prevItemData = currentItemData;
                    });
                }
                else {
                    // didn't made changes to current item
                    proceedTabClick();
                }
            }
            else {
                proceedTabClick();
            }
        }
    });


    // EVENT: ITEM CLICK
    body.delegate('.card-main-item', 'click', function() {
        if (!performedDBSearch) {
            var t = $(this);
            isFromTabClick = false;
            isFromMenuClick = false;
            function proceedCardMainItemClick() {
                isLiveClick = true;
                select(t);
                slideTabContent('left');
            }

            // check for unsaved data first
            var divContentTab = body.find('.content-tab-pane#tab' + tab);
            var divItemContent = divContentTab.find('.item-content');
            var currentItemData = getFormState(divItemContent);
            if (currentItemData != "") {
                if (currentItemData != prevItemData) {
                    // made changes to current item
                    save(divContentTab.find('.btn-save-item'), function () {
                        proceedCardMainItemClick();
                    });
                }
                else {
                    // didn't made changes to current item
                    proceedCardMainItemClick();
                }
            }
            else {
                proceedCardMainItemClick();
            }
        }
    });


    // EVENT: BACK TO ITEMS (on WindowWidth <= 767)
    body.delegate('.btn-back-to-items', 'click', function() {
        showPaneLeftCol();
        slideTabContent('right');
    });


    // EVENT: NEW BUTTON CLICK
    body.delegate('.btn-new-item', 'click', function() {
        if(!performedDBSearch) {
            create($(this));
        }
    });


    // EVENT: SEARCH BUTTON CLICK
    body.delegate('.btn-search-item', 'click', function() {
        search($(this));
    });


    // EVENT: SAVE BUTTON CLICK
    body.delegate('.btn-save-item', 'click', function() {
        if(!performedDBSearch) {
            save($(this));
        }
    });


    // EVENT: SUBMIT BUTTON CLICK
    body.delegate('.btn-submit-item', 'click', function() {
        if(!performedDBSearch) {
            submitItem($(this));
        }
    });


    // EVENT: DELETE BUTTON CLICK
    body.delegate('.btn-delete-item', 'click', function() {
        if(!performedDBSearch) {
            remove($(this));
        }
    });


    // EVENT: PRINT BUTTON CLICK
    body.delegate('.btn-print-item', 'click', function() {
        if(!performedDBSearch) {
            print($(this));
        }
    });


    // EVENT: PRINT INVOICE BUTTON CLICK
    body.delegate('.btn-print-invoice', 'click', function() {
        var divContentTab = body.find('.content-tab-pane#tab' + tab);
        var ifrInvoice = divContentTab.find('#ifrInvoice');
        var contentWindow = ifrInvoice[0].contentWindow;
        contentWindow.focus();
        contentWindow.print();
    });

    // EVENT: FIND IN PAGE KEYUP
    var tmrFindInPage = null;
    var foundClass = "el-found";
    var highlightClass = "el-highlight";
    var currentKeyword  = '';

    var totalFound = 0;
    var highlightCTR = 0;

    body.delegate('.txt-find-in-page', 'keyup', function(e) {
        var str = $(this).val();
        if(e.keyCode == 40) {
            // arrow down
            highlightNext();
            focusEnd($(this));
        }
        else if(e.keyCode == 38) {
            // up arrow
            highlightPrev();
            focusEnd($(this));
        }
        else if(e.keyCode == 13) {
            // enter
            var divContentTab = body.find('.content-tab-pane#tab' + tab);
            var divItemContent = divContentTab.find('.item-content');
            if(divItemContent.find('.' + foundClass).length > 0)
                highlightNext();
            else {
                findInPage(str);
            }
            focusEnd($(this));
        }
        else {
            if (tmrFindInPage != null) {
                clearTimeout(tmrFindInPage);
            }
            tmrFindInPage = setTimeout(function () {
                findInPage(str);
            }, 320);
        }
    });
    function findInPage(str) {
        var divContentTab = body.find('.content-tab-pane#tab' + tab);
        var divItemContent = divContentTab.find('.item-content');
        if (divItemContent != null) {
            if (divItemContent.length > 0) {
                // un-highlight any previous keywords
                if (currentKeyword != '') {
                    divItemContent.unhighlight({className: foundClass});
                    divItemContent.unhighlight({className: highlightClass});
                }

                currentKeyword = str;
                divItemContent.highlight(str, {className: foundClass});

                totalFound = divItemContent.find('.' + foundClass).length;

                highlightCTR = 0;
                doHighlight();
            }
        }
    }
    function highlightPrev() {
        highlightCTR -= 1;
        if(highlightCTR < 0) {
            if(totalFound > 0)
                highlightCTR = totalFound - 1;
            else
                highlightCTR = 0;
        }
        doHighlight();
    }
    function highlightNext() {
        highlightCTR += 1;
        if(highlightCTR >= totalFound) {
            highlightCTR = 0;
        }
        doHighlight();
    }
    function doHighlight() {
        var divContentTab = body.find('.content-tab-pane#tab' + tab);
        var divItemContent = divContentTab.find('.item-content');
        var foundElements = divItemContent.find('.' + foundClass);
        foundElements.each(function(i) {
            if(i == highlightCTR) {
                if(!$(this).hasClass('el-highlight')) {
                    $(this).addClass('el-highlight');
                }
                divItemContent.css({'scroll-behavior':'unset'});
                scrollToEl(divItemContent, $(this), 35);
                divItemContent.css({'scroll-behavior':'smooth'});
            }
            else {
                if($(this).hasClass('el-highlight')) {
                    $(this).removeClass('el-highlight');
                }
            }
        });
    }


    // EVENT: FORM MAIN TITLE FOCUS
    body.delegate('input.item-main-title', 'focus', function() {
        if(!$(this).hasClass('system-log')) {
            var val = $(this).val().trim();
            if (val.indexOf("[") >= 0 && val.indexOf("]") >= 0)
                $(this).val("");
        }
    });


    // EVENT: TOGGLE PASSWORD BUTTON CLICK
    body.delegate('.btn-toggle-password', 'click', function() {
        var btn = $(this);
        var txtPassword = btn.parent().parent().find("input");
        var fa = btn.find('.fa');
        if(fa.hasClass('fa-eye-slash')) {
            // show password
            fa.removeClass('fa-eye-slash');
            fa.addClass('fa-eye');
            txtPassword.attr('type', 'text');
        }
        else {
            // hide password
            fa.removeClass('fa-eye');
            fa.addClass('fa-eye-slash');
            txtPassword.attr('type', 'password');
        }
        if(window.innerWidth > 767) {
            var strLength = txtPassword.val().length * 2;
            txtPassword.focus();
            txtPassword[0].setSelectionRange(strLength, strLength);
        }
    });


    // EVENT: TOGGLE DETAILS CBO CHANGE
    body.delegate('select[cbo-toggle-details]', 'change', function() {
        displayCBODetails($(this));
    });


    // EVENT: .chk-toggle-all SWITCHERY CHECKBOX TOGGLE
    var isOneChkToggled = false;
    body.delegate('[data-toggle-all-chk]', 'change', function() {
        if(!isOneChkToggled) {
            var bool = $(this).prop('checked');
            body.find($(this).attr('data-toggle-all-chk')).each(function () {
                if ($(this).prop('checked') != bool) {
                    $(this).click();
                }
            });
        }
    });


    // EVENT: .chk-toggle-one SWITCHERY CHECKBOX TOGGLE
    body.delegate('[data-toggle-one-chk]', 'change', function() {
        isOneChkToggled = true;
        var bool = $(this).prop('checked');
        var chkTarget = body.find("[data-toggle-all-chk='" + $(this).attr('data-toggle-one-chk') + "']");

        // check other siblings
        var totalChecked = 0;
        var allChk = body.find("[data-toggle-one-chk='" + $(this).attr('data-toggle-one-chk') + "']");
        var totalChk = allChk.length;
        allChk.each(function(i) {
            if($(this).prop('checked'))
                totalChecked += 1;
        });

        if(totalChecked == totalChk) {
            if(!chkTarget.prop('checked')) {
                if(chkTarget.prop('disabled')) {
                    chkTarget.next().remove();
                    chkTarget.attr('checked', true);
                    chkTarget.prop('checked', true);
                    chkTarget.attr('data-switchery', false);
                    chkTarget.attr('data-init-plugin', 'switchery');
                    chkTarget.attr('data-size', 'small');
                    chkTarget.attr('data-color', 'success');
                    var switchery = new Switchery(chkTarget[0], {
                        color: (chkTarget.data("color") != null ?  $.Pages.getColor(chkTarget.data("color")) : $.Pages.getColor('success')),
                        size : (chkTarget.data("size") != null ?  chkTarget.data("size") : "default")
                    });
                }
                else {
                    chkTarget.click();
                }
            }
        }
        else {
            if(chkTarget.prop('checked')) {
                if(chkTarget.prop('disabled')) {
                    chkTarget.next().remove();
                    chkTarget.attr('checked', false);
                    chkTarget.prop('checked', false);
                    chkTarget.attr('data-switchery', false);
                    chkTarget.attr('data-init-plugin', 'switchery');
                    chkTarget.attr('data-size', 'small');
                    chkTarget.attr('data-color', 'success');
                    var switchery = new Switchery(chkTarget[0], {
                        color: (chkTarget.data("color") != null ?  $.Pages.getColor(chkTarget.data("color")) : $.Pages.getColor('success')),
                        size : (chkTarget.data("size") != null ?  chkTarget.data("size") : "default")
                    });
                }
                else {
                    chkTarget.click();
                }
            }
        }
        isOneChkToggled = false;
    });


    // EVENT: .txt-amount FOCUS (FORMAT IN CURRENCY)
    body.delegate('.txt-amount', 'focus', function() {
        var v = removeCommas($(this).val());
        if(v <= 0) {
            $(this).val("");
        }
    });


    // EVENT: .txt-amount BLUR (FORMAT IN CURRENCY)
    body.delegate('.txt-amount', 'blur', function() {
        var v = removeCommas($(this).val());
        v = applyCommas(v.toFixed(2));
        $(this).val(v);
    });


    // EVENT: .txt-amount KEYUP
    body.delegate('.txt-amount', 'keyup', function(e) {
        if(e.keyCode == 13) {
            $(this).blur();
        }
    });


    // EVENT: .txt-int FOCUS (FORMAT IN WHOLE NUMBER)
    body.delegate('.txt-int', 'focus', function() {
        var v = removeCommas($(this).val());
        if(v <= 0) {
            $(this).val("");
        }
    });


    // EVENT: .txt-int BLUR (FORMAT IN WHOLE NUMBER)
    body.delegate('.txt-int', 'blur', function() {
        var v = parseInt(removeCommas($(this).val()));
        if(v == undefined || v != v)
            v = 0;
        $(this).val(applyCommas(v.toString(), true));
    });


    // EVENT: .cbo-color CBO CHANGE
    body.delegate('select.cbo-color', 'change', function() {
        applyCboColor($(this));
    });


    // EVENT: input[data-toggle-all-txt] KEYUP
    body.delegate('input[data-toggle-all-txt]', 'keyup', function() {
        performToggleAllTxt($(this));
    });
    function performToggleAllTxt(e) {
        var v = removeCommas(e.val().trim());
        body.find(e.attr('data-toggle-all-txt') + '[data-toggle-one-txt]').each(function() {
            $(this).val(applyCommas(v));
        });
    }


    // EVENT: input[data-toggle-one-txt] KEYUP
    body.delegate('input[data-toggle-one-txt]', 'keyup', function() {
        performToggleOneTxt($(this));
    });
    function performToggleOneTxt(e) {
        var txtTarget = body.find(e.attr('data-toggle-one-txt') + '[data-toggle-all-txt]');
        var arrAllValues = [];
        body.find(txtTarget.attr('data-toggle-all-txt') + '[data-toggle-one-txt]').each(function() {
            arrAllValues.push(removeCommas($(this).val().trim()));
        });
        if(arrayUnique(arrAllValues).length == 1) {
            txtTarget.val(applyCommas(arrAllValues[0]));
        }
        else {
            txtTarget.val('');
        }
    }

    // EVENT: select[data-toggle-all-cbo] CHANGE
    var isOneCboChanged = false;
    body.delegate('select[data-toggle-all-cbo]', 'change', function() {
        if(!isOneCboChanged)
            performToggleAllCbo($(this));
    });
    function performToggleAllCbo(e) {
        var v = e.val();
        if(v != '') {
            body.find(e.attr('data-toggle-all-cbo') + '[data-toggle-one-cbo]').each(function () {
                $(this).val(v).change();
            });
        }
    }

    // EVENT: select[data-toggle-one-cbo] CHANGE
    body.delegate('select[data-toggle-one-cbo]', 'change', function() {
        isOneCboChanged = true;
        performToggleOneCbo($(this));
        isOneCboChanged = false;
    });
    function performToggleOneCbo(e) {
        var cboTarget = body.find(e.attr('data-toggle-one-cbo') + '[data-toggle-all-cbo]');
        var arrAllValues = [];
        body.find(cboTarget.attr('data-toggle-all-cbo') + '[data-toggle-one-cbo]').each(function() {
            arrAllValues.push($(this).val());
        });
        if(arrayUnique(arrAllValues).length == 1) {
            cboTarget.val(arrAllValues[0]).change();
        }
        else {
            cboTarget.val('').change();
        }
    }

    // EVENT: input[data-update-el-on-keyup] KEYUP, BLUR
    body.delegate('input[data-update-el-on-keyup]', 'keyup', function() {
        performElDataUpdate($(this));
    });
    body.delegate('input[data-update-el-on-keyup]', 'blur', function() {
        performElDataUpdate($(this));
    });
    function performElDataUpdate(e) {
        var str = e.val().trim();
        var divTarget = body.find(e.attr('data-update-el-on-keyup'));
        if(divTarget != null) {
            divTarget.each(function(i) {
                divTarget.html(str);
            });
        }
    }

    // EVENT: select.cbo-fee-status CHANGE
    body.delegate('select.cbo-fee-status', 'change', function() {
        var v = $(this).val();
        var p = $(this).parent().parent();
        var formGroupFeeAmount = p.find('.form-group-fee-amount');
        var formGroupBusinessSizeFeeAmount = p.find('.form-group-business-size-fee-amount');

        function showFeeAmount() {
            if(formGroupFeeAmount.hasClass('hidden')) {
                formGroupFeeAmount.removeClass('hidden');
            }
        }
        function hideFeeAmount() {
            if(!formGroupFeeAmount.hasClass('hidden')) {
                formGroupFeeAmount.addClass('hidden');
            }
        }
        function showBusinessSizeFeeAmount() {
            formGroupBusinessSizeFeeAmount.each(function(i) {
                if($(this).hasClass('hidden')) {
                    $(this).removeClass('hidden');
                }
            });
        }
        function hideBusinessSizeFeeAmount() {
            formGroupBusinessSizeFeeAmount.each(function(i) {
                if(!$(this).hasClass('hidden')) {
                    $(this).addClass('hidden');
                }
            });
        }

        if(v == '' || v == '1') {
            hideFeeAmount();
            hideBusinessSizeFeeAmount();
        }
        else if(v == '2') {
            showFeeAmount();
            hideBusinessSizeFeeAmount();
        }
        else if(v == '3') {
            hideFeeAmount();
            showBusinessSizeFeeAmount();
        }
        else if(v == '4' || v == '5') {
            showFeeAmount();
            hideBusinessSizeFeeAmount();
        }

    });

    // EVENT: .btn-new-bracket CLICK
    body.delegate('.btn-new-bracket', 'click', function() {
        var divAssetBrackets = $(this).parent().parent().parent().parent().parent().find('.div-asset-brackets');
        var cboTaxStatus = divAssetBrackets.parent().find('.cbo-tax-status');
        var cboTaxStatusVal = cboTaxStatus.val();
        var optTaxStatus = cboTaxStatus.find('option');
        var arrTaxVariables = [];
        var defaulTaxVarID = '0';
        for(var i=0; i<optTaxStatus.length; i++) {
            var optVal = optTaxStatus[i].value;
            var optText = optTaxStatus[i].text;
            if(optVal != '1' && optVal != '2') {
                arrTaxVariables.push({
                    id: optVal,
                    formula: optText
                });
            }
            if(i == 0) {
                defaulTaxVarID = optVal;
            }
        }
        if (cboTaxStatusVal == '9')
            defaulTaxVarID = '5';
        else if(cboTaxStatusVal != '1' && cboTaxStatusVal != '2') {
            defaulTaxVarID = cboTaxStatusVal;
        }

        divAssetBrackets.append(generateAssetBracket({
            bracketID: '-1',
            assetMinimum: 0,
            assetMaximum: 0,
            taxAmount: 0,
            isByPercentage: 0,
            percentage: 0,
            perTaxVariableID: cboTaxStatusVal,
            ofTaxVariableID: defaulTaxVarID,
            inExcessOf: 0,
            additionalAmount: 0,
            objTaxVariables: arrTaxVariables
        }, false));

        renderSwitcheryCheckboxes();
        $(this).blur();

        var divItemContent = body.find('.content-tab-pane#tab' + tab).find('.item-content');
        scrollToEl(divItemContent, $(this), 150);
    });

    // EVENT: .btn-remove-bracket CLICK
    body.delegate('.btn-remove-bracket', 'click', function() {
        var parentFormGroupAttached = $(this).parent().parent().parent();
        function removeFormGroupAttached() {
            parentFormGroupAttached.fadeOut(320, function() {
                parentFormGroupAttached.remove();
            });
        }
        if(parentFormGroupAttached.find('.form-group-tax-bracket').attr('data-id') == '-1')
            removeFormGroupAttached();
        else {
            var parentDivAssetBracket = parentFormGroupAttached.parent();
            var applicationType = parentDivAssetBracket.attr('data-application-type');
            var businessLineTitle = activeCardMainItem.find('.main-title').text();
            var formGroupHTML = "<div class='form-group-attached active'><div class='form-input-group'>" + parentFormGroupAttached.find('.form-main-data').html() + "</div></div>";
            showConfirmDialog("CONFIRM REMOVAL", "<span style='font-size: 1.2em'>Are you sure you want to remove the following <span class='text-success'>" + applicationType + "</span> TAX Bracket for <span class='text-info'>" + businessLineTitle + "</span>?</span><br><br>" + formGroupHTML);
            body.find('#confirm-dialog').find('input').each(function () {
                $(this).prop('disabled', true);
                $(this).attr('disabled', true);
                $(this).prop('readonly', true);
                $(this).attr('readonly', true);
            });
            confirmYes(function () {
                hideConfirmDialog(function () {
                    removeFormGroupAttached();
                });
            });
        }
    });

    // EVENT: select.cbo-tax-status CHANGE
    body.delegate('select.cbo-tax-status', 'change', function() {
        var v = $(this).val();
        var p = $(this).parent().parent().parent().parent();
        var divAmountFixed = p.find('.div-amount-fixed');
        var divAssetBrackets = p.find('.div-asset-brackets');
        var divAddBracket = p.find('.div-add-bracket');

        function showTaxAmount() {
            if(divAmountFixed.hasClass('hidden')) {
                divAmountFixed.removeClass('hidden');
            }
        }

        function hideTaxAmount() {
            if(!divAmountFixed.hasClass('hidden')) {
                divAmountFixed.addClass('hidden');
            }
        }

        function showTaxBrackets() {
            if(divAssetBrackets.hasClass('hidden')) {
                divAssetBrackets.removeClass('hidden');
            }
            if(divAddBracket.hasClass('hidden')) {
                divAddBracket.removeClass('hidden');
            }
        }

        function hideTaxBrackets() {
            if(!divAssetBrackets.hasClass('hidden')) {
                divAssetBrackets.addClass('hidden');
            }
            if(!divAddBracket.hasClass('hidden')) {
                divAddBracket.addClass('hidden');
            }
        }

        if(v == '2') {
            showTaxAmount();
            hideTaxBrackets();
        }
        else if(v == '3' || v == '4' || v == '5' || v == '6' || v == '9') {
            hideTaxAmount();
            showTaxBrackets();

            if(v == '9') {
                divAssetBrackets.find('.label-label').each(function(i) {
                    $(this).removeClass('text-primary');
                    $(this).removeClass('text-info');
                    $(this).addClass('text-info');

                    var spAssetLabel = $(this).find('.sp-asset-label');
                    if(spAssetLabel.length > 0) {
                        spAssetLabel.html("UNIT");
                    }
                });

                divAssetBrackets.find('.input-group-currency').each(function(i) {
                    if(!$(this).hasClass('input-group-currency-lock')) {
                        var spAddOn = $(this).find('.input-group-addon');
                        if (!spAddOn.hasClass('hidden')) {
                            spAddOn.addClass('hidden');
                        }
                    }
                });
            }
            else {
                divAssetBrackets.find('.label-label').each(function(i) {
                    $(this).removeClass('text-info');
                    $(this).removeClass('text-primary');
                    $(this).addClass('text-primary');

                    var spAssetLabel = $(this).find('.sp-asset-label');
                    if(spAssetLabel.length > 0) {
                        spAssetLabel.html("ASSET");
                    }
                });

                divAssetBrackets.find('.input-group-currency').each(function(i) {
                    var spAddOn = $(this).find('.input-group-addon');
                    if(spAddOn.hasClass('hidden')) {
                        spAddOn.removeClass('hidden');
                    }
                    var txtAmount = $(this).find('.txt-amount');
                    txtAmount.removeClass('text-right');
                    txtAmount.removeClass('text-left');
                    txtAmount.addClass('text-left');
                });
            }
        }
        else {
            hideTaxAmount();
            hideTaxBrackets();
        }

    });

    // EVENT: .label-opt CLICK
    body.delegate('.label-opt', 'click', function() {
        if(!$(this).hasClass('badge-success')) {
            var str = $(this).text().trim();
            var ref = $(this).attr('data-ref');
            body.find('.label-opt').each(function() {
                if(ref == $(this).attr('data-ref')) {
                    var p = $(this).parent().parent();
                    var t = p.find('input');
                    if (str == $(this).text().trim()) {
                        $(this).addClass('badge');
                        $(this).addClass('badge-success');
                        t.val(p.attr('data-' + str));
                    }
                    else {
                        $(this).removeClass('badge');
                        $(this).removeClass('badge-success');
                    }
                }
            });
        }
        renderDatePickers();
    });

    // EVENT: .txt-opt KEYUP
    body.delegate('.txt-opt', 'keyup', function() {
        updateLabelOptValue($(this));
    });

    // EVENT: .date-opt CHANGE
    body.delegate('.date-opt', 'change', function() {
        updateLabelOptValue($(this));
    });

    // FUNCTION: update .label-opt's from group data
    function updateLabelOptValue(e) {
        var v = e.val().trim();
        var p = e.parent();
        p.find('.label-opt').each(function(i) {
            if($(this).hasClass('badge-success')) {
                var str = $(this).text().trim();
                p.attr('data-' + str, v);
                return 0;
            }
        });
    }

    // EVENT: .data-toggle-visibility CHANGE
    body.delegate('input[data-toggle-visibility]', 'change', function() {
        var divTargets = body.find($(this).attr('data-toggle-visibility'));
        if($(this).prop('checked')) {
            // show targets
            divTargets.each(function(i) {
                $(this).removeClass('hidden');
            });
        }
        else {
            // hide targets
            divTargets.each(function(i) {
                if(!$(this).hasClass('hidden')) {
                    $(this).addClass('hidden');
                }
            });
        }
    });

    // EVENT: .data-on-show-div CHANGE
    body.delegate('input[data-on-show-div]', 'change', function() {
        var onShowDiv = body.find($(this).attr('data-on-show-div'));
        var offShowDiv = body.find($(this).attr('data-off-show-div'));

        if($(this).prop('checked')) {
            if(onShowDiv.hasClass('hidden')) {
                onShowDiv.removeClass('hidden');
                offShowDiv.addClass('hidden');
            }

        }
        else {
            if(offShowDiv.hasClass('hidden')) {
                offShowDiv.removeClass('hidden');
                onShowDiv.addClass('hidden');
            }
        }
    });


    // EVENT: FORM GROUP CITIZEN BTN SEARCH CLICK
    body.delegate('.form-group-citizen .btn-citizen-search', 'click', function() {
        $(this).blur();
        activeSearchFormGroup = $(this).parent().parent();
        showQuickview(STR_QUICKVIEW_SEARCH_CITIZEN);
    });


    // EVENT: FORM GROUP CORPORATE OWNER BTN SEARCH CLICK
    body.delegate('.form-group-corporate-owner .btn-corporate-owner-search', 'click', function() {
        $(this).blur();
        activeSearchFormGroup = $(this).parent().parent().parent();
        showQuickview(STR_QUICKVIEW_SEARCH_CORPORATE_OWNER);
    });


    // EVENT: FORM GROUP CORPORATE OWNER UPLOAD PHOTO CLICK
    body.delegate('.form-group-corporate-owner .btn-corporate-owner-upload-photo', 'click', function() {
        $(this).blur();
        activeUploadFormGroup = $(this).parent().parent().parent();
        showQuickview(STR_QUICKVIEW_UPLOAD_CORPORATE_OWNER_PHOTO);
    });


    // EVENT: FORM GROUP BARANGAY BTN SEARCH CLICK
    body.delegate('.form-group-barangay .btn-barangay-search', 'click', function() {
        $(this).blur();
        activeSearchFormGroup = $(this).parent().parent();
        showQuickview(STR_QUICKVIEW_SEARCH_BARANGAY);
    });


    // EVENT: FORM GROUP LINE OF BUSINESS BTN SEARCH CLICK
    body.delegate('.form-group-line-of-business .btn-line-of-business-search', 'click', function() {
        $(this).blur();
        activeSearchFormGroup = $(this).parent().parent().parent();
        showQuickview(STR_QUICKVIEW_SEARCH_LINE_OF_BUSINESS);
    });

    // EVENT: ADD LINE OF BUSINESS BTN CLICK
    body.delegate('.btn-line-of-business-add', 'click', function() {
        $(this).blur();
        var applicationType = $(this).attr('data-application-type');
        var objBusActivity = generateBusinessActivity(applicationType, {}, false);
        var divBusActivities = body.find('.div-bus-activities');
        divBusActivities.append(objBusActivity.h);
        if(busActivityCtr != null) {
            for(var x=0; x<objBusActivity.v.length; x++) {
                if(objBusActivity.v[x][0] == ".txt-units-" + (busActivityCtr-1).toString()) {
                    divBusActivities.find(".txt-units-" + (busActivityCtr-1).toString()).val(objBusActivity.v[x][1]);
                }

                if(applicationType == 'NEW') {
                    if(objBusActivity.v[x][0] == ".txt-capitalization-" + (busActivityCtr-1).toString())
                        divBusActivities.find(".txt-capitalization-" + (busActivityCtr-1).toString()).val(objBusActivity.v[x][1]);
                }
                else {
                    if(objBusActivity.v[x][0] == ".txt-gross-sales-essential-" + (busActivityCtr-1).toString())
                        divBusActivities.find(".txt-gross-sales-essential-" + (busActivityCtr-1).toString()).val(objBusActivity.v[x][1]);
                    else if(objBusActivity.v[x][0] == ".txt-gross-sales-non-essential-" + (busActivityCtr-1).toString())
                        divBusActivities.find(".txt-gross-sales-non-essential-" + (busActivityCtr-1).toString()).val(objBusActivity.v[x][1]);
                }
            }
        }
        var divItemContent = body.find('.content-tab-pane#tab' + tab).find('.item-content');
        scrollToBottom(divItemContent);
    });

    // EVENT: REMOVE LINE OF BUSINESS BTN CLICK
    body.delegate('.btn-line-of-business-remove', 'click', function() {
        $(this).blur();
        var parentFormGroupAttached = $(this).parent().parent().parent().parent().parent().parent();
        function removeFormGroupAttached() {
            parentFormGroupAttached.fadeOut(320, function() {
                parentFormGroupAttached.remove();
            });
        }
        if(parseInt(parentFormGroupAttached.find('.form-group-line-of-business').attr('data-id')) <= 0)
            removeFormGroupAttached();
        else {
            var lineOfBusiness = parentFormGroupAttached.find('.txt-line-of-business').val();
            var formGroupHTML = "<div class='form-group-attached active'><div class='form-group form-group-default input-group'>" + parentFormGroupAttached.find('.form-group-line-of-business').html() + "</div></div>";
            showConfirmDialog("CONFIRM REMOVAL", "<span style='font-size: 1.2em'>Are you sure you want to remove the following line of business from this application?</span><br><br>" + formGroupHTML);
            body.find('#confirm-dialog').find('.txt-line-of-business').val(lineOfBusiness);
            body.find('#confirm-dialog').find('input').each(function () {
                $(this).prop('disabled', true);
                $(this).attr('disabled', true);
                $(this).prop('readonly', true);
                $(this).attr('readonly', true);
            });
            body.find('#confirm-dialog').find('button').each(function () {
                if ($(this).attr('id') != 'btnConfirmNo' && $(this).attr('id') != 'btnConfirmYes') {
                    $(this).hide();
                }
            });
            confirmYes(function () {
                hideConfirmDialog(function () {
                    removeFormGroupAttached();
                });
            });
        }
    });

    // EVENT: FORM GROUP REQUIREMENT BTN UPLOAD CLICK
    body.delegate('.form-group-requirement-upload .btn-upload-requirement', 'click', function() {
        $(this).blur();
        activeUploadFormGroup = $(this).parent().parent();
        showQuickview(STR_QUICKVIEW_UPLOAD_REQUIREMENT);
    });


    // EVENT: FORM GROUP REQUIREMENT BTN VIEW CLICK
    body.delegate('.form-group-requirement-upload .btn-view-requirement', 'click', function() {
        $(this).blur();
        activeUploadFormGroup = $(this).parent().parent();
        showQuickview(STR_QUICKVIEW_VIEW_REQUIREMENT);
    });


    // EVENT: SWITCH LOCK TOGGLE (.btn-lock-switch)
    body.delegate('.btn-lock-switch', 'click', function() {
        var arrTargets = body.find($(this).attr('data-target'));
        var fa = $(this).find('.fa');
        var chk = null;

        if(fa.hasClass('fa-lock')) {
            // UNLOCK
            fa.removeClass('fa-lock');
            fa.addClass('fa-unlock');

            arrTargets.each(function(i) {
                chk = $(this);
                chk.next().remove();
                chk.attr('disabled', false);
                chk.attr('data-switchery', false);
                chk.attr('data-init-plugin', 'switchery');
                chk.attr('data-size', 'small');
                chk.attr('data-color', 'success');
                var switchery = new Switchery(chk[0], {
                    color: (chk.data("color") != null ?  $.Pages.getColor(chk.data("color")) : $.Pages.getColor('success')),
                    size : (chk.data("size") != null ?  chk.data("size") : "default")
                });
            });
        }
        else {
            // LOCK
            fa.removeClass('fa-unlock');
            fa.addClass('fa-lock');

            arrTargets.each(function(i) {
                chk = $(this);
                chk.next().remove();
                chk.attr('disabled', true);
                chk.attr('data-switchery', false);
                chk.attr('data-init-plugin', 'switchery');
                chk.attr('data-size', 'small');
                chk.attr('data-color', 'success');
                var switchery = new Switchery(chk[0], {
                    color: (chk.data("color") != null ?  $.Pages.getColor(chk.data("color")) : $.Pages.getColor('success')),
                    size : (chk.data("size") != null ?  chk.data("size") : "default")
                });
            });
        }
    });

    // EVENT: DIV LOCK TOGGLE (.btn-lock-div)
    body.delegate('.btn-lock-div', 'click', function() {
        var arrTargets = body.find($(this).attr('data-target'));
        var fa = $(this).find('.fa');
        var chk = null;

        if(fa.hasClass('fa-lock')) {
            // UNLOCK
            fa.removeClass('fa-lock');
            fa.addClass('fa-unlock');

            arrTargets.each(function(i) {
                var inputs = $(this).find('select, input');
                inputs.each(function(i) {
                    $(this).attr('disabled', false);
                    $(this).prop('disabled', false);
                    $(this).attr('readonly', false);
                    $(this).prop('readonly', false);
                });
            });
        }
        else {
            // LOCK
            fa.removeClass('fa-unlock');
            fa.addClass('fa-lock');

            arrTargets.each(function(i) {
                var inputs = $(this).find('select, input');
                inputs.each(function(i) {
                    $(this).attr('disabled', true);
                    $(this).prop('disabled', true);
                    $(this).attr('readonly', true);
                    $(this).prop('readonly', true);
                });
            });
        }
    });

    // EVENT: .cbo-business-type CHANGE
    body.delegate('.cbo-business-type', 'change', function() {
        var formGroupTrade = body.find('.form-group-trade');
        if($(this).val() == '1') {
            if(!formGroupTrade.hasClass('hidden')) {
                formGroupTrade.addClass('hidden');
            }
        }
        else {
            if(formGroupTrade.hasClass('hidden')) {
                formGroupTrade.removeClass('hidden');
                var txtTradeName = formGroupTrade.find('.txt-trade-name');
                if(txtTradeName.length > 0) {
                    txtTradeName.select();
                    txtTradeName.focus();
                }
            }
        }
    });

    // EVENT: .btn-group-dashboard-period > button CLICK
    body.delegate('.btn-group-dashboard-period > button', 'click', function() {
        var btnPeriod = $(this);
        if(!btnPeriod.hasClass('btn-success')) {
            var btnGroupDashboardPeriod = btnPeriod.parent();
            btnGroupDashboardPeriod.find('button').each(function() {
                disableButton($(this), true);
            });

            btnGroupDashboardPeriod.find('.btn-success').removeClass('btn-success');
            btnPeriod.removeClass('btn-default');
            btnPeriod.addClass('btn-success');
            btnPeriod.blur();

            var fas = btnPeriod.find('.fas');
            if(!fas.hasClass('fa-spin')) {
                fas.removeClass('fa-' + btnPeriod.attr('data-fa-icon'));
                fas.addClass('fa-circle-notch');
                fas.addClass('fa-spin');
            }

            renderGraphData();
        }
    });

    // EVENT :: .btn-generate-report CLICK
    body.delegate('.btn-generate-report', 'click', function() {
        var reportID = activeCardMainItem.attr('data-id');
        var dateFrom = body.find('.txt-from-date').val();
        var dateTo   = body.find('.txt-to-date').val();
        window.open('report.php?r=' + reportID + '&from=' + dateFrom + '&to=' + dateTo, '_blank');
    });
});