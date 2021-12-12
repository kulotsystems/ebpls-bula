<?php

    require '__init.php';
    require '../admin.user_verifier.php';
    if($response['error'] == '') {

        if(isset($_POST['get_dashboard_data'])) {
            $period = trim($_POST['get_dashboard_data']);
            if($period == '') {
                if(isset($_SESSION[SESSION_DASHBOARD_PERIOD])) {
                    if($_SESSION[SESSION_DASHBOARD_PERIOD] != '')
                        $period = $_SESSION[SESSION_DASHBOARD_PERIOD];
                }
                else
                    $period = 'd';
            }
            $_SESSION[SESSION_DASHBOARD_PERIOD] = $period;
            // =====================================================================================
            $total_fees    = 0;
            $total_tax     = 0;
            $total_new     = 0;
            $total_renewal = 0;

            $chart = array();
            $chart['chart'      ] ['type'      ]               = 'line';
            $chart['title'      ] ['text'      ]               = '';
            $chart['xAxis'      ] ['categories']               = array();
            $chart['xAxis'      ] ['labels'    ] ['rotation' ] = -45;
            $chart['yAxis'      ] ['title'     ] ['enabled'  ] = false;
            $chart['plotOptions'] ['series'    ] ['animation'] = false;
            $chart['legend'     ] ['enabled'   ]               = false;
            $chart['credits'    ] ['enabled'   ]               = false;
            $chart['series'     ]                              = array();

            $series_fees = array();
            $series_fees['name'     ] = 'Fees';
            $series_fees['color'    ] = '#69b6f3';
            $series_fees['lineWidth'] = 3;
            $series_fees['data'] = array();

            $series_tax = array();
            $series_tax['name'     ] = 'Tax';
            $series_tax['color'    ] = '#eb7374';
            $series_tax['lineWidth'] = 3;
            $series_tax['data'] = array();

            define('SECS_MINUTE',    60);
            define('SECS_HOUR'  ,  3600);
            define('SECS_DAY'   , 86400);
            function to_db_date_time     ($epoch) { return date('Y-m-d H:i:s'  , $epoch); }
            function to_human_date       ($epoch) { return date('M. d, Y'      , $epoch); }
            function to_human_date_abbrev($epoch) { return date('M.d'          , $epoch); }
            function to_human_time       ($epoch) { return date('h:i A'        , $epoch); }
            function to_human_date_time  ($epoch) { return date('M. d, Y h:i A', $epoch); }

            $epoch_midnight    = CURRENT_TIME - (date('G', CURRENT_TIME) * SECS_HOUR +  date('i', CURRENT_TIME) * SECS_MINUTE +  date('s', CURRENT_TIME));
            $epoch_week_start  = $epoch_midnight - (date('N', CURRENT_TIME) * SECS_DAY);
            $epoch_week_end    = $epoch_week_start + (7 * SECS_DAY - 1);
            $epoch_month_start = $epoch_midnight - ((date('d', CURRENT_TIME) - 1) * SECS_DAY);
            $epoch_month_end   = $epoch_month_start + ((date('t', CURRENT_TIME)) * SECS_DAY - 1);

            switch($_SESSION[SESSION_DASHBOARD_PERIOD]) {

                // HOURS OF THE DAY
                case 'd' : {
                    $chart['title']['text'] = 'Income Today';

                    $epoch_start = $epoch_midnight + (6  * SECS_HOUR);
                    $epoch_end   = $epoch_midnight + (18 * SECS_HOUR);
                    for($i = $epoch_start; $i <= $epoch_end; $i += SECS_HOUR) {
                        $epoch_hour_start = $i;
                        $epoch_hour_end   = $i + SECS_HOUR - 1;
                        array_push($chart['xAxis'] ['categories'], '<b>' . date('g', $epoch_hour_start) . date('a', $epoch_hour_start) . '</b>');

                        $db_hour_start     = to_db_date_time($epoch_hour_start);
                        $db_hour_end       = to_db_date_time($epoch_hour_end);
                        $permits_analytics = get_permits_analytics(array('NEW', 'RENEWAL'), $db_hour_start, $db_hour_end);

                        $total_fees += $permits_analytics['total_fees'];
                        array_push($series_fees['data'], $permits_analytics['total_fees']);

                        $total_tax += $permits_analytics['total_tax'];
                        array_push($series_tax ['data'], $permits_analytics['total_tax']);

                        $total_new     += $permits_analytics['total_new'];
                        $total_renewal += $permits_analytics['total_renewal'];
                    }
                } break;

                // DAYS OF THE WEEK
                case 'w' : {
                    $chart['title']['text'] = 'Income this Week';

                    for($i = $epoch_week_start; $i <= $epoch_week_end; $i += SECS_DAY) {
                        $epoch_day_start = $i;
                        $epoch_day_end   = $i + SECS_DAY - 1;
                        array_push($chart['xAxis'] ['categories'], '<b>' . strtoupper(substr(date('l', $i), 0, 3)) . '</b><br><small>' . to_human_date_abbrev($i) . '</small>' );

                        $db_day_start      = to_db_date_time($epoch_day_start);
                        $db_day_end        = to_db_date_time($epoch_day_end);
                        $permits_analytics = get_permits_analytics(array('NEW', 'RENEWAL'), $db_day_start, $db_day_end);

                        $total_fees += $permits_analytics['total_fees'];
                        array_push($series_fees['data'], $permits_analytics['total_fees']);

                        $total_tax += $permits_analytics['total_tax'];
                        array_push($series_tax ['data'], $permits_analytics['total_tax']);

                        $total_new     += $permits_analytics['total_new'];
                        $total_renewal += $permits_analytics['total_renewal'];
                    }
                } break;

                // WEEKS OF THE MONTH
                case 'm' : {
                    $chart['title']['text'] = 'Income this Month';

                    $epoch_week_start_ctr = $epoch_month_start;
                    $ctr = 1;
                    for($i = $epoch_month_start; $i <= $epoch_month_end; $i += SECS_DAY) {
                        $day_name = date('l', $i);
                        if($day_name == 'Sunday') {
                            $epoch_week_start_ctr = $i;
                        }
                        if($day_name == 'Saturday' || $i == ($epoch_month_end + 1) - SECS_DAY) {
                            $epoch_week_end_ctr = $i + SECS_DAY - 1;
                            array_push($chart['xAxis'] ['categories'], '<b>WEEK ' . $ctr . '</b><br>' . to_human_date_abbrev($epoch_week_start_ctr) . ' - ' . to_human_date_abbrev($epoch_week_end_ctr));

                            $db_week_start     = to_db_date_time($epoch_week_start_ctr);
                            $db_week_end       = to_db_date_time($epoch_week_end_ctr);
                            $permits_analytics = get_permits_analytics(array('NEW', 'RENEWAL'), $db_week_start, $db_week_end);

                            $total_fees += $permits_analytics['total_fees'];
                            array_push($series_fees['data'], $permits_analytics['total_fees']);

                            $total_tax += $permits_analytics['total_tax'];
                            array_push($series_tax ['data'], $permits_analytics['total_tax']);

                            $total_new     += $permits_analytics['total_new'];
                            $total_renewal += $permits_analytics['total_renewal'];

                            $ctr += 1;
                        }
                    }
                } break;

                // MONTHS OF THE YEAR
                case 'y' : {
                    $chart['title']['text'] = 'Income this Year';

                    for($i = 1; $i <= 12; $i++) {
                        $month_num = ($i < 10) ? '0'.$i : $i;
                        $year = date('Y', CURRENT_TIME);
                        $date_time = new DateTime($year . '-' . $month_num . '-01');
                        $date_time->setTimezone(new DateTimeZone(STR_TIMEZONE));
                        $epoch_month_start = $date_time->getTimestamp();
                        $epoch_month_end = $epoch_month_start + (date('t', $epoch_month_start) * SECS_DAY) - 1;
                        array_push($chart['xAxis'] ['categories'], '<b>' . substr(date('F', $epoch_month_start), 0, 3) . '</b>');

                        $db_month_start    = to_db_date_time($epoch_month_start);
                        $db_month_end      = to_db_date_time($epoch_month_end);
                        $permits_analytics = get_permits_analytics(array('NEW', 'RENEWAL'), $db_month_start, $db_month_end);

                        $total_fees += $permits_analytics['total_fees'];
                        array_push($series_fees['data'], $permits_analytics['total_fees']);

                        $total_tax += $permits_analytics['total_tax'];
                        array_push($series_tax ['data'], $permits_analytics['total_tax']);

                        $total_new     += $permits_analytics['total_new'];
                        $total_renewal += $permits_analytics['total_renewal'];
                    }

                } break;

                // ALL
                case 'a' : {
                    $chart['title']['text'] = 'All Income';

                    $year_min = 2021;
                    $year_max = 2021;

                    // get maximum `CreatedAt` at `applications_forpermit`
                    $query  = "SELECT MAX(`CreatedAt`) AS MaxCreatedAt FROM `applications_forpermit`";
                    $result = mysqli_query($con, $query);
                    if(has_no_db_error('for getting maximum permit creation date')) {
                        while($row = mysqli_fetch_assoc($result)) {
                            $year_max = intval(date('Y', strtotime($row['MaxCreatedAt'])));
                            break;
                        }

                        // add 5 years to $year_max
                        $year_max += 5;

                        for($i=$year_min; $i<=$year_max; $i++) {
                            $year          = $i;
                            $db_year_start = $year . '-01-01 00:00:00';
                            $db_year_end   = $year . '-12-31 23:59:59';
                            array_push($chart['xAxis'] ['categories'], '<b>' . $year . '</b>');

                            $permits_analytics = get_permits_analytics(array('NEW', 'RENEWAL'), $db_year_start, $db_year_end);

                            $total_fees += $permits_analytics['total_fees'];
                            array_push($series_fees['data'], $permits_analytics['total_fees']);

                            $total_tax += $permits_analytics['total_tax'];
                            array_push($series_tax ['data'], $permits_analytics['total_tax']);

                            $total_new     += $permits_analytics['total_new'];
                            $total_renewal += $permits_analytics['total_renewal'];
                        }
                    }
                }
            }

            array_push($chart['series' ], $series_fees);
            array_push($chart['series' ], $series_tax);
            // =====================================================================================
            $response['success']['data'] = array(
                'period'        => $period,
                'chart'         => $chart,
                'total_fees'    => number_format($total_fees, 2),
                'total_tax'     => number_format($total_tax, 2),
                'total_new'     => $total_new,
                'total_renewal' => $total_renewal
            );
        }
    }
    require '__fin.php';
?>