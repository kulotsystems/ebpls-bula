/**
 * SEARCH ITEM
 * Search for an item
 * @param  {node} e [the active $('.btn-search-item') element]
 */
function search(e) {

    // get active menu and active tab details
    var sidebarMenuHref = activeSidebarMenuItem.attr('data-href');
    var sidebarMenuText = activeSidebarMenuItem.find('.sidebar-menu-item-title').text();
    var tabHref = activeContentTabItem.attr('href');
    var tabTitle = activeContentTabItem.find('.tab-title').html();
    var tabIdentifier = activeContentTabItem.attr('data-identifier');

    var route = routes[tabIdentifier];
    if(route != undefined) {
        if(route.search_param != null) {
            var searchLabel = "<b>SEARCH:</b> " + tabTitle;
            if(searchLabel != "") {
                showQuickview(searchLabel);
            }
        }
    }
}