<?php

// функция возвращет сегменты запроса из адресной строки
// $initialPosition = порядковый номер первого сегмента
//function getAddressParts($initialPosition = 0)
function getAddressParts()
{
    $url = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
    $segments = explode('/', trim($url, '/'));

//    return array_slice($segments, $initialPosition);
    return $segments;
}

function getAvatar($person)
{
    $images = 'img/';
    $type = '.jpg';
    $prefix = '/';

    if (empty($person['id'])) {
        return $prefix.$images.'none'.$type;
    }

    $avatarById = $images.$person['id'].$type;
    $avatarByGender = $images.$person['gender'].$type;

    if (file_exists($avatarById)) {
        return $prefix.$avatarById;
    }

    return $prefix.$avatarByGender;
}

// функция обеспечивает защиту от XSS
function dataFiltering($data)
{
    if (is_array($data)) {
        $result = [];
        foreach ($data as $key => $value) {
            $result[$key] = dataFiltering($value);
        }
    } elseif (is_object($data)) {
        foreach ($data as $key => $value) {
            $data->$key = dataFiltering($value);
        }
        return $data;
    } else {
        $result = htmlspecialchars($data);
    }

    return $result;
}

// функция выводит шаблон из заданного файла
function includeTemplate($template, $data = [])
{
    $file = $GLOBALS['templatesPath'].'/'.$template.'.php';

    $result = "";

    if (file_exists($file)) {
        $data = dataFiltering($data);
        extract($data);
        ob_start();
        include($file);
        $result = ob_get_clean();
    }

    echo $result;
}

// функция выводит виджет из заданного файла
function includeWidget($widget, $data = [])
{
    $file = $GLOBALS['widgetsPath'].'/'.$widget.'.php';

    $result = "";

    if (file_exists($file)) {
        $data = dataFiltering($data);
        extract($data);
        ob_start();
        include($file);
        $result = ob_get_clean();
    }

    echo $result;
}

// Возвращает даты начала и конца текущей недели
// Формат "Y-m-d" по умолчанию для SQL запросов
function getWeekPeriod($format="Y-m-d")
{
    $period = [
        'begin' => '',
        'end' => ''
    ];

    $time = time();
    $date = date($format, $time);
    $current_week_day = date_format(date_create($date), "w");
    $days_to_week_end = 7 - $current_week_day;
    $days_to_week_start = 6 - $days_to_week_end;
    $first_week_day = mktime(0, 0, 0, date("m", $time), date("d", $time) - $days_to_week_start, date("Y", $time));
    $last_week_day = mktime(0, 0, 0, date("m", $time), date("d", $time) + $days_to_week_end, date("Y", $time));

    $period['begin'] = date($format, $first_week_day);
    $period['end'] = date($format, $last_week_day);

    return $period;
}

// Возвращает все даты текущей недели
// Формат "Y-m-d" по умолчанию для SQL запросов
function getWeekDates($format="Y-m-d")
{
    $dates = [
        '0' => ['day' => 'Понедельник', 'date' => ''],
        '1' => ['day' => 'Вторник', 'date' => ''],
        '2' => ['day' => 'Среда', 'date' => ''],
        '3' => ['day' => 'Четверг', 'date' => ''],
        '4' => ['day' => 'Пятница', 'date' => ''],
        '5' => ['day' => 'Суббота', 'date' => ''],
        '6' => ['day' => 'Воскресенье', 'date' => '']
    ];

    $time = time();
    $date = date($format, $time);
    $current_week_day = date_format(date_create($date), "w");
    $days_to_week_end = 7 - $current_week_day;
    $days_to_week_start = 6 - $days_to_week_end;
    $first_week_day = mktime(0, 0, 0, date("m", $time), date("d", $time) - $days_to_week_start, date("Y", $time));

    foreach ($dates as $dayNumber => $value) {
        $dates[$dayNumber]['date'] = date($format, strtotime("+$dayNumber days", $first_week_day));
    }

    return $dates;
}

// Возвращает первую и последнюю дату из указанного периода
// Формат "Y-m-d" по умолчанию для SQL запросов
function getBoundaryDates($dates, $format="Y-m-d")
{
    if (empty($dates)) {
        return ['begin' => '', 'end' => ''];
    }

    return [
        'begin' => date($format, strtotime($dates[array_key_first($dates)]['date'])),
        'end' => date($format, strtotime($dates[array_key_last($dates)]['date']))
    ];
}

// Проверяет является ли незавершенное задание просроченным
function taskIsFailed($date_planned, $is_finished)
{
    $result = false;

    $date_today = date("Y-m-d");

    if (!$is_finished && (strtotime($date_planned) < strtotime($date_today))) {

        $result = true;

    }

    return $result;
}

// Возвращает название класса в соответствии со статусом задания
function getStatusClass($task)
{
    if ($task['is_finished'] == 1) {

        return "  task_finished";

    }

    if (taskIsFailed($task['date_planned'], $task['is_finished'])) {

        return "  task_failed";

    }

/*    if (empty($task['product'])) {

        return "  task_product";

    }*/

    return "";
}

// Возвращает список товаров в заказе
function getProducts($products)
{
    $productsString = "";

    if (empty($products)) {

        return "";

    }

    $productsString = "(";

    $productsCount = 1;

    foreach ($products as $key => $product) {

        $productsString .= $product['code'];

        if ($productsCount < count($products)) {

            $productsString .= ", ";

        }

        $productsCount++;

    }

    $productsString .= ")";

    return $productsString;
}
