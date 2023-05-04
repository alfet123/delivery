USE `delivery`;

CREATE TABLE `user` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`login` varchar(32) NOT NULL COMMENT 'Логин',
	`password` varchar(64) NOT NULL COMMENT 'Пароль',
	`role` enum('admin', 'manager', 'courier') NOT NULL COMMENT 'Роль пользователя',
	`name` varchar(64) NOT NULL COMMENT 'Имя пользователя',
	`phone` varchar(32) DEFAULT NULL COMMENT 'Телефон',
	`email` varchar(64) DEFAULT NULL COMMENT 'E-mail',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

CREATE TABLE `type` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`name` varchar(32) NOT NULL COMMENT 'Название типа задания',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Тип задания';

CREATE TABLE `product` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`code` varchar(32) NOT NULL UNIQUE KEY COMMENT 'Артикул',
	`name` varchar(64) NOT NULL COMMENT 'Название товара',
	`description` text DEFAULT NULL COMMENT 'Описание товара',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары';

CREATE TABLE `transport` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`name` varchar(32) NOT NULL COMMENT 'Название',
	`address` varchar(64) NOT NULL COMMENT 'Адрес',
	`phone` varchar(32) NOT NULL COMMENT 'Телефон',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Транспортная компания';

CREATE TABLE `task` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`type_id` int(11) NOT NULL COMMENT 'Тип задания',
	`date_planned` date NOT NULL COMMENT 'Дата плановая',
	/*`time` varchar(64) DEFAULT NULL COMMENT 'Время для уточнения',*/
	/*`city_id` int(11) DEFAULT NULL COMMENT 'Город',*/
	/*`route_id` int(11) NOT NULL COMMENT 'Маршрут',*/
	`address` varchar(128) NOT NULL COMMENT 'Адрес',
	`person` varchar(64) NOT NULL COMMENT 'Контактное лицо',
	`phone` varchar(32) NOT NULL COMMENT 'Телефон',
	`company` varchar(64) DEFAULT NULL COMMENT 'Организация',
	`transport_id` int(11) DEFAULT NULL COMMENT 'Транспортная компания',
	/*`address` varchar(255) DEFAULT NULL COMMENT 'Адрес',*/
	/*`lat` decimal(10,7) DEFAULT NULL COMMENT 'Широта',*/
	/*`long` decimal(10,7) DEFAULT NULL COMMENT 'Долгота',*/
	`cost` int(11) NOT NULL DEFAULT 0 COMMENT 'Стоимость',
	`comment` text DEFAULT NULL COMMENT 'Примечание',
	`courier_id` int(11) DEFAULT NULL COMMENT 'Исполнитель',
	/* Возможно оставить только признак или только дату выполнения */
	`is_finished` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Признак выполнения',
	`date_finished` date DEFAULT NULL COMMENT 'Дата выполнения',
	`status` enum('new', 'finished', 'canceled', 'failed') NOT NULL DEFAULT 'new' COMMENT 'Статус задания',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
	FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
	FOREIGN KEY (`transport_id`) REFERENCES `transport` (`id`),
	FOREIGN KEY (`courier_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Задания';

CREATE TABLE `task_product` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`task_id` int(11) NOT NULL COMMENT 'Задание',
	`product_id` int(11) NOT NULL COMMENT 'Товар',
	`price` int(11) NOT NULL DEFAULT 0 COMMENT 'Цена',
	`count` int(11) NOT NULL DEFAULT 1 COMMENT 'Количество',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
	FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
	FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары в задании';
