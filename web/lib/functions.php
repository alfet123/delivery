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
