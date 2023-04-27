<?php

if(!isset($title)) {
    $title = 'Планирование доставки';
}

?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Программа для планирования доставки товаров">
    <title>Планирование доставки</title>
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>

<div class="wrapper">

<header class="main-header">
    <div class="container">
        <div class="header_logo">
            <p class="logo_name">Подарки Люкс</p>
            <p class="logo_task">Delivery</p>
        </div>
        <nav class="header_menu">
            <ul class="menu_list">
            <?php foreach ($menu as $menuLink => $menuText) : ?>
                <li class="menu_item"><a href="<?=$menuLink;?>" class="menu_link"><?=$menuText;?></a></li>
            <?php endforeach; ?>
            </ul>
        </nav>
        <div class="header_user"><a href="#" class="menu_link">Вход</a></div>
    </div>
</header>
