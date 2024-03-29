/**
 * init.js :: global variables and functions
 *
 */

var app = '';
var os = '';
var browser = '';
var app_url = '';
var index = '';
var page = '';
var dir = '';
var lgu;
var lgu_type;
var province;
var region;
var body;
var banner1, banner2;
var egov2 = "egov2";
var citizenAvatarDir = '';


// FUNCTION: render switchery checkboxes
function renderSwitcheryCheckboxes() {
    body.find("[data-init-plugin='switchery']").each(function(i) {
        var el = $(this);
        var proceed = false;
        var nextEl = el.next();
        if(nextEl != null) {
            if(!nextEl.hasClass('switchery')) {
                proceed = true;
            }
        }
        else {
            proceed = true;
        }

        if(proceed) {
            new Switchery(el.get(0), {
                color: (el.data("color") != null ? $.Pages.getColor(el.data("color")) : $.Pages.getColor('success')),
                size: (el.data("size") != null ? el.data("size") : "default")
            });
        }
    });
}


// FUNCTION: render responsive tabs
function renderResponsiveTabs() {
    body.find('.nav-tab-dropdown').each(function(i) {
        $(this).remove();
    });
    $('[data-init-reponsive-tabs="dropdownfx"]').each(function() {
        var drop = $(this);
        var parentFormWizardClass = $(this).parent().attr('class');
        drop.addClass("hidden-sm-down");
        var content = '<select class="cs-select cs-skin-slide full-width" data-init-plugin="cs-select" data-form-wizard-class="' + parentFormWizardClass + '">';
        for (var i = 1; i <= drop.children("li").length; i++) {
            var li = drop.children("li:nth-child(" + i + ")");
            var selected = "";
            if (li.children('a').hasClass("active")) {
                selected = "selected";
            }
            var tabRef = li.children('a').attr('href');
            if (tabRef == "#" || "") {
                tabRef = li.children('a').attr('data-target')
            }
            content += '<option value="' + tabRef + '" ' + selected + '>';
            content += li.children('a').text();
            content += '</option>';
        }
        content += '</select>';
        drop.after(content);
        var select = drop.next()[0];
        /*
        $(select).on('change', function (e) {
            var optionSelected = $("option:selected", this);
            var valueSelected = this.value;
            var tabLink = drop.find('a[data-target="' + valueSelected + '"]');
            if (tabLink.length == 0) {
                tabLink = drop.find('a[data-target="' + valueSelected + '"]')
            }
            tabLink.tab('show')
        });*/
        $(select).wrap('<div class="nav-tab-dropdown cs-wrapper full-width hidden-md-up"></div>');
        var csSelect = new SelectFx(select);

        // HACK ON NOT ABLE TO TRIGGER .cs-options > li CLICK FOR FIRST TIME
        if(!isLiveClick) {
            csSelect._toggleSelect();
            setTimeout(function () {
                csSelect._toggleSelect();
            }, 1);
        }
    });
}


// FUNCTION: scroll top to a specific div
function scrollToTop(div) {
    div.animate({
        scrollTop: 0
    }, 1);
}


// FUNCTION: scroll bottom to a specific div
function scrollToBottom(div) {
    div.animate({
        scrollTop: div[0].scrollHeight
    }, 1);
}


// FUNCTION: scroll to specific scrolltop in a specific div
function scrollTo(div, scrollTop, callback) {
    div.animate({
        scrollTop: scrollTop
    }, 1, function() {
        if(callback != null) {
            callback();
        }
    });
}


// FUNCTION: scroll to specific element
function scrollToEl(div, el, pad) {
    if(pad == undefined)
        pad = 0;
    div.scrollTop(
        el.offset().top - div.offset().top + div.scrollTop() - pad
    );
}


// FUNCTION: check if mobile phone
function isMobile() {
    var check = false;
    (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
    return check;
}


// FUNCTION: detect client system : https://stackoverflow.com/questions/9514179/how-to-find-the-operating-system-version-using-javascript
function getClientSystem() {
    (function (window) {
        {
            var unknown = '-';

            // screen
            var screenSize = '';
            if (screen.width) {
                width = (screen.width) ? screen.width : '';
                height = (screen.height) ? screen.height : '';
                screenSize += '' + width + " x " + height;
            }

            // browser
            var nVer = navigator.appVersion;
            var nAgt = navigator.userAgent;
            var browser = navigator.appName;
            var version = '' + parseFloat(navigator.appVersion);
            var majorVersion = parseInt(navigator.appVersion, 10);
            var nameOffset, verOffset, ix;

            // Opera
            if ((verOffset = nAgt.indexOf('Opera')) != -1) {
                browser = 'Opera';
                version = nAgt.substring(verOffset + 6);
                if ((verOffset = nAgt.indexOf('Version')) != -1) {
                    version = nAgt.substring(verOffset + 8);
                }
            }
            // Opera Next
            if ((verOffset = nAgt.indexOf('OPR')) != -1) {
                browser = 'Opera';
                version = nAgt.substring(verOffset + 4);
            }
            // Edge
            else if ((verOffset = nAgt.indexOf('Edge')) != -1) {
                browser = 'Microsoft Edge';
                version = nAgt.substring(verOffset + 5);
            }
            // MSIE
            else if ((verOffset = nAgt.indexOf('MSIE')) != -1) {
                browser = 'Microsoft Internet Explorer';
                version = nAgt.substring(verOffset + 5);
            }
            // Chrome
            else if ((verOffset = nAgt.indexOf('Chrome')) != -1) {
                browser = 'Chrome';
                version = nAgt.substring(verOffset + 7);
            }
            // Safari
            else if ((verOffset = nAgt.indexOf('Safari')) != -1) {
                browser = 'Safari';
                version = nAgt.substring(verOffset + 7);
                if ((verOffset = nAgt.indexOf('Version')) != -1) {
                    version = nAgt.substring(verOffset + 8);
                }
            }
            // Firefox
            else if ((verOffset = nAgt.indexOf('Firefox')) != -1) {
                browser = 'Firefox';
                version = nAgt.substring(verOffset + 8);
            }
            // MSIE 11+
            else if (nAgt.indexOf('Trident/') != -1) {
                browser = 'Microsoft Internet Explorer';
                version = nAgt.substring(nAgt.indexOf('rv:') + 3);
            }
            // Other browsers
            else if ((nameOffset = nAgt.lastIndexOf(' ') + 1) < (verOffset = nAgt.lastIndexOf('/'))) {
                browser = nAgt.substring(nameOffset, verOffset);
                version = nAgt.substring(verOffset + 1);
                if (browser.toLowerCase() == browser.toUpperCase()) {
                    browser = navigator.appName;
                }
            }
            // trim the version string
            if ((ix = version.indexOf(';')) != -1) version = version.substring(0, ix);
            if ((ix = version.indexOf(' ')) != -1) version = version.substring(0, ix);
            if ((ix = version.indexOf(')')) != -1) version = version.substring(0, ix);

            majorVersion = parseInt('' + version, 10);
            if (isNaN(majorVersion)) {
                version = '' + parseFloat(navigator.appVersion);
                majorVersion = parseInt(navigator.appVersion, 10);
            }

            // mobile version
            var mobile = /Mobile|mini|Fennec|Android|iP(ad|od|hone)/.test(nVer);

            // cookie
            var cookieEnabled = (navigator.cookieEnabled) ? true : false;

            if (typeof navigator.cookieEnabled == 'undefined' && !cookieEnabled) {
                document.cookie = 'testcookie';
                cookieEnabled = (document.cookie.indexOf('testcookie') != -1) ? true : false;
            }

            // system
            var os = unknown;
            var clientStrings = [
                {s:'Windows 10', r:/(Windows 10.0|Windows NT 10.0)/},
                {s:'Windows 8.1', r:/(Windows 8.1|Windows NT 6.3)/},
                {s:'Windows 8', r:/(Windows 8|Windows NT 6.2)/},
                {s:'Windows 7', r:/(Windows 7|Windows NT 6.1)/},
                {s:'Windows Vista', r:/Windows NT 6.0/},
                {s:'Windows Server 2003', r:/Windows NT 5.2/},
                {s:'Windows XP', r:/(Windows NT 5.1|Windows XP)/},
                {s:'Windows 2000', r:/(Windows NT 5.0|Windows 2000)/},
                {s:'Windows ME', r:/(Win 9x 4.90|Windows ME)/},
                {s:'Windows 98', r:/(Windows 98|Win98)/},
                {s:'Windows 95', r:/(Windows 95|Win95|Windows_95)/},
                {s:'Windows NT 4.0', r:/(Windows NT 4.0|WinNT4.0|WinNT|Windows NT)/},
                {s:'Windows CE', r:/Windows CE/},
                {s:'Windows 3.11', r:/Win16/},
                {s:'Android', r:/Android/},
                {s:'Open BSD', r:/OpenBSD/},
                {s:'Sun OS', r:/SunOS/},
                {s:'Chrome OS', r:/CrOS/},
                {s:'Linux', r:/(Linux|X11(?!.*CrOS))/},
                {s:'iOS', r:/(iPhone|iPad|iPod)/},
                {s:'Mac OS X', r:/Mac OS X/},
                {s:'Mac OS', r:/(MacPPC|MacIntel|Mac_PowerPC|Macintosh)/},
                {s:'QNX', r:/QNX/},
                {s:'UNIX', r:/UNIX/},
                {s:'BeOS', r:/BeOS/},
                {s:'OS/2', r:/OS\/2/},
                {s:'Search Bot', r:/(nuhk|Googlebot|Yammybot|Openbot|Slurp|MSNBot|Ask Jeeves\/Teoma|ia_archiver)/}
            ];
            for (var id in clientStrings) {
                var cs = clientStrings[id];
                if (cs.r.test(nAgt)) {
                    os = cs.s;
                    break;
                }
            }

            var osVersion = unknown;
            if (/Windows/.test(os)) {
                osVersion = /Windows (.*)/.exec(os)[1];
                os = 'Windows';
            }

            switch (os) {
                case 'Mac OS X':
                    osVersion = /Mac OS X (10[\.\_\d]+)/.exec(nAgt)[1];
                    break;

                case 'Android':
                    osVersion = /Android ([\.\_\d]+)/.exec(nAgt)[1];
                    break;

                case 'iOS':
                    osVersion = /OS (\d+)_(\d+)_?(\d+)?/.exec(nVer);
                    osVersion = osVersion[1] + '.' + osVersion[2] + '.' + (osVersion[3] | 0);
                    break;
            }

            // flash (you'll need to include swfobject)
            /* script src="//ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js" */
            var flashVersion = 'no check';
            if (typeof swfobject != 'undefined') {
                var fv = swfobject.getFlashPlayerVersion();
                if (fv.major > 0) {
                    flashVersion = fv.major + '.' + fv.minor + ' r' + fv.release;
                }
                else  {
                    flashVersion = unknown;
                }
            }
        }

        window.jscd = {
            screen: screenSize,
            browser: browser,
            browserVersion: version,
            browserMajorVersion: majorVersion,
            mobile: mobile,
            os: os,
            osVersion: osVersion,
            cookies: cookieEnabled,
            flashVersion: flashVersion
        };
    }(this));
    return jscd;
}


// FUNCTION: apply tooltips
function applyTooltips() {
    body.find('[data-toggle="tooltip"]').tooltip();
}


// FUNCTION: apply commas on values
function applyCommas(str, isWholeNumber) {
    if(isWholeNumber == undefined)
        isWholeNumber = false;
    if(!isWholeNumber) {
        var f = parseFloat(str);
        if (f == undefined || f != f)
            f = 0;
        return f.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    else {
        var i = parseInt(str);
        if (i == undefined || i != i)
            i = 0;
        return i.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
}


// FUNCTION: remove commas on values
function removeCommas(str, isWholeNumber) {
    if(isWholeNumber == undefined)
        isWholeNumber = false;

    str = str.toString();
    var newStr = '';
    var n;
    for(var i=0; i<str.length; i++) {
        var c = str.substr(i, 1);
        if(c != ',') {
            newStr += c;
        }
    }

    if(isWholeNumber)
        n = parseInt(newStr);
    else
        n = parseFloat(newStr);

    if(n == undefined || n != n) {
        n = 0;
    }
    return n;
}


// FUNCTION: remove duplicate elements in an arrray
function arrayUnique(arr) {
    for(var i=0; i<arr.length-1; i++) {
        for (var j = i + 1; j < arr.length; j++) {
            if(arr[j] != null) {
                if(arr[i] == arr[j]) {
                    arr[j] = null;
                }
            }
        }
    }
    var arr2 = [];
    for(var i=0; i<arr.length; i++) {
        if(arr[i] != null) {
            arr2.push(arr[i]);
        }
    }
    return arr2;
}


// https://stackoverflow.com/questions/46155/how-to-validate-an-email-address-in-javascript
function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}


// https://stackoverflow.com/questions/13627308/add-st-nd-rd-and-th-ordinal-suffix-to-a-number
function ordinal_suffix(i) {
    var j = i % 10,
        k = i % 100;
    if (j == 1 && k != 11) {
        return i + "st";
    }
    if (j == 2 && k != 12) {
        return i + "nd";
    }
    if (j == 3 && k != 13) {
        return i + "rd";
    }
    return i + "th";
}


// https://stackoverflow.com/questions/511088/use-javascript-to-place-cursor-at-end-of-text-in-text-input-element
function focusEnd(e) {
    e[0].selectionStart = e[0].selectionEnd = e[0].value.length;
}


$(function() {
    body = $('body');
    app = body.attr('data-app');
    os = body.attr('data-os');
    browser = body.attr('data-browser');
    app_url = body.attr('data-app-url');
    index = body.attr('data-index');
    page = body.attr('data-page');
    dir = body.attr('data-dir');
    lgu = body.attr('data-lgu');
    lgu_type = body.attr('data-lgu-type');
    province = body.attr('data-province');
    region = body.attr('data-region');
    citizenAvatarDir = body.attr('data-citizen-avatar-dir');
    banner1 = body.find('#banner1');
    banner2 = body.find('#banner2');

    // form wizard tab click
    body.delegate("a[data-toggle='tab']", 'click', function() {
        var newTab = $(this);
        if(!newTab.hasClass('active')) {
            var navTabs = newTab.parent().parent();
            var prevTab = navTabs.find('a.active');
            if(prevTab.length > 0) {
                var prevTabHref = prevTab.attr('href');

                var newTabHref = newTab.attr('href');
                var arrNewHref = newTabHref.split("tab");
                var arrPrevHref = prevTabHref.split("tab");

                var slideClass = (parseInt(arrNewHref[1]) > parseInt(arrPrevHref[1])) ? 'slide-left' : 'slide-right';
                var tabContent = navTabs.parent().find('.tab-content');
                var pane = tabContent.find(newTab.attr('href'));

                pane.css({
                    '-webkit-transition': 'all 0s ease',
                    'transition': 'all 0s ease'
                });
                pane.removeClass('slide-left');
                pane.removeClass('slide-right');

                pane.addClass(slideClass);
                pane.addClass('sliding');
                setTimeout(function () {
                    pane.css({
                        '-webkit-transition': 'all 0.3s ease',
                        'transition': 'all 0.3s ease'
                    });
                    pane.removeClass("sliding");
                },100);
            }
        }

        // change the nav-tab-dropdown
        var navTabDropdown = newTab.parent().parent().parent().find('.nav-tab-dropdown');
        if(navTabDropdown.length > 0) {
            var csSelect = navTabDropdown.find('.cs-select');
            var csPlaceHolder = csSelect.find('.cs-placeholder');
            csPlaceHolder.html(newTab.text().trim());
        }
    });

    // form wizard responsive tab click
    body.delegate('.cs-select > .cs-options li', 'click', function() {
        var dataValue = $(this).attr('data-value');
        var csOption = $(this);
        var select = csOption.parent().parent().parent().find('select');
        var parentFormWizardClass = select.attr('data-form-wizard-class');
        var formWizard = body.find('.' + parentFormWizardClass);
        var navItem = formWizard.find(".content-tab[href='" + csOption.attr('data-value') + "']");
        navItem.click();
    });

    // hide all tr of a table
    function hideAllRowsOfTable(tbl) {
        tbl.find('tr').each(function(i) {
            if(!$(this).hasClass('hidden')) {
                $(this).addClass('hidden');
            }
        });
    }

    // show all tr of a table
    function showAllRowsOfTable(tbl) {
        tbl.find('tr').each(function(i) {
            if($(this).hasClass('hidden')) {
                $(this).removeClass('hidden');
            }
        });
    }

    // txt search offline table keyup
    body.delegate('.txt-search-offline-table', 'keyup', function(e) {
        var q = $(this).val().trim().toLocaleLowerCase();
        var offlineTable = body.find($(this).attr('data-offline-table'));
        if(q == "")
            showAllRowsOfTable(offlineTable);
        else {
            hideAllRowsOfTable(offlineTable);
            offlineTable.find('tr').each(function(i) {
                var tr = $(this);
                tr.find('td').each(function(j) {
                    if($(this).html().toLowerCase().indexOf(q) > -1) {
                        if(tr.hasClass('hidden')) {
                            tr.removeClass('hidden');
                        }
                        return 0;
                    }
                });
            });
        }
    });

    // textbox with switch keyup
    body.delegate('.textbox-with-switch', 'keyup', function() {
        var txt = $(this);
        var sw = body.find(txt.attr('data-switch'));
        if(sw.length > 0) {
            var val = txt.val().trim();
            if(val == "") {
                if(sw.prop('checked'))
                    sw.click();
            }
            else {
                if(!sw.prop('checked'))
                    sw.click();
            }
        }
    });

    // textbox switch
    body.delegate('.textbox-switch', 'change', function() {
        var sw = $(this);
        var txt = body.find(sw.attr('data-textbox'));
        if(txt.length > 0) {
            if (!sw.prop('checked'))
                txt.val("");
        }

        var lbl = body.find(sw.attr('data-label'));
        if(lbl.length > 0) {
            if (!sw.prop('checked'))
                lbl.html(sw.attr('data-off-label'));
            else
                lbl.html(sw.attr('data-on-label'));
        }
        if(txt.val().length > 0)
            txt.focus();
        else
            txt.select();
    });

    // form group disable switch
    body.delegate('.disable-form-group-switch', 'change', function(){
        var sw = $(this);
        body.find(sw.attr('data-form-groups')).each(function(i) {
            var formGroup = $(this);
            if(sw.prop('checked')) {
                if(formGroup.hasClass('disabled')) {
                    formGroup.removeClass('disabled');
                    formGroup.find('.form-control').each(function(j) {
                        $(this).prop('disabled', false);
                        $(this).attr('disabled', false);
                        $(this).prop('readonly', false);
                        $(this).attr('readonly', false);
                        if(j == 0 && i==0)
                            $(this).select();
                    });
                }
            }
            else {
                if(!formGroup.hasClass('disabled')) {
                    formGroup.addClass('disabled');
                    formGroup.find('.form-control').each(function(j) {
                        $(this).prop('disabled', true);
                        $(this).attr('disabled', true);
                        $(this).prop('readonly', true);
                        $(this).attr('readonly', true);
                    });
                }
            }
        });
    });

    // blur sidebar on windowWidth <= 991
    body.delegate('.tab-content', 'click', function() {
        if(window.innerWidth <= 991) {
            if(body.hasClass('sidebar-open'))
                $('[data-pages="sidebar"]').data('pg.sidebar').toggleSidebar();
        }
    });
});