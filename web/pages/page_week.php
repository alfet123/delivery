<?php

$title = 'Доставки на неделю';

$dates = getWeekDates();

$periodDMY = getBoundaryDates($dates, "d.m.Y");
$periodYMD = getBoundaryDates($dates); // Формат "Y-m-d" по умолчанию

$tasks = DataBase::instance()->getTasksByDates($dates);

$summary = DataBase::instance()->getSummary($periodYMD);

includeTemplate('html_begin', ['title' => $title, 'menu' => $menu]);

includeTemplate('week', ['period' => $periodDMY, 'tasks' => $tasks, 'summary' => $summary]);

include 'templates/html_end.php';
