<?php

$menu = [
	'/' => 'Главная',
	'/catalog' => 'Каталог',
	'/about' => 'О компании'
];

$title = 'Планирование доставки';

//$persons = DataBase::instance()->getAllPersons();

includeTemplate('html_begin', ['title' => $title, 'menu' => $menu]);

//includeTemplate('list', ['persons' => $persons]);

include 'templates/week.php';

include 'templates/html_end.php';
