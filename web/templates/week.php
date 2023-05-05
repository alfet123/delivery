<?php

    $failedString = "";

    if ($summary['failed'] > 0) {

        $failedString = " (в том числе просрочены ".$summary['failed'].")";

    }

?>

<main class="main_content">
    <div class="container  container_delivery">

        <h1 class="delivery_title">Планирование доставки за период с <?=$period['begin'];?> по <?=$period['end'];?></h1>

        <div class="delivery_cards">

        <?php foreach ($tasks as $dayNumber => $value) : ?>

            <div class="day_card">

                <p class="day_name"><?=$value['day'];?></p>

                <?php if (empty($value['tasks'])) : ?>

                    <p class="day_task  task_none">Доставок нет</p>

                <?php else : ?>

                    <ul>

                    <?php foreach ($value['tasks'] as $key => $task) : ?>

                        <li class="day_task<?=getStatusClass($task);?>">
                            <?=$task['type'];?> по адресу <?=$task['address'];?>
                            <?=getProducts($task['product']);?>
                            <?php if (!empty($task['transport'])) : ?>
                                через ТК <?=$task['transport'];?>
                            <?php endif; ?>
                        </li>

                    <?php endforeach; ?>

                    </ul>

                <?php endif; ?>

            </div>

        <?php endforeach; ?>

        </div>

        <p class="delivery_summary">Всего доставок за неделю: <?=$summary['all'];?></p>
        <p class="delivery_summary">Из них выполнено <?=$summary['finished'];?>, ожидают <?=$summary['waiting'];?><?=$failedString;?></p>

    </div>
</main>
