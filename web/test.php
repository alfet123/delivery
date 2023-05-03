<?php

require_once 'lib/database.php';
require 'lib/functions.php';

$dates = getWeekDates();

//var_dump($dates);

$tasks = DataBase::instance()->getTasksByDates($dates);

var_dump($tasks);
