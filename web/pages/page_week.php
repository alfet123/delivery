<?php

$title = 'Доставки на неделю';

$dates = getWeekDates();

$tasks = DataBase::instance()->getTasksByDates($dates);

includeTemplate('html_begin', ['title' => $title, 'menu' => $menu]);

includeTemplate('week', ['period' => getBoundaryDates($dates), 'tasks' => $tasks]);

include 'templates/html_end.php';
