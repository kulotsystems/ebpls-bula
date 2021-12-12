/**
 * SELECT ITEM
 * Prepare the contents of $('.item-content') depending on the active item
 * @param  {node} e [the active $('.card-main-item') element]
 */
function select(e) {
    // set active item
    activeCardMainItem = e;

    // clear prevItemData
    prevItemData = '';

    // get active menu, active tab, and active item details
    var sidebarMenuHref = activeSidebarMenuItem.attr('data-href');
    var tabHref = activeContentTabItem.attr('href');
    var tabTitle = activeContentTabItem.find('.tab-title').html();
    var tabIdentifier = activeContentTabItem.attr('data-identifier');
    var itemTitle = activeCardMainItem.find('.main-title').text();
    var itemID = activeCardMainItem.attr('data-id');

    // make this item appear active
    activeCardMainItem.parent().find('.card-main-item.active').removeClass('active');
    activeCardMainItem.addClass('active');

    // on mobile view :: hide the left pane
    if(window.innerWidth <= 767) {
        if(isLiveClick && !isFromTabClick) {
            hidePaneLeftCol();
        }
    }

    // update URL
    if(isLiveClick) {
        var currentPath = "";
        var arrCurrentLocation = window.location.toString().split("dashboard.php");
        if(arrCurrentLocation.length > 1)
            currentPath = arrCurrentLocation[1];

        var newPath = "?" + page + "_" + tab + "_" + itemID;
        if(currentPath != newPath) {
            history.pushState(null, null, "dashboard.php" + newPath);
        }
    }

    // update document title
    document.title = app + " | " + activeSidebarMenuItem.find('.sidebar-menu-item-title').text() + " (" + activeContentTabItem.text().trim() + " : " + itemTitle + ")";

    // update data-tab-#-active-item
    activeSidebarMenuItem.attr('data-tab-' + tab + '-active-item', itemID);

    // cache control elements
    var divContentTab = body.find('.content-tab-pane#tab' + tab);
	var btnNew = divContentTab.find('.btn-new-item');
    var btnSearch = divContentTab.find('.btn-search-item');
    var btnSave = divContentTab.find('.btn-save-item');
    var btnSubmit = divContentTab.find('.btn-submit-item');
    var btnDelete = divContentTab.find('.btn-delete-item');
    var btnPrint = divContentTab.find('.btn-print-item');
    var txtFindInPage = divContentTab.find('.txt-find-in-page');

    // reset save button
    if(btnSave.length > 0) {
        var fa = btnSave.find('.fas');
        if (fa.hasClass('fa-check')) {
            fa.removeClass('fa-check');
            fa.addClass('fa-save');
        }
    }

    // show/configure submit button when necessary
    if(btnSubmit.length > 0) {
        var btnSubmitLabel = btnSubmit.find('.btn-label');
        if(tabIdentifier == STR_TAB_NEW_APPLICATIONS || tabIdentifier == STR_TAB_RENEWAL_APPLICATIONS)
            btnSubmitLabel.html('Verify');
        else if(tabIdentifier == STR_TAB_NEW_VERIFICATIONS || tabIdentifier == STR_TAB_RENEWAL_VERIFICATIONS)
            btnSubmitLabel.html('Invoice');
        else if(tabIdentifier == STR_TAB_NEW_INVOICES || tabIdentifier == STR_TAB_RENEWAL_INVOICES)
            btnSubmitLabel.html('Permit');

        if(btnSubmitLabel.text() != '') {
            if (btnSubmit.hasClass('hidden')) {
                btnSubmit.removeClass('hidden');
            }
        }

        if(btnSubmit.prop('disabled')) {
            btnSubmit.prop('disabled', false);
            btnSubmit.attr('disabled', false);
            var fa = btnSubmit.find('.fas');
            fa.removeClass('fa-circle-notch');
            fa.removeClass('fa-spin');
            fa.addClass('fa-arrow-circle-right');
        }
    }

    // show item content
    if( (window.innerWidth < 768 && (isLiveClick && !isFromMenuClick)) || (window.innerWidth >= 768) ) {
        
        // generate the divItemContent html
        var divItemContent = divContentTab.find('.item-content');
        var html = "";
        if(sidebarMenuHref == 'systemlogs') {
            html += "<p class='text-montserrat text-bold no-margin font-1-1em'><span class='sp-item-main-title'>" + activeCardMainItem.find('.main-title').html() + "</span></p>";
        }
        else {
            var activity = "Editing";
            var prep = "under";
            if(tabIdentifier == STR_TAB_NEW_VERIFICATIONS || tabIdentifier == STR_TAB_RENEWAL_VERIFICATIONS)
                activity = "Verifying";
            else if(tabIdentifier == STR_TAB_NEW_INVOICES || tabIdentifier == STR_TAB_RENEWAL_INVOICES || tabIdentifier == STR_TAB_NEW_PERMITS || tabIdentifier == STR_TAB_RENEWAL_PERMITS || tabIdentifier == STR_TAB_UPDATES || tabIdentifier == STR_TAB_CITIZENS || tabIdentifier == STR_TAB_REPORTS)
                activity = "Viewing";
            if(tabIdentifier == STR_TAB_UPDATES)
                prep = "";
            html += "<p class='text-montserrat text-bold no-margin font-1-1em'><span class='fa fa-info-circle text-info'></span> " + activity + " <span class='text-success sp-item-main-title'>" + itemTitle + "</span> " + prep + " <span class='text-success'>" + tabTitle + "</span>.</p>";
        }
        if(tabIdentifier == STR_TAB_CITIZENS) {
            var h = "";
            h += "<div class='card social-card share no-border w-100 active m-t-15 card-citizen-banner'>";
                h += "<div class='card-header clearfix no-border no-border-radius overflow-hidden'>";
                    h += "<div class='item-avatar user-pic' style='border-radius: 4px !important'><div style='width: 108px; height: 108px; display: inline-block' align='center'><table style='width: 100%; height: 100%'><tr><td align='center'><span class='fas fa-circle-notch fa-spin text-success' style='font-size: 40px; opacity: 0.4'></span></td></tr></table></div></div>";
                    h += "<ul class='text-montserrat no-padding no-margin' style='list-style: none; display: inline-block'>";
                        h += "<li style='line-height: 1 !important'>";
                            h += "<h4 class='no-padding no-margin'>&nbsp;</h4>";
                        h += "</li>";
                        h += "<li style='line-height: 1 !important; margin-top: -10px'>";
                            h += "<h3 class='no-padding no-margin text-bold text-uppercase'>&nbsp;</h3>";
                        h += "</li>";
                    h += "</ul>";
                h += "</div>";
            h += "</div>";
            divItemContent.html(html + h);
        }
        else {
            divItemContent.html(html + "<p class='text-montserrat text-bold padding-bottom-15 p-wait'><span class='fas fa-circle-notch fa-spin'></span> PLEASE WAIT...</p>");
        }

        if(window.innerWidth > 767)
            divItemContent.find('.main-row').fadeOut(240);
        else
            divItemContent.find('.main-row').hide();


	    var route = routes[tabIdentifier];
	    if(route != undefined) {
		    // configure AJAX request depending on active menu and active tab
		    var strAjaxURL = route.path;
	        var objAjaxData = {};
	        objAjaxData[route.select_param] = itemID;

		    // initiate AJAX request
		    if(strAjaxURL != undefined) {
		        Pace.restart();

	            // disable control buttons
	            performedDBSearch = true;
	            disableButton(btnNew, true);
	            disableButton(btnSearch, true);
	            disableButton(btnSave, true);
	            disableButton(btnSubmit, true);
	            disableButton(btnDelete, true);
	            disableButton(btnPrint, true);
	            disableInput(txtFindInPage, true);

	            // ms before the client sends the request for item data
	            var nTimeout = 1;
	            if(window.innerWidth < 768) {
	                if (tabIdentifier == STR_TAB_FEE_ITEMS || tabIdentifier == STR_TAB_REQUIREMENT_ITEMS || tabIdentifier == STR_TAB_ACTIVITY_LOGS) {
	                    if(isLiveClick)
	                        nTimeout = 321;
	                }
	            }

	            setTimeout(function() {
	    	        $.ajax({
	    	            type: 'POST',
	    	            url: strAjaxURL,
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
	    	                        var objData = response.success.data;

	                                // write the html
	                                var o = renderItemData(objData, tabIdentifier);
	                                html += o.h;
	    	                        divItemContent.find('.p-wait').fadeOut(239);
	    	                        divItemContent.html(html);

                                    // execute the callback f
                                    if(o.f != null) {
                                        o.f();
                                    }

	                                // cache item controls
	                                var itemControls = divContentTab.find('.item-controls');
	                                var txtFindInpage = divContentTab.find('.txt-find-in-page');

	                                // show item controls
	                                if(itemControls.length > 0) {
	                                    if (itemControls.hasClass('hidden')) {
	                                        itemControls.hide();
	                                        itemControls.removeClass('hidden');
	                                    }
	                                    itemControls.fadeIn(240);
	                                }
	                                if(txtFindInpage.length > 0) {
	                                    if(txtFindInpage.hasClass('hidden')) {
	                                        txtFindInpage.removeClass('hidden');
	                                    }
	                                }

	                                // assign values to text input fields
	                                for(var i=0; i<o.v.length; i++) {
	                                    divItemContent.find(o.v[i][0]).val(o.v[i][1]);
	                                }

	    	                        // fade in effect
	    	                        var divMainRow = divItemContent.find('.main-row');
	    	                        divMainRow.removeClass('hidden');
	    	                        divMainRow.hide();
	    	                        divMainRow.fadeIn(240);

	                                // housekeeping
	                                if(activeCardMainItem != undefined) {
	                                    if (parseInt(activeCardMainItem.attr('data-id')) == parseInt(objData.id) && !divContentTab.find('.pane-right-col').hasClass('hidden')) {
	                                        positionElements(false);
	                                    }
	                                }
	                                renderSwitcheryCheckboxes();
	                                renderDatePickers();
	                                applyTooltips();
	                                formatAmountElements();

                                    // save prevItemData
                                    prevItemData = getFormState(divItemContent);
	    	                    }
	    	                }
	    	                Pace.stop();
	                        performedDBSearch = false;

	                        // reset control buttons
	                        disableButton(btnNew, false);
	                        disableButton(btnSearch, false);
	                        disableButton(btnSave, false);
	                        disableButton(btnSubmit, false);
	                        disableButton(btnDelete, false);
	                        disableButton(btnPrint, false);
	                        disableInput(txtFindInPage, false);

	                        // focus on .txt-find-in-page
	                        if(!isMobile()) {
	                            txtFindInpage.focus();
	                        }
	    	            },
	    	            error: function(data) {
	    	                alert("UNABLE TO GET " + tabTitle + " DATA OF " + itemTitle + "\n\nError " + data.status + " (" + data.statusText + ")");
	    	                Pace.stop();
	                        window.location.reload();
	    	            }
	    	        });
	            }, nTimeout);
		    }
		}
	}
}


/**
 * RENDER ITEM DATA
 * Generate the html to be written on $('.item-content')
 * @param  {object} objData [the object that contains data to be rendered]
 * @param  {string} tabIdentifier [the [data-identifier] of a tab]
 * @param  {boolean} isForLogs [if the render is for system log]
 * @param  {string} [senderTabIdentifier] [the sender tab identifier]
 */
function renderItemData(objData, tabIdentifier, isForLogs, senderTabIdentifier) {
    if(senderTabIdentifier == undefined)
        senderTabIdentifier = '';
    console.log(senderTabIdentifier);

    var o = { h : '',  v : [], f: null};
	if(isForLogs == undefined)
		isForLogs = false;

    var extraClass = '';
    if(isForLogs)
        extraClass = ' system-log';

    // SYSTEM LOGS
    if(tabIdentifier == STR_TAB_ACTIVITY_LOGS) {
    	var o2f = null;
        o.h += "<p class='text-montserrat text-bold text-uppercase padding-bottom-15 no-margin'>" + objData.created_date + "</p>";
        o.h += "<br>";
        o.h += "<div class='row'>";
            o.h += "<div class='col-sm-6 padding-bottom-15'>";
                if(objData.action != 'CHANGE PASSWORD') {
                    o.h += "<p class='text-montserrat text-bold no-margin text-uppercase'>This <span class='text-info'>" + objData.tab_title + "</span> was " + objData.action_title + "</p>";
                }
                else {
                    o.h += "<p class='text-montserrat text-bold no-margin text-uppercase'>This <span class='text-info'>" + objData.tab_title + "</span> CHANGED PASSWORD</p>";
                }
                o.h += generateItemHTML(objData.item, 0, true);
            o.h += "</div>";
            if(objData.action != 'CHANGE PASSWORD') {
                o.h += "<div class='col-sm-6 padding-bottom-15'>";
                o.h += "<p class='text-montserrat text-bold no-margin text-uppercase'>by the following user:</p>";
                o.h += generateItemHTML(objData.user_account, 0, true);
                o.h += "</div>";
            }
        o.h += "</div>";

        if(objData.action != 'CHANGE PASSWORD') {
        	if(objData.item_data != null) {
	            o.h += "<br>";
                var prep = "after";
                if(objData.action_title == "removed")
                    prep = "before";
	            o.h += "<p class='text-montserrat text-bold no-margin text-uppercase'><span class='text-info'>" + objData.tab_title + "</span> data " + prep + " this operation:</p>";
	            o.h += "<div class='log-item-data bg-white' style='padding: 10px; border: 5px dashed #e1f0fd'>";
	                var o2 = renderItemData(objData.item_data, objData.tab, true);
	                o.h += o2.h;
	                o.v = o2.v;
	                o2f = o2.f;
	        	o.h += "</div>";
            }
        }

        o.f = function() {
        	// make inputs readonly or disabled on displying system log
            var divLogItemData = body.find('.log-item-data');
            divLogItemData.find("input[type='text']").each(function () {
                $(this).prop('readonly', true);
                $(this).attr('readonly', true);
            });
            divLogItemData.find("input[type='password']").each(function () {
                $(this).prop('readonly', true);
                $(this).attr('readonly', true);
            });
            divLogItemData.find("input[type='email']").each(function () {
                $(this).prop('readonly', true);
                $(this).attr('readonly', true);
            });
            divLogItemData.find("textarea").each(function () {
                $(this).prop('readonly', true);
                $(this).attr('readonly', true);
            });
            divLogItemData.find("button").each(function () {
                if(!$(this).hasClass('btn-view-requirement')) {
                    $(this).prop('disabled', true);
                    $(this).attr('disabled', true);
                }
            });
            if(o2f != null) {
            	o2f();
            }
        }
    }

	// USER TYPES
    else if (tabIdentifier == STR_TAB_USER_TYPES) {
        o.h += "<div class='main-row hidden'>";
            if(!isForLogs) {
                o.h += "<p class='text-montserrat text-montserrat text-bold padding-bottom-15'>To save changes, press the <span class='text-success'><span class='fa fa-save'></span> SAVE</span> button above.</p>";
            }
            o.h += "<div class='form-group-attached'>";
                o.h += "<div class='row clearfix'>";
                if(objData.acronym != undefined) {
                    o.h += "<div class='col-md-4'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label>ACRONYM</label>";
                            o.h += "<input type='text' class='form-control txt-acronym item-main-title" + extraClass + "'>";
                            o.v.push(['.txt-acronym', objData.acronym]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                if(objData.title != undefined) {
                    o.h += "<div class='col-md-8'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label>TITLE</label>";
                            o.h += "<input type='text' class='form-control txt-title item-sub-title'>";
                            o.v.push(['.txt-title', objData.title]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                if(objData.desc != undefined) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>DESCRIPTION</label>";
                            o.h += "<textarea class='form-control txt-desc' style='height: 64px'></textarea>";
                            o.v.push(['.txt-desc', objData.desc]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

            o.h += "</div>";
            o.h += "<br>";
            o.h += "<p class='text-montserrat text-bold'>SYSTEM ACCESS</p>";
            o.h += "<div class='form-group-attached'>";
                o.h += "<div class='row clearfix'>";
                if(objData.access != undefined) {
                    o.h += "<div class='col-md-12'>";
                    var access = objData.access;
                    for (var i = 0; i < access.length; i++) {
                        var user_access = access[i];
                        o.h += "<div class='checkbox check-success checkbox-circle padding-bottom-15'>";
                            var attrChecked = (user_access.checked == '1') ? ' checked' : '';
                            var attrDisabled = (isForLogs) ? ' disabled' : '';
                            var attrID = user_access.title.split(' ').join('_');

                            var attrDisabled2 = '';
                            var strAccessLabel = '';
                            if(user_access.for_devs_only == '1') {
                                attrDisabled2 = ' disabled';
                                strAccessLabel = '<b>For developers only: </b>';
                            }
                            if(!isForLogs) {
                                attrDisabled = attrDisabled2;
                            }
                            o.h += "<input type='checkbox' class='chk-access' id='A_" + attrID + "' data-title='" + user_access.title + "' style='vertical-align: top'" + attrChecked + attrDisabled + ">";
                            o.h += "<label for='A_" + attrID + "'>";
                                o.h += "<div class='bold text-montserrat text-uppercase text-success'><span class='fa fa-fw " + user_access.icon + "'></span> " + user_access.title + "</div>";
                                o.h += "<div style='padding-left: 20px'>" + strAccessLabel + user_access.desc + "</div>";
                            o.h += "</label>";
                        o.h += "</div>";
                    }
                    o.h += "</div>";
                }
                o.h += "</div>";
            o.h += "</div>";
        o.h += "</div>";
    }

    // USER ACCOUNTS
    else if (tabIdentifier == STR_TAB_USER_ACCOUNTS) {
        o.h += "<div class='main-row hidden'>";
            if(!isForLogs) {
                o.h += "<p class='text-montserrat text-bold padding-bottom-15'>To save changes, press the <span class='text-success'><span class='fa fa-save'></span> SAVE</span> button above.</p>";
            }
            o.h += "<div class='form-group-attached'>";

                o.h += "<div class='row clearfix'>";
                if(objData.citizen_id != undefined && objData.citizen_avatar != undefined && objData.citizen_full_name != undefined) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default form-group-search input-group form-group-citizen' data-id='" + objData.citizen_id + "'>";
                            o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                o.h += "<span class='thumbnail-wrapper d32 circular inline cursor-pointer'>";
                                var avatarDir = citizenAvatarDir;
                                if(objData.citizen_avatar == '_.jpg')
                                    avatarDir = index + 'img/';
                                o.h += "<img class='img-citizen-avatar img-item-avatar' src='" + avatarDir +  objData.citizen_avatar + "' alt='[img]'>";
                                o.h += "</span>";
                            o.h += "</div>";
                            o.h += "<div class='form-input-group'>";
                                o.h += "<label class='inline'>CITIZEN</label>";
                                o.h += "<input type='text' class='form-control txt-citizen-name item-main-title" + extraClass + "' disabled readonly>";
                                o.v.push(['.txt-citizen-name', objData.citizen_full_name]);
                            o.h += "</div>";
                            if(!isForLogs) {
                                o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                    o.h += "<button class='btn btn-success btn-xs btn-citizen-search'><span class='fa fa-search'></span></button>";
                                o.h += "</div>";
                            }
                        o.h += "</div>";
                    o.h += "</div>";
                }
                if(objData.is_active != undefined) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default input-group'>";
                            o.h += "<div class='form-input-group'>";
                                o.h += "<label class='inline' id=''>ACTIVE ACCOUNT?</label>";
                            o.h += "</div>";
                            o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                var attrChecked = (objData.is_active == '1') ? 'checked' : '';
                                var attrDisabled = (isForLogs) ? ' disabled' : '';
                                o.h += " <input type='checkbox' class='chk-user-active' " + attrChecked + " data-init-plugin='switchery' data-size='small' data-color='success'" + attrDisabled + ">";
                            o.h += "</div>";
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                o.h += "<div class='row clearfix'>";
                if(objData.username != undefined) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label>USERNAME</label>";
                            o.h += "<input type='text' class='form-control txt-username'>";
                            o.v.push(['.txt-username', objData.username]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                if(objData.password != undefined) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default input-group'>";
                            o.h += "<div class='form-input-group'>";
                                o.h += "<label class='inline'>PASSWORD</label>";
                                o.h += "<input type='password' class='form-control monospace txt-password'>";
                                o.v.push(['.txt-password', objData.password]);
                            o.h += "</div>";
                            o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                o.h += "<button class='btn btn-default btn-xs cursor-pointer btn-toggle-password'><span class='fa fa-eye-slash'></span></button>";
                            o.h += "</div>";
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                o.h += "<div class='row clearfix'>";
                if(objData.usertypes != undefined) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>USER TYPE</label>";
                            o.h += "<select class='form-control cbo cbo-usertype item-sub-title' cbo-toggle-details='.div-details'>";
                            var arrUsertypes = objData.usertypes;
                            for(var i=0; i<arrUsertypes.length; i++) {
                                var userType = arrUsertypes[i];
                                var descHTML = "<b class='text-montserrat'>DESCRIPTION</b>";
                                if(userType.desc == "")
                                    descHTML += "<p>(No description)</p>";
                                else
                                    descHTML += "<p>" + userType.desc + "</p>";
                                descHTML += "<br><b class='text-montserrat'>SYSTEM ACCESS</b>";
                                if(userType.access.length <= 0)
                                    descHTML += "<p>(No system access)</p>";
                                else {
                                    descHTML += "<ol>";
                                    for (var j = 0; j < userType.access.length; j++) {
                                        var access = userType.access[j];
                                        if(access.checked == '1') {
                                            descHTML += "<li>";
                                            descHTML += "<b class='text-montserrat text-success'><span class='fa fa-fw " + access.icon + "'></span> " + access.title + "</b>";
                                            if (access.desc != "") {
                                                descHTML += "<p style='padding-left: 20px'>" + access.desc + "</p>";
                                            }
                                            descHTML += "</li>";
                                        }
                                    }
                                    descHTML += "</ol>";
                                }
                                var attrSelected = (userType.id == objData.usertype_id) ? ' selected' : '';
                                o.h += "<option value='" + userType.id + "' " + attrSelected + " data-desc=\"" + descHTML + "\">";
                                    o.h += "(" + userType.acronym + ") " + userType.title;
                                o.h += "</option>";
                            }
                            o.h += "</select>";
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

            o.h += "</div>";

            o.h += "<br>";
            o.h += "<div class='div-details'></div>";

        o.h += "</div>";

        o.f = function() {
        	// display select option:selected details
        	var divContentTab = body.find('.content-tab-pane#tab' + tab);
            var divContent = divContentTab.find('.item-content');
        	displayCBODetails(divContent.find('select[cbo-toggle-details]'));
        };
    }

    // BUSINESS SIZES
    else if(tabIdentifier == STR_TAB_BUSINESS_SIZES) {
        o.h += "<div class='main-row hidden'>";
            if(!isForLogs) {
                o.h += "<p class='text-montserrat text-bold padding-bottom-15'>To save changes, press the <span class='text-success'><span class='fa fa-save'></span> SAVE</span> button above.</p>";
            }
            o.h += "<div class='form-group-attached'>";
                o.h += "<div class='row clearfix'>";
                if(objData.title != undefined) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label>TITLE</label>";
                            o.h += "<input type='text' class='form-control txt-title item-main-title" + extraClass + "'>";
                            o.v.push(['.txt-title', objData.title]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";
                o.h += "<div class='row clearfix'>";
                if(objData.desc != undefined) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>DESCRIPTION</label>";
                            o.h += "<textarea class='form-control txt-desc item-sub-title' style='height: 64px'></textarea>";
                            o.v.push(['.txt-desc', objData.desc]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";
                o.h += "<div class='row clearfix'>";
                if(objData.asset_limit_from != undefined) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default input-group input-group-currency'>";
                            o.h += "<div class='form-input-group'>";
                                o.h += "<label><span class='label-label'>ASSET LIMIT MINUMUM</span></label>";
                                o.h += "<input type='text' class='form-control txt-amount txt-asset-limit-from' data-low-of='.txt-asset-limit-to'>";
                                o.v.push(['.txt-asset-limit-from', applyCommas(objData.asset_limit_from)]);
                            o.h += "</div>";
                            o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                        o.h += "</div>";
                    o.h += "</div>";
                }
                if(objData.asset_limit_to != undefined) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default input-group input-group-currency'>";
                            o.h += "<div class='form-input-group'>";
                                o.h += "<label><span class='label-label'>ASSET LIMIT MAXIMUM</span> (INFINITE: <b class='monospace text-danger'>-1</b>)</label>";
                                o.h += "<input type='text' class='form-control txt-amount txt-asset-limit-to'>";
                                o.v.push(['.txt-asset-limit-to', applyCommas(objData.asset_limit_to)]);
                            o.h += "</div>";
                            o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";
                o.h += "<div class='row clearfix'>";
                    if(objData.total_workers_from != undefined) {
                        o.h += "<div class='col-md-6'>";
                            o.h += "<div class='form-group form-group-default'>";
                                o.h += "<label><span class='label-label'>TOTAL WORKERS MINUMUM</span></label>";
                                o.h += "<input type='text' class='form-control txt-int txt-total-workers-from' data-low-of='.txt-total-workers-to'>";
                                o.v.push(['.txt-total-workers-from', parseInt(objData.total_workers_from)]);
                            o.h += "</div>";
                        o.h += "</div>";
                    }
                    if(objData.total_workers_to != undefined) {
                        o.h += "<div class='col-md-6'>";
                            o.h += "<div class='form-group form-group-default'>";
                                o.h += "<label><span class='label-label'>TOTAL WORKERS MAXIMUM</span> (INFINITE: <b class='monospace text-danger'>-1</b>)</label>";
                                o.h += "<input type='text' class='form-control txt-int txt-total-workers-to'>";
                                o.v.push(['.txt-total-workers-to', parseInt(objData.total_workers_to)]);
                            o.h += "</div>";
                        o.h += "</div>";
                    }
                o.h += "</div>";
            o.h += "</div>";
        o.h += "</div>";
    }

    // LINES OF BUSINESS
	else if (tabIdentifier == STR_TAB_LINES_OF_BUSINESS) {
        var attrDisabled = (isForLogs) ? ' disabled readonly' : '';
		o.h += "<div class='main-row hidden'>";
            if(!isForLogs) {
                o.h += "<p class='text-montserrat text-bold padding-bottom-15'>To save changes, press the <span class='text-success'><span class='fa fa-save'></span> SAVE</span> button above.</p>";
            }
			o.h += "<div class='form-group-attached'>";

				o.h += "<div class='row clearfix'>";
                if(objData.business_line != undefined) {
					o.h += "<div class='col-md-12'>";
						o.h += "<div class='form-group form-group-default required'>";
							o.h += "<label>TITLE</label>";
							o.h += "<input type='text' class='form-control txt-title item-main-title" + extraClass + "'>";
                            o.v.push(['.txt-title', objData.business_line]);
						o.h += "</div>";
					o.h += "</div>";
                }
				o.h += "</div>";

				o.h += "<div class='row clearfix'>";
                if(objData.desc != undefined) {
					o.h += "<div class='col-md-12'>";
						o.h += "<div class='form-group form-group-default'>";
							o.h += "<label>DESCRIPTION</label>";
							o.h += "<textarea class='form-control txt-desc item-sub-title' style='height: 64px'></textarea>";
                            o.v.push(['.txt-desc', objData.desc]);
						o.h += "</div>";
					o.h += "</div>";
                }
				o.h += "</div>";
			o.h += "</div>";
            o.h += "<br>";
            o.h += "<div class='row'>";
                o.h += "<div class='col-md-6 padding-bottom-15'>";
                    o.h += "<p class='text-montserrat text-bold'>BUSINESS TAX FOR NEW BUSINESS:</p>";
                    o.h += "<div class='form-group-attached div-tax-brackets-new'>";

                        // (NEW) .cbo-tax-status
                        o.h += "<div class='row clearfix'>";
                        var taxVariablesNew = [];
                        if(objData.tax_variables != undefined) {
                            o.h += "<div class='col-md-12'>";
                                o.h += "<div class='form-group form-group-default' style='border-bottom: 1px solid #ececec'>";
                                    o.h += "<label>NEW BUSINESS TAX STATUS</label>";
                                    o.h += "<select class='cbo-tax-status cbo-color'" + attrDisabled + ">";
                                    for(var i=0; i<objData.tax_variables.length; i++) {
                                        var taxVariable = objData.tax_variables[i];
                                        if(taxVariable.for_new == '1') {
                                            var attrSelected = (objData.new_tax_var_id == taxVariable.id) ? ' selected' : '';
                                            var classColor = 'text-info';
                                            if(taxVariable.id == '1')
                                                classColor = 'text-danger';
                                            else if(taxVariable.id == '2')
                                                classColor = 'text-success';
                                            else if(taxVariable.id == '3')
                                                classColor = 'text-primary';
                                            o.h += "<option value='" + taxVariable.id + "' data-color='" + classColor + "'" + attrSelected + ">" + taxVariable.formula +"</option>";
                                            if(taxVariable.id != '1' && taxVariable.id != '2') {
                                                taxVariablesNew.push(taxVariable);
                                            }
                                        }
                                    }
                                    o.h += "</select>";
                                o.h += "</div>";
                            o.h += "</div>";
                        }
                        o.h += "</div>";

                        // (NEW) decide to hide .div-amount-fixed-new, div-asset-brackets, and .btn-new-bracket
                        var newTaxAmountHidden = ' hidden';
                        var newTaxBracketHidden = ' hidden';
                        if(objData.new_tax_var_id == '2') {
                            newTaxAmountHidden = '';
                            newTaxBracketHidden = ' hidden';
                        }
                        else if(objData.new_tax_var_id == '3' || objData.new_tax_var_id == '9') {
                            newTaxAmountHidden = ' hidden';
                            newTaxBracketHidden = '';
                        }

                        // (NEW) .txt-amount
                        o.h += "<div class='row clearfix div-amount-fixed div-amount-fixed-new" + newTaxAmountHidden + "'>";
                            o.h += "<div class='col-md-12'>";
                                o.h += "<div class='form-group form-group-default input-group input-group-currency' style='border-bottom: 1px solid #ececec'>";
                                    o.h += "<div class='form-input-group'>";
                                        o.h += "<label class=''>TAX AMOUNT</label>";
                                        o.h += "<input type='text' class='form-control txt-amount txt-amount-fixed-new'" + attrDisabled + ">";
                                        o.v.push(['.txt-amount-fixed-new', applyCommas(objData.new_tax_fixed)]);
                                    o.h += "</div>";
                                    o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                o.h += "</div>";
                            o.h += "</div>";
                        o.h += "</div>";


                        // (NEW) tax bracket
                        o.h += "<div class='row clearfix div-asset-brackets" + newTaxBracketHidden + "' data-application-type='NEW BUSINESS'>";
                        for(var i=0; i<objData.tax_brackets.length; i++) {
                            var taxBracket = objData.tax_brackets[i];
                            if(taxBracket.application_type == 'NEW') {
                                var asset_bracket = {};
                                pushNode(asset_bracket, 'bracketID', taxBracket.id);
                                pushNode(asset_bracket, 'assetMinimum', taxBracket.asset_minimum);
                                pushNode(asset_bracket, 'assetMaximum', taxBracket.asset_maximum);
                                pushNode(asset_bracket, 'taxAmount', taxBracket.tax_amount);
                                pushNode(asset_bracket, 'isByPercentage', taxBracket.is_by_percentage);
                                pushNode(asset_bracket, 'percentage', taxBracket.percentage);
                                pushNode(asset_bracket, 'perTaxVariableID', objData.new_tax_var_id);
                                pushNode(asset_bracket, 'ofTaxVariableID', taxBracket.of_tax_variable_id);
                                pushNode(asset_bracket, 'inExcessOf', taxBracket.in_excess_of);
                                pushNode(asset_bracket, 'additionalAmount', taxBracket.additional_amount);
                                pushNode(asset_bracket, 'objTaxVariables', taxVariablesNew);
                                o.h += generateAssetBracket(asset_bracket, isForLogs);
                            }
                        }
                        o.h += "</div>";

                        // (NEW) add bracket
                        if(!isForLogs) {
                            o.h += "<div class='row clearfix div-add-bracket" + newTaxBracketHidden + "'>";
                                o.h += "<div class='col-md-12 form-group-attached-hover'>";
                                    o.h += "<div class='form-group form-group-default input-group'>";
                                        o.h += "<div class='form-input-group'></div>";
                                        o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                            if(!isForLogs)
                                                o.h += "<button class='btn btn-success btn-xs btn-new-bracket'><span class='fa fa-plus'></span></button>";
                                        o.h += "</div>";
                                    o.h += "</div>";
                                o.h += "</div>";
                            o.h += "</div>";
                        }

                        // extra last row (for consistent border-bottom)
                        /*o.h += "<div class='row clearfix'>";
                            o.h += "<div class='col-md-12'>";
                                o.h += "<div class='form-group form-group-default no-padding'></div>";
                            o.h += "</div>";
                        o.h += "</div>";*/

                    o.h += "</div>";
                o.h += "</div>";

                o.h += "<div class='col-md-6 padding-bottom-15'>";
                    o.h += "<p class='text-montserrat text-bold'>BUSINESS TAX FOR RENEWAL:</p>";
                    o.h += "<div class='form-group-attached div-tax-brackets-renewal'>";

                        // (RENEWAL) .cbo-tax-status
                        o.h += "<div class='row clearfix'>";
                        var taxVariablesRenewal = [];
                        if(objData.tax_variables != undefined) {
                            o.h += "<div class='col-md-12'>";
                                o.h += "<div class='form-group form-group-default' style='border-bottom: 1px solid #ececec'>";
                                    o.h += "<label>RENEWAL TAX STATUS</label>";
                                    o.h += "<select class='cbo-tax-status cbo-color'" + attrDisabled + ">";
                                    for(var i=0; i<objData.tax_variables.length; i++) {
                                        var taxVariable = objData.tax_variables[i];
                                        if(taxVariable.for_renewal == '1') {
                                            var attrSelected = (objData.renewal_tax_var_id == taxVariable.id) ? ' selected' : '';
                                            var classColor = 'text-info';
                                            if(taxVariable.id == '1')
                                                classColor = 'text-danger';
                                            else if(taxVariable.id == '2')
                                                classColor = 'text-success';
                                            else if(taxVariable.id == '4' || taxVariable.id == '5' || taxVariable.id == '6')
                                                classColor = 'text-primary';
                                            o.h += "<option value='" + taxVariable.id + "' data-color='" + classColor + "'" + attrSelected + ">" + taxVariable.formula +"</option>";
                                            if(taxVariable.id != '1' && taxVariable.id != '2') {
                                                taxVariablesRenewal.push(taxVariable);
                                            }
                                        }
                                    }
                                    o.h += "</select>";
                                o.h += "</div>";
                            o.h += "</div>";
                        }
                        o.h += "</div>";

                        // (RENEWAL) decide to hide .div-amount-fixed-new, div-asset-brackets, and .btn-new-bracket
                        var renewalTaxAmountHidden = ' hidden';
                        var renewalTaxBracketHidden = ' hidden';
                        if(objData.renewal_tax_var_id == '2') {
                            renewalTaxAmountHidden = '';
                            renewalTaxBracketHidden = ' hidden';
                        }
                        else if(objData.renewal_tax_var_id == '4' || objData.renewal_tax_var_id == '5' || objData.renewal_tax_var_id == '6' || objData.renewal_tax_var_id == '9') {
                            renewalTaxAmountHidden = ' hidden';
                            renewalTaxBracketHidden = '';
                        }

                        // (RENEWAL) .txt-amount
                        o.h += "<div class='row clearfix div-amount-fixed div-amount-fixed-renewal" + renewalTaxAmountHidden + "'>";
                            o.h += "<div class='col-md-12'>";
                                o.h += "<div class='form-group form-group-default input-group input-group-currency' style='border-bottom: 1px solid #ececec'>";
                                    o.h += "<div class='form-input-group'>";
                                        o.h += "<label class=''>TAX AMOUNT</label>";
                                        o.h += "<input type='text' class='form-control txt-amount txt-amount-fixed-renewal'" + attrDisabled + ">";
                                        o.v.push(['.txt-amount-fixed-renewal', applyCommas(objData.renewal_tax_fixed)]);
                                    o.h += "</div>";
                                    o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                o.h += "</div>";
                            o.h += "</div>";
                        o.h += "</div>";

                        // (RENEWAL) per gross sales
                        o.h += "<div class='row clearfix div-asset-brackets" + renewalTaxBracketHidden + "' data-application-type='RENEWAL'>";
                        for(var i=0; i<objData.tax_brackets.length; i++) {
                            var taxBracket = objData.tax_brackets[i];

                            if(taxBracket.application_type == 'RENEWAL') {
                                var asset_bracket = {};
                                pushNode(asset_bracket, 'bracketID', taxBracket.id);
                                pushNode(asset_bracket, 'assetMinimum', taxBracket.asset_minimum);
                                pushNode(asset_bracket, 'assetMaximum', taxBracket.asset_maximum);
                                pushNode(asset_bracket, 'taxAmount', taxBracket.tax_amount);
                                pushNode(asset_bracket, 'isByPercentage', taxBracket.is_by_percentage);
                                pushNode(asset_bracket, 'percentage', taxBracket.percentage);
                                pushNode(asset_bracket, 'perTaxVariableID', objData.renewal_tax_var_id);
                                pushNode(asset_bracket, 'ofTaxVariableID', taxBracket.of_tax_variable_id);
                                pushNode(asset_bracket, 'inExcessOf', taxBracket.in_excess_of);
                                pushNode(asset_bracket, 'additionalAmount', taxBracket.additional_amount);
                                pushNode(asset_bracket, 'objTaxVariables', taxVariablesRenewal);
                                o.h += generateAssetBracket(asset_bracket, isForLogs);
                            }
                        }
                        o.h += "</div>";

                        // (RENEWAL) add bracket
                        if(!isForLogs) {
                            o.h += "<div class='row clearfix div-add-bracket" + renewalTaxBracketHidden + "'>";
                                o.h += "<div class='col-md-12 form-group-attached-hover'>";
                                    o.h += "<div class='form-group form-group-default input-group'>";
                                        o.h += "<div class='form-input-group'></div>";
                                        o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                            if(!isForLogs)
                                                o.h += "<button class='btn btn-success btn-xs btn-new-bracket'><span class='fa fa-plus'></span></button>";
                                        o.h += "</div>";
                                    o.h += "</div>";
                                o.h += "</div>";
                            o.h += "</div>";
                        }

                        // extra last row (for consistent border-bottom)
                        /*o.h += "<div class='row clearfix'>";
                            o.h += "<div class='col-md-12'>";
                                o.h += "<div class='form-group form-group-default no-padding'></div>";
                            o.h += "</div>";
                        o.h += "</div>";*/

                    o.h += "</div>";
                o.h += "</div>";
            o.h += "</div>";
		o.h += "</div>";

		o.f = function() {
			// apply color to .cbo-color select elements
			var divContentTab = body.find('.content-tab-pane#tab' + tab);
            var divContent = divContentTab.find('.item-content');
            divContent.find('.cbo-color').each(function() {
            	$(this).change();
            });
		};
	}

    // TAX OPTIONS
    else if(tabIdentifier == STR_TAB_TAX_OPTIONS) {
        o.h += "<div class='main-row hidden'>";
            if(!isForLogs) {
                o.h += "<p class='text-montserrat text-bold padding-bottom-15'>To save changes, press the <span class='text-success'><span class='fa fa-save'></span> SAVE</span> button above.</p>";
            }
            o.h += "<div class='form-group-attached'>";
                o.h += "<div class='row clearfix'>";
                if(objData.title != undefined) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label>TITLE</label>";
                            o.h += "<input type='text' class='form-control txt-title item-main-title" + extraClass + "' readonly disabled>";
                            o.v.push(['.txt-title', objData.title]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";
                o.h += "<div class='row clearfix'>";
                if(objData.desc != undefined) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>DESCRIPTION</label>";
                            o.h += "<textarea class='form-control txt-desc item-sub-title' style='height: 64px'></textarea>";
                            o.v.push(['.txt-desc', objData.desc]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";
            o.h += "</div>";
            o.h += "<br>";
            if(objData.data != undefined) {
                var arrData = objData.data;
                if (objData.id == 1) { // BUSINESS TAX PENALTY
                    o.h += "<div class='row'>";
                    if(arrData.NEW != null) {
                        o.h += "<div class='col-md-6 padding-bottom-15'>";
                            o.h += "<p class='text-montserrat text-bold'>BUSINESS TAX PENALTY FOR NEW BUSINESS:</p>";
                                o.h += "<div class='form-group-attached'>";
                                    o.h += "<div class='row clearfix'>";
                                        o.h += "<div class='col-md-6 col-sm-6 col-6'>";
                                            o.h += "<div class='form-group form-group-default required'>";
                                                o.h += "<label>DATE START</label>";
                                                o.h += "<input type='text' class='form-control date-picker date-picker-no-year cursor-pointer txt-new-date-start' data-low-of-date='.txt-new-date-end' readonly>";
                                                if(arrData.NEW.date_start != null)
                                                    o.v.push(['.txt-new-date-start', arrData.NEW.date_start]);
                                            o.h += "</div>";
                                        o.h += "</div>";
                                        o.h += "<div class='col-md-6 col-sm-6 col-6'>";
                                            o.h += "<div class='form-group form-group-default required'>";
                                                o.h += "<label>DATE END</label>";
                                                o.h += "<input type='text' class='form-control date-picker date-picker-no-year cursor-pointer txt-new-date-end' readonly>";
                                                if(arrData.NEW.date_end != null)
                                                    o.v.push(['.txt-new-date-end', arrData.NEW.date_end]);
                                            o.h += "</div>";
                                        o.h += "</div>";
                                    o.h += "</div>";
                                    o.h += "<div class='row clearfix'>";
                                        o.h += "<div class='col-md-12'>";
                                            o.h += "<div class='form-group form-group-default input-group input-group-percentage'>";
                                                o.h += "<div class='form-input-group'>";
                                                    o.h += "<label class=''>NEW BUSINESS PENALTY</label>";
                                                    o.h += "<input type='text' class='form-control txt-amount txt-new-percentage text-danger'>";
                                                    if(arrData.NEW.percentage != null)
                                                        o.v.push(['.txt-new-percentage', applyCommas(arrData.NEW.percentage)]);
                                                o.h += "</div>";
                                                o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class='fa fa-percent text-danger'></span></td></tr></table></div>";
                                            o.h += "</div>";
                                        o.h += "</div>";
                                    o.h += "</div>";
                                o.h += "</div>";
                        o.h += "</div>";
                    }
                    if(arrData.RENEWAL != null) {
                        o.h += "<div class='col-md-6'>";
                            o.h += "<p class='text-montserrat text-bold'>BUSINESS TAX PENALTY FOR RENEWAL:</p>";
                            o.h += "<div class='form-group-attached'>";
                                    o.h += "<div class='row clearfix'>";
                                        o.h += "<div class='col-md-6 col-sm-6 col-6'>";
                                            o.h += "<div class='form-group form-group-default required'>";
                                                o.h += "<label>DATE START</label>";
                                                o.h += "<input type='text' class='form-control date-picker date-picker-no-year cursor-pointer txt-renewal-date-start' data-low-of-date='.txt-renewal-date-end' readonly>";
                                                if(arrData.RENEWAL.date_start != null)
                                                    o.v.push(['.txt-renewal-date-start', arrData.RENEWAL.date_start]);
                                            o.h += "</div>";
                                        o.h += "</div>";
                                        o.h += "<div class='col-md-6 col-sm-6 col-6'>";
                                            o.h += "<div class='form-group form-group-default required'>";
                                                o.h += "<label>DATE END</label>";
                                                o.h += "<input type='text' class='form-control date-picker date-picker-no-year cursor-pointer txt-renewal-date-end' readonly>";
                                                if(arrData.RENEWAL.date_end != null)
                                                    o.v.push(['.txt-renewal-date-end', arrData.RENEWAL.date_end]);
                                            o.h += "</div>";
                                        o.h += "</div>";
                                    o.h += "</div>";
                                    o.h += "<div class='row clearfix'>";
                                        o.h += "<div class='col-md-12'>";
                                            o.h += "<div class='form-group form-group-default input-group input-group-percentage'>";
                                                o.h += "<div class='form-input-group'>";
                                                    o.h += "<label class=''>RENEWAL PENALTY</label>";
                                                    o.h += "<input type='text' class='form-control txt-amount txt-renewal-percentage text-danger'>";
                                                    if(arrData.RENEWAL.percentage != null)
                                                        o.v.push(['.txt-renewal-percentage', applyCommas(arrData.RENEWAL.percentage)]);
                                                o.h += "</div>";
                                                o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class='fa fa-percent text-danger'></span></td></tr></table></div>";
                                            o.h += "</div>";
                                        o.h += "</div>";
                                    o.h += "</div>";
                                o.h += "</div>";
                        o.h += "</div>";
                    }
                    o.h += "</div>";
                }
            }

        o.h += "</div>";
    }

    // REQUIREMENTS
    else if(tabIdentifier == STR_TAB_REQUIREMENT_ITEMS) {
        o.h += "<div class='main-row hidden'>";
            if(!isForLogs) {
                o.h += "<p class='text-montserrat text-bold padding-bottom-15'>To save changes, press the <span class='text-success'><span class='fa fa-save'></span> SAVE</span> button above.</p>";
            }
            o.h += "<div class='form-group-attached'>";
                o.h += "<div class='row clearfix'>";
                if(objData.title != undefined) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label>TITLE</label>";
                            o.h += "<input type='text' class='form-control txt-title item-main-title" + extraClass + "'>";
                            o.v.push(['.txt-title', objData.title]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                o.h += "<div class='row clearfix'>";
                if(objData.desc != undefined) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>DESCRIPTION</label>";
                            o.h += "<textarea class='form-control txt-desc item-sub-title' style='height: 64px'></textarea>";
                            o.v.push(['.txt-desc', objData.desc]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                o.h += "<div class='row clearfix'>";
                if(objData.validation_code_title != undefined) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label>VALIDATION CODE TITLE</label>";
                            o.h += "<input type='text' class='form-control txt-validation-code-title'>";
                            o.v.push(['.txt-validation-code-title', objData.validation_code_title]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                if(objData.collect_after != undefined) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label>COLLECT AFTER</label>";
                            o.h += "<select class='form-control cbo-collect-after'>";
                                o.h += "<option value='APPLICATION'" + (objData.collect_after == "APPLICATION" ? " selected" : "")  + ">APPLICATION</option>";
                                o.h += "<option value='PAYMENT'" + (objData.collect_after == "PAYMENT" ? " selected" : "") + ">PAYMENT</option>";
                                o.v.push(['.cbo-submit-after', objData.collect_after]);
                            o.h += "</select>";
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";
				
				o.h += "<div class='row clearfix'>";
				if(objData.is_for_upload != undefined) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default input-group'>";
                            o.h += "<div class='form-input-group'>";
                                o.h += "<label class='inline' id=''>NEEDS TO BE UPLOADED?</label>";
                            o.h += "</div>";
                            o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                var attrChecked = (objData.is_for_upload == '1') ? 'checked' : '';
                                var attrDisabled = (isForLogs) ? ' disabled' : '';
                                o.h += " <input type='checkbox' class='chk-for-upload' " + attrChecked + " data-init-plugin='switchery' data-size='small' data-color='success'" + attrDisabled + ">";
                            o.h += "</div>";
                        o.h += "</div>";
                    o.h += "</div>";
                }
                if(objData.is_for_poblacion_only != undefined) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default input-group'>";
                            o.h += "<div class='form-input-group'>";
                                o.h += "<label class='inline' id=''>FOR POBLACION AREA ONLY?</label>";
                            o.h += "</div>";
                            o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                var attrChecked = (objData.is_for_poblacion_only == '1') ? 'checked' : '';
                                var attrDisabled = (isForLogs) ? ' disabled' : '';
                                o.h += " <input type='checkbox' class='chk-for-poblacion-only' " + attrChecked + " data-init-plugin='switchery' data-size='small' data-color='success'" + attrDisabled + ">";
                            o.h += "</div>";
                        o.h += "</div>";
                    o.h += "</div>";
                }
				o.h += "</div>";
            o.h += "</div>";
            if(objData.classifications != undefined && objData.lines_of_business != undefined) {
                o.h += "<br>";
                o.h += "<p class='text-montserrat text-bold no-margin'>REQUIRE TO THE FOLLOWING LINES OF BUSINESS:</p>";
                var arrLinesOfBusiness = objData.lines_of_business;
                var totalLinesOfBusiness = arrLinesOfBusiness.length;
                var arrClassifications = objData.classifications;
                var totalClassifications = arrClassifications.length;

                // required for all in new or renewal?
                var newCtr = 0;
                var renewalCtr = 0;

                for(var i=-1; i<totalLinesOfBusiness; i++) {
                    var lineOfBusinessID = '';
                    var lineOfBusinessTitle = '';
                    var strN = '';
                    var newChecked = '';
                    var renewalChecked = '';
                    var businessLineID = '';
                    var attrDisabled = (isForLogs) ? ' disabled' : '';
                    var chkNewClass = '';
                    var chkRenewalClass = '';
                    var chkNewToggleAttr = "";
                    var chkRenewalToggleAttr = "";
                    var labelBoldClass = '';
                    var formGroupClass = '';
                    var formGroupAttachedClass = '';
                    var applyLock = false;

                    if(i == -1) {
                        lineOfBusinessTitle = "ALL LINES OF BUSINESS";
                        chkNewToggleAttr = " data-toggle-all-chk='.chk-requirement-new'";
                        chkRenewalToggleAttr = " data-toggle-all-chk='.chk-requirement-renewal'";
                        labelBoldClass = ' text-bold';
                        formGroupClass = ' form-group-outline-success';
                        applyLock = true;
                    }
                    else {
                        lineOfBusinessID = arrLinesOfBusiness[i].id;
                        lineOfBusinessTitle = arrLinesOfBusiness[i].title;
                        strN = (i+1).toString() + '. ';

                        businessLineID = arrLinesOfBusiness[i].id;
                        chkNewClass = 'chk-require-requirement chk-requirement-new';
                        chkNewToggleAttr = " data-toggle-one-chk='.chk-requirement-new'";
                        chkRenewalToggleAttr = " data-toggle-one-chk='.chk-requirement-renewal'";
                        chkRenewalClass = 'chk-require-requirement chk-requirement-renewal';
                        formGroupAttachedClass = ' form-group-attached-hover';
                        applyLock = false;

                        // required for new or renewal ?
                        var ctr = 0;
                        for(var j=0; j<totalClassifications; j++) {
                            if(arrClassifications[j].business_line_id == businessLineID) {
                                if(arrClassifications[j].application_type == 'NEW') {
                                    newChecked = ' checked';
                                    ctr += 1;
                                    newCtr += 1;
                                }
                                if(arrClassifications[j].application_type == 'RENEWAL') {
                                    renewalChecked = ' checked';
                                    ctr += 1;
                                    renewalCtr += 1;
                                }
                            }
                            if(ctr >= 2)
                                break;
                        }
                    }

                    o.h += "<div class='form-group-attached no-margin" + formGroupAttachedClass + "' style='margin-bottom: 5px !important;' data-id='" + lineOfBusinessID + "'>";
                        o.h += "<div class='row clearfix'>";
                            o.h += "<div class='col-md-5 col-sm-12 col-12'>";
                                if(!applyLock) {
                                    o.h += "<div class='form-group form-group-default" + formGroupClass + "'>";
                                        o.h += "<label class='" + labelBoldClass + "'>LINE OF BUSINESS</label>";
                                        //o.h += "<input type='text' class='form-control txt-line-of-business txt-line-of-business-" + i.toString() + "' readonly disabled>";
                                        o.h += "<span class='form-control text-bold padding-top-8 txt-line-of-business txt-line-of-business-" + i.toString() + "'>" + (i + 1).toString() + ". " + lineOfBusinessTitle +"</span>";
                                    o.h += "</div>";
                                }
                                else {
                                    o.h += "<div class='form-group form-group-default input-group'>";
                                        o.h += "<div class='form-input-group'>";
                                            o.h += "<label class='inline'>LINE OF BUSINESS</label>";
                                            //o.h += "<input type='text' class='form-control txt-line-of-business txt-line-of-business-" + i.toString() + "' readonly disabled>";
                                            o.h += "<span class='form-control text-bold padding-top-8 txt-line-of-business txt-line-of-business-" + i.toString() + "'>" + lineOfBusinessTitle + "</span>";
                                        o.h += "</div>";
                                        o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                            o.h += "<button class='btn btn-primary btn-default btn-xs btn-lock-switch' data-target='.chk-lockable--1'><span class='fa fa-lock'></span></button>";
                                        o.h += "</div>";
                                    o.h += "</div>";
                                }
                                //o.v.push(['.txt-line-of-business-' + i.toString(), strN + lineOfBusinessTitle]);
                            o.h += "</div>";
                            if(i == -1) {
                                attrDisabled = ' disabled';
                            }
                            o.h += "<div class='col-md-7 col-sm-12 col-12 no-padding'>";
                                o.h += "<div class='row clearfix'>";
                                    o.h += "<div class='col-md-6 col-sm-6 col-6 no-padding-right'>";
                                        o.h += "<div class='form-group form-group-default input-group" + formGroupClass + "'>";
                                            o.h += "<div class='form-input-group'>";
                                                o.h += "<label class='inline" + labelBoldClass + "' id=''><span class='collapse-768'>FOR&nbsp;</span>NEW BUSINESS</label>";
                                            o.h += "</div>";
                                                o.h += "<div class='input-group-addon bg-transparent h-c-50 no-padding-left'>";
                                                o.h += " <input type='checkbox' class='" + chkNewClass + " chk-lockable-" + i.toString() + "' " + newChecked + " data-init-plugin='switchery' data-size='small' data-color='success'" + chkNewToggleAttr + attrDisabled + ">";
                                            o.h += "</div>";
                                        o.h += "</div>";
                                    o.h += "</div>";
                                    o.h += "<div class='col-md-6 col-sm-6 col-6 no-padding-left'>";
                                        o.h += "<div class='form-group form-group-default input-group" + formGroupClass + "'>";
                                            o.h += "<div class='form-input-group'>";
                                                o.h += "<label class='inline" + labelBoldClass + "' id=''><span class='collapse-768'>FOR&nbsp;</span>RENEWAL</label>";
                                            o.h += "</div>";
                                                o.h += "<div class='input-group-addon bg-transparent h-c-50 no-padding-left'>";
                                                o.h += " <input type='checkbox' class='" + chkRenewalClass + " chk-lockable-" + i.toString() + "' " + renewalChecked + " data-init-plugin='switchery' data-size='small' data-color='success'" + chkRenewalToggleAttr + attrDisabled + ">";
                                            o.h += "</div>";
                                        o.h += "</div>";
                                    o.h += "</div>";
                                o.h += "</div>";
                            o.h += "</div>";
                        o.h += "</div>";
                    o.h += "</div>";
                }

                o.f = function() {
                    var divContentTab = body.find('.content-tab-pane#tab' + tab);
                    var divContent = divContentTab.find('.item-content');
                    if(newCtr == totalLinesOfBusiness) {
                        divContent.find("input[data-toggle-all-chk='.chk-requirement-new']").attr('checked', true);
                    }
                    if(renewalCtr == totalLinesOfBusiness) {
                        divContent.find("input[data-toggle-all-chk='.chk-requirement-renewal']").attr('checked', true);
                    }
                };
            }
        o.h += "</div>";
    }

    // FEES
    else if(tabIdentifier == STR_TAB_FEE_ITEMS) {
        o.h += "<div class='main-row hidden'>";
            if(!isForLogs) {
                o.h += "<p class='text-montserrat text-bold padding-bottom-15'>To save changes, press the <span class='text-success'><span class='fa fa-save'></span> SAVE</span> button above.</p>";
            }
            o.h += "<div class='form-group-attached'>";
                o.h += "<div class='row clearfix'>";
                if(objData.title != undefined) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label>TITLE</label>";
                            o.h += "<input type='text' class='form-control txt-title item-main-title" + extraClass + "'>";
                            o.v.push(['.txt-title', objData.title]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";
                o.h += "<div class='row clearfix'>";
                if(objData.desc != undefined) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>DESCRIPTION</label>";
                            o.h += "<textarea class='form-control txt-desc item-sub-title' style='height: 64px'></textarea>";
                            o.v.push(['.txt-desc', objData.desc]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";
				o.h += "<div class='row clearfix'>";
				if(objData.is_multiple_collection != undefined) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default input-group'>";
                            o.h += "<div class='form-input-group'>";
                                o.h += "<label class='inline' id=''>SEPARATE COLLECTIONS ON MULTIPLE LINES OF BUSINESS?</label>";
                            o.h += "</div>";
                            o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                var attrChecked = (objData.is_multiple_collection == '1') ? 'checked' : '';
                                var attrDisabled = (isForLogs) ? ' disabled' : '';
                                o.h += " <input type='checkbox' class='chk-multiple-collection' " + attrChecked + " data-init-plugin='switchery' data-size='small' data-color='success'" + attrDisabled + ">";
                            o.h += "</div>";
                        o.h += "</div>";
                    o.h += "</div>";
                }
				if(objData.is_for_poblacion_only != undefined) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default input-group'>";
                            o.h += "<div class='form-input-group'>";
                                o.h += "<label class='inline' id=''>FOR POBLACION AREA ONLY?</label>";
                            o.h += "</div>";
                            o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                var attrChecked = (objData.is_for_poblacion_only == '1') ? 'checked' : '';
                                var attrDisabled = (isForLogs) ? ' disabled' : '';
                                o.h += " <input type='checkbox' class='chk-for-poblacion-only' " + attrChecked + " data-init-plugin='switchery' data-size='small' data-color='success'" + attrDisabled + ">";
                            o.h += "</div>";
                        o.h += "</div>";
                    o.h += "</div>";
                }
				o.h += "</div>";
            o.h += "</div>";
            
            if(objData.classifications != undefined && objData.lines_of_business != undefined && objData.business_sizes != undefined) {
                o.h += "<br>";
                o.h += "<p class='text-montserrat text-bold no-margin'>APPLY TO FOLLOWING LINES OF BUSINESS:</p>";
                var arrLinesOfBusiness = objData.lines_of_business;
                var totalLinesOfBusiness = arrLinesOfBusiness.length;
                var arrBusinessSizes = objData.business_sizes;
                var totalBusinessSizes = arrBusinessSizes.length;
                var arrFeeVariables = objData.fee_variables;
                var totalFeeVariables = arrFeeVariables.length;
                var arrClassifications = objData.classifications;
                var totalClassifications = arrClassifications.length;

                var arrNewFeeStatus = [];
                var arrRenewalFeeStatus = [];
                var arrNewFeeAmount = [];
                var arrRenewalFeeAmount = [];

                for(var i=-1; i<totalLinesOfBusiness; i++) {
                    var lineOfBusinessID = '';
                    var lineOfBusinessTitle = '';
                    var strN = '';

                    var newFeeStatus = '';
                    var renewalFeeStatus = '';
                    var newAmount = '';
                    var renewalAmount = '';
                    var newArrBusSizesFees = [];
                    var renewalArrBusiSizesFees = [];

                    var cboNewToggleAttr = "";
                    var cboRenewalToggleAttr = "";

                    var txtNewToggleAttr = "";
                    var txtRenewalToggleAttr = "";

                    var formGroupClass = '';
                    var formGroupAttachedClass = '';
                    var labelBoldClass = '';
                    var applyLock = false;
                    attrDisabled = '';

                    var isNewFound = false;
                    var isRenewalFound = false;

                    if(i == -1) {
                        lineOfBusinessTitle = "ALL LINES OF BUSINESS";
                        formGroupClass = ' form-group-outline-success';
                        labelBoldClass = ' text-bold';

                        cboNewToggleAttr = " data-toggle-all-cbo='.cbo-fee-status-new'";
                        cboRenewalToggleAttr = " data-toggle-all-cbo='.cbo-fee-status-renewal'";

                        txtNewToggleAttr = " data-toggle-all-txt='.txt-amount-new'";
                        txtRenewalToggleAttr = " data-toggle-all-txt='.txt-amount-renewal'";
                        applyLock = true;
                    }
                    else {
                        lineOfBusinessID = arrLinesOfBusiness[i].id;
                        lineOfBusinessTitle = arrLinesOfBusiness[i].title;
                        strN = (i+1).toString() + '. ';
                        formGroupAttachedClass = ' form-group-attached-hover';

                        cboNewToggleAttr = " data-toggle-one-cbo='.cbo-fee-status-new'";
                        cboRenewalToggleAttr = " data-toggle-one-cbo='.cbo-fee-status-renewal'";

                        txtNewToggleAttr = " data-toggle-one-txt='.txt-amount-new'";
                        txtRenewalToggleAttr = " data-toggle-one-txt='.txt-amount-renewal'";

                        // search for the fee status
                        newFeeStatus = '1';
                        renewalFeeStatus = '1';
                        for(var j=0; j<totalClassifications; j++) {
                            if(arrClassifications[j].business_line_id == lineOfBusinessID) {
                                if(arrClassifications[j].application_type == 'NEW') {
                                    newFeeStatus = arrClassifications[j].fee_variable_id;
                                    newAmount = arrClassifications[j].amount;
                                    newArrBusSizesFees = arrClassifications[j].business_size_fees;
                                    if(arrNewFeeStatus.indexOf(newFeeStatus) < 0)
                                        arrNewFeeStatus.push(newFeeStatus);
                                    if(arrNewFeeAmount.indexOf(newAmount) < 0)
                                        arrNewFeeAmount.push(newAmount);
                                    isNewFound = true;
                                }
                                if(arrClassifications[j].application_type == 'RENEWAL') {
                                    renewalFeeStatus = arrClassifications[j].fee_variable_id;
                                    renewalAmount = arrClassifications[j].amount;
                                    renewalArrBusiSizesFees = arrClassifications[j].business_size_fees;
                                    if(arrRenewalFeeStatus.indexOf(renewalFeeStatus) < 0)
                                        arrRenewalFeeStatus.push(renewalFeeStatus);
                                    if(arrRenewalFeeAmount.indexOf(renewalAmount) < 0)
                                        arrRenewalFeeAmount.push(renewalAmount);
                                    isRenewalFound = true;
                                }
                            }
                        }
                    }


                    o.h += "<div class='form-group-attached no-margin" + formGroupAttachedClass + "' style='margin-bottom: 5px !important;' data-id='" + lineOfBusinessID + "'>";
                        o.h += "<div class='row clearfix'>";
                            o.h += "<div class='col-md-5 col-sm-12 col-12'>";
                                if(!applyLock) {
                                    o.h += "<div class='form-group form-group-default" + formGroupClass + "'>";
                                        o.h += "<label class='" + labelBoldClass + "'>LINE OF BUSINESS</label>";
                                        //o.h += "<input type='text' class='form-control txt-line-of-business txt-line-of-business-" + i.toString() + "' readonly disabled>";
                                        o.h += "<span class='form-control text-bold padding-top-8 txt-line-of-business txt-line-of-business-" + i.toString() + "'>" + (i + 1).toString() + ". " + lineOfBusinessTitle + "</span>";
                                    o.h += "</div>";
                                }
                                else {
                                    o.h += "<div class='form-group form-group-default input-group'>";
                                        o.h += "<div class='form-input-group'>";
                                            o.h += "<label class='inline'>LINE OF BUSINESS</label>";
                                            //o.h += "<input type='text' class='form-control txt-line-of-business txt-line-of-business-" + i.toString() + "' readonly disabled>";
                                            o.h += "<span class='form-control text-bold padding-top-8 txt-line-of-business txt-line-of-business-" + i.toString() + "'>" + lineOfBusinessTitle + "</span>";
                                        o.h += "</div>";
                                        o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                            o.h += "<button class='btn btn-primary btn-default btn-xs btn-lock-div' data-target='.div-lockable--1'><span class='fa fa-lock'></span></button>";
                                        o.h += "</div>";
                                    o.h += "</div>";
                                }
                                //o.v.push(['.txt-line-of-business-' + i.toString(), strN + lineOfBusinessTitle]);
                            o.h += "</div>";

                            if(i == -1 || isForLogs) {
                                attrDisabled = 'disabled readonly';
                            }
                            o.h += "<div class='col-md-7 col-sm-12 col-12 no-padding'>";

                                o.h += "<div class='row clearfix no-margin'>";
                                    o.h += "<div class='col-md-6 col-sm-6 col-6 div-lockable-" + i.toString() + "'>";
                                        o.h += "<div class='row clearfix'>";

                                            // (NEW) .cbo-fee-status
                                            o.h += "<div class='form-group form-group-default" + formGroupClass + "'>";
                                                o.h += "<label class='" + labelBoldClass + "'><span class='collapse-768'>FOR&nbsp;</span>NEW BUSINESS</label>";
                                                var selectColorClass = "";
                                                var optHTML = "";
                                                for(var j=0; j<totalFeeVariables; j++) {
                                                	var optColorClass = 'text-info';
                                                    if(j==0)
                                                        optColorClass = 'text-danger';
                                                    else if(j == 1)
                                                        optColorClass = 'text-success';
                                                    else if(j == 2)
                                                        optColorClass = 'text-primary';

                                                    var attrSelected = ""
                                                	if(newFeeStatus == arrFeeVariables[j].id) {
                                                		attrSelected = " selected";
                                                		if(selectColorClass == "") {
                                                			selectColorClass = " " + optColorClass;
                                                		}
                                                	}
                                                    optHTML += "<option value='" + arrFeeVariables[j].id + "'" + attrSelected + " data-color='" + optColorClass + "'>" + arrFeeVariables[j].title + "</option>";
                                                }
                                                o.h += "<select class='cbo-fee-status cbo-fee-status-new cbo-color" + selectColorClass + "'" + cboNewToggleAttr + " " + attrDisabled + ">";
		                                            if(i < 0) {
		                                                o.h += "<option value='' data-color='text-info'></option>";
		                                            }
		                                            o.h += optHTML;
                                                o.h += "</select>";
                                            o.h += "</div>";

                                            // (NEW) decide to hide .form-group-fee-amount and .form-group-business-size-fee-amount
                                            var newAmountHidden = '';
                                            var newBusinessSizeHidden = '';
                                            if(newFeeStatus == '' || newFeeStatus == '1') {
                                                newAmountHidden = ' hidden';
                                                newBusinessSizeHidden = ' hidden';
                                            }
                                            else if(newFeeStatus == '3') {
                                                newAmountHidden = ' hidden';
                                                newBusinessSizeHidden = '';
                                            }
                                            else {
                                                newAmountHidden = '';
                                                newBusinessSizeHidden = ' hidden';
                                            }

                                            // (NEW) .txt-amount
                                            o.h += "<div class='form-group form-group-default input-group input-group-currency form-group-fee-amount" + formGroupClass + newAmountHidden + "'>";
                                                o.h += "<div class='form-input-group'>";
                                                    o.h += "<label class='" + labelBoldClass + "'>AMOUNT</label>";
                                                    o.h += "<input type='text' class='form-control txt-amount txt-amount-new txt-amount-new-" + (i+1).toString() + "'" + txtNewToggleAttr + " " + attrDisabled + " value='" + applyCommas(newAmount) + "'>";
                                                o.h += "</div>";
                                                o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                            o.h += "</div>";

                                            // (NEW) business sizes
                                            for(var j=0; j<totalBusinessSizes; j++) {

                                                // get amount of this business size fee
                                                var businessSizeFeeAmount = 0;
                                                for(var k=0; k<newArrBusSizesFees.length; k++) {
                                                    if(newArrBusSizesFees[k].business_size_id == arrBusinessSizes[j].id) {
                                                        businessSizeFeeAmount = newArrBusSizesFees[k].amount;
                                                        break;
                                                    }
                                                 }
                                                o.h += "<div class='form-group form-group-default input-group input-group-currency form-group-business-size-fee-amount form-group-business-size-fee-amount-new" + formGroupClass + newBusinessSizeHidden + "' data-id='" + arrBusinessSizes[j].id + "'>";
                                                    o.h += "<div class='form-input-group'>";
                                                        o.h += "<label class='" + labelBoldClass + " text-primary'>";
                                                            var assetLimitFrom = removeCommas(arrBusinessSizes[j].asset_limit_from);
                                                            var assetLimitTo = removeCommas(arrBusinessSizes[j].asset_limit_to);
                                                            var totalWorkersFrom = removeCommas(arrBusinessSizes[j].total_workers_from, true);
                                                            var totalWorkersTo = removeCommas(arrBusinessSizes[j].total_workers_to, true);
                                                            var assetLimitStr = "ASSET LIMIT is from " + applyCommas(assetLimitFrom);
                                                            var totalWorkersStr = "TOTAL WORKERS is from " + applyCommas(totalWorkersFrom, true);
                                                            if(assetLimitTo != -1)
                                                                assetLimitStr += " to " + applyCommas(assetLimitTo);
                                                            else
                                                                assetLimitStr += " and ABOVE ";

                                                            if(totalWorkersTo != -1)
                                                                totalWorkersStr += " to " + applyCommas(totalWorkersTo, true);
                                                            else
                                                                totalWorkersStr += " and ABOVE ";

                                                            o.h += "<span data-toggle='tooltip' data-placement='right' data-original-title='" + assetLimitStr + " AND " + totalWorkersStr + "'>";
                                                                o.h += "<span class='fa fa-question-circle text-primary'></span>";
                                                            o.h += "</span>";
                                                            o.h += " " + arrBusinessSizes[j].title;
                                                        o.h += "</label>";
                                                        var txtClass0 = 'txt-amount-new-business-size-fee';
                                                        var txtClass1 = txtClass0 + '-' +  (j+1).toString();
                                                        var txtClass2 = txtClass1 + '-' + (i+1).toString();
                                                        var txtNewBusinessSizeToggleAttr = (i < 0) ? " data-toggle-all-txt='." + txtClass1 + "'" : " data-toggle-one-txt='." + txtClass1 + "'";
                                                        o.h += "<input type='text' class='form-control txt-amount " + txtClass0 + " " + txtClass1 + " " + txtClass2 + "'" + txtNewBusinessSizeToggleAttr + " " + attrDisabled + " value='" + applyCommas(businessSizeFeeAmount) + "'>";
                                                    o.h += "</div>";
                                                    o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                                o.h += "</div>";
                                            }

                                        o.h += "</div>";
                                    o.h += "</div>";
                                    o.h += "<div class='col-md-6 col-sm-6 col-6 div-lockable-" + i + "'>";
                                        o.h += "<div class='row clearfix'>";

                                            // (RENEWAL) .cbo-fee-status
                                            o.h += "<div class='form-group form-group-default" + formGroupClass + "'>";
                                                o.h += "<label class='" + labelBoldClass + "'><span class='collapse-768'>FOR&nbsp;</span>RENEWAL</label>";
                                                var selectColorClass = "";
                                                var optHTML = "";
                                                for(var j=0; j<totalFeeVariables; j++) {
                                                	var optColorClass = 'text-info';
                                                    if(j==0)
                                                        optColorClass = 'text-danger';
                                                    else if(j == 1)
                                                        optColorClass = 'text-success';
                                                    else if(j == 2)
                                                        optColorClass = 'text-primary';

                                                    var attrSelected = ""
                                                	if(renewalFeeStatus == arrFeeVariables[j].id) {
                                                		attrSelected = " selected";
                                                		if(selectColorClass == "") {
                                                			selectColorClass = " " + optColorClass;
                                                		}
                                                	}
                                                    optHTML += "<option value='" + arrFeeVariables[j].id + "'" + attrSelected + " data-color='" + optColorClass + "'>" + arrFeeVariables[j].title + "</option>";
                                                }
                                                o.h += "<select class='cbo-fee-status cbo-fee-status-renewal cbo-color" + selectColorClass + "'" + cboRenewalToggleAttr + " " + attrDisabled + ">";
                                                    if(i < 0) {
                                                        o.h += "<option value='' data-color='text-info'></option>";
                                                    }
                                                    o.h += optHTML;
                                                o.h += "</select>";
                                            o.h += "</div>";

                                            // (NEW) decide to hide .form-group-fee-amount and .form-group-business-size-fee-amount
                                            var renewalAmountHidden = '';
                                            var renewalBusinessSizeHidden = '';
                                            if(renewalFeeStatus == '' || renewalFeeStatus == '1') {
                                                renewalAmountHidden = ' hidden';
                                                renewalBusinessSizeHidden = ' hidden';
                                            }
                                            else if(renewalFeeStatus == '3') {
                                                renewalAmountHidden = ' hidden';
                                                renewalBusinessSizeHidden = '';
                                            }
                                            else {
                                                renewalAmountHidden = '';
                                                renewalBusinessSizeHidden = ' hidden';
                                            }

                                            // (RENEWAL) .txt-amount
                                            o.h += "<div class='form-group form-group-default input-group input-group-currency form-group-fee-amount" + formGroupClass + renewalAmountHidden + "'>";
                                                o.h += "<div class='form-input-group'>";
                                                    o.h += "<label class='" + labelBoldClass + "'>AMOUNT</label>";
                                                    o.h += "<input type='text' class='form-control txt-amount txt-amount-renewal txt-amount-renewal-" + (i+1).toString() + "'" + txtRenewalToggleAttr + " " + attrDisabled +  " value='" + applyCommas(renewalAmount) + "'>";
                                                o.h += "</div>";
                                                o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                            o.h += "</div>";

                                            // (RENEWAL) business sizes
                                            for(var j=0; j<totalBusinessSizes; j++) {

                                                // get amount of this business size fee
                                                var businessSizeFeeAmount = 0;
                                                for(var k=0; k<renewalArrBusiSizesFees.length; k++) {
                                                    if(renewalArrBusiSizesFees[k].business_size_id == arrBusinessSizes[j].id) {
                                                        businessSizeFeeAmount = renewalArrBusiSizesFees[k].amount;
                                                        break;
                                                    }
                                                }

                                                o.h += "<div class='form-group form-group-default input-group input-group-currency form-group-business-size-fee-amount form-group-business-size-fee-amount-renewal" + formGroupClass + renewalBusinessSizeHidden + "' data-id='" + arrBusinessSizes[j].id + "'>";
                                                    o.h += "<div class='form-input-group'>";
                                                        o.h += "<label class='" + labelBoldClass + " text-primary'>";
                                                            var assetLimitFrom = removeCommas(arrBusinessSizes[j].asset_limit_from);
                                                            var assetLimitTo = removeCommas(arrBusinessSizes[j].asset_limit_to);
                                                            var totalWorkersFrom = removeCommas(arrBusinessSizes[j].total_workers_from, true);
                                                            var totalWorkersTo = removeCommas(arrBusinessSizes[j].total_workers_to, true);
                                                            var assetLimitStr = "ASSET LIMIT is from " + applyCommas(assetLimitFrom);
                                                            var totalWorkersStr = "TOTAL WORKERS is from " + applyCommas(totalWorkersFrom, true);
                                                            if(assetLimitTo != -1)
                                                                assetLimitStr += " to " + applyCommas(assetLimitTo);
                                                            else
                                                                assetLimitStr += " and ABOVE ";

                                                            if(totalWorkersTo != -1)
                                                                totalWorkersStr += " to " + applyCommas(totalWorkersTo, true);
                                                            else
                                                                totalWorkersStr += " and ABOVE ";

                                                            o.h += "<span data-toggle='tooltip' data-placement='left' data-original-title='" + assetLimitStr + " AND " + totalWorkersStr + "'>";
                                                                o.h += "<span class='fa fa-question-circle text-primary'></span>";
                                                            o.h += "</span>";
                                                            o.h += " " + arrBusinessSizes[j].title;
                                                        o.h += "</label>";
                                                        var txtClass0 = 'txt-amount-renewal-business-size-fee';
                                                        var txtClass1 = txtClass0 + '-' + (j+1).toString();
                                                        var txtClass2 = txtClass1 + '-' + (i+1).toString();
                                                        var txtRenewalBusinessSizeToggleAttr = (i < 0) ? " data-toggle-all-txt='." + txtClass1 + "'" : " data-toggle-one-txt='." + txtClass1 + "'";
                                                        o.h += "<input type='text' class='form-control txt-amount " + txtClass0 + " " + txtClass1 + " " + txtClass2 + "'" + txtRenewalBusinessSizeToggleAttr + " " + attrDisabled + " value='" + applyCommas(businessSizeFeeAmount) + "'>";
                                                    o.h += "</div>";
                                                    o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                                o.h += "</div>";
                                            }
                                        o.h += "</div>";
                                    o.h += "</div>";
                                o.h += "</div>";
                            o.h += "</div>";
                        o.h += "</div>";
                    o.h += "</div>";


                    if(!isNewFound && i > -1) {
                        if(arrNewFeeStatus.indexOf('1') < 0)
                            arrNewFeeStatus.push('1');
                        if(arrNewFeeAmount.indexOf('0') < 0)
                            arrNewFeeAmount.push('0');
                    }
                    if(!isRenewalFound && i > -1) {
                        if(arrRenewalFeeStatus.indexOf('1') < 0)
                            arrRenewalFeeStatus.push('1');
                        if(arrRenewalFeeAmount.indexOf('0') < 0)
                            arrRenewalFeeAmount.push('0');
                    }
                }

                o.f = function() {
                	// process the appearance of the first fee status element group
                    var divContentTab = body.find('.content-tab-pane#tab' + tab);
                    var divContent = divContentTab.find('.item-content');
                    var cboFeeStatusNew0 = divContent.find('.cbo-fee-status-new[data-toggle-all-cbo]');
                    var cboFeeStatusRenewal0 = divContent.find('.cbo-fee-status-renewal[data-toggle-all-cbo]');
                    var txtAmountNew0 = divContent.find('.txt-amount-new-0');
                    var txtAmountRenewal0 = divContent.find('.txt-amount-renewal-0');

                    if(arrNewFeeStatus.length == 1) {
                        cboFeeStatusNew0.val(arrNewFeeStatus[0]);
                        cboFeeStatusNew0.addClass(cboFeeStatusNew0.find('option:selected').attr('data-color'));

						if(cboFeeStatusNew0.val() == '3') {
							cboFeeStatusNew0.parent().parent().find('.form-group-business-size-fee-amount').each(function(i) {
								$(this).removeClass('hidden');
							});
						}
                        else if(cboFeeStatusNew0.val() != '' && cboFeeStatusNew0.val() != '1')
                        	txtAmountNew0.parent().parent().removeClass('hidden');
                    }
                    if(arrRenewalFeeStatus.length == 1) {
                        cboFeeStatusRenewal0.val(arrRenewalFeeStatus[0]);
                        cboFeeStatusRenewal0.addClass(cboFeeStatusRenewal0.find('option:selected').attr('data-color'));
						if(cboFeeStatusRenewal0.val() == '3') {
							cboFeeStatusRenewal0.parent().parent().find('.form-group-business-size-fee-amount').each(function(i) {
								$(this).removeClass('hidden');
							});
						}
                        else if(cboFeeStatusRenewal0.val() != '' && cboFeeStatusRenewal0.val() != '1')
                        	txtAmountRenewal0.parent().parent().removeClass('hidden');
                    }

                    if(arrNewFeeAmount.length == 1) {
                        txtAmountNew0.val(applyCommas(arrNewFeeAmount[0]));
                        
                    }
                    if(arrRenewalFeeAmount.length == 1) {
                        txtAmountRenewal0.val(applyCommas(arrRenewalFeeAmount[0]));
                    }
                };
            }
        o.h += "</div>";
    }

    // NEW APPLICATION | RENEWAL APPLICATION
    else if(tabIdentifier == STR_TAB_NEW_APPLICATIONS || tabIdentifier == STR_TAB_RENEWAL_APPLICATIONS) {
        var application_type = '';
        if(objData.application_type != null) {
            application_type = objData.application_type;
        }
        o.h += "<div class='main-row hidden'>";
            if(!isForLogs) {
                o.h += "<p class='text-montserrat text-bold no-margin'> - To save changes, press the <span class='text-success'><span class='fa fa-save'></span> SAVE</span> button above.</p>";
                o.h += "<p class='text-montserrat text-bold padding-bottom-15'> - To submit for verification, press the <span class='text-success'><span class='fa fa-arrow-circle-right'></span> VERIFY</span> button above.</p>";
            }

            o.h += "<p class='text-montserrat text-bold no-margin'>1. BASIC INFORMATION</p>";
            o.h += "<div class='form-group-attached'>";
                o.h += "<div class='row clearfix'>";
                // citizen
                if(objData.citizen_id != undefined && objData.citizen_avatar != undefined && objData.citizen_full_name != undefined) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default form-group-search input-group form-group-citizen' data-id='" + objData.citizen_id + "'>";
                            o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                o.h += "<span class='thumbnail-wrapper d32 circular inline cursor-pointer'>";
                                    var avatarDir = citizenAvatarDir;
                                    if(parseInt(objData.citizen_id) == 0)
                                        avatarDir = index + 'img/';
                                    o.h += "<img class='img-citizen-avatar img-item-avatar' src='" + avatarDir +  objData.citizen_avatar + "' data-src='" + objData.citizen_avatar + "' alt='[img]'>";
                                o.h += "</span>";
                            o.h += "</div>";
                            o.h += "<div class='form-input-group'>";
                                o.h += "<label class='inline'>CITIZEN</label>";
                                o.h += "<input type='text' class='form-control txt-citizen-name item-sub-title' disabled readonly>";
                                o.v.push(['.txt-citizen-name', objData.citizen_full_name]);
                            o.h += "</div>";
                            if(!isForLogs) {
                                o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                    o.h += "<button class='btn btn-success btn-xs btn-citizen-search'><span class='fa fa-search'></span></button>";
                                o.h += "</div>";
                            }
                        o.h += "</div>";
                    o.h += "</div>";
                }

                // citizen gender
                if(objData.citizen_gender != null) {
                    o.h += "<div class='col-md-3 col-sm-6 col-12'>";
                        o.h += "<div class='form-group form-group-default readonly'>";
                            o.h += "<label>GENDER</label>";
                            o.h += "<input type='text' class='form-control txt-citizen-gender' readonly disabled>";
                            o.v.push(['.txt-citizen-gender', objData.citizen_gender]);
                        o.h += "</div>";
                    o.h += "</div>";
                }

                // citizen tin
                if(objData.citizen_tin != null) {
                    o.h += "<div class='col-md-3 col-sm-6 col-12'>";
                        o.h += "<div class='form-group form-group-default readonly'>";
                            o.h += "<label>TIN</label>";
                            o.h += "<input type='text' class='form-control txt-citizen-tin' readonly disabled>";
                            o.v.push(['.txt-citizen-tin', objData.citizen_tin]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                o.h += "<div class='row clearfix'>";
                // business name
                if(objData.business_name != null) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label>BUSINESS NAME</label>";
                            o.h += "<input type='text' class='form-control txt-business-name item-main-title'>";
                            o.v.push(['.txt-business-name', objData.business_name]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";
                o.h += "<div class='row clearfix'>";
                // type of business
                if(objData.business_types != undefined && objData.business_type_id != undefined) {
                    o.h += "<div class='col-md-2 col-sm-6 col-12'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>TYPE</label>";
                            o.h += "<select class='cbo-business-type'>";
                            for(var i=0; i<objData.business_types.length; i++) {
                                var attrSelected = (objData.business_types[i].id == objData.business_type_id) ? ' selected' : '';
                                o.h += "<option value='" + objData.business_types[i].id + "'" + attrSelected + ">" + objData.business_types[i].title +"</option>";
                            }
                            o.h += "</select>";
                        o.h += "</div>";
                    o.h += "</div>";
                }

                // mode of payment
                if(objData.payment_modes != undefined && objData.payment_mode_id != undefined) {
                    o.h += "<div class='col-md-2 col-sm-6 col-12'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>PAYMENT</label>";
                            o.h += "<select class='cbo-payment-mode'>";
                            for(var i=0; i<objData.payment_modes.length; i++) {
                                var attrSelected = (objData.payment_modes[i].id == objData.payment_mode_id) ? ' selected' : '';
                                o.h += "<option value='" + objData.payment_modes[i].id + "'" + attrSelected + ">" + objData.payment_modes[i].title +"</option>";
                            }
                            o.h += "</select>";
                        o.h += "</div>";
                    o.h += "</div>";
                }

                // dti | cda | sec
                if(objData.active_number != null && objData.dti_number != null && objData.cda_number != null && objData.sec_number != null && objData.dti_date != null && objData.cda_date != null && objData.sec_date != null) {
                    var regNumber = '';
                    var regDate = '';
                    var arrBadgeClasses = ['', '', ''];
                    if(objData.active_number == 'DTI') {
                        regNumber = objData.dti_number;
                        regDate = objData.dti_date;
                        arrBadgeClasses[0] = ' badge badge-success';
                    }
                    else if(objData.active_number == 'CDA') {
                        regNumber = objData.cda_number;
                        regDate = objData.cda_date;
                        arrBadgeClasses[1] = ' badge badge-success';
                    }
                    else if(objData.active_number == 'SEC') {
                        regNumber = objData.sec_number;
                        regDate = objData.cda_date;
                        arrBadgeClasses[2] = ' badge badge-success';
                    }
                    o.h += "<div class='col-md-4 col-sm-6 col-12'>";
                        o.h += "<div class='form-group form-group-default form-group-reg-number required' data-DTI='" + objData.dti_number + "' data-CDA='" + objData.cda_number + "' data-SEC='" + objData.sec_number + "'>";
                            o.h += "<label><span class='label-opt" + arrBadgeClasses[0] + " cursor-pointer' data-ref='application_reg'>DTI</span> / <span class='label-opt" + arrBadgeClasses[1] + " cursor-pointer' data-ref='application_reg'>CDA</span> / <span class='label-opt" + arrBadgeClasses[2] + " cursor-pointer' data-ref='application_reg'>SEC</span> Number</label>";
                            o.h += "<input type='text' class='form-control txt-opt txt-dti-cda-sec-number'>";
                            o.v.push(['.txt-dti-cda-sec-number', regNumber]);
                        o.h += "</div>";
                    o.h += "</div>";
                    o.h += "<div class='col-md-4 col-sm-6 col-12'>";
                        o.h += "<div class='form-group form-group-default form-group-reg-date required' data-DTI='" + objData.dti_date + "' data-CDA='" + objData.cda_date + "' data-SEC='" + objData.sec_date + "'>";
                            o.h += "<label><span class='label-opt" + arrBadgeClasses[0] + " cursor-pointer' data-ref='application_reg'>DTI</span> / <span class='label-opt" + arrBadgeClasses[1] + " cursor-pointer' data-ref='application_reg'>CDA</span> / <span class='label-opt" + arrBadgeClasses[2] + " cursor-pointer' data-ref='application_reg'>SEC</span> Number</label>";
                            o.h += "<input type='text' class='form-control date-opt date-picker txt-dti-cda-sec-date cursor-pointer' readonly>";
                            o.v.push(['.txt-dti-cda-sec-date', regDate]);
                        o.h += "</div>";
                    o.h += "</div>";
            	}
                o.h += "</div>";
            o.h += "</div>";
            var tradeClass = (objData.business_type_id == '1') ? ' hidden' : '';
            o.h += "<div class='form-group-attached form-group-trade" + tradeClass + "'>";
                o.h += "<div class='row clearfix'>";
                // trade name
                if(objData.trade_name != null) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>TRADE NAME</label>";
                            o.h += "<input type='text' class='form-control txt-trade-name'>";
                            o.v.push(['.txt-trade-name', objData.trade_name]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";
                o.h += "<div class='row clearfix'>";
                // corporate owner
                if(objData.corporate_owner_id != undefined && objData.corporate_owner_avatar != undefined && objData.corporate_owner_fullname != undefined) {
                    o.h += "<div class='col-md-8'>";
                        o.h += "<div class='form-group form-group-default form-group-search input-group form-group-corporate-owner' data-id='" + objData.corporate_owner_id + "'>";
                            o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                o.h += "<span class='thumbnail-wrapper d32 circular inline cursor-pointer' style='position: relative'>";
                                    var avatarDir = citizenAvatarDir;
                                    if(parseInt(objData.corporate_owner_id) == 0)
                                        avatarDir = index + 'img/users/';
                                    o.h += "<img class='img-citizen-avatar img-item-avatar' src='" + avatarDir +  objData.corporate_owner_avatar + "' data-src='" + objData.corporate_owner_avatar + "' alt='[img]'>";
                                o.h += "</span>";
                            o.h += "</div>";
                            o.h += "<div class='form-input-group'>";
                                o.h += "<label class='inline'>TRADE OWNER</label>";
                                o.h += "<input type='text' class='form-control txt-corporate-owner-name'>";
                                o.v.push(['.txt-corporate-owner-name', objData.corporate_owner_fullname]);
                            o.h += "</div>";
                            if(!isForLogs) {
                                o.h += "<div class='input-group-addon bg-transparent h-c-50' style='display: inline-table; padding-top: 13px'>";
                                    o.h += "<div class='btn-group'>";
                                        o.h += "<button class='btn btn-success btn-xs btn-corporate-owner-search'><span class='fa fa-search'></span></button>";
                                        o.h += "<button class='btn btn-default btn-xs btn-corporate-owner-upload-photo'><span class='fa fa-upload'></span></button>";
                                    o.h += "</div>";
                                o.h += "</div>";
                            }
                        o.h += "</div>";
                    o.h += "</div>";
                }

                // corporate TIN
                if(objData.corporate_owner_tin != null) {
                    o.h += "<div class='col-md-4'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>TRADE TIN</label>";
                            o.h += "<input type='text' class='form-control txt-corporate-owner-tin'>";
                            o.v.push(['.txt-corporate-owner-tin', objData.corporate_owner_tin]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                // corporate address
                o.h += "<div class='row clearfix'>";
                if(objData.corporate_owner_address != null) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>TRADE ADDRESS</label>";
                            o.h += "<input type='text' class='form-control txt-corporate-owner-address'>";
                            o.v.push(['.txt-corporate-owner-address', objData.corporate_owner_address]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";
            o.h += "</div>";

            o.h += "<br>";
            o.h += "<p class='text-montserrat text-bold no-margin'>2. OTHER INFORMATION</p>";
            o.h += "<div class='form-group-attached'>";
                o.h += "<div class='row clearfix'>";
                // business street address
                if(objData.street_address != null) {
                    o.h += "<div class='col-md-4'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label>BUSINESS ST. ADDRESS</label>";
                            o.h += "<input type='text' class='form-control txt-street-address'>";
                            o.v.push(['.txt-street-address', objData.street_address]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                // business barangay address
                if(objData.barangay_id != null && objData.barangay_address != null) {
                    o.h += "<div class='col-md-8'>";
                        o.h += "<div class='form-group form-group-default form-group-search input-group form-group-barangay' data-id='" + objData.barangay_id + "'>";
                            o.h += "<div class='form-input-group'>";
                                o.h += "<label class='inline'>BUSINESS BARANGAY ADDRESS</label>";
                                o.h += "<input type='text' class='form-control txt-barangay-address' disabled readonly>";
                                o.v.push(['.txt-barangay-address', objData.barangay_address]);
                            o.h += "</div>";
                            if(!isForLogs) {
                                o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                    o.h += "<button class='btn btn-success btn-xs btn-barangay-search'><span class='fa fa-search'></span></button>";
                                o.h += "</div>";
                            }
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                o.h += "<div class='row clearfix'>";
                // business email
                if(objData.business_email != null) {
                    o.h += "<div class='col-md-4'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>BUSINESS EMAIL</label>";
                            o.h += "<input type='email' class='form-control txt-business-email'>";
                            o.v.push(['.txt-business-email', objData.business_email]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                // business mobile num
                if(objData.business_mobile_num != null) {
                    o.h += "<div class='col-md-4'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>BUSINESS MOBILE NO.</label>";
                            o.h += "<input type='text' class='form-control txt-business-mobile-num'>";
                            o.v.push(['.txt-business-mobile-num', objData.business_mobile_num]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                // business tel num
                if(objData.business_tel_num != null) {
                    o.h += "<div class='col-md-4'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>BUSINESS TEL. NO.</label>";
                            o.h += "<input type='text' class='form-control txt-business-tel-num'>";
                            o.v.push(['.txt-business-tel-num', objData.business_tel_num]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                o.h += "<div class='row clearfix'>";
                // home address
                if(objData.home_address != null) {
                    o.h += "<div class='col-md-8'>";
                        o.h += "<div class='form-group form-group-default readonly'>";
                            o.h += "<label>HOME ADDRESS</label>";
                            o.h += "<input type='text' class='form-control txt-citizen-address' readonly disabled>";
                            o.v.push(['.txt-citizen-address', objData.home_address]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                // home contact num
                if(objData.home_contact_num != null) {
                    o.h += "<div class='col-md-4'>";
                        o.h += "<div class='form-group form-group-default readonly'>";
                            o.h += "<label>HOME CONTACT NO.</label>";
                            o.h += "<input type='text' class='form-control txt-citizen-contact-num' readonly disabled>";
                            o.v.push(['.txt-citizen-contact-num', objData.home_contact_num]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";
                // emergency contact person
                o.h += "<div class='row clearfix'>";
                if(objData.emergency_person != null) {
                    o.h += "<div class='col-md-8'>";
                        o.h += "<div class='form-group form-group-default readonly'>";
                            o.h += "<label>EMERGENCY CONTACT PERSON</label>";
                            o.h += "<input type='text' class='form-control txt-citizen-emergency-person' readonly disabled>";
                            o.v.push(['.txt-citizen-emergency-person', objData.emergency_person]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                // emergency contact number
                if(objData.emergency_contact_num != null) {
                    o.h += "<div class='col-md-4'>";
                        o.h += "<div class='form-group form-group-default readonly'>";
                            o.h += "<label>EMERGENCY CONTACT NO.</label>";
                            o.h += "<input type='text' class='form-control txt-citizen-emergency-contact-num' readonly disabled>";
                            o.v.push(['.txt-citizen-emergency-contact-num', objData.emergency_contact_num]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                o.h += "<div class='row clearfix'>";
                // total male employees
                if(objData.total_male_emp != null) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label><span class='label-label'>TOTAL MALE EMPLOYEES</span></label>";
                            o.h += "<input type='text' class='form-control txt-int txt-total-male-employees'>";
                            o.v.push(['.txt-total-male-employees', applyCommas(objData.total_male_emp, true)]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                // total male employees from lgu
                if(objData.total_male_emp_lgu != null) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label><span class='label-label'>TOTAL MALE EMPLOYEES FROM " + lgu.toUpperCase() + "</span></label>";
                            o.h += "<input type='text' class='form-control txt-int txt-total-male-employees-lgu' data-low-of='.txt-total-male-employees'>";
                            o.v.push(['.txt-total-male-employees-lgu', applyCommas(objData.total_male_emp_lgu, true)]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                o.h += "<div class='row clearfix'>";
                // total female employees
                if(objData.total_female_emp != null) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label><span class='label-label'>TOTAL FEMALE EMPLOYEES</span></label>";
                            o.h += "<input type='text' class='form-control txt-int txt-total-female-employees'>";
                            o.v.push(['.txt-total-female-employees', applyCommas(objData.total_female_emp, true)]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                // total female employees from lgu
                if(objData.total_female_emp_lgu != null) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label><span class='label-label'>TOTAL FEMALE EMPLOYEES FROM " + lgu.toUpperCase() + "</span></label>";
                            o.h += "<input type='text' class='form-control txt-int txt-total-female-employees-lgu' data-low-of='.txt-total-female-employees'>";
                            o.v.push(['.txt-total-female-employees-lgu', applyCommas(objData.total_female_emp_lgu, true)]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                o.h += "<div class='row clearfix'>";
                if(objData.business_area != null) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>BUSINESS AREA (SQ. METERS)</label>";
                            o.h += "<input type='text' class='form-control txt-amount txt-business-area'>";
                            o.v.push(['.txt-business-area', applyCommas(objData.business_area)]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                var classRentalHidden = ' hidden';
                if(objData.is_renting != null) {
                    o.h += "<div class='col-md-6'>";
                        o.h += "<div class='form-group form-group-default input-group'>";
                            o.h += "<div class='form-input-group'>";
                                o.h += "<label class='inline' id=''>RENTING THE BUSINESS AREA?</label>";
                            o.h += "</div>";
                            o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                var attrChecked = '';
                                if (objData.is_renting == '1') {
                                    attrChecked = ' checked';
                                    classRentalHidden = '';
                                }
                                var attrDisabled = (isForLogs) ? ' disabled' : '';
                                o.h += " <input type='checkbox' class='chk-is-renting'" + attrChecked + " data-toggle-visibility='.row-rent' data-init-plugin='switchery' data-size='small' data-color='success'" + attrDisabled + ">";
                            o.h += "</div>";
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                o.h += "<div class='row clearfix row-rent" + classRentalHidden + "'>";
                if(objData.monthly_rental != null) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default input-group input-group-currency form-group-rent-amount'>";
                            o.h += "<div class='form-input-group'>";
                                o.h += "<label>MONTHLY RENT</label>";
                                o.h += "<input type='text' class='form-control txt-amount txt-amount-rent'>";
                                o.v.push(['.txt-amount-rent', applyCommas(objData.monthly_rental)]);
                            o.h += "</div>";
                            o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                o.h += "<div class='row clearfix row-rent" + classRentalHidden + "'>";
                if(objData.lessor_fullname != null) {
                    o.h += "<div class='col-md-8'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>LESSOR FULL NAME</label>";
                            o.h += "<input type='text' class='form-control txt-lessor-fullname'>";
                            o.v.push(['.txt-lessor-fullname', objData.lessor_fullname]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                if(objData.lessor_contact_num != null) {
                    o.h += "<div class='col-md-4'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>LESSOR CONTACT NO.</label>";
                            o.h += "<input type='text' class='form-control txt-lessor-contact-num'>";
                            o.v.push(['.txt-lessor-contact-num', objData.lessor_contact_num]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                o.h += "<div class='row clearfix row-rent" + classRentalHidden + "'>";
                if(objData.lessor_address != null) {
                    o.h += "<div class='col-md-8'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>LESSOR ADDRESS</label>";
                            o.h += "<input type='text' class='form-control txt-lessor-address'>";
                            o.v.push(['.txt-lessor-address', objData.lessor_address]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                if(objData.lessor_email != null) {
                    o.h += "<div class='col-md-4'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>LESSOR EMAIL</label>";
                            o.h += "<input type='email' class='form-control txt-lessor-email'>";
                            o.v.push(['.txt-lessor-email', objData.lessor_email]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";

                // extra last row (for consistent border-bottom)
                o.h += "<div class='row clearfix'>";
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default no-padding'></div>";
                    o.h += "</div>";
                o.h += "</div>";

            o.h += "</div>";
            o.h += "<br>";
            o.h += "<p class='text-montserrat text-bold no-margin'>3. BUSINESS ACTIVITY</p>";
            o.h += "<div class='div-bus-activities'>";
            if(objData.business_activities != null) {
                for(var i=0; i<objData.business_activities.length; i++) {
                    var objBusActivity = generateBusinessActivity(application_type, objData.business_activities[i], isForLogs);
                    o.h += objBusActivity.h;
                    for(var x=0; x<objBusActivity.v.length; x++) {
                        o.v.push([objBusActivity.v[x][0], objBusActivity.v[x][1]]);
                    }
                }
            }
            o.h += "</div>";
            if(!isForLogs) {
                o.h += "<div class='form-group-attached form-group-attached-hover'>";
                    o.h += "<div class='row clearfix'>";
                        o.h += "<div class='col-md-12 p-t-5' align='right'>";
                            o.h += "<button class='btn btn-success btn-xs font-1em btn-line-of-business-add' data-application-type='" + application_type + "'><span class='fa fa-plus-circle'></span> ADD BUSINESS ACTIVITY</button>";
                        o.h += "</div>";
                    o.h += "</div>";
                o.h += "</div>";
            }
        o.h += "</div>";
    }

    // NEW VERIFICATION | RENEWAL VERIFICATION
    else if(tabIdentifier == STR_TAB_NEW_VERIFICATIONS || tabIdentifier == STR_TAB_RENEWAL_VERIFICATIONS) {
        if(objData.application != null) {
            var application = objData.application;
            var application_type = '';
            if(application.application_type != null) {
                application_type = application.application_type;
            }
            o.h += "<div class='main-row hidden'>";
            if(!isForLogs) {
                o.h += "<p class='text-montserrat text-bold no-margin'> - To save changes, press the <span class='text-success'><span class='fa fa-save'></span> SAVE</span> button above.</p>";
                o.h += "<p class='text-montserrat text-bold padding-bottom-15'> - To submit for payment invoice, press the <span class='text-success'><span class='fa fa-arrow-circle-right'></span> INVOICE</span> button above.</p>";
            }
                o.h += "<h4 class='no-margin'>I. APPLICATION SUMMARY</h4>";
                o.h += "<div style='background-color: #f0f0f0; padding: 5px; margin-bottom: 15px'>";
                    o.h += "<div class='form-group-attached'>";
                        o.h += "<div class='row clearfix'>";
                        if(application.citizen_avatar != null && application.citizen_full_name != null) {
                            o.h += "<div class='col-md-6 col-sm-12 col-12'>";
                                o.h += "<div class='form-group form-group-default input-group'>";
                                    o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                        o.h += "<span class='thumbnail-wrapper d32 circular inline cursor-pointer'>";
                                            var avatarDir = citizenAvatarDir;
                                            if(parseInt(objData.citizen_id) == 0)
                                                avatarDir = index + 'img/';
                                            o.h += "<img class='img-item-avatar' src='" + avatarDir +  application.citizen_avatar + "' data-src='" + application.citizen_avatar + "' alt='[img]'>";
                                        o.h += "</span>";
                                    o.h += "</div>";
                                    o.h += "<div class='form-input-group'>";
                                        o.h += "<label class='inline'>CITIZEN</label>";
                                        o.h += "<input type='text' class='form-control txt-citizen-name item-sub-title' disabled readonly>";
                                        o.v.push(['.txt-citizen-name', application.citizen_full_name]);
                                    o.h += "</div>";
                                o.h += "</div>";
                            o.h += "</div>";
                        }
                        if(application.business_type_id != null && application.business_types != null) {
                            o.h += "<div class='col-md-3 col-sm-6 col-6'>";
                                o.h += "<div class='form-group form-group-default'>";
                                    o.h += "<label>BUSINESS TYPE</label>";
                                    o.h += "<select disabled>";
                                    for(var i=0; i<application.business_types.length; i++) {
                                        var attrSelected = (application.business_types[i].id == application.business_type_id) ? ' selected' : '';
                                        o.h += "<option value='" + application.business_types[i].id + "'" + attrSelected + ">" + application.business_types[i].title +"</option>";
                                    }
                                    o.h += "</select>";
                                o.h += "</div>";
                            o.h += "</div>";
                        }
                        if(application.payment_mode_id != null && application.payment_modes != null) {
                            o.h += "<div class='col-md-3 col-sm-6 col-6'>";
                                o.h += "<div class='form-group form-group-default'>";
                                    o.h += "<label>PAYMENT MODE</label>";
                                    o.h += "<select disabled>";
                                    for(var i=0; i<application.payment_modes.length; i++) {
                                        var attrSelected = (application.payment_modes[i].id == application.payment_mode_id) ? ' selected' : '';
                                        o.h += "<option value='" + application.payment_modes[i].id + "'" + attrSelected + ">" + application.payment_modes[i].title +"</option>";
                                    }
                                    o.h += "</select>";
                                o.h += "</div>";
                            o.h += "</div>";
                        }
                        o.h += "</div>";
                        o.h += "<div class='row clearfix'>";
                        if(application.business_name != null) {
                            o.h += "<div class='col-md-12'>";
                                o.h += "<div class='form-group form-group-default'>";
                                    o.h += "<label>BUSINESS NAME</label>";
                                    o.h += "<input type='text' class='form-control txt-business-name' disabled readonly>";
                                    o.v.push(['.txt-business-name', application.business_name]);
                                o.h += "</div>";
                            o.h += "</div>";
                        }
                        o.h += "</div>";
                        if(application.business_type_id != '1') {
                            o.h += "<div class='row clearfix'>";
                            if(application.trade_name != null) {
                                o.h += "<div class='col-md-12'>";
                                    o.h += "<div class='form-group form-group-default'>";
                                        o.h += "<label>TRADE NAME</label>";
                                        o.h += "<input type='text' class='form-control txt-trade-name' disabled readonly>";
                                        o.v.push(['.txt-trade-name', application.trade_name]);
                                    o.h += "</div>";
                                o.h += "</div>";
                            }
                            // corporate owner
                            if(application.corporate_owner_id != undefined && application.corporate_owner_avatar != undefined && application.corporate_owner_fullname != undefined) {
                                o.h += "<div class='col-md-8'>";
                                    o.h += "<div class='form-group form-group-default form-group-search input-group form-group-corporate-owner' data-id='" + application.corporate_owner_id + "'>";
                                        o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                            o.h += "<span class='thumbnail-wrapper d32 circular inline cursor-pointer' style='position: relative'>";
                                                var avatarDir = citizenAvatarDir;
                                                if(parseInt(application.corporate_owner_id) == 0)
                                                    avatarDir = index + 'img/users/';
                                                o.h += "<img class='img-citizen-avatar img-item-avatar' src='" + avatarDir +  application.corporate_owner_avatar + "' data-src='" + application.corporate_owner_avatar + "' alt='[img]'>";
                                            o.h += "</span>";
                                        o.h += "</div>";
                                        o.h += "<div class='form-input-group'>";
                                            o.h += "<label class='inline'>TRADE OWNER</label>";
                                            o.h += "<input type='text' class='form-control txt-corporate-owner-name' disabled readonly>";
                                            o.v.push(['.txt-corporate-owner-name', application.corporate_owner_fullname]);
                                        o.h += "</div>";
                                    o.h += "</div>";
                                o.h += "</div>";
                            }
                            // corporate TIN
                            if(application.corporate_owner_tin != null) {
                                o.h += "<div class='col-md-4'>";
                                    o.h += "<div class='form-group form-group-default'>";
                                        o.h += "<label>TRADE TIN</label>";
                                        o.h += "<input type='text' class='form-control txt-corporate-owner-tin' disabled readonly>";
                                        o.v.push(['.txt-corporate-owner-tin', application.corporate_owner_tin]);
                                    o.h += "</div>";
                                o.h += "</div>";
                            }
                            o.h += "</div>";

                            // corporate address
                            o.h += "<div class='row clearfix'>";
                            if(application.corporate_owner_address != null) {
                                o.h += "<div class='col-md-12'>";
                                    o.h += "<div class='form-group form-group-default'>";
                                        o.h += "<label>TRADE ADDRESS</label>";
                                        o.h += "<input type='text' class='form-control txt-corporate-owner-address' disabled readonly>";
                                        o.v.push(['.txt-corporate-owner-address', application.corporate_owner_address]);
                                    o.h += "</div>";
                                o.h += "</div>";
                            }
                            o.h += "</div>";
                        }
                        if(application.business_activities != null) {
                            for(var i=0; i<application.business_activities.length; i++) {
                                var business_activity = application.business_activities[i];
                                o.h += "<div class='row clearfix'>";
                                    var colLineOfBusiness = 'col-md-5 col-12';
                                    var colNumUnits = 'col-md-3 col-12';
                                    var lblNumUnits = "<span class='collapse-768'>NUMBER OF&nbsp;</span>UNITS";
                                    if(application_type == 'RENEWAL') {
                                        colLineOfBusiness = 'col-md-12 col-12';
                                        colNumUnits = 'col-md-2 col-12';
                                        lblNumUnits = 'UNITS';
                                    }
                                    o.h += "<div class='" + colLineOfBusiness + "'>";
                                        o.h += "<div class='form-group form-group-default input-group'>";
                                            o.h += "<div class='form-input-group'>";
                                                o.h += "<label class='inline'>LINE OF BUSINESS</label>";
                                                o.h += "<input type='text' class='form-control txt-line-of-business txt-line-of-business-" + i.toString() + "' disabled readonly>";
                                                o.v.push(['.txt-line-of-business-' + i.toString(), business_activity.business_line_title]);
                                            o.h += "</div>";
                                        o.h += "</div>";
                                    o.h += "</div>";

                                    // number of units
                                    o.h += "<div class='" + colNumUnits + "'>";
                                        o.h += "<div class='form-group form-group-default'>";
                                            o.h += "<label>" + lblNumUnits + "</label>";
                                            o.h += "<input type='text' class='form-control txt-int txt-units txt-units-" + i.toString() + "' disabled readonly>";
                                            o.v.push(['.txt-units-' + i.toString(), applyCommas(business_activity.units, true)]);
                                        o.h += "</div>";
                                    o.h += "</div>";

                                    // capitalization
                                    if(application_type == 'NEW') {
                                        o.h += "<div class='col-md-4 col-12'>";
                                            o.h += "<div class='form-group form-group-default input-group input-group-currency'>";
                                                o.h += "<div class='form-input-group'>";
                                                    o.h += "<label>CAPITALIZATION</label>";
                                                    o.h += "<input type='text' class='form-control txt-amount txt-capitalization txt-capitalization-" + i.toString() + "' disabled readonly>";
                                                    o.v.push(['.txt-capitalization-' + i.toString(), applyCommas(business_activity.capitalization)]);
                                                o.h += "</div>";
                                                o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                            o.h += "</div>";
                                        o.h += "</div>";
                                    }
                                    // gross sales essential and non-essential
                                    if(application_type == 'RENEWAL') {
                                        o.h += "<div class='col-md-5 col-12'>";
                                            o.h += "<div class='form-group form-group-default input-group input-group-currency'>";
                                                o.h += "<div class='form-input-group'>";
                                                    o.h += "<label>GROSS SALES (ESSENTIAL)</label>";
                                                    o.h += "<input type='text' class='form-control txt-amount txt-gross-sales-essential txt-gross-sales-essential-" + i.toString() + "' disabled readonly>";
                                                    o.v.push(['.txt-gross-sales-essential-' + i.toString(), applyCommas(business_activity.gross_sales_essential)]);
                                                o.h += "</div>";
                                                o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                            o.h += "</div>";
                                        o.h += "</div>";
                                        o.h += "<div class='col-md-5 col-12'>";
                                            o.h += "<div class='form-group form-group-default input-group input-group-currency'>";
                                                o.h += "<div class='form-input-group'>";
                                                    o.h += "<label>GROSS SALES (NON-ESSENTIAL)</label>";
                                                    o.h += "<input type='text' class='form-control txt-amount txt-gross-sales-non-essential txt-gross-sales-non-essential-" + i.toString() + "' disabled readonly>";
                                                    o.v.push(['.txt-gross-sales-non-essential-' + i.toString(), applyCommas(business_activity.gross_sales_non_essential)]);
                                                o.h += "</div>";
                                                o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                            o.h += "</div>";
                                        o.h += "</div>";
                                    }
                                o.h += "</div>";
                            }
                        }
                    o.h += "</div>";
                o.h += "</div>";

                o.h += "<h4 class='no-margin'>II. REQUIREMENTS</h4>";
                o.h += "<div style='background-color: #f0f0f0; padding: 5px; margin-bottom: 15px'>";
                if(objData.requirements != null) {
                    var requirements_after_payment = [];
                    for(var i=0; i<objData.requirements.length; i++) {
                        var requirement = objData.requirements[i];
                        if(requirement.collect_after == 'PAYMENT' && senderTabIdentifier == '')
                        {
                            requirements_after_payment.push(requirement);
                            continue;
                        }
                        var styleMarginBot = (i < objData.requirements.length - 1) ? '5px' : '0';
                        o.h += "<div class='form-group-attached form-group-attached-requirement form-group-attached-hover' style='margin-bottom: " + styleMarginBot + "' data-id='" + requirement.id + "'>";
                            o.h += "<div class='row clearfix'>";
                            var divReqTitleClass = 'col-md-4';
                            var divValidationCodeClass = 'col-sm-3';
                            if(requirement.for_upload == '0') {
                                divReqTitleClass = 'col-md-7';
                                divValidationCodeClass = 'col-sm-9';
                            }
                            if(requirement.title != null) {
                                o.h += "<div class='" + divReqTitleClass + " col-sm-12 col-12'>";
                                    o.h += "<div class='form-group form-group-default'>";
                                        o.h += "<label>REQUIREMENT TITLE</label>";
                                        o.h += "<input type='text' class='form-control txt-requirement-title-" + i.toString() +"' readonly disabled>";
                                        o.v.push(['.txt-requirement-title-' + i.toString(), requirement.title]);
                                    o.h += "</div>";
                                o.h += "</div>";
                            }
                            if(requirement.for_upload == '1') {
                                if (requirement.submitted.file_name != null) {
                                    o.h += "<div class='col-md-3 col-sm-6 col-12'>";
                                        o.h += "<div class='form-group form-group-default form-group-upload form-group-requirement-upload input-group'>";
                                            o.h += "<div class='form-input-group'>";
                                                o.h += "<label class='inline' data-item='" + requirement.title + "'>FILE NAME</label>";
                                                o.h += "<input type='text' class='form-control txt-file-name txt-file-name-" + i.toString() + "' disabled readonly>";
                                                o.v.push(['.txt-file-name-' + i.toString(), requirement.submitted.file_name]);
                                                o.h += "<input type='text' class='hidden txt-upload-item-title txt-upload-item-title-" + i.toString() +"'>";
                                                o.v.push(['.txt-upload-item-title-' + i.toString(), requirement.title]);
                                            o.h += "</div>";
                                            if (!isForLogs || ((senderTabIdentifier == STR_TAB_NEW_INVOICES || senderTabIdentifier == STR_TAB_RENEWAL_INVOICES) && requirement.collect_after == 'PAYMENT')) {
                                                o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                                    o.h += "<button class='btn btn-success btn-xs btn-upload-requirement'><span class='fa fa-upload'></span></button>";
                                                o.h += "</div>";
                                            }
                                            else {
                                                o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                                    o.h += "<button class='btn btn-success btn-xs btn-view-requirement'><span class='fa fa-eye'></span></button>";
                                                o.h += "</div>";
                                            }
                                        o.h += "</div>";
                                    o.h += "</div>";
                                }
                            }
                            if(requirement.validation_code_title != null) {
                                o.h += "<div class='col-md-3 " + divValidationCodeClass + " col-6'>";
                                    o.h += "<div class='form-group form-group-default required'>";
                                        o.h += "<label>" + requirement.validation_code_title.toUpperCase() + "</label>";
                                        o.h += "<input type='text' class='form-control txt-requirement-validation-code txt-requirement-validation-code-" + i.toString() +"'>";
                                        if(requirement.submitted.validation_code != null)
                                            o.v.push(['.txt-requirement-validation-code-' + i.toString(), requirement.submitted.validation_code]);
                                    o.h += "</div>";
                                o.h += "</div>";
                            }
                            if(requirement.submitted.is_verified != null) {
                                o.h += "<div class='col-md-2 col-sm-3 col-6'>";
                                    o.h += "<div class='form-group form-group-default input-group'>";
                                        o.h += "<div class='form-input-group'>";
                                            o.h += "<label class='inline' id=''>VERIFIED?</label>";
                                            o.h += "</div>";
                                            o.h += "<div class='input-group-addon bg-transparent h-c-50 no-padding-left'>";
                                            var attrChecked = (requirement.submitted.is_verified == '1') ? 'checked' : '';
                                            var attrDisabled = (!isForLogs || ((senderTabIdentifier == STR_TAB_NEW_INVOICES || senderTabIdentifier == STR_TAB_RENEWAL_INVOICES) && requirement.collect_after == 'PAYMENT')) ? '' : ' disabled';
                                            o.h += " <input type='checkbox' class='chk-verified' " + attrChecked + " data-init-plugin='switchery' data-size='small' data-color='success'" + attrDisabled + ">";
                                        o.h += "</div>";
                                    o.h += "</div>";
                                o.h += "</div>";
                            }
                            o.h += "</div>";
                        o.h += "</div>";
                    }

                    if(requirements_after_payment.length > 0) {
                        o.h += "<div class='bg-white padding-15'>";
                        o.h += "<h6 class='text-danger'><b><span class='fa fa-info-circle fa-fw'></span> Requirement" + (requirements_after_payment.length > 1 ? "s" : "") + " to be collected after payment of applicable fees:</b></h6>";
                        o.h += "<ol>";
                        for(var x=0; x<requirements_after_payment.length; x++) {
                            o.h += "<li><b><big>" + requirements_after_payment[x].title + "</big></b></li>";
                        }
                        o.h += "</ol>";
                        o.h += "</div>";
                    }
                }
                o.h += "</div>";
                o.h += "<h4 class='no-margin'>III. APPLICABLE FEES</h4>";
                o.h += "<div style='background-color: #f0f0f0; padding: 5px; margin-bottom: 15px'>";
                if(objData.fees != null) {
                    if(objData.business_size != null) {
                        if(objData.business_size.title != null) {
                            o.h += "<p class='text-montserrat text-bold no-margin padding-left-15'>BUSINESS SIZE : <span class='text-info'>" + objData.business_size.title + "</span></p>";
                        }
                    }
                    o.h += "<div class='padding-left-15 padding-right-15 text-montserrat text-bold' style='border: 1px dotted #e3f0fc; border-bottom: 0'>";
                        if(objData.fees.fee_classifications != null) {
                            for(var i=0; i<objData.fees.fee_classifications.length; i++) {
                                var fee = objData.fees.fee_classifications[i];
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left text-success'>" + fee.fee.toUpperCase() + " :</div>";
                                    o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(fee.amount) + "</div>";
                                o.h += "</div>";
                            }
                        }
                    o.h += "</div>";
                    if(objData.fees.total_fee != null) {
                        o.h += "<div class='padding-left-15 padding-right-15 text-montserrat text-bold' style='border: 1px dotted #e3f0fc; border-bottom: 0; margin-top: 4px'>";
                            o.h += "<div class='row row-tbl'>";
                                o.h += "<div class='col-md-5 col-left text-danger'>TOTAL FEES :</div>";
                                o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(objData.fees.total_fee) + "</div>";
                            o.h += "</div>";
                        o.h += "</div>";
                    }
                }
                o.h += "</div>";

                o.h += "<h4 class='no-margin'>IV. BUSINESS TAX</h4>";
                o.h += "<div style='background-color: #f0f0f0; padding: 5px; margin-bottom: 15px'>";
                if(application.business_activities != null) {
                    for(var i=0; i<application.business_activities.length; i++) {
                        var businessActivity = application.business_activities[i];
                        if(businessActivity.business_line_title != null) {
                            o.h += "<p class='text-montserrat text-bold no-margin padding-left-15'>" + (i+1).toString() + ". " + businessActivity.business_line_title + "</p>";
                        }
                        o.h += "<div class='padding-left-15 padding-right-15 text-montserrat text-bold' style='border: 1px dotted #e3f0fc; border-bottom: 0'>";
                        if(businessActivity.units != null) {
                            o.h += "<div class='row row-tbl'>";
                                o.h += "<div class='col-md-5 col-left text-success'>NUMBER OF UNITS :</div>";
                                o.h += "<div class='col-md-7 col-right'>" + businessActivity.units + "</div>";
                            o.h += "</div>";
                        }
                        if(application_type == 'NEW') {
                            if (businessActivity.capitalization != null) {
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left text-success'>CAPITALIZATION :</div>";
                                    o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(businessActivity.capitalization) + "</div>";
                                o.h += "</div>";
                            }
                            if (businessActivity.total_capitalization != null) {
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left text-success'>TOTAL CAPITALIZATION :</div>";
                                    o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(businessActivity.total_capitalization) + "</div>";
                                o.h += "</div>";
                            }
                        }
                        else if(application_type == 'RENEWAL') {
                            if (businessActivity.gross_sales_essential != null) {
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left text-success'>GROSS SALES (ESSENTIAL) :</div>";
                                    o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(businessActivity.gross_sales_essential) + "</div>";
                                o.h += "</div>";
                            }
                            if (businessActivity.total_gross_sales_essential != null) {
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left text-success'>TOTAL GROSS SALES (ESSENTIAL) :</div>";
                                    o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(businessActivity.total_gross_sales_essential) + "</div>";
                                o.h += "</div>";
                            }
                            if (businessActivity.gross_sales_non_essential != null) {
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left text-success'>GROSS SALES (NON-ESSENTIAL) :</div>";
                                    o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(businessActivity.gross_sales_non_essential) + "</div>";
                                o.h += "</div>";
                            }
                            if (businessActivity.total_gross_sales_non_essential != null) {
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left text-success'>TOTAL GROSS SALES (NON-ESSENTIAL) :</div>";
                                    o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(businessActivity.total_gross_sales_non_essential) + "</div>";
                                o.h += "</div>";
                            }
                            if (businessActivity.total_gross_sales != null) {
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left text-success'>TOTAL GROSS SALES:</div>";
                                    o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(businessActivity.total_gross_sales) + "</div>";
                                o.h += "</div>";
                            }
                        }
                        if (businessActivity.business_tax_formula != null) {
                            o.h += "<div class='row row-tbl'>";
                                o.h += "<div class='col-md-5 col-left text-info'>BUSINESS TAX SETTING:</div>";
                                o.h += "<div class='col-md-7 col-right'>";
                                    o.h += businessActivity.business_tax_formula;
                                    if(businessActivity.business_tax_explanation != null) {
                                        if(businessActivity.business_tax_explanation.trim() != "") {
                                            o.h += "<br><br>" + businessActivity.business_tax_explanation;
                                        }
                                    }
                                o.h += "</div>";
                            o.h += "</div>";
                        }

                        if (businessActivity.business_tax != null) {
                            o.h += "<div class='row row-tbl'>";
                                o.h += "<div class='col-md-5 col-left text-info'>BUSINESS TAX:</div>";
                                o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(businessActivity.business_tax) + "</div>";
                            o.h += "</div>";
                        }
                        o.h += "</div>";
                    }
                    o.h += "<div class='padding-left-15 padding-right-15 text-montserrat text-bold' style='border: 1px dotted #e3f0fc; border-bottom: 0; margin-top: 4px'>";
                    if (application.total_business_tax != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-danger'>TOTAL BUSINESS TAX W/O PENALTY:</div>";
                            o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(application.total_business_tax) + "</div>";
                        o.h += "</div>";
                        /*if(objData.tax_penalty != null) {
                            var taxPenalty = objData.tax_penalty;
                            if(taxPenalty.percentage != null) {
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left text-info'>TAX PENALTY:</div>";
                                    o.h += "<div class='col-md-7 col-right'>" + applyCommas(taxPenalty.percentage) + "%</div>";
                                o.h += "</div>";
                            }
                            if(taxPenalty.amount != null) {
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left text-info'>PENALTY AMOUNT:</div>";
                                    o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(taxPenalty.amount) + "</div>";
                                o.h += "</div>";
                            }
                            if(taxPenalty.tax_with_penalty != null) {
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left'>WITH PENALTY:</div>";
                                    o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(taxPenalty.tax_with_penalty) + "</div>";
                                o.h += "</div>";
                            }
                            if(taxPenalty.effectivity_start != null && taxPenalty.effectivity_end != null) {
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left text-info'>PENALTY EFFECTIVITY:</div>";
                                    o.h += "<div class='col-md-7 col-right'><span class='text-danger'>" + taxPenalty.effectivity_start + "</span> to <span class='text-danger'>" + taxPenalty.effectivity_end + "</span></div>";
                                o.h += "</div>";
                            }
                        }*/
                    }
                    o.h += "</div>";
                }
                o.h += "</div>";

                o.h += "<h4 class='no-margin'>V. APPLICATION DATA</h4>";
                o.h += "<div style='background-color: #f0f0f0; padding: 5px; margin-bottom: 15px'>";
                o.h += "<p class='text-montserrat text-bold no-margin padding-left-15'>1. BASIC INFORMATION</p>";
                o.h += "<div class='padding-left-15 padding-right-15 text-montserrat text-bold' style='border: 1px dotted #e3f0fc; border-bottom: 0'>";
                if(application.citizen_full_name != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>CITIZEN :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + application.citizen_full_name + "</div>";
                    o.h += "</div>";
                }
                if(application.citizen_gender != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>GENDER :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + application.citizen_gender + "</div>";
                    o.h += "</div>";
                }
                if(application.citizen_tin != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>TIN :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + application.citizen_tin + "</div>";
                    o.h += "</div>";
                }
                if(application.business_name != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>BUSINESS NAME :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + application.business_name + "</div>";
                    o.h += "</div>";
                }
                if(application.trade_name != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>TRADE NAME :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + application.trade_name + "</div>";
                    o.h += "</div>";
                }
                if(application.business_type_id != null && application.business_types != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>BUSINESS TYPE :</div>";
                        o.h += "<div class='col-md-7 col-right'>";
                        for(var i=0; i<application.business_types.length; i++) {
                            if(application.business_types[i].id == application.business_type_id) {
                                o.h += application.business_types[i].title;
                                break;
                            }
                        }
                        o.h += "</div>";
                    o.h += "</div>";
                }
                if(application.payment_mode_id != null && application.payment_modes != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>PAYMENT MODE :</div>";
                        o.h += "<div class='col-md-7 col-right'>";
                        for(var i=0; i<application.payment_modes.length; i++) {
                            if(application.payment_modes[i].id == application.payment_mode_id) {
                                o.h += application.payment_modes[i].title;
                                break;
                            }
                        }
                        o.h += "</div>";
                    o.h += "</div>";
                }
                if(application.active_number != null) {
                    if(application[application.active_number.toLowerCase() + '_number'] != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>" + application.active_number + " REG. NO.</div>";
                            o.h += "<div class='col-md-7 col-right'>" + application[application.active_number.toLowerCase() + '_number'] + "</div>";
                        o.h += "</div>";
                    }
                    if(application[application.active_number.toLowerCase() + '_date'] != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>" + application.active_number + " REG. DATE</div>";
                            o.h += "<div class='col-md-7 col-right'>" + application[application.active_number.toLowerCase() + '_date'] + "</div>";
                        o.h += "</div>";
                    }
                }
                o.h += "</div>";

                o.h += "<p class='text-montserrat text-bold no-margin padding-left-15' style='padding-top: 5px'>2. OTHER INFORMATION</p>";
                o.h += "<div class='padding-left-15 padding-right-15 text-montserrat text-bold' style='border: 1px dotted #e3f0fc; border-bottom: 0'>";
                if(application.street_address != null && application.barangay_address != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>BUSINESS ADDRESS :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + application.street_address + ", " + application.barangay_address + "</div>";
                    o.h += "</div>";
                }
                if(application.business_email != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>BUSINESS EMAIL :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + application.business_email + "</div>";
                    o.h += "</div>";
                }
                if(application.business_mobile_num != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>BUSINESS MOBILE NO :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + application.business_mobile_num + "</div>";
                    o.h += "</div>";
                }
                if(application.business_tel_num != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>BUSINESS TEL. NO :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + application.business_tel_num + "</div>";
                    o.h += "</div>";
                }
                if(application.home_address != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>HOME ADDRESS :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + application.home_address + "</div>";
                    o.h += "</div>";
                }
                if(application.home_contact_num != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>HOME CONTACT NO :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + application.home_contact_num + "</div>";
                    o.h += "</div>";
                }
                if(application.emergency_person != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>EMERGENCY PERSON :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + application.emergency_person + "</div>";
                    o.h += "</div>";
                }
                if(application.emergency_contact_num != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>EMERGENCY NO :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + application.emergency_contact_num + "</div>";
                    o.h += "</div>";
                }
                if(application.total_male_emp != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>MALE EMPLOYEES :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + applyCommas(application.total_male_emp, true) + "</div>";
                    o.h += "</div>";
                }
                if(application.total_male_emp_lgu != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>MALE EMPLOYEES FROM " + lgu.toUpperCase() + " :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + applyCommas(application.total_male_emp_lgu, true) + "</div>";
                    o.h += "</div>";
                }
                if(application.total_female_emp != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>FEMALE EMPLOYEES :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + applyCommas(application.total_female_emp, true) + "</div>";
                    o.h += "</div>";
                }
                if(application.total_female_emp_lgu != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>FEMALE EMPLOYEES FROM " + lgu.toUpperCase() + " :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + applyCommas(application.total_female_emp_lgu, true) + "</div>";
                    o.h += "</div>";
                }
                if(application.business_area != null) {
                    o.h += "<div class='row row-tbl'>";
                        o.h += "<div class='col-md-5 col-left text-success'>BUSINESS AREA (SQ.M) :</div>";
                        o.h += "<div class='col-md-7 col-right'>" + applyCommas(application.business_area) + "</div>";
                    o.h += "</div>";
                }
                if(application.is_renting != null) {
                    o.h += "<div class='row row-tbl'>";
                        var strRenting = (application.is_renting == '1') ? 'YES' : 'NO';
                        o.h += "<div class='col-md-5 col-left text-success'>IS RENTING ?</div>";
                        o.h += "<div class='col-md-7 col-right'>" + strRenting + "</div>";
                    o.h += "</div>";
                    if(strRenting == 'YES') {
                        if(application.monthly_rental != null) {
                            o.h += "<div class='row row-tbl'>";
                                o.h += "<div class='col-md-5 col-left text-success'>MONTHLY RENT :</div>";
                                o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(application.monthly_rental) + "</div>";
                            o.h += "</div>";
                        }
                        if(application.lessor_fullname != null) {
                            o.h += "<div class='row row-tbl'>";
                                o.h += "<div class='col-md-5 col-left text-success'>LESSOR FULL NAME :</div>";
                                o.h += "<div class='col-md-7 col-right'>" + application.lessor_fullname + "</div>";
                            o.h += "</div>";
                        }
                        if(application.lessor_address != null) {
                            o.h += "<div class='row row-tbl'>";
                                o.h += "<div class='col-md-5 col-left text-success'>LESSOR ADDRESS :</div>";
                                o.h += "<div class='col-md-7 col-right'>" + application.lessor_address + "</div>";
                            o.h += "</div>";
                        }
                        if(application.lessor_contact_num != null) {
                            o.h += "<div class='row row-tbl'>";
                                o.h += "<div class='col-md-5 col-left text-success'>LESSOR CONTACT NO :</div>";
                                o.h += "<div class='col-md-7 col-right'>" + application.lessor_contact_num + "</div>";
                            o.h += "</div>";
                        }
                        if(application.lessor_email != null) {
                            o.h += "<div class='row row-tbl'>";
                                o.h += "<div class='col-md-5 col-left text-success'>LESSOR EMAIL :</div>";
                                o.h += "<div class='col-md-7 col-right'>" + application.lessor_email + "</div>";
                            o.h += "</div>";
                        }
                    }
                }
                o.h += "</div>";

                o.h += "<p class='text-montserrat text-bold no-margin padding-left-15' style='padding-top: 5px'>3. BUSINESS ACTIVITY</p>";
                if(application.business_activities != null) {
                    for(var i=0; i<application.business_activities.length; i++) {
                        var businessActivity = application.business_activities[i];
                        o.h += "<div class='padding-left-15 padding-right-15 text-montserrat text-bold' style='border: 1px dotted #e3f0fc; border-bottom: 0'>";
                        if(businessActivity.business_line_title != null) {
                            o.h += "<div class='row row-tbl'>";
                                o.h += "<div class='col-md-5 col-left text-success'>LINE OF BUSINESS :</div>";
                                o.h += "<div class='col-md-7 col-right'>" + businessActivity.business_line_title + "</div>";
                            o.h += "</div>";
                        }
                        if(businessActivity.units != null) {
                            o.h += "<div class='row row-tbl'>";
                                o.h += "<div class='col-md-5 col-left text-success'>NUMBER OF UNITS :</div>";
                                o.h += "<div class='col-md-7 col-right'>" + applyCommas(businessActivity.units, true) + "</div>";
                            o.h += "</div>";
                        }
                        if(application_type == 'NEW') {
                            if(businessActivity.capitalization != null) {
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left text-success'>CAPITALIZATION :</div>";
                                    o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(businessActivity.capitalization) + "</div>";
                                o.h += "</div>";
                            }
                        }
                        else if(application_type == 'RENEWAL') {
                            if(businessActivity.gross_sales_essential != null) {
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left text-success'>GROSS SALES (ESSENTIAL) :</div>";
                                    o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(businessActivity.gross_sales_essential) + "</div>";
                                o.h += "</div>";
                            }
                            if(businessActivity.gross_sales_non_essential != null) {
                                o.h += "<div class='row row-tbl'>";
                                    o.h += "<div class='col-md-5 col-left text-success'>GROSS SALES (NON-ESSENTIAL) :</div>";
                                    o.h += "<div class='col-md-7 col-right'>&#8369; " + applyCommas(businessActivity.gross_sales_non_essential) + "</div>";
                                o.h += "</div>";
                            }
                        }
                        o.h += "</div>";
                    }
                }
                o.h += "</div>";

                o.h += "<h4 class='no-margin'>VI. APPROVALS</h4>";
                if(objData.verifiers != null) {
                    o.h += "<div style='background-color: #f0f0f0; padding: 5px'>";
                    for(var i=0; i<objData.verifiers.length; i++) {
                        var verifier = objData.verifiers[i];
                        if(verifier.id != undefined && verifier.avatar != undefined && verifier.fullname != undefined) {
                            var styleMarginBot = (i < objData.verifiers.length - 1) ? '5px' : '0';
                            var inputDisabledAttr = '';
                            var formGroupAttachedClass = 'form-group-attached-approval form-group-attached-hover';
                            if(verifier.is_logged_in != '1' || isForLogs) {
                                inputDisabledAttr = ' readonly disabled';
                                formGroupAttachedClass = 'form-group-attached-white';
                            }
                            o.h += "<div class='form-group-attached " + formGroupAttachedClass + "' style='margin-bottom: " + styleMarginBot + "'>";
                                o.h += "<div class='row clearfix'>";
                                    o.h += "<div class='col-md-9'>";
                                        o.h += "<div class='form-group form-group-default input-group form-group-citizen' data-id='" + verifier.id + "'>";
                                            o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                                o.h += "<span class='thumbnail-wrapper d32 circular inline cursor-pointer'>";
                                                    var avatarDir = citizenAvatarDir;
                                                    if(parseInt(verifier.id) == 0)
                                                        avatarDir = index + 'img/';
                                                    o.h += "<img src='" + avatarDir +  verifier.avatar + "' alt='[img]'>";
                                                o.h += "</span>";
                                            o.h += "</div>";
                                            o.h += "<div class='form-input-group'>";
                                                o.h += "<label class='inline'>(" + verifier.usertype_acronym + ") " + verifier.usertype_title + "</label>";
                                                o.h += "<input type='text' class='form-control txt-citizen-name-" + i.toString() + "' disabled readonly>";
                                                o.v.push(['.txt-citizen-name-' + i.toString(), verifier.fullname]);
                                            o.h += "</div>";
                                        o.h += "</div>";
                                    o.h += "</div>";
                                    o.h += "<div class='col-md-3'>";
                                        o.h += "<div class='form-group form-group-default input-group'>";
                                            o.h += "<div class='form-input-group'>";
                                                o.h += "<label class='inline' id=''>APPROVED?</label>";
                                            o.h += "</div>";
                                            o.h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                                var attrChecked = '';
                                                if(verifier.approval != null) {
                                                    if (verifier.approval.is_approved != null) {
                                                        if (verifier.approval.is_approved == '1')
                                                            attrChecked = ' checked';
                                                    }
                                                }
                                                var attrDisabled = (isForLogs) ? ' disabled' : '';
                                                o.h += " <input type='checkbox' class='chk-is-approved'" + attrChecked + " data-init-plugin='switchery' data-size='small' data-color='success'" + attrDisabled + inputDisabledAttr + ">";
                                            o.h += "</div>";
                                        o.h += "</div>";
                                    o.h += "</div>";
                                o.h += "</div>";
                                o.h += "<div class='row clearfix'>";
                                    o.h += "<div class='col-md-12'>";
                                        o.h += "<div class='form-group form-group-default'>";
                                        o.h += "<label>REMARKS</label>";
                                        o.h += "<textarea class='form-control txt-remarks txt-ramarks-" + i.toString() + "' style='height: 64px'" + inputDisabledAttr + "></textarea>";
                                        if(verifier.approval != null) {
                                            if (verifier.approval.remarks != null) {
                                                o.v.push(['.txt-ramarks-' + i.toString(), verifier.approval.remarks]);
                                            }
                                        }
                                        o.h += "</div>";
                                    o.h += "</div>";
                                o.h += "</div>";
                            o.h += "</div>";
                        }
                    }
                    o.h += "</div>";
                }
            o.h += "</div>";
        }
    }

    // NEW INVOICE | RENEWAL INVOICE
    else if(tabIdentifier == STR_TAB_NEW_INVOICES || tabIdentifier == STR_TAB_RENEWAL_INVOICES) {
        var o2f = null;
        o.h += "<div class='main-row hidden'>";
            if(!isForLogs) {
                o.h += "<p class='text-montserrat text-bold padding-bottom-15'>To generate business permit, press the <span class='text-success'><span class='fa fa-arrow-circle-right'></span> PERMIT</span> button above.</p>";
            }
            o.h += "<iframe id='ifrInvoice' name='ifrInvoice' class='no-border no-padding no-margin w-100 hidden' scrolling='no' src='" + index + "inc/invoices/index.php'></iframe>";

            // render invoice data : div
            o.h += generatePaymentInvoice(objData);

            // render verification data
            if(objData.verification != null) {
                o.h += "<br>";
                o.h += "<div class='padding-5 log-item-data' style='background-color: #f0f0f0; margin-left: 5px; margin-right: 5px'>";
                var targetTab = (tabIdentifier == STR_TAB_NEW_INVOICES) ? STR_TAB_NEW_VERIFICATIONS : STR_TAB_RENEWAL_VERIFICATIONS;
                var o2 = renderItemData(objData.verification, targetTab, true, tabIdentifier);
                o.h += o2.h;
                o.v = o2.v;
                o2f = o2.f;
                o.h += "</div>";
            }
        o.h += "</div>";

        o.f = function() {
			// render payment invoice
			var divContentTab = body.find('.content-tab-pane#tab' + tab);
            var divItemContent = divContentTab.find('.item-content');
            var itemControls = divContentTab.find('.item-controls');
            var btnPrint = itemControls.find('.btn-print-item');
            var btnPrintInvoice = itemControls.find('.btn-print-invoice');
            disableButton(btnPrint, true);
            disableButton(btnPrintInvoice, true);
            // disable print button
            var fa = btnPrint.find('.fas');
            if(!fa.hasClass('fa-spin')) {
                fa.removeClass('fa-print');
                fa.addClass('fa-circle-notch');
                fa.addClass('fa-spin');
            }

            var ifrInvoice = divItemContent.find('#ifrInvoice');
            ifrInvoice.load(function() {
                var contents = ifrInvoice.contents();
                contents.find('.page').html(generatePaymentInvoice(objData));

                // enable print button
                disableButton(btnPrint, false);
                disableButton(btnPrintInvoice, false);
                if(fa.hasClass('fa-spin')) {
                    fa.removeClass('fa-circle-notch');
                    fa.removeClass('fa-spin');
                    fa.addClass('fa-print');
                }
            });

        	if(o2f != null) {
        		o2f();
        	}
        };
    }

    // NEW PERMIT | RENEWAL PERMIT
    else if(tabIdentifier == STR_TAB_NEW_PERMITS || tabIdentifier == STR_TAB_RENEWAL_PERMITS) {
        var o2f = null;
        o.h += "<div class='main-row hidden'>";
            if(objData.invoice != null) {
                if(!isForLogs) {
                    o.h += "<p class='text-montserrat text-bold padding-bottom-15 p-wait'><span class='fas fa-circle-notch fa-spin'></span> GENERATING BUSINESS PERMIT. PLEASE WAIT...</p>";
                }
                o.h += "<div class='permit-wrapper overflow-x-auto' style='height: 11.69in; width: 100%;' align='center'>";
                    o.h += "<iframe id='ifrPermit' name='ifrPermit' class='no-border no-padding no-margin' scrolling='no' src='" + index + "inc/permits/[" + lgu + "] " + objData.permit_file + "'></iframe>";
                o.h += "</div>";
                o.h += "<br>";
                var targetTab = (tabIdentifier == STR_TAB_NEW_PERMITS) ? STR_TAB_NEW_INVOICES : STR_TAB_RENEWAL_INVOICES;
                var o2 = renderItemData(objData.invoice, targetTab, true);
                o.h += o2.h;
                o.v = o2.v;
                o2f = o2.f;
            }
        o.h += "</div>";

        o.f = function() {
			// render business permit
            generateBusinessPermit(objData);

            if(o2f != null) {
            	o2f();
            }
        };
    }

    // APPLICATION SETTINGS | SYSTEM SETTINGS
    else if(tabIdentifier == STR_TAB_APPLICATION_SETTINGS || tabIdentifier == STR_TAB_SYSTEM_SETTINGS) {
        o.h += "<div class='main-row hidden'>";
            if(!isForLogs) {
                o.h += "<p class='text-montserrat text-bold padding-bottom-15'>To save changes, press the <span class='text-success'><span class='fa fa-save'></span> SAVE</span> button above.</p>";
            }
            o.h += "<div class='form-group-attached'>";
                o.h += "<div class='row clearfix'>";
                if(objData.title != undefined) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default required'>";
                            o.h += "<label>TITLE</label>";
                            o.h += "<input type='text' class='form-control txt-title item-main-title" + extraClass + "' readonly disabled>";
                            o.v.push(['.txt-title', objData.title]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";
                o.h += "<div class='row clearfix'>";
                if(objData.desc != undefined) {
                    o.h += "<div class='col-md-12'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>DESCRIPTION</label>";
                            o.h += "<textarea class='form-control txt-desc item-sub-title' style='height: 64px' readonly disabled></textarea>";
                            o.v.push(['.txt-desc', objData.desc]);
                        o.h += "</div>";
                    o.h += "</div>";
                }
                o.h += "</div>";
            o.h += "</div>";
            o.h += "<br>";
            if(objData.data != undefined) {
                var arrData = objData.data;
                if (objData.id == 1) { // BUSINESS PERMIT SETTINGS
                    o.h += "<p class='text-montserrat text-bold no-margin text-uppercase'>BUSINESS PERMIT NO.</p>";
                    o.h += "<div class='form-group-attached'>";
                        o.h += "<div class='row clearfix'>";
                            o.h += "<div class='col-md-4'>";
                                o.h += "<div class='form-group form-group-default'>";
                                    o.h += "<label>PERMIT NO. PREFIX</label>";
                                    o.h += "<input type='text' class='form-control txt-permit-no-prefix'>";
                                    if(arrData.permit_no_prefix != null)
                                        o.v.push(['.txt-permit-no-prefix', arrData.permit_no_prefix]);
                                o.h += "</div>";
                            o.h += "</div>";
                            o.h += "<div class='col-md-4'>";
                                o.h += "<div class='form-group form-group-default'>";
                                    o.h += "<label>NEXT PERMIT NO.</label>";
                                    o.h += "<input type='text' class='form-control txt-int txt-permit-no-next'>";
                                    if(arrData.permit_no_next != null)
                                        o.v.push(['.txt-permit-no-next', removeCommas(arrData.permit_no_next, true)]);
                                o.h += "</div>";
                            o.h += "</div>";
                            o.h += "<div class='col-md-4'>";
                                o.h += "<div class='form-group form-group-default'>";
                                    o.h += "<label>PERMIT NO. DIGITS</label>";
                                    o.h += "<input type='text' class='form-control txt-int txt-permit-no-digits'>";
                                    if(arrData.permit_no_digits != null)
                                        o.v.push(['.txt-permit-no-digits', removeCommas(arrData.permit_no_digits, true)]);
                                o.h += "</div>";
                            o.h += "</div>";
                        o.h += "</div>";
                    o.h += "</div>";
                    o.h += "<br>";
                    o.h += "<p class='text-montserrat text-bold no-margin text-uppercase'>BUSINESS PLATE NO.</p>";
                    o.h += "<div class='form-group-attached'>";
                        o.h += "<div class='row clearfix'>";
                            o.h += "<div class='col-md-4'>";
                                o.h += "<div class='form-group form-group-default'>";
                                    o.h += "<label>PLATE NO. PREFIX</label>";
                                    o.h += "<input type='text' class='form-control txt-plate-no-prefix'>";
                                    if(arrData.plate_no_prefix != null)
                                        o.v.push(['.txt-plate-no-prefix', arrData.plate_no_prefix]);
                                o.h += "</div>";
                            o.h += "</div>";
                            o.h += "<div class='col-md-4'>";
                                o.h += "<div class='form-group form-group-default'>";
                                    o.h += "<label>NEXT PLATE NO.</label>";
                                    o.h += "<input type='text' class='form-control txt-int txt-plate-no-next'>";
                                    if(arrData.plate_no_next != null)
                                        o.v.push(['.txt-plate-no-next', removeCommas(arrData.plate_no_next, true)]);
                                o.h += "</div>";
                            o.h += "</div>";
                            o.h += "<div class='col-md-4'>";
                                o.h += "<div class='form-group form-group-default'>";
                                    o.h += "<label>PLATE NO. DIGITS</label>";
                                    o.h += "<input type='text' class='form-control txt-int txt-plate-no-digits'>";
                                    if(arrData.plate_no_digits != null)
                                        o.v.push(['.txt-plate-no-digits', removeCommas(arrData.plate_no_digits, true)]);
                                o.h += "</div>";
                            o.h += "</div>";
                        o.h += "</div>";
                    o.h += "</div>";
                }
            }
        o.h += "</div>";
    }

    // REPORTS
    else if(tabIdentifier == STR_TAB_REPORTS) {
        o.h += "<div class='main-row hidden'>";
            o.h += "<p class='text-montserrat text-bold padding-bottom-15'></p>";
            o.h += "<div class='form-group-attached'>";
                o.h += "<div class='row clearfix'>";
                    o.h += "<div class='col-md-5'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>FROM</label>";
                            o.h += "<input type='text' class='form-control date-opt date-picker txt-from-date cursor-pointer" + extraClass + "' value='January 1, " + (new Date().getFullYear()).toString() + "'>";
                        o.h += "</div>";
                    o.h += "</div>";
                    o.h += "<div class='col-md-5'>";
                        o.h += "<div class='form-group form-group-default'>";
                            o.h += "<label>TO</label>";
                            o.h += "<input type='text' class='form-control date-opt date-picker txt-to-date cursor-pointer" + extraClass + "' value='December 31, " + (new Date().getFullYear()).toString() + "'>";
                        o.h += "</div>";
                    o.h += "</div>";
                    o.h += "<div class='col-md-2'>";
                        o.h += "<div class='form-group form-group-default '>";
                            o.h += "<button class='btn btn-success btn-block btn-generate-report'>GO</button>";
                        o.h += "</div>";
                    o.h += "</div>";
                o.h += "</div>";
            o.h += "</div>";
        o.h += "</div>";
    }

    // UPDATES
    else if(tabIdentifier == STR_TAB_UPDATES) {
        o.h += "<div class='main-row hidden'>";
        if(objData.updates != null) {
            o.h += "<div class='p-t-15'>";
            for(var i=0; i<objData.updates.length; i++) {
                var update = objData.updates[i];
                o.h += "<h6>";
                    if(update.menu != "" && update.tab != "") {
                        o.h += (i + 1).toString() + ". <b>" + update.menu + " <span class='fa fa-chevron-right'></span> " + update.tab + "</b>";
                    }
                    else if(update.menu != "" && update.tab == "") {
                        o.h += (i + 1).toString() + ". <b>" + update.menu + "</b>";
                    }
                o.h += "</h6>";
                o.h += "<p class='p-l-15 text-montserrat text-black'>";
                o.h += update.details;
                o.h += "</p>";
                o.h += "<div align='right' class='text-montserrat text-black'>";
                    o.h += update.date_created;
                o.h += "</div>";
                o.h += "<hr>";
            }
            o.h += "</div>";
        }
        o.h += "</div>";
    }

    // CITIZENS
    else if(tabIdentifier == STR_TAB_CITIZENS) {
        o.h += "<div class='main-row hidden'>";
        if(objData.id != null && objData.avatar != null && objData.full_name != null) {
            o.h += "<div class='card social-card share no-border w-100 active m-t-15 card-citizen-banner'>";
                o.h += "<div class='card-header clearfix no-border no-border-radius overflow-hidden'>";
                    o.h += "<div class='item-avatar user-pic' style='border-radius: 4px !important'><img alt='(img)' src='" + citizenAvatarDir + objData.avatar + "' style='width: 108px; height: 108px'></div>";
                    o.h += "<ul class='text-montserrat no-padding no-margin' style='list-style: none; display: inline-block'>";
                    o.h += "<li style='line-height: 1 !important'><h4 class='no-padding no-margin'>" + objData.id.toString().padStart(10, '0') + "</h4></li>";
                    o.h += "<li style='line-height: 1 !important; margin-top: -10px'><h3 class='no-padding no-margin text-bold text-uppercase'>" + objData.full_name + "</h3></li>";
                    o.h += "</ul>";
                o.h += "<ul class='sub-title no-padding no-margin' style='list-style: none'>";
                    o.h += "<li><h6 class='p-t-5'>" + "<span class='fa fa-map-marker'></span> " + objData.full_address + "</h6></li>";
                o.h += "</ul>";
            o.h += "</div>";
            o.h += "<div style='background: #e1f0fd; padding: 3px; margin-top: 2px'>";
                o.h += "<div class='padding-left-15 padding-right-15 text-montserrat text-bold' style='border: 1px dotted #e3f0fc; border-bottom: 0'>";
                    if(objData.first_name != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>FIRST NAME:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.first_name + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.middle_name != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>MIDDLE NAME:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.middle_name + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.last_name != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>LAST NAME:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.last_name + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.gender != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>GENDER:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.gender + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.blood_type != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>BLOOD TYPE:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.blood_type + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.date_of_birth != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>DATE OF BIRTH:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.date_of_birth + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.place_of_birth != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>PLACE OF BIRTH:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.place_of_birth + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.contact_num != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>CONTACT NUMBER:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.contact_num + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.address_line1 != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>ADDRESS LINE 1:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.address_line1 + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.address_line2 != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>ADDRESS LINE 2:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.address_line2 + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.citizenship != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>CITIZENSHIP:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.citizenship + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.civil_status != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>CIVIL STATUS:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.civil_status + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.tin != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>TIN:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.tin + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.profession != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>OCCUPATION / BUSINESS:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.profession + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.emergency_person != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>EMERGENCY PERSON NAME:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.emergency_person + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.emergency_address != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>EMERGENCY PERSON ADDRESS:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.emergency_address + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.emergency_contact_num != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>EMERGENCY PERSON CONTACT:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.emergency_contact_num + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.emergency_relationship != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>EMERGENCY PERSON RELATIONSHIP:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.emergency_relationship + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.id_release_date != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>ID RELEASE DATE:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.id_release_date + "</div>";
                        o.h += "</div>";
                    }
                    /*if(objData.is_paid != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>PAID:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.is_paid + "</div>";
                        o.h += "</div>";
                    }*/
                    if(objData.is_reprint != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>REPRINTED:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.is_reprint + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.is_cancelled != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>CANCELLED:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.is_cancelled + "</div>";
                        o.h += "</div>";
                    }
                    if(objData.is_indigent != null) {
                        o.h += "<div class='row row-tbl'>";
                            o.h += "<div class='col-md-5 col-left text-success'>INDIGENT:</div>";
                            o.h += "<div class='col-md-7 col-right'>" + objData.is_indigent + "</div>";
                        o.h += "</div>";
                    }
                o.h += "</div>";
            o.h += "</div>";
        }
        o.h += "</div>";
    }
    return o;
}


/**
 * GENERATE BUSINESS ACTIVITY
 * Generate the html to be written on $('.div-bus-activities')
 * @param {string} application_type [the application type]
 * @param {object} business_activity the business activity array
 * @param {boolean} isForLogs [if the current request is for system logs or not]
 *
 * @global {int} busActivityCtr [used in unique id of input controls]
 */
var busActivityCtr = 0;
function generateBusinessActivity(application_type, business_activity, isForLogs) {
    var o = { h : '',  v : [] };
    if(business_activity.id == null) {
        business_activity = {
            id: -1,
            business_line_id: 0,
            business_line_title: "",
            business_line_desc: "",
            units: 0,
            capitalization: 0,
            total_capitalization: 0,
            gross_sales_essential: 0,
            total_gross_sales_essential: 0,
            gross_sales_non_essential: 0,
            total_gross_sales_non_essential: 0,
            total_gross_sales: 0,
            business_tax_formula: "",
            business_tax: 0
        };
    }
    o.h += "<div class='form-group-attached form-group-attached-hover'>";
        o.h += "<div class='row clearfix'>";

        var colLineOfBusiness = 'col-md-5 col-12';
        var colNumUnits = 'col-md-3 col-12';
        var lblNumUnits = "<span class='collapse-768'>NUMBER OF&nbsp;</span>UNITS";
        if(application_type == 'RENEWAL') {
            colLineOfBusiness = 'col-md-12 col-12';
            colNumUnits = 'col-md-2 col-12';
            lblNumUnits = 'UNITS';
        }

        // line of business
        o.h += "<div class='" + colLineOfBusiness + "'>";
            o.h += "<div class='form-group form-group-default form-group-search input-group form-group-line-of-business' data-id='" + business_activity.business_line_id + "'>";
                o.h += "<div class='form-input-group'>";
                    o.h += "<label class='inline'>LINE OF BUSINESS</label>";
                    o.h += "<input type='text' class='form-control txt-line-of-business txt-line-of-business-" + busActivityCtr.toString() + "' disabled readonly>";
                    o.v.push(['.txt-line-of-business-' + busActivityCtr.toString(), business_activity.business_line_title]);
                o.h += "</div>";
                if(!isForLogs) {
                    o.h += "<div class='input-group-addon bg-transparent h-c-50' style='display: inline-table; padding-top: 13px'>";
                        //o.h += "<button class='btn btn-success btn-xs btn-line-of-business-search'><span class='fa fa-search'></span></button>";
                        o.h += "<div class='btn-group'>";
                            o.h += "<button class='btn btn-success btn-xs btn-line-of-business-search'><span class='fa fa-search'></span></button>";
                            o.h += "<button class='btn btn-default btn-xs btn-line-of-business-remove'><span class='fa fa-times'></span></button>";
                        o.h += "</div>";
                    o.h += "</div>";
                }
            o.h += "</div>";
        o.h += "</div>";

        // number of units
        o.h += "<div class='" + colNumUnits + "'>";
            o.h += "<div class='form-group form-group-default'>";
                o.h += "<label>" + lblNumUnits + "</label>";
                o.h += "<input type='text' class='form-control txt-int txt-units txt-units-" + busActivityCtr.toString() + "'>";
                o.v.push(['.txt-units-' +  busActivityCtr.toString(), applyCommas(business_activity.units, true)]);
            o.h += "</div>";
        o.h += "</div>";

        // capitalization
        if(application_type == 'NEW') {
            o.h += "<div class='col-md-4 col-12'>";
                o.h += "<div class='form-group form-group-default input-group input-group-currency required'>";
                    o.h += "<div class='form-input-group'>";
                        o.h += "<label>CAPITALIZATION</label>";
                        o.h += "<input type='text' class='form-control txt-amount txt-capitalization txt-capitalization-" +  busActivityCtr.toString() + "'>";
                        o.v.push(['.txt-capitalization-' +  busActivityCtr.toString(), applyCommas(business_activity.capitalization)]);
                    o.h += "</div>";
                    o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                o.h += "</div>";
            o.h += "</div>";
        }

        // gross sales essential
        if(application_type == 'RENEWAL') {
            o.h += "<div class='col-md-5 col-12'>";
                o.h += "<div class='form-group form-group-default input-group input-group-currency required'>";
                    o.h += "<div class='form-input-group'>";
                        o.h += "<label>GROSS SALES (ESSENTIAL)</label>";
                        o.h += "<input type='text' class='form-control txt-amount txt-gross-sales-essential txt-gross-sales-essential-" +  busActivityCtr.toString() + "'>";
                        o.v.push(['.txt-gross-sales-essential-' + busActivityCtr.toString(), applyCommas(business_activity.gross_sales_essential)]);
                    o.h += "</div>";
                    o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                o.h += "</div>";
            o.h += "</div>";
        }

        // gross sales non essential
        if(application_type == 'RENEWAL') {
            o.h += "<div class='col-md-5 col-12'>";
                o.h += "<div class='form-group form-group-default input-group input-group-currency required'>";
                    o.h += "<div class='form-input-group'>";
                        o.h += "<label>GROSS SALES (NON-ESSENTIAL)</label>";
                        o.h += "<input type='text' class='form-control txt-amount txt-gross-sales-non-essential txt-gross-sales-non-essential-" +  busActivityCtr.toString() + "'>";
                        o.v.push(['.txt-gross-sales-non-essential-' +  busActivityCtr.toString(), applyCommas(business_activity.gross_sales_non_essential)]);
                    o.h += "</div>";
                    o.h += "<div class='input-group-addon bg-transparent h-c-50'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                o.h += "</div>";
            o.h += "</div>";
        }
        o.h += "</div>";
    o.h += "</div>";
    busActivityCtr += 1;
    return o;
}


/**
 * GENERATE ASSET BRACKET
 * Generate the html to be written on $('.div-asset-brackets > .col-md-12')
 * for clustering business taxes according to capitalization or gross sales
 * @param {object} asset_bracket the asset bracket object
 * @param  {boolean} isForLogs [if the current request is for system logs or not]
 *
 * @global {int} assetBracketCtr [used in unique id of input controls]
 */
var assetBracketCtr = 0;
function generateAssetBracket(asset_bracket, isForLogs) {
    assetBracketCtr += 1;
    var attrAddonCurrencyClass = '';
    var strAssetLabel = 'ASSET';
    if(asset_bracket.perTaxVariableID != null) {
        if (asset_bracket.perTaxVariableID == '9') {
            attrAddonCurrencyClass = ' hidden';
            strAssetLabel = 'UNIT';
        }
    }

    var h = "<div class='col-md-12 form-group-attached-hover m-t-5 m-b-5' style='border-bottom: 1px solid #ececec'>";
        h += "<div class='form-group form-group-default input-group form-group-tax-bracket' data-id='" + asset_bracket.bracketID + "'>";
            h += "<div class='form-input-group form-main-data'>";
                h += "<div class='row'>";
                    h += "<div class='col-md-12'>";
                        h += "<div class='row clearfix'>";
                        if(asset_bracket.assetMinimum != null) {
                            h += "<div class='col-md-6 col-sm-6 no-padding-right-colsm6'>";
                                h += "<div class='form-group form-group-default input-group input-group-currency'>";
                                    h += "<div class='form-input-group'>";
                                        h += "<label class=''><span class='label-label'><span class='sp-asset-label'>" + strAssetLabel + "</span> MINUMUM</span></label>";
                                        h += "<input type='text' class='form-control txt-amount txt-amount-asset-minimum' value='" + applyCommas(removeCommas(asset_bracket.assetMinimum)) + "' data-low-of='.txt-asset-maximum-" + assetBracketCtr.toString() + "'>";
                                    h += "</div>";
                                    h += "<div class='input-group-addon bg-transparent h-c-50" + attrAddonCurrencyClass + "'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                h += "</div>";
                            h += "</div>";
                        }
                        if(asset_bracket.assetMaximum != null) {
                            h += "<div class='col-md-6 col-sm-6 no-padding-left-colsm6'>";
                                h += "<div class='form-group form-group-default input-group input-group-currency'>";
                                    h += "<div class='form-input-group'>";
                                        h += "<label class=''><span class='label-label'><span class='sp-asset-label'>" + strAssetLabel + "</span> MAXIMUM</span></label>";
                                        h += "<input type='text' class='form-control txt-amount txt-amount-asset-maximum txt-asset-maximum-" + assetBracketCtr.toString() + "' value='" + applyCommas(removeCommas(asset_bracket.assetMaximum)) + "'>";
                                    h += "</div>";
                                    h += "<div class='input-group-addon bg-transparent h-c-50" + attrAddonCurrencyClass + "'><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                h += "</div>";
                            h += "</div>";
                        }
                        h += "</div>";
                    h += "</div>";
                    h += "<div class='col-md-12'>";
                    if(asset_bracket.isByPercentage != null) {
                        h += "<div class='row clearfix'>";
                            h += "<div class='col-md-6 col-sm-6 no-padding-right-colsm6'>";
                                h += "<div class='form-group form-group-default input-group'>";
                                    h += "<div class='form-input-group'>";
                                        h += "<label class='' id=''><span class='label-label'>BY <big><b>%</b></big></span></label>";
                                    h += "</div>";
                                    h += "<div class='input-group-addon bg-transparent h-c-50' style='margin-left:-15px'>";
                                        var attrChecked = (asset_bracket.isByPercentage == '1') ? 'checked' : '';
                                        var attrDisabled = (isForLogs) ? ' disabled' : '';
                                            h += " <input type='checkbox' class='chk-is-by-percentage' " + attrChecked + " data-toggle-visibility='.div-percent-of-" + assetBracketCtr.toString() + ", .div-in-excess-of-" + assetBracketCtr.toString() + ", .div-additional-amount-" + assetBracketCtr.toString() + "' data-on-show-div='.div-by-percentage-" + assetBracketCtr.toString() + "' data-off-show-div='.div-by-amount-" + assetBracketCtr.toString() + "' data data-init-plugin='switchery' data-size='small' data-color='success'" + attrDisabled + ">";
                                    h += "</div>";
                                h += "</div>";
                            h += "</div>";

                        if(asset_bracket.percentage != null) {
                            // by percentage
                            var classHidden = (asset_bracket.isByPercentage == '1') ? '' : ' hidden';
                            h += "<div class='col-md-6 col-sm-6 no-padding-left-colsm6 div-by-percentage div-by-percentage-" + assetBracketCtr.toString() + classHidden + "'>";
                                h += "<div class='form-group form-group-default input-group input-group-percentage'>";
                                    h += "<div class='form-input-group'>";
                                        h += "<label class=''><span class='label-label'>TAX PERCENTAGE</span></label>";
                                        h += "<input type='text' class='form-control txt-amount txt-amount-tax-percentage' value='" + applyCommas(removeCommas(asset_bracket.percentage)) + "' data-update-el-on-keyup='.percentage-label-" + assetBracketCtr.toString() + "' style='font-size: 14px;'>";
                                    h += "</div>";
                                    h += "<div class='input-group-addon bg-transparent h-c-50'>";
                                        h += "<table class='h-100 w-100'>";
                                            h += "<tbody>";
                                                h += "<tr>";
                                                    h += "<td valign='bottom'><span class='fa fa-percent'></span></td>";
                                                h += "</tr>";
                                            h += "</tbody>";
                                        h += "</table>";
                                    h += "</div>";
                                h += "</div>";
                            h += "</div>";
                        }

                        if(asset_bracket.taxAmount != null) {
                            // by amount
                            classHidden = (asset_bracket.isByPercentage != '1') ? '' : ' hidden';
                            h += "<div class='col-md-6 col-sm-6 no-padding-left-colsm6 div-by-amount div-by-amount-" + assetBracketCtr.toString() + classHidden + "'>";
                                h += "<div class='form-group form-group-default input-group input-group-currency input-group-currency-lock'>";
                                    h += "<div class='form-input-group'>";
                                        h += "<label class=''><span class='label-label'>TAX AMOUNT</span></label>";
                                        h += "<input type='text' class='form-control txt-amount txt-amount-tax-value' value='" + applyCommas(removeCommas(asset_bracket.taxAmount)) + "'>";
                                    h += "</div>";
                                    h += "<div class='input-group-addon bg-transparent h-c-50''><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                h += "</div>";
                            h += "</div>";
                        }

                        if(asset_bracket.ofTaxVariableID != null && asset_bracket.percentage != null && asset_bracket.objTaxVariables != null) {
                            // percent of
                            classHidden = (asset_bracket.isByPercentage == '1') ? '' : ' hidden';
                            h += "<div class='col-md-12 div-percent-of div-percent-of-" + assetBracketCtr.toString() + "" + classHidden + "'>";
                                h += "<div class='form-group form-group-default'>";
                                    h += "<label class='no-margin no-padding'><span class='label-label'><b class='percent-label percentage-label-" + assetBracketCtr.toString() + "'>" + applyCommas(removeCommas(asset_bracket.percentage)) + "</b><b>%</b> of:</span></label>";
                                    h += "<select class='cbo-of-tax-variable-id'>";
                                        for(var i=0; i<asset_bracket.objTaxVariables.length; i++) {
                                            var attrSelected = (asset_bracket.objTaxVariables[i].id == asset_bracket.ofTaxVariableID) ? ' selected' : '';
                                            h += "<option value='" + asset_bracket.objTaxVariables[i].id + "'" + attrSelected + ">" + asset_bracket.objTaxVariables[i].formula.replace('PER ', '') + "</option>";
                                        }
                                    h += "</select>";
                                h += "</div>";
                            h += "</div>";
                        }

                        if(asset_bracket.inExcessOf != null) {
                            // in excess of
                            classHidden = (asset_bracket.isByPercentage == '1') ? '' : ' hidden';
                            h += "<div class='col-md-6 col-sm-6 no-padding-right-colsm6 div-in-excess-of div-in-excess-of-" + assetBracketCtr.toString() + classHidden + "'>";
                                h += "<div class='form-group form-group-default input-group input-group-currency'>";
                                    h += "<div class='form-input-group'>";
                                        h += "<label class=''><span class='label-label'>IN EXCESS OF:</span></label>";
                                        h += "<input type='text' class='form-control txt-amount txt-in-excess-of' value='" + applyCommas(removeCommas(asset_bracket.inExcessOf)) + "'>";
                                    h += "</div>";
                                    h += "<div class='input-group-addon bg-transparent h-c-50''><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                h += "</div>";
                            h += "</div>";
                        }

                        if(asset_bracket.additionalAmount != null) {
                            // additional amount
                            classHidden = (asset_bracket.isByPercentage == '1') ? '' : ' hidden';
                            h += "<div class='col-md-6 col-sm-6 no-padding-left-colsm6 div-additional-amount div-additional-amount-" + assetBracketCtr.toString() + classHidden + "'>";
                                h += "<div class='form-group form-group-default input-group input-group-currency input-group-currency-lock'>";
                                    h += "<div class='form-input-group'>";
                                        h += "<label class=''><span class='label-label'>ADDITIONAL TAX:</span></label>";
                                        h += "<input type='text' class='form-control txt-amount txt-additional-tax-amount' value='" + applyCommas(removeCommas(asset_bracket.additionalAmount)) + "'>";
                                    h += "</div>";
                                    h += "<div class='input-group-addon bg-transparent h-c-50''><table class='h-100 w-100'><tr><td valign='bottom'><span class=''>&#8369;</span></td></tr></table></div>";
                                h += "</div>";
                            h += "</div>";
                        }
                        h += "</div>";
                    }
                    h += "</div>";
                h += "</div>";
            h += "</div>";
            h += "<div class='input-group-addon bg-transparent h-c-50'>";
                if(!isForLogs)
                    h += "<button class='btn btn-default btn-xs btn-remove-bracket'><span class='fa fa-trash'></span></button>";
                else
                    h += "&nbsp;";
            h += "</div>";
        h += "</div>";
    h += "</div>";
    return h;
}


/**
 * GENERATE PAYMENT INVOICE
 * Generate the html to be written on the order of payment
 * @param  {object} objData [the object data]
 */
function generatePaymentInvoice(objData) {
    var h = "";
    var strLinesOfBusiness = "";
    if(objData.verification.application.business_activities != null) {
        for(var i=0; i<objData.verification.application.business_activities.length; i++) {
            strLinesOfBusiness += objData.verification.application.business_activities[i].business_line_title;
            if(i < objData.verification.application.business_activities.length -1) {
                strLinesOfBusiness += ", ";
            }
        }
    }
    if(objData.fees_payment_invoice != null) {
        var feesPaymentInvoice = objData.fees_payment_invoice;
        h += "<div class='invoice padding-5 text-montserrat' style='margin-bottom: 10px; page-break-after: always;'>";
            h += "<div class='align-center-gte-768' style='text-align: center !important;'>";
                h += generateDocHeader();
                h += "<h4 class='no-margin text-bold text-montserrat'>" + objData.verification.application.application_type + " BUSINESS APPLICATION</h4>";
                h += "<p class='no-margin text-bold text-montserrat'><big>" + objData.verification.application.business_name + "</big></p>";
                h += "<p class='no-margin text-bold text-montserrat'>" + strLinesOfBusiness + "</p>";
                h += "<br>";
            h += "</div>";
            h += "<div class='row no-margin' style='border: 1px solid #f0f0f0; padding-bottom: 8px'>";
                h += "<div class='col-md-6 col-sm-6'>";
                    h += "<h4 class='font-montserrat all-caps text-bold' style='margin-bottom: 0'>APPLICABLE FEES</h4>";
                    h += "<table class='text-bold font-1-1em'>";
                    if(feesPaymentInvoice.status != null) {
                        h += "<tr>";
                            h += "<td>STATUS</td>";
                            h += "<td>&nbsp;:&nbsp;</td>";
                            h += "<td>" + feesPaymentInvoice.status + "</td>";
                        h += "</tr>";
                    }
                    if(feesPaymentInvoice.or_no != null && feesPaymentInvoice.or_char != null && feesPaymentInvoice.related_or != null) {
                        if(feesPaymentInvoice.or_no != '') {
                            h += "<tr>";
                                h += "<td>O.R.</td>";
                                h += "<td>&nbsp;:&nbsp;</td>";
                                h += "<td class='text-success'>";
                                h += feesPaymentInvoice.or_no + feesPaymentInvoice.or_char;
                                if(feesPaymentInvoice.related_or.length > 0) {
                                    h += ", ";
                                    for(var i=0; i<feesPaymentInvoice.related_or.length; i++) {
                                        h += feesPaymentInvoice.related_or[i].or_no + feesPaymentInvoice.related_or[i].or_char;
                                        if(i < feesPaymentInvoice.related_or.length-1) {
                                            h += ", ";
                                        }
                                    }
                                }

                                h += "</td>";
                            h += "</tr>";

                            if(feesPaymentInvoice.or_date != null) {
                                h += "<tr>";
                                    h += "<td>DATE</td>";
                                    h += "<td>&nbsp;:&nbsp;</td>";
                                    h += "<td class='text-success'>" + feesPaymentInvoice.or_date + "</td>";
                                h += "</tr>";
                            }
                        }
                    }
                    h += "</table>";
                h += "</div>";
                h += "<div class='col-md-6 col-sm-6'>";
                    h += "<table class='w-100 h-100'><tr><td class='align-right-gte-768'>";
                        h += "<h1 class='font-montserrat all-caps'>INVOICE</h1>";
                    h += "</td></tr></table>";
                h += "</div>";
            h += "</div>";
            h += "<div class='row no-margin padding-top-30'>";
                h += "<div class='col-md-6 col-sm-6 padding-bottom-15'>";
                if(feesPaymentInvoice.citizen != null) {
                    var citizen = feesPaymentInvoice.citizen;
                    h += "<p class='no-margin text-bold'>INVOICE TO</p>";
                    if(citizen.fullname != null)
                        h += "<p class='no-margin text-bold' style='font-size: 1.2em'>" + citizen.fullname + "</p>";
                    if(citizen.address1 != null)
                        h += "<address>" + citizen.address1 + "</address>";
                    if(citizen.address2 != null)
                        h += "<address>" + citizen.address2 + "</address>";
                }
                h += "</div>";
                h += "<div class='col-md-6 col-sm-6 padding-bottom-15 align-right-gte-768'>";
                    h += "<div style='display: inline-block; text-align: left'>";
                        if(feesPaymentInvoice.id != null) {
                            h += "<p class='no-margin text-bold'>INVOICE NO.</p>";
                            h += "<p class='no-margin text-bold' style='font-size: 1.2em'>" + feesPaymentInvoice.id + "</p>";
                        }
                        if(feesPaymentInvoice.invoice_date != null) {
                            h += "<p class='no-margin text-bold' style='padding-top: 5px'>INVOICE DATE</p>";
                            h += "<p class='no-margin'>" + feesPaymentInvoice.invoice_date + "</p>";
                        }
                    h += "</div>";
                h += "</div>";
            h += "</div>";

            h += "<div class='padding-15'>";
                if(feesPaymentInvoice.invoice_summary != null) {
                    for(var i=0; i<feesPaymentInvoice.invoice_summary.length; i++) {
                        if(i == 0) {
                            h += "<p class='no-margin text-bold'>INVOICE SUMMARY</p>";
                        }
                        var invoiceSummary = feesPaymentInvoice.invoice_summary[i];
                        h += "<div class='row no-margin row-tbl-invoice'>";
                            if(invoiceSummary.other_fee != null)
                                h += "<div class='col-md-8 col-left text-bold font-1-1em' align='left'>" + invoiceSummary.other_fee + "</div>";
                            if(invoiceSummary.amount != null) {
                                var strCurr = (i == 0) ? '&#8369; ' : '';
                                h += "<div class='col-md-4 col-right font-1-1em' align='right'>" + strCurr + "<span class='monospace font-1-1em text-bold'>" + applyCommas(invoiceSummary.amount) + "</span></div>";
                            }
                        h += "</div>";
                    }
                }
                if(feesPaymentInvoice.amount != null) {
                    h += "<div class='row padding-left-15 padding-right-15 row-tbl-invoice no-border bg-active'>";
                        h += "<div class='col-md-8 col-left text-bold font-1-1em' align='left'>TOTAL FEES</div>";
                        h += "<div class='col-md-4 col-right font-1-1em' align='right'>&#8369; <span class='monospace font-1-1em text-bold'>" + applyCommas(feesPaymentInvoice.amount) + "</span></div>";
                    h += "</div>";
                }
            h += "</div>";
            h += generateDocFooter();
        h += "</div>";
    }
    if(objData.verification.application.total_business_tax != null) {
        if(objData.verification.application.total_business_tax > 0) {
            if(objData.tax_payment_invoice != null) {
                var taxPaymentInvoice = objData.tax_payment_invoice;
                h += "<div class='invoice padding-5 text-montserrat' style='margin-bottom: 10px;'>";
                    h += "<div class='align-center-gte-768'>";
                        h += generateDocHeader();
                        h += "<div class='doc-show-only-on-print'>";
                            h += "<h4 class='no-margin text-bold text-montserrat'>" + objData.verification.application.application_type + " BUSINESS APPLICATION</h4>";
                            h += "<p class='no-margin text-bold text-montserrat'><big>" + objData.verification.application.business_name + "</big></p>";
                            h += "<p class='no-margin text-bold text-montserrat'>" + strLinesOfBusiness + "</p>";
                        h += "</div>";
                        h += "<br>";
                    h += "</div>";
                    h += "<div class='row no-margin' style='border: 1px solid #f0f0f0; padding-bottom: 8px'>";
                        h += "<div class='col-md-6 col-sm-6'>";
                            h += "<h4 class='font-montserrat all-caps text-bold' style='margin-bottom: 0'>BUSINESS TAX</h4>";
                            h += "<table class='text-bold font-1-1em'>";
                            if(taxPaymentInvoice.payment_mode != null) {
                                h += "<tr>";
                                    h += "<td>PAYMENT MODE</td>";
                                    h += "<td>&nbsp;:&nbsp;</td>";
                                    h += "<td class='text-info'>" + taxPaymentInvoice.payment_mode + "</td>";
                                h += "</tr>";
                            }
                            if(taxPaymentInvoice.status_text != null) {
                                h += "<tr>";
                                    h += "<td>STATUS</td>";
                                    h += "<td>&nbsp;:&nbsp;</td>";
                                    h += "<td class='text-info'>" + taxPaymentInvoice.status_text + "</td>";
                                h += "</tr>";
                            }
                            h += "</table>";
                        h += "</div>";
                        h += "<div class='col-md-6 col-sm-6'>";
                            h += "<table class='w-100 h-100'><tr><td class='align-right-gte-768'>";
                                h += "<h1 class='font-montserrat all-caps'>INVOICE</h1>";
                            h += "</td></tr></table>";
                        h += "</div>";
                    h += "</div>";
                    h += "<div class='row no-margin padding-top-30'>";
                        h += "<div class='col-md-6 col-sm-6 padding-bottom-15'>";
                        if(feesPaymentInvoice.citizen != null) {
                            var citizen = feesPaymentInvoice.citizen;
                            h += "<p class='no-margin text-bold'>INVOICE TO</p>";
                            if(citizen.fullname != null)
                                h += "<p class='no-margin text-bold' style='font-size: 1.2em'>" + citizen.fullname + "</p>";
                            if(citizen.address1 != null)
                                h += "<address>" + citizen.address1 + "</address>";
                            if(citizen.address2 != null)
                                h += "<address>" + citizen.address2 + "</address>";
                        }
                        h += "</div>";
                        h += "<div class='col-md-6 col-sm-6 padding-bottom-15 align-right-gte-768'>";
                            h += "<div style='display: inline-block; text-align: left'>";
                            var totalTax = 0;
                            if(taxPaymentInvoice.payment_invoices != null) {
                                h += "<p class='no-margin text-bold'>INVOICE NO.</p>";
                                for(var i=0; i<taxPaymentInvoice.payment_invoices.length; i++) {
                                    h += "<p class='no-margin text-bold' style='font-size: 1.2em'>" + taxPaymentInvoice.payment_invoices[i].id + "</p>";
                                    totalTax += parseFloat(taxPaymentInvoice.payment_invoices[i].amount);
                                }
                            }
                            if(feesPaymentInvoice.invoice_date != null) {
                                h += "<p class='no-margin text-bold' style='padding-top: 5px'>INVOICE DATE</p>";
                                h += "<p class='no-margin'>" + feesPaymentInvoice.invoice_date + "</p>";
                            }
                            h += "</div>";
                        h += "</div>";
                    h += "</div>";

                    h += "<div class='padding-15' style='padding-bottom: 0 !important; margin-bottom: 1px'>";
                        h += "<div class='row padding-left-15 padding-right-15 row-tbl-invoice no-border bg-active'>";
                            h += "<div class='col-md-8 col-left text-bold font-1-1em' align='left'>TOTAL BUSINESS TAX W/O PENALTY</div>";
                            h += "<div class='col-md-4 col-right font-1-1em' align='right'>&#8369; <span class='monospace font-1-1em text-bold'>" + applyCommas(totalTax) + "</span></div>";
                        h += "</div>";
                    h += "</div>";



                    if(taxPaymentInvoice.payment_invoices != null) {
                        for(var i=0; i<taxPaymentInvoice.payment_invoices.length; i++) {
                            var invoiceSummary = taxPaymentInvoice.payment_invoices[i];
                            if(invoiceSummary.or_no != null) {
                                if(invoiceSummary.or_no != "") {
                                    h += generateORHtml({
                                        or_no: invoiceSummary.or_no,
                                        or_char: invoiceSummary.or_char,
                                        or_date: invoiceSummary.or_date,
                                        amount_without_penalty: removeCommas(invoiceSummary.amount_without_penalty),
                                        penalty: removeCommas(invoiceSummary.penalty),
                                        amount_with_penalty: removeCommas(invoiceSummary.amount_with_penalty)
                                    });

                                    if(invoiceSummary.related_or != null) {
                                        for(var j=0; j<invoiceSummary.related_or.length; j++) {
                                            var relatedOR = invoiceSummary.related_or[j];

                                            h += generateORHtml({
                                                or_no: relatedOR.or_no,
                                                or_char: relatedOR.or_char,
                                                or_date: relatedOR.or_date,
                                                amount_without_penalty: removeCommas(relatedOR.amount_without_penalty),
                                                penalty: removeCommas(relatedOR.penalty),
                                                amount_with_penalty: removeCommas(relatedOR.amount_with_penalty)
                                            });
                                        }
                                    }
                                }

                                if(taxPaymentInvoice.status_code != '0') {
                                    if(invoiceSummary.total_amount_without_penalty != null) {
                                        h += "<div class='padding-15' style='padding-top: 0 !important; padding-bottom: 0 !important; margin-bottom: 1px'>";
                                            h += "<div class='row padding-left-15 padding-right-15 row-tbl-invoice no-border bg-active'>";
                                                h += "<div class='col-md-8 col-left text-bold font-1-1em' align='left'>TAX PAYMENT W/O PENALTY</div>";
                                                h += "<div class='col-md-4 col-right font-1-1em' align='right'><span class='monospace font-1-1em text-bold'>" + applyCommas(invoiceSummary.total_amount_without_penalty) + "</span></div>";
                                            h += "</div>";
                                        h += "</div>";
                                    }
                                    if(taxPaymentInvoice.business_tax_balance_without_penalty != null) {
                                        h += "<div class='padding-15' style='padding-top: 0 !important; padding-bottom: 0 !important; margin-bottom: 1px'>";
                                            h += "<div class='row padding-left-15 padding-right-15 row-tbl-invoice no-border bg-active'>";
                                                h += "<div class='col-md-8 col-left text-bold font-1-1em' align='left'>BALANCE</div>";
                                                h += "<div class='col-md-4 col-right font-1-1em' align='right'><span class='monospace font-1-1em text-bold'>" + applyCommas(taxPaymentInvoice.business_tax_balance_without_penalty) + "</span></div>";
                                            h += "</div>";
                                        h += "</div>";
                                    }

                                    if(invoiceSummary.total_penalty != null) {
                                        h += "<div class='padding-15' style='padding-top: 0 !important; padding-bottom: 0 !important;  margin-bottom: 1px'>";
                                            h += "<div class='row padding-left-15 padding-right-15 row-tbl-invoice no-border bg-active'>";
                                                h += "<div class='col-md-8 col-left text-bold font-1-1em' align='left'>TOTAL TAX PENALTY </div>";
                                                h += "<div class='col-md-4 col-right font-1-1em' align='right'><span class='monospace font-1-1em text-bold text-danger'>" + applyCommas(invoiceSummary.total_penalty) + "</span></div>";
                                            h += "</div>";
                                        h += "</div>";
                                    }
                                    if(invoiceSummary.total_amount_with_penalty != null) {
                                        h += "<div class='padding-15' style='padding-top: 0 !important; padding-bottom: 0 !important;  margin-bottom: 1px'>";
                                            h += "<div class='row padding-left-15 padding-right-15 row-tbl-invoice no-border bg-active'>";
                                                h += "<div class='col-md-8 col-left text-bold font-1-1em' align='left'>TAX PAYMENT WITH PENALTY </div>";
                                                h += "<div class='col-md-4 col-right font-1-1em' align='right'>&#8369; <span class='monospace font-1-1em text-bold'>" + applyCommas(invoiceSummary.total_amount_with_penalty) + "</span></div>";
                                            h += "</div>";
                                        h += "</div>";
                                    }
                                }
                            }
                        }

                        function generateORHtml(objOR) {
                            var oh = "";
                            oh += "<div class='no-padding' style='border: 1px solid #e3f0fc; padding-bottom: 8px !important; margin-bottom: 1px'>";
                                oh += "<div class='padding-15' style='padding-top: 0 !important; padding-bottom: 0 !important'>";
                                    oh += "<div class='row padding-left-15 padding-right-15 row-tbl-invoice no-border'>";
                                        oh += "<div class='col-md-12 col-left font-1-1em text-success' align='left'><span class='fa fa-receipt'></span> <span class='text-bold'>O.R. " + objOR.or_no + objOR.or_char + "</span>&nbsp;&nbsp;<small>" + objOR.or_date + "</small>" + "</div>";
                                    oh += "</div>";
                                    oh += "<div class='row padding-left-15 padding-right-15 row-tbl-invoice row-tbl-invoice-sm no-border'>";
                                        oh += "<div class='col-md-8 col-left text-bold font-1-1em' align='left' style=''>Amount</div>";
                                        oh += "<div class='col-md-4 col-right font-1-1em' align='right'><span class='monospace font-1-1em'>" + applyCommas(objOR.amount_without_penalty) + "</span></div>";
                                    oh += "</div>";
                                    oh += "<div class='row padding-left-15 padding-right-15 row-tbl-invoice row-tbl-invoice-sm no-border'>";
                                        oh += "<div class='col-md-8 col-left text-bold font-1-1em text-danger' align='left'>Penalty</div>";
                                        oh += "<div class='col-md-4 col-right font-1-1em' align='right'><span class='monospace font-1-1em text-danger'>" + applyCommas(objOR.penalty) + "</span></div>";
                                    oh += "</div>";
                                    oh += "<div class='row padding-left-15 padding-right-15 row-tbl-invoice row-tbl-invoice-sm no-border' style='padding-top: 8px !important'>";
                                        oh += "<div class='col-md-8 col-left text-bold font-1-1em' align='left'>TOTAL</div>";
                                        oh += "<div class='col-md-4 col-right font-1-1em' align='right'><span class='monospace font-1-1em text-bold'>" + applyCommas(objOR.amount_with_penalty) + "</span></div>";
                                    oh += "</div>";
                                oh += "</div>";
                            oh += "</div>";
                            return oh;
                        }
                    }
                    h += generateDocFooter();
                h += "</div>";
            }
        }
    }
    return h;
}


/**
 * GENERATE BUSINESS PERMIT
 * Generate the business permit.
 * @param  {object} objData [the object data]
 * @param  {boolean} isForLogs [if the current request is for system logs or not]
 */
function generateBusinessPermit(objData, isForLogs) {
    if(isForLogs == undefined)
        isForLogs = false;

    var divContentTab = body.find('.content-tab-pane#tab' + tab);
    var divItemContent = divContentTab.find('.item-content');
    var itemControls = divContentTab.find('.item-controls');

    if(!isForLogs) {
        // disable print button
        var btnPrint = itemControls.find('.btn-print-item');
        if (!btnPrint.prop('disabled')) {
            btnPrint.prop('disabled', true);
            btnPrint.attr('disabled', true);
            var fa = btnPrint.find('.fas');
            if (fa.hasClass('fa-print')) {
                fa.removeClass('fa-print');
                fa.addClass('fa-circle-notch');
                fa.addClass('fa-spin');
            }
        }
    }

    var ifrPermit = divItemContent.find('#ifrPermit');
    ifrPermit.load(function() {
        var contents = ifrPermit.contents();
        var page = contents.find('.page');

        var businessTypeID = objData.invoice.verification.application.business_type_id;
        // render citizen avatar
        var citizenAvatar = '';
        var applicantName = '';
        var avatarDir = citizenAvatarDir;
        if(businessTypeID == 1) {
            citizenAvatar = objData.invoice.verification.application.citizen_avatar;
            applicantName = objData.invoice.verification.application.citizen_full_name;
            if (citizenAvatar == '_.jpg')
                avatarDir = index + 'img/';
        }
        else {
            if(objData.invoice.verification.application.corporate_owner_fullname != '[NO CITIZEN]') {
                if(objData.invoice.verification.application.corporate_owner_id != '0') {
                    avatarDir = citizenAvatarDir;
                    citizenAvatar = objData.invoice.verification.application.corporate_owner_avatar;
                    applicantName = objData.invoice.verification.application.corporate_owner_fullname +  " (" + objData.invoice.verification.application.citizen_full_name + ")";
                }
                else {
                    avatarDir = index + 'img/users/';
                    citizenAvatar = objData.invoice.verification.application.corporate_owner_avatar;
                    applicantName = objData.invoice.verification.application.corporate_owner_fullname +  " (" + objData.invoice.verification.application.citizen_full_name + ")";
                }
            }
            else {
                citizenAvatar = objData.invoice.verification.application.citizen_avatar;
                applicantName = objData.invoice.verification.application.citizen_full_name;
                if (citizenAvatar == '_.jpg')
                    avatarDir = index + 'img/';
            }
        }
        contents.find('.p-citizen-avatar').attr('src', avatarDir + citizenAvatar);

        // render permit fields
        contents.find('div.p-field').each(function(i) {
            var dataValue = $(this).attr('data-value');
            if(dataValue != null) {
                if (dataValue != '') {
                    var arrDataValue = dataValue.split('.');
                    var obj = objData[arrDataValue[0]];
                    for(var i=1; i<arrDataValue.length; i++) {
                        if(arrDataValue[i].indexOf('[') >= 0 && arrDataValue[i].indexOf(']') >= 0) {
                            var arrIndex = arrDataValue[i].split('[');
                            obj = obj[arrIndex[0]];
                            for(var j=1; j<arrIndex.length; j++) {
                                obj = obj[parseInt(arrIndex[j].substr(0, arrIndex[j].length - 1))];
                            }
                        }
                        else {
                            obj = obj[arrDataValue[i]];
                        }
                    }
                    $(this).find('td').html(obj);
                }
            }
        });

        // business full address
        contents.find('.p-business-location td').prepend(objData.invoice.verification.application.street_address + ', ');

        // mayor's permit fee
        if(objData.invoice != null) {
            if(objData.invoice.fees_payment_invoice != null) {
                if(objData.invoice.fees_payment_invoice.invoice_summary != null) {
                    for(var i=0; i<objData.invoice.fees_payment_invoice.invoice_summary.length; i++) {
                        var feeDesc = objData.invoice.fees_payment_invoice.invoice_summary[i].other_fee.trim().toLowerCase();
                        if(feeDesc == "mayor's permit fee" || feeDesc == "mayor permit fee") {
                            contents.find('.p-mayors-permit-fee td').html("&#8369; " + applyCommas(objData.invoice.fees_payment_invoice.invoice_summary[i].amount));
                            break;
                        }
                    }
                }
            }
        }

        // or no.
        if(objData.invoice != null) {
            if(objData.invoice.fees_payment_invoice != null) {
                if(objData.invoice.fees_payment_invoice.or_char != null && objData.invoice.fees_payment_invoice.or_no != null && objData.invoice.fees_payment_invoice.related_or != null) {
                    var strORNum = objData.invoice.fees_payment_invoice.or_no + objData.invoice.fees_payment_invoice.or_char;
                    if(objData.invoice.fees_payment_invoice.related_or.length > 0) {
                        strORNum += ", ";
                        for(var i=0; i<objData.invoice.fees_payment_invoice.related_or.length; i++) {
                            strORNum += objData.invoice.fees_payment_invoice.related_or[i].or_no + objData.invoice.fees_payment_invoice.related_or[i].or_char;
                            if(i < objData.invoice.fees_payment_invoice.related_or.length-1) {
                                strORNum += ", ";
                            }
                        }
                    }
                    else {
                        strORNum = objData.invoice.fees_payment_invoice.or_no + objData.invoice.fees_payment_invoice.or_char;
                    }
                    contents.find('.p-or-number td').html(strORNum);
                }
            }
        }

        // business description (line of business, including multiple)
        if(objData.invoice != null) {
            if(objData.invoice.verification != null) {
                if (objData.invoice.verification.application != null) {
                    if (objData.invoice.verification.application.business_activities != null) {
                        var arrBusActivities = objData.invoice.verification.application.business_activities;
                        var strBusDesc = "";
                        for(var i=0; i<arrBusActivities.length; i++) {
                            strBusDesc += arrBusActivities[i].business_line_title;
                            if(i < arrBusActivities.length-1) {
                                strBusDesc += ", ";
                            }
                        }
                        contents.find('.p-business-line-desc td').html(strBusDesc);
                    }
                }
            }
        }

        if(businessTypeID != 1) {
            contents.find('.p-applicant-name td').html(applicantName);
            contents.find('.p-business-line td').html(objData.invoice.verification.application.trade_name);
        }

        // fee-or-amount
        contents.find('.div-amount td').each(function() {
            $(this).html('&#8369; ' + applyCommas($(this).html()));
        });

        // date only fields
        contents.find('.p-field.date-only td').each(function() {
            var arrHTML = $(this).html().split(' · ');
            $(this).html(arrHTML[0]);
        });

        // month only fields
        contents.find('.p-field.month-only td').each(function() {
            var arrHTML = $(this).html().split(' · ');
            arrHTML = arrHTML[0].split(' ');
            $(this).html(arrHTML[0]);
        });

        // day only fields
        contents.find('.p-field.day-only td').each(function() {
            var arrHTML = $(this).html().split(' · ');
            arrHTML = arrHTML[0].split(' ');
            arrHTML = arrHTML[1].split(',');
            $(this).html(ordinal_suffix(arrHTML[0]));
        });

        ifrPermit.css({
            'width' : parseFloat(page.css('width')).toString() + 'px',
            'height' : parseFloat(page.css('height')).toString() + 'px'
        });

        if(!isForLogs) {
            divItemContent.find('.p-wait').html(
                "<p class='text-montserrat text-bold no-margin'> - To print this permit, press the <span class='text-success'><span class='fa fa-print'></span> PRINT</span> button above.</p>" +
                "<p class='text-montserrat text-bold no-margin'> - To print the updated invoice, press the <span class='text-success'>&#8369;</span> button above.</p>"
            );

            // enable print button
            if (btnPrint.prop('disabled')) {
                btnPrint.prop('disabled', false);
                btnPrint.attr('disabled', false);
                var fa = btnPrint.find('.fas');
                if (fa.hasClass('fa-spin')) {
                    fa.removeClass('fa-spin');
                    fa.removeClass('fa-circle-notch');
                    fa.addClass('fa-print');
                }
            }
        }
    });
}