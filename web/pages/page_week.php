<?php

$title = 'Доставки на неделю';

$dates = getWeekDates();

$period = [
	'first' => $dates['0']['date'],
	'last' => $dates['6']['date']
];

//$tasks = DataBase::instance()->getTasksByDates($dates);

includeTemplate('html_begin', ['title' => $title, 'menu' => $menu]);

//includeTemplate('week', ['period' => $period, 'tasks' => $tasks]);

include 'templates/week_static.php';

include 'templates/html_end.php';
