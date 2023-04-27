<?php

if (isset($argv[1])) {
	echo PHP_EOL.password_hash($argv[1], PASSWORD_DEFAULT).PHP_EOL.PHP_EOL;
} else {
	echo PHP_EOL."Usage: hash <password>".PHP_EOL.PHP_EOL;
}

?>
