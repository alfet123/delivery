<?php

$menu = [
    '/list' => 'Список'
];

$url = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$segments = explode('/', trim($url, '/'));
$method = $_SERVER['REQUEST_METHOD'];

$title = 'Тестовая страница';

includeTemplate('html_begin', ['title' => $title, 'menu' => $menu]);

includeTemplate('test', ['url' => $url, 'segments' => $segments, 'method' => $method]);

include 'templates/html_end.php';
