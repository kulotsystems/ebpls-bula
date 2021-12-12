<?php

    $arr_menu_items = array(
        array(
            'name'   => 'HOME',
            'href'   => 'home',
            'status' => '',
            'tab'    => '1',
            'icon'   => 'fa fa-home',
            'tabs' => array(
                array(
                    'tab_icon' => 'fa fa-th-large',
                    'tab_text' => 'DASHBOARD',
                    'desc' => 'View the system dashboard.',
                    'for_devs_only' => false
                ),
                array(
                    'tab_icon' => 'fas fa-layer-group',
                    'tab_text' => 'UPDATES',
                    'desc' => 'View the updates posted by the developers.',
                    'for_devs_only' => false
                )
            )
        ),
        array(
            'name'   => 'NEW BUSINESS',
            'href'   => 'newbusiness',
            'status' => '',
            'tab'    => '1',
            'icon'   => 'fa fa-folder-plus',
            'tabs' => array(
                array(
                    'tab_icon' => 'fa fa-edit',
                    'tab_text' => '[NEW] APPLICATIONS',
                    'desc' => 'Create application for new business.',
                    'for_devs_only' => false
                ),
                array(
                    'tab_icon' => 'fa fa-window-restore',
                    'tab_text' => '[NEW] VERIFICATIONS',
                    'desc' => 'Verify application for new business.',
                    'for_devs_only' => false
                ),
                array(
                    'tab_icon' => 'fa fa-receipt',
                    'tab_text' => '[NEW] PAYMENT INVOICES',
                    'desc' => 'Access payment invoices for new business.',
                    'for_devs_only' => false
                ),
                array(
                    'tab_icon' => 'fa fa-address-card',
                    'tab_text' => '[NEW] BUSINESS PERMITS',
                    'desc' => 'Access business permits for new business.',
                    'for_devs_only' => false
                )
            )
        ),
        array(
            'name'   => 'RENEWAL',
            'href'   => 'renewal',
            'status' => '',
            'tab'    => '1',
            'icon'   => 'fa fa-folder',
            'tabs' => array(
                array(
                    'tab_icon' => 'fa fa-edit',
                    'tab_text' => '[REN] APPLICATIONS',
                    'desc' => 'Create application for renewal.',
                    'for_devs_only' => false
                ),
                array(
                    'tab_icon' => 'fa fa-window-restore',
                    'tab_text' => '[REN] VERIFICATIONS',
                    'desc' => 'Verify application for renewal.',
                    'for_devs_only' => false
                ),
                array(
                    'tab_icon' => 'fa fa-receipt',
                    'tab_text' => '[REN] PAYMENT INVOICES',
                    'desc' => 'Access payment invoices for renewal.',
                    'for_devs_only' => false
                ),
                array(
                    'tab_icon' => 'fa fa-address-card',
                    'tab_text' => '[REN] BUSINESS PERMITS',
                    'desc' => 'Access business permits for renewal.',
                    'for_devs_only' => false
                )
            )
        ),
        array(
            'name'   => 'BUSINESS & TAX',
            'href'   => 'businesses',
            'status' => '',
            'tab'    => '1',
            'icon'   => 'fa fa-wallet',
            'tabs' => array(
                array(
                    'tab_icon' => 'fa fa-sitemap',
                    'tab_text' => 'LINES OF BUSINESS',
                    'desc' => 'Manage settings for lines of business and business taxes.',
                    'for_devs_only' => false
                ),
                array(
                    'tab_icon' => 'fa fa-chart-pie',
                    'tab_text' => 'BUSINESS SIZES',
                    'desc' => 'Manage settings for business sizes.',
                    'for_devs_only' => false
                )/*,
                array(
                    'tab_icon' => 'fa fa-sliders-h',
                    'tab_text' => 'TAX OPTIONS',
                    'desc' => 'Manage business tax options',
                    'for_devs_only' => false
                )*/
            )
        ),
        array(
            'name'   => 'FEES',
            'href'   => 'fees',
            'status' => '',
            'tab'    => '1',
            'icon'   => 'fa fa-calculator',
            'tabs' => array(
                array(
                    'tab_icon' => 'fa fa-calculator',
                    'tab_text' => 'FEE ITEMS',
                    'desc' => 'Manage settings for applicable fees.',
                    'for_devs_only' => false
                )
            )
        ),
        array(
            'name'   => 'REQUIREMENTS',
            'href'   => 'requirements',
            'status' => '',
            'tab'    => '1',
            'icon'   => 'fa fa-file',
            'tabs' => array(
                array(
                    'tab_icon' => 'fa fa-file',
                    'tab_text' => 'REQUIREMENT ITEMS',
                    'desc' => 'Manage settings for application requirements.',
                    'for_devs_only' => false
                )
            )
        ),
        array(
            'name'   => 'REPORTS',
            'href'   => 'reports',
            'status' => '',
            'tab'    => '1',
            'icon'   => 'fa fa-copy',
            'tabs' => array(
                array(
                    'tab_icon' => 'fa fa-copy',
                    'tab_text' => 'REPORTS',
                    'desc' => 'View reports.',
                    'for_devs_only' => false
                )
            )
        ),
        array(
            'name'   => 'USERS',
            'href'   => 'users',
            'status' => '',
            'tab'    => '1',
            'icon'   => 'fa fa-user',
            'tabs' => array(
                array(
                    'tab_icon' => 'fa fa-user',
                    'tab_text' => 'USER ACCOUNTS',
                    'desc' => 'Manage settings for user accounts.',
                    'for_devs_only' => false
                ),
                array(
                    'tab_icon' => 'fa fa-tags',
                    'tab_text' => 'USER TYPES',
                    'desc' => 'Manage settings for user types.',
                    'for_devs_only' => false
                ),
                array(
                    'tab_icon' => 'fa fa-user-circle',
                    'tab_text' => 'CITIZENS',
                    'desc' => 'View citizens.',
                    'for_devs_only' => true
                )
            )
        ),
        array(
            'name'   => 'SETTINGS',
            'href'   => 'settings',
            'status' => '',
            'tab'    => '1',
            'icon'   => 'fa fa-cog',
            'tabs' => array(
                array(
                    'tab_icon' => 'fa fa-cog',
                    'tab_text' => 'APPLICATION SETTINGS',
                    'desc' => 'Manage application settings.',
                    'for_devs_only' => false
                ),
                array(
                    'tab_icon' => 'fa fa-cog',
                    'tab_text' => 'SYSTEM SETTINGS',
                    'desc' => 'Manage system settings.',
                    'for_devs_only' => false
                )
            )
        ),
        array(
            'name'   => 'SYSTEM LOGS',
            'href'   => 'systemlogs',
            'status' => '',
            'tab'    => '1',
            'icon'   => 'fa fa-desktop',
            'tabs' => array(
                array (
                    'tab_icon' => 'fa fa-desktop',
                    'tab_text' => 'ACTIVITY LOGS',
                    'desc' => 'Access activity logs.',
                    'for_devs_only' => false
                )
            )
        )
    );

?>