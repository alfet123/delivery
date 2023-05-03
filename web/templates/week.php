<?php

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

                    <?php foreach ($value['tasks'] as $key => $task) : ?>

                        <p class="day_task"><?=$task['type'];?> по адресу <?=$task['address'];?></p>

                    <?php endforeach; ?>

                <?php endif; ?>

            </div>

        <?php endforeach; ?>

        </div>

        <p class="delivery_summary">Итог по доставкам за неделю: запланировано 25, выполнено 18, просрочено 2, ожидают 5 </p>

    </div>
</main>
