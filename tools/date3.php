<?php

date_default_timezone_set("Asia/Yekaterinburg");

$dates = [
    'monday' => '',
    'tuesday' => '',
    'wednesday' => '',
    'thursday' => '',
    'friday' => '',
    'saturday' => '',
    'sunday' => ''
];

$time = time();
$date = date("Y-m-d", $time);
$current_week_day = date_format(date_create($date), "w");
$days_to_week_end = 7 - $current_week_day;
$days_to_week_start = 6 - $days_to_week_end;
$first_week_day = mktime(0, 0, 0, date("m", $time), date("d", $time) - $days_to_week_start, date("Y", $time));

$dayNumber = 0;

foreach ($dates as $day => $date) {
    $dates[$day] = date("Y-m-d", strtotime("+$dayNumber days", $first_week_day));
    echo $day." - ".$dates[$day].PHP_EOL;
    $dayNumber++;
}
