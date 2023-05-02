<?php

date_default_timezone_set("Asia/Yekaterinburg");

if (isset($argv[1])) {

    $date_message = "Указанная дата";
    $week_message = "Находится на неделе";

    $time = strtotime($argv[1]);

} else {

    $date_message = "Текущая дата";
    $week_message = "Текущая неделя";

    $time = time();

}

$date = date("d.m.Y", $time);

$current_week_day = date_format(date_create($date), "w");

$days_to_week_end = 7 - $current_week_day;

$days_to_week_start = 6 - $days_to_week_end;

$first_week_day = mktime(0, 0, 0, date("m", $time), date("d", $time) - $days_to_week_start, date("Y", $time));

$last_week_day = mktime(0, 0, 0, date("m", $time), date("d", $time) + $days_to_week_end, date("Y", $time));

echo $date_message.": ".$date.PHP_EOL;

echo $week_message.": ".date("d.m.Y", $first_week_day)." - ".date("d.m.Y", $last_week_day).PHP_EOL;
