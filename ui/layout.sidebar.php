
        <nav class="page-sidebar" data-pages="sidebar">
            <div class="sidebar-header">
                <?php $banner_text_class = 'text-white'; $app_logo = 'app_logo_2.png';  $brand_id = 'banner2'; require INDEX . "ui/layout.banner.php"; ?>
            </div>
            <div class="sidebar-menu">
                <ul class="menu-items p-t-15"><?php ret(1);
                    for($i=0; $i<sizeof($arr_menu_items); $i++) {
                        $arr_attr_tabs = array();
                        $arr_tabs = $arr_menu_items[$i]['tabs'];
                        $str_tab_total = '';

                        // check if all tabs are accessible by the user
                        $arr_accessible_tabs = array();
                        for($j=0; $j<sizeof($arr_tabs); $j++) {
                            if(in_array($arr_tabs[$j]['tab_text'], $arr_admin_details['user_type_access']) || ($arr_tabs[$j]['for_devs_only'] && $arr_admin_details['citizen_id'] == 1)) {
                                array_push($arr_accessible_tabs, $arr_tabs[$j]['tab_text']);
                            }
                        }

                        if(sizeof($arr_accessible_tabs) > 0) {
                            for($j=0; $j<sizeof($arr_tabs); $j++) {
                                if(in_array($arr_tabs[$j]['tab_text'], $arr_accessible_tabs)) {
                                    array_push($arr_attr_tabs, implode("|", array($arr_tabs[$j]['tab_icon'], $arr_tabs[$j]['tab_text'])));
                                    $str_tab_total .= ' data-tab-' . ($j + 1) . '-total="0"';
                                }
                            }
                            tab(5); echo "<li class='cursor-pointer sidebar-menu-item no-selection" . $arr_menu_items[$i]['status'] . "' data-href='" . $arr_menu_items[$i]['href'] . "' data-tabs='" . implode("||", $arr_attr_tabs) . "' data-tab='" . $arr_menu_items[$i]['tab'] . "'"; if($arr_menu_items[$i]['href'] == $page) echo " data-tab-" . $arr_menu_items[$i]['tab'] . "-active-item='" . $item . "'"; else echo " data-tab-1-active-item='0'"; echo $str_tab_total; echo ">"; ret(1);
                            tab(6); echo "<a class='sidebar-menu-item-title'>" . $arr_menu_items[$i]['name'] . "</a>"; ret(1);
                            tab(6);echo "<span class='icon-thumbnail border-radius-2'><span class='" . $arr_menu_items[$i]['icon'] . "'></span></span>"; ret(1);
                            tab(5); echo "</li>"; ret(1);
                        }
                    }
                    tab(4); ?></ul>
                <div class="clearfix"></div>
            </div>
        </nav>
