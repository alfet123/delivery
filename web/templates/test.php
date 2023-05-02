<?php

$style = "padding:10px; background-color: gray; color: white;";

?>

<main class="main_content">
    <div class="container  container_delivery">

        <pre>

            <div style="<?=$style;?>">Переменная $_SERVER['REQUEST_URI']</div>
            <div><?=var_dump($_SERVER['REQUEST_URI']);?></div>

            <div style="<?=$style;?>">Переменная $_SERVER</div>
            <div><?=print_r($_SERVER);?></div>

            <div style="<?=$style;?>">URL</div>
            <div><?=var_dump($url);?></div>

            <div style="<?=$style;?>">Сегменты запроса</div>
            <div><?=print_r($segments);?></div>

            <div style="<?=$style;?>">Метод запроса</div>
            <div><?=var_dump($method);?></div>

            <div style="<?=$style;?>">Переменная $_GET</div>
            <div><?=print_r($_GET);?></div>

        </pre>

    </div>
</main>
