/**
 * PRINT ITEM
 * Print the data of an item
 * @param  {node} e [the active $('.btn-print-item') element]
 */
function print(e) {

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

    if(tabIdentifier == STR_TAB_NEW_INVOICES || tabIdentifier == STR_TAB_RENEWAL_INVOICES) {
        var ifrInvoice = divContentTab.find('#ifrInvoice');
        var contentWindow = ifrInvoice[0].contentWindow;
        contentWindow.focus();
        contentWindow.print();

        /*window.frames['ifrInvoice'].focus();
        window.frames['ifrInvoice'].print();*/
    }
    else if(tabIdentifier == STR_TAB_NEW_PERMITS || tabIdentifier == STR_TAB_RENEWAL_PERMITS) {
        var ifrPermit = divContentTab.find('#ifrPermit');
        var contentWindow = ifrPermit[0].contentWindow;
        contentWindow.focus();
        contentWindow.print();

        /*window.frames['ifrPermit'].focus();
        window.frames['ifrPermit'].print();*/
    }
}