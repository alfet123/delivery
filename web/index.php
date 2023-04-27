<?php

require_once 'lib/database.php';

require 'lib/config.php';
require 'lib/functions.php';

$addressParts = getAddressParts();

if (isset($addressParts[0]) && !empty($addressParts[0])) {
    $pageName = $addressParts[0];
}

if (isset($addressParts[1]) && !empty($addressParts[1])) {
    $personId = intval($addressParts[1]);
}

if (isset($pageName)) {

    if (array_key_exists($pageName, $pages)){

        require $pagesPath.'/'.$pages[$pageName].'.php';

    } else {

        require $pagesPath.'/'.$pageError.'.php';

    }

} else {

    require $pagesPath.'/'.$pageDefault.'.php';

}
