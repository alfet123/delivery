<?php

date_default_timezone_set("Asia/Yekaterinburg");

$time = strtotime("2023-05-03");

echo "Today is ".date("Y-m-d", $time).PHP_EOL;

echo "Last monday is ".date("Y-m-d", strtotime("last monday", $time)).PHP_EOL;
