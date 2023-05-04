<?php

date_default_timezone_set("Asia/Yekaterinburg");

$date_today = date("d.m.Y");

$date_planned = "05.05.2023";

echo "Сегодня ".$date_today.PHP_EOL;

echo "Доставка запланирована на ".$date_planned.PHP_EOL;

if (strtotime($date_planned) == strtotime($date_today)) {

    echo "Доставка сегодня".PHP_EOL;

} else if (strtotime($date_planned) < strtotime($date_today)) {

    echo "Доставка просрочена".PHP_EOL;

} else {

    echo "Время доставки еще не наступило".PHP_EOL;

}
