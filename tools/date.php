<?php

date_default_timezone_set("Asia/Yekaterinburg");

if (isset($argv[1])) {

$date_message = "Указанная дата";
$week_message = "Находится на неделе";

$date = new DateTimeImmutable($argv[1]);

} else {

$date_message = "Текущая дата";
$week_message = "Текущая неделя";

$date = new DateTimeImmutable();

}

echo $date_message.": ".date("d.m.Y", $date).PHP_EOL;

$current_week_day = $date->format("w");

$days_to_week_end = 7 - $current_week_day;

$days_to_week_start = 6 - $days_to_week_end;

$first_week_day_date = mktime(0, 0, 0, date("m", $date), date("d", $date) - $days_to_week_start, date("Y", $date));

$last_week_day_date = mktime(0, 0, 0, date("m", $date), date("d", $date) + $days_to_week_end, date("Y", $date));

echo $week_message.": ".date("d.m.Y", $first_week_day_date)." - ".date("d.m.Y", $last_week_day_date).PHP_EOL;
