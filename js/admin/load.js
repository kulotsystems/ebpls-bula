/**
 * LOAD CONTENTS
 * Prepare the contents of $('.content') depending on the active menu
 */
function load() {
    // get active menu data
    var sidebarMenuItemTitle = activeSidebarMenuItem.find('.sidebar-menu-item-title').html();
    var sidebarMenuHref = activeSidebarMenuItem.attr('data-href');
    var invokeResizePositioning = false;

    // generate HTML :: breadcrumbs
    var h = "";
    h += "<div class='jumbotron no-margin' data-pages='parallax'>";
        h += "<div class='container-fixed-lg sm-p-l-0 sm-p-r-0'>";
            h += "<div class='inner'>";
                h += "<ol class='breadcrumb no-selection'>";
                    h += "<li class='breadcrumb-item cursor-pointer toggle-sidebar' data-toggle='sidebar'><a>Admin</a></li>";
                    h += "<li class='breadcrumb-item active cursor-pointer toggle-sidebar' data-toggle='sidebar'>" + sidebarMenuItemTitle + "</li>";
                    h += "<li class='breadcrumb-item no-before float-right p-r-10'>";
                        // RESERVED FOR BREADCRUMB BUTTONS
                    h += "</li>";
                h += "</ol>";
            h += "</div>";
        h += "</div>";
    h += "</div>";

    h += "<div class='main-content bg-white overflow-hidden'>";
        h += "<div class='main-form-wizard'>";

            // :: content tabs
            h += "<ul class='nav nav-tabs nav-tabs-linetriangle nav-tabs-separator nav-stack-sm hidden-sm-down' role='tablist' data-init-reponsive-tabs='dropdownfx'>";
            var arrTabs = activeSidebarMenuItem.attr('data-tabs').split("||");
            for(var i=0; i<arrTabs.length; i++) {
                var arrTab = arrTabs[i].split("|");
                if(arrTab.length > 1) {
                    var tabIdentifier = arrTab[1].split(" ").join("_");
                    h += "<li class='nav-item'>";
                        h += "<a class='content-tab text-center' data-toggle='tab' href='#tab" + (i + 1).toString() + "' role='tab' aria-expanded='false' data-identifier='" + tabIdentifier + "' data-item=''>";
                            h += "<i class='" + arrTab[0] + " tab-icon'></i>";
                            h += "<span class='tab-title'>" + arrTab[1] + "</span>";
                        h += "</a>";
                    h += "</li>";
                }
            }
            h += "</ul>";

            // :: content panes
            h += "<div class='tab-content no-top-padding no-bottom-padding'>";
            for(var i=0; i<arrTabs.length; i++) {
                var arrTab = arrTabs[i].split("|");
                var tabIdentifier = '';
                if(arrTab.length > 1) {
                    tabIdentifier = arrTab[1].split(" ").join("_");
                }
                h += "<div class='tab-pane content-tab-pane";
                h += "' id='tab" + (i+1).toString() + "' aria-expanded='true'>";
                h += "<div class='pane'>";
                    h += "<div class='row'>";
                        if(tabIdentifier == STR_TAB_DASHBOARD) {
                            h += "<div class='col-md-12 no-padding pane-right-col'>";
                                h += "<div class='pane-right'>";
                                    h += "<div class='card card-default no-margin'>";
                                        h += "<div class='card-header separator no-padding padding-left-15 padding-right-15 item-content-header'>";
                                            h += "<div class='card-controls card-controls-right w-100'>";
                                                h += "<div class='btn-group float-right item-controls btn-group-dashboard-period'>";
                                                    h += "<button class='btn btn-default btn-xs m-l-10 cursor-pointer font-1em' data-period='d' data-fa-icon='clock'><span class='fas fa-clock display-none-sm'></span><span class='icon-title'> Today</span></button>";
                                                    h += "<button class='btn btn-default btn-xs m-l-10 cursor-pointer font-1em' data-period='w' data-fa-icon='calendar-day'><span class='fas fa-calendar-day display-none-sm'></span><span class='icon-title'> Week</span></button>";
                                                    h += "<button class='btn btn-default btn-xs m-l-10 cursor-pointer font-1em' data-period='m' data-fa-icon='calendar-alt'><span class='fas fa-calendar-alt display-none-sm'></span><span class='icon-title'> Month</span></button>";
                                                    h += "<button class='btn btn-default btn-xs m-l-10 cursor-pointer font-1em' data-period='y' data-fa-icon='calendar'><span class='fas fa-calendar display-none-sm'></span><span class='icon-title'> Year</span></button>";
                                                    h += "<button class='btn btn-default btn-xs m-l-10 cursor-pointer font-1em' data-period='a' data-fa-icon='calendar-check'><span class='fas fa-calendar-check display-none-sm'></span><span class='icon-title'> All</span></button>";
                                                h += "</div>";
                                            h += "</div>";
                                        h += "</div>";
                                        h += "<div class='card-block overflow-y-auto item-content padding-15'>";
                                            h += generateDashboard();
                                            invokeResizePositioning = true;
                                        h += "</div>";
                                    h += "</div>";
                                h += "</div>";
                            h += "</div>";
                        }
                        else {
                            // :: left pane
                            h += "<div class='col-md-3 no-padding pane-left-col'>";
                                h += "<div class='pane-left module-block'>";
                                    h += "<div class='card card-default no-margin h-100'>";
                                        h += "<div class='card-header separator div-main-items-header'>";
                                            h += "<div class='card-controls card-controls-left w-100'>";

                                                h += "<div class='btn-group float-left'>";
                                                    h += "<button class='btn btn-link btn-xs m-l-10 cursor-pointer font-1em' data-toggle='' style='padding-top: 4px !important;'>";
                                                        h += "<span class='icon-title text-success text-lowercase hidden'>" + /*"<span class='fa fa-list-ol'></span>&nbsp;&nbsp;" +*/ "<span class='item-displayed-total text-bold font-1-1em'></span> / <span class='item-total text-bold font-1-1em'></span></span>";
                                                    h += "</button>";
                                                h += "</div>";
                                                h += "<div class='btn-group float-right'>";
                                                if(sidebarMenuHref != 'systemlogs'
                                                    && tabIdentifier != STR_TAB_NEW_VERIFICATIONS
                                                    && tabIdentifier != STR_TAB_RENEWAL_VERIFICATIONS
                                                    && tabIdentifier != STR_TAB_NEW_INVOICES
                                                    && tabIdentifier != STR_TAB_RENEWAL_INVOICES
                                                    && tabIdentifier != STR_TAB_NEW_PERMITS
                                                    && tabIdentifier != STR_TAB_RENEWAL_PERMITS
                                                    && tabIdentifier != STR_TAB_TAX_OPTIONS
                                                    && tabIdentifier != STR_TAB_APPLICATION_SETTINGS
                                                    && tabIdentifier != STR_TAB_SYSTEM_SETTINGS
                                                    && tabIdentifier != STR_TAB_CITIZENS
                                                    && tabIdentifier != STR_TAB_UPDATES
                                                    && tabIdentifier != STR_TAB_REPORTS) {
                                                    h += "<button class='btn btn-success btn-xs m-l-10 cursor-pointer font-1em btn-new-item' data-toggle=''>";
                                                        h += "<span class='fas fa-plus-circle'></span><span class='icon-title'> New</span>";
                                                    h += "</button>";
                                                }
                                                if((sidebarMenuHref != 'systemlogs')
                                                    &&
                                                    (
                                                        tabIdentifier == STR_TAB_NEW_APPLICATIONS ||
                                                        tabIdentifier == STR_TAB_NEW_VERIFICATIONS ||
                                                        tabIdentifier == STR_TAB_NEW_INVOICES ||
                                                        tabIdentifier == STR_TAB_NEW_PERMITS ||
                                                        tabIdentifier == STR_TAB_RENEWAL_APPLICATIONS ||
                                                        tabIdentifier == STR_TAB_RENEWAL_VERIFICATIONS ||
                                                        tabIdentifier == STR_TAB_RENEWAL_INVOICES ||
                                                        tabIdentifier == STR_TAB_RENEWAL_PERMITS ||
                                                        tabIdentifier == STR_TAB_LINES_OF_BUSINESS ||
                                                        tabIdentifier == STR_TAB_BUSINESS_SIZES ||
                                                        tabIdentifier == STR_TAB_TAX_OPTIONS ||
                                                        tabIdentifier == STR_TAB_FEE_ITEMS ||
                                                        tabIdentifier == STR_TAB_REQUIREMENT_ITEMS ||
                                                        tabIdentifier == STR_TAB_CITIZENS/* ||
                                                        tabIdentifier == STR_TAB_USER_ACCOUNTS ||
                                                        tabIdentifier == STR_TAB_USER_TYPES ||
                                                        tabIdentifier == STR_TAB_APPLICATION_SETTINGS ||
                                                        tabIdentifier == STR_TAB_SYSTEM_SETTINGS*/
                                                    )) {
                                                    h += "<button class='btn btn-default btn-xs m-l-10 cursor-pointer font-1em btn-search-item text-success' data-toggle=''>";
                                                        h += "<span class='fas fa-search'></span></span>";
                                                    h += "</button>";
                                                }
                                                h += "</div>";
                                            h += "</div>";
                                        h += "</div>";
                                        h += "<div class='card-block overflow-y-auto no-padding div-main-items' style='position: relative'></div>";
                                    h += "</div>";
                                h += "</div>";
                            h += "</div>";

                            // :: right pane
                            h += "<div class='col-md-9 no-padding pane-right-col'>";
                                h += "<div class='pane-right'>";
                                    h += "<div class='card card-default no-margin'>";
                                        h += "<div class='card-header separator no-padding padding-left-15 padding-right-15 item-content-header'>";
                                            h += "<div class='card-controls card-controls-right w-100'>";
                                                h += "<div class='btn-group float-left'>";
                                                    h += "<button class='btn btn-default btn-xs m-l-10 cursor-pointer btn-back-to-items font-1em' data-toggle='' style='border-radius: 3px'>";
                                                        h += "&nbsp;<span class='fa fa-arrow-left'>&nbsp;</span><span class='icon-title'>Back&nbsp;</span>";
                                                    h += "</button>";
                                                    h += "<input type='text' class='btn btn-xs m-l-10 font-1em txt-find-in-page hidden' data-toggle='' placeholder='Find...' style='text-align: left; cursor: auto; border: 0; background: transparent'>";
                                                h += "</div>";

                                                if(sidebarMenuHref != 'systemlogs') {
                                                    h += "<div class='btn-group float-right item-controls hidden'>";
                                                        if(tabIdentifier != STR_TAB_NEW_INVOICES
                                                            && tabIdentifier != STR_TAB_RENEWAL_INVOICES
                                                            && tabIdentifier != STR_TAB_NEW_PERMITS
                                                            && tabIdentifier != STR_TAB_RENEWAL_PERMITS
                                                            && tabIdentifier != STR_TAB_UPDATES
                                                            && tabIdentifier != STR_TAB_CITIZENS
                                                            && tabIdentifier != STR_TAB_REPORTS) {
                                                            h += "<button class='btn btn-success btn-xs m-l-10 cursor-pointer font-1em btn-save-item' data-toggle=''>";
                                                                h += "<span class='fas fa-save'></span><span class='icon-title'> Save</span>";
                                                            h += "</button>";
                                                        }
                                                        if(tabIdentifier == STR_TAB_NEW_INVOICES
                                                            || tabIdentifier == STR_TAB_RENEWAL_INVOICES
                                                            || tabIdentifier == STR_TAB_NEW_PERMITS
                                                            || tabIdentifier == STR_TAB_RENEWAL_PERMITS) {
                                                                h += "<button class='btn btn-success btn-xs m-l-10 cursor-pointer font-1em btn-print-item' data-toggle=''>";
                                                                    h += "<span class='fas fa-print'></span><span class='icon-title'> Print</span>";
                                                                h += "</button>";
                                                        }
                                                        if(tabIdentifier != STR_TAB_TAX_OPTIONS
                                                            && tabIdentifier != STR_TAB_NEW_PERMITS
                                                            && tabIdentifier != STR_TAB_RENEWAL_PERMITS
                                                            && tabIdentifier != STR_TAB_APPLICATION_SETTINGS
                                                            && tabIdentifier != STR_TAB_UPDATES
                                                            && tabIdentifier != STR_TAB_CITIZENS
                                                            && tabIdentifier != STR_TAB_REPORTS) {
                                                            h += "<button class='btn btn-default btn-xs m-l-10 cursor-pointer font-1em btn-submit-item text-success hidden' data-toggle=''>";
                                                                h += "<span class='fas fa-arrow-circle-right'></span><span class='icon-title'> <span class='btn-label'></span></span>";
                                                            h += "</button>";
                                                            h += "<button class='btn btn-default btn-xs m-l-10 cursor-pointer font-1em btn-delete-item' data-toggle=''>";
                                                                h += "<span class='fa fa-trash'></span><span class='icon-title'></span>";
                                                            h += "</button>";
                                                        }
                                                        if(tabIdentifier == STR_TAB_NEW_PERMITS || tabIdentifier == STR_TAB_RENEWAL_PERMITS) {
                                                            h += "<button class='btn btn-default btn-xs m-l-10 cursor-pointer font-1em btn-print-invoice' data-toggle=''>";
                                                                h += "&#8369;<span class='icon-title'></span>";
                                                            h += "</button>";
                                                        }
                                                    h += "</div>";
                                                }

                                            h += "</div>";
                                        h += "</div>";
                                        h += "<div class='card-block overflow-y-auto item-content padding-15'>";
                                        h += "</div>";
                                    h += "</div>";
                                h += "</div>";
                            h += "</div>";
                        }
                        h += "</div>";
                    h += "</div>";
                h += "</div>";
            }
            h += "</div>";

        h += "</div>";
    h += "</div>";

    // :: quickview
    h += "<div id='quickview' class='quickview-wrapper' data-pages='quickview'>";
        h += "<ul class='nav nav-tabs no-padding quickview-title-bar'>";
            h += "<li class='text-white' data-target='' data-toggle='tab'>";
                h += "<a href='#' class='text-white quickview-title'></a>";
            h += "</li>";
        h += "</ul>";
        h += "<a class='btn-link quickview-toggle cursor-pointer' style='right: 5px'>";
            h += "<span class='fa fa-times-circle text-white'></span>";
        h += "</a>";
        h += "<div class='quickview-content'>";
            h += "<div class='quickview-content-head'></div>";
            h += "<div class='quickview-content-body overflow-y-auto'></div>";
        h += "</div>";
    h += "</div>";


    // write the html
    body.find('.content').html(h);

    var chartContainer = body.find("#chartContainer");
    if(chartContainer.length > 0) {
        var options = {
            animationEnabled: false,
            /*title: {
                text: "Monthly Sales - 2017"
            },*/
            axisX: {
                valueFormatString: "MMM"
            },
            axisY: {
                /*title: "Sales (in USD)",*/
                prefix: "₱",
                includeZero: false
            },
            data: [{
                yValueFormatString: "₱#,###",
                xValueFormatString: "MMMM",
                type: "spline",
                dataPoints: [
                    {x: new Date(2017, 0), y: 99999},
                    {x: new Date(2017, 1), y: 27980},
                    {x: new Date(2017, 2), y: 33800},
                    {x: new Date(2017, 3), y: 49400},
                    {x: new Date(2017, 4), y: 40260},
                    {x: new Date(2017, 5), y: 33900},
                    {x: new Date(2017, 6), y: 48000},
                    {x: new Date(2017, 7), y: 31500},
                    {x: new Date(2017, 8), y: 32300},
                    {x: new Date(2017, 9), y: 42000},
                    {x: new Date(2017, 10), y: 52160},
                    {x: new Date(2017, 11), y: 49400}
                ]
            },
                {
                    yValueFormatString: "₱#,###",
                    xValueFormatString: "MMMM",
                    type: "spline",
                    dataPoints: [
                        {x: new Date(2017, 0), y: 1},
                        {x: new Date(2017, 1), y: 27981},
                        {x: new Date(2017, 2), y: 30801},
                        {x: new Date(2017, 3), y: 49401},
                        {x: new Date(2017, 4), y: 40261},
                        {x: new Date(2017, 5), y: 33901},
                        {x: new Date(2017, 6), y: 48001},
                        {x: new Date(2017, 7), y: 31501},
                        {x: new Date(2017, 8), y: 20000},
                        {x: new Date(2017, 9), y: 42001},
                        {x: new Date(2017, 10), y: 52161},
                        {x: new Date(2017, 11), y: 49401}
                    ]
                }
            ]
        };
        chartContainer.CanvasJSChart(options);
    }


    // position elements
    positionElements();
    if(invokeResizePositioning) {
        setTimeout(function() {
            positionElements();
        }, 32);
    }

    // populate data-tab-#-active-item attr to activeSidebarMenuItem
    var mainFormWizard = body.find('.main-form-wizard');
    var totalContentTab = mainFormWizard.find('.content-tab').length;
    for(var i=1; i<=totalContentTab; i++) {
        var attr = 'data-tab-' + i.toString() + '-active-item';
        if(!activeSidebarMenuItem[0].hasAttribute(attr)) {
            activeSidebarMenuItem.attr(attr, '0');
        }
    }

    // set the active tab of the menu
    activeContentTabItem = mainFormWizard.find(".nav-tabs .nav-item > a[href='#tab" + tab + "']");

    if(activeContentTabItem.length < 1) {
        tab = '1';
        activeContentTabItem = mainFormWizard.find(".nav-tabs .nav-item > a[href='#tab1']");
    }
    if(isLiveClick) {
        if(activeContentTabItem != undefined)
            activeContentTabItem.click();
    }
    else {
        mainFormWizard.find(".content-tab.active").removeClass('active');
        activeContentTabItem.addClass('active');

        mainFormWizard.find(".content-tab-pane.active").removeClass('active');
        mainFormWizard.find(".content-tab-pane[id='tab" + tab + "']").addClass('active');

        enumerate();
    }

    // hide sidebar on 991px and below screen width
    if(isLiveClick) {
        if(window.innerWidth <= 991) {
            $('[data-pages="sidebar"]').data('pg.sidebar').toggleSidebar();
        }
    }

    // render responsive tabs
    renderResponsiveTabs();

}


/**
 * GENERATE DASHBOARD
 * Generate the dashboard html
 */
function generateDashboard() {
    var h = "";
    h += "<div class='row'>";
        // LEFT COLUMN
        h += "<div class='col-md-3'>";

            // >>>> APPLICABLE FEES >>>>>>>>>>>>>>>>>>>>>>>>>>>
            h += "<div class='row'>";
                h += "<div class='col-md-12 m-b-10'>";
                    h += "<div class='widget-9 card no-border bg-complete no-margin widget-loader-bar'>";
                        h += "<div class='container-xs-height full-height'>";
                            h += "<div class='card-header'>";
                                h += "<div class='card-title text-white'>";
                                    h += "<span class='font-montserrat fs-11 all-caps'>Applicable Fees <i class='fa fa-chevron-right'></i></span>";
                                h += "</div>";
                                h += "<div class='card-controls'>";
                                    h += "<ul>";
                                        h += "<li>";
                                            h += "<a href='#' class='card-refresh text-black' data-toggle='refresh'><i class='card-icon card-icon-refresh'></i></a>";
                                        h += "</li>";
                                    h += "</ul>";
                                h += "</div>";
                            h += "</div>";
                            h += "<div class='p-l-20'>";
                                h += "<h3 class='no-margin p-b-5 text-white chart-total-fees'>&nbsp;</h3>";
                                // h += "<a href='#' class='btn-circle-arrow text-white'><i class='pg-arrow_minimize'></i></a>";
                                // h += "<span class='small hint-text text-white'>65% lower than last month</span>";
                            h += "</div>";
                        h += "</div>";
                    h += "</div>";
                h += "</div>";
            h += "</div>";
            // <<<<<<<<<<<<<<<<<<<<<<<<<<<< APPLICABLE FEES <<<<


            // >>>> BUSINESS TAX >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            h += "<div class='row'>";
                h += "<div class='col-md-12 m-b-10'>";
                    h += "<div class='widget-9 card no-border bg-danger no-margin widget-loader-bar'>";
                        h += "<div class='container-xs-height full-height'>";
                            h += "<div class='card-header'>";
                                h += "<div class='card-title text-white'>";
                                    h += "<span class='font-montserrat fs-11 all-caps'>Business Tax <i class='fa fa-chevron-right'></i></span>";
                                h += "</div>";
                                h += "<div class='card-controls'>";
                                    h += "<ul>";
                                        h += "<li>";
                                            h += "<a href='#' class='card-refresh text-black' data-toggle='refresh'><i class='card-icon card-icon-refresh'></i></a>";
                                        h += "</li>";
                                    h += "</ul>";
                                h += "</div>";
                            h += "</div>";
                            h += "<div class='p-l-20'>";
                                h += "<h3 class='no-margin p-b-5 text-white chart-total-tax'>&nbsp;</h3>";
                                // h += "<a href='#' class='btn-circle-arrow text-white'><i class='pg-arrow_minimize'></i></a>";
                                // h += "<span class='small hint-text text-white'>65% lower than last month</span>";
                            h += "</div>";
                        h += "</div>";
                    h += "</div>";
                h += "</div>";
            h += "</div>";
            // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< BUSINESS TAX <<<<


            // >>>> ANOTHER COLLECTION >>>>>>>>>>>>>>>>>>>>>>>>>
            h += "<div class='row'>";
                h += "<div class='col-md-12 m-b-10'>";
                    h += "<div class='widget-9 card no-border bg-warning no-margin widget-loader-bar'>";
                        h += "<div class='container-xs-height full-height'>";
                            h += "<div class='card-header'>";
                                h += "<div class='card-title text-black'>";
                                    h += "<span class='font-montserrat fs-11 all-caps'>Business Applications <i class='fa fa-chevron-right'></i></span>";
                                h += "</div>";
                                h += "<div class='card-controls'>";
                                    h += "<ul>";
                                        h += "<li>";
                                            h += "<a href='#' class='card-refresh text-black' data-toggle='refresh'><i class='card-icon card-icon-refresh'></i></a>";
                                        h += "</li>";
                                    h += "</ul>";
                                h += "</div>";
                            h += "</div>";
                            h += "<div class='p-l-20'>";
                                h += "<table>";
                                    h += "<tr>";
                                        h += "<td><big>NEW</big></td>";
                                        h += "<td><big>:</big></td>";
                                        h += "<td class='text-bold'><big class='chart-total-new'>&nbsp;</big></td>";
                                    h += "</tr>";
                                    h += "<tr>";
                                        h += "<td><big>RENEWAL</big></td>";
                                        h += "<td><big>:</big></td>";
                                        h += "<td class='text-bold'><big class='chart-total-renewal'>&nbsp;</big></td>";
                                    h += "</tr>";
                                h += "</table>";
                            h += "</div>";
                        h += "</div>";
                    h += "</div>";
                h += "</div>";
            h += "</div>";
            // <<<<<<<<<<<<<<<<<<<<<<<< ANOTHER COLLECTION <<<<

        h += "</div>";


        // MIDDLE COLUMN
        h += "<div class='col-md-9'>";
            h += "<div class='dashboard-chart' id='dashboard-chart'></div>";
        h += "</div>";
    h += "</div>";

    return h;
}


/**
 * RENDER GRAPH
 * Display graph in #chartContainer
 *
 */
var tmrGraphRender;
var tmrGraphRenderMs = 5000;
var isTmrGraphRenderRunning = false;
function renderGraphData() {

    // stop ongoing render
    stopGraphRender();

    // get period
    var period = '';
    var divContentTab = body.find('.content-tab-pane#tab' + tab);
    var btnGroupDashboardPeriod = divContentTab.find('.btn-group-dashboard-period');
    var btnActivePeriod = divContentTab.find('button.btn-success');
    if(btnActivePeriod.length > 0) {
        btnActivePeriod.each(function(i) {
            period = $(this).attr('data-period');
            return 0;
        });
    }

    // initiate ajax request
    $.ajax({
        type: 'POST',
        url: index + 'php/ajax/dashboard.php',
        data: {
            get_dashboard_data: period
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
                    var tabIdentifier = activeContentTabItem.attr('data-identifier');
                    if(tabIdentifier == STR_TAB_DASHBOARD) {
                        var objData = response.success.data;
                        period = objData.period;

                        // make period button active
                        btnGroupDashboardPeriod.find('button').each(function() {
                            var btnPeriod = $(this);
                            disableButton(btnPeriod, false);

                            var fas = btnPeriod.find('.fas');
                            if(fas.hasClass('fa-spin')) {
                                fas.removeClass('fa-circle-notch');
                                fas.removeClass('fa-spin');
                                fas.addClass('fa-' + btnPeriod.attr('data-fa-icon'));
                            }

                            if(btnPeriod.attr('data-period') == period) {
                                if(!btnPeriod.hasClass('btn-success')) {
                                    btnPeriod.removeClass('btn-default');
                                    btnPeriod.addClass('btn-success');
                                }
                            }
                            else {
                                if(btnPeriod.hasClass('btn-success')) {
                                    btnPeriod.removeClass('btn-success');
                                    btnPeriod.addClass('btn-default');
                                }
                            }
                        });

                        if(body.find('.dashboard-chart').length > 0) {
                            dashboardChart = Highcharts.chart('dashboard-chart', objData.chart);
                            dashboardChartReflow();
                        }

                        divContentTab.find('.chart-total-fees').html("&#8369; " + objData.total_fees.toString());
                        divContentTab.find('.chart-total-tax').html("&#8369; " + objData.total_tax.toString());

                        divContentTab.find('.chart-total-new').html(objData.total_new.toString());
                        divContentTab.find('.chart-total-renewal').html(objData.total_renewal.toString());

                        // request again
                        startGraphRender();
                    }
                }
            }
        },
        error: function(data) {
            alert("UNABLE TO FETCH DASHBOARD DATA.\n\nError " + data.status + " (" + data.statusText + ")");
            window.location.reload();
        }
    });
}
// start the timer in rendering the graph
function startGraphRender() {
    tmrGraphRender = setTimeout(function() {
        renderGraphData();
    }, tmrGraphRenderMs);
}
// stop the timer in rendering the graph
function stopGraphRender() {
    clearTimeout(tmrGraphRender);
    isTmrGraphRenderRunning = false;
}

// reflow dashboard chart
function dashboardChartReflow() {
    setTimeout(function() {
        if(dashboardChart != null)
            dashboardChart.reflow();
    }, 48);
    setTimeout(function() {
        if(dashboardChart != null)
            dashboardChart.reflow();
    }, 480);
    setTimeout(function() {
        if(dashboardChart != null)
            dashboardChart.reflow();
    }, 4800);
}
