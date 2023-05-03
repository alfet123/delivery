<?php

date_default_timezone_set("Asia/Yekaterinburg");

$dates = [
    '0' => ['day' => 'Понедельник', 'date' => ''],
    '1' => ['day' => 'Вторник', 'date' => ''],
    '2' => ['day' => 'Среда', 'date' => ''],
    '3' => ['day' => 'Четверг', 'date' => ''],
    '4' => ['day' => 'Пятница', 'date' => ''],
    '5' => ['day' => 'Суббота', 'date' => ''],
    '6' => ['day' => 'Воскресенье', 'date' => '']
];


$time = time();
$date = date("Y-m-d", $time);
$current_week_day = date_format(date_create($date), "w");
$days_to_week_end = 7 - $current_week_day;
$days_to_week_start = 6 - $days_to_week_end;
$first_week_day = mktime(0, 0, 0, date("m", $time), date("d", $time) - $days_to_week_start, date("Y", $time));

foreach ($dates as $dayNumber => $value) {
    $dates[$dayNumber]['date'] = date("Y-m-d", strtotime("+$dayNumber days", $first_week_day));
}

var_dump($dates);
