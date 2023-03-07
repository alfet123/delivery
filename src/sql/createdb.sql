CREATE DATABASE `delivery` CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

USE `delivery`;

CREATE TABLE `user` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`login` varchar(32) NOT NULL COMMENT 'Логин',
	`password` varchar(64) NOT NULL COMMENT 'Пароль',
	`role` enum('manager','courier') NOT NULL COMMENT 'Роль пользователя',
	`name` varchar(64) NOT NULL COMMENT 'Имя пользователя',
	`phone` varchar(32) NOT NULL COMMENT 'Телефон',
	`email` varchar(64) DEFAULT NULL COMMENT 'E-mail',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

CREATE TABLE `type` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`name` varchar(64) NOT NULL COMMENT 'Название типа задания',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Тип задания';

CREATE TABLE `product` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`code` varchar(32) NOT NULL COMMENT 'Артикул',
	`name` varchar(64) NOT NULL COMMENT 'Название',
	`description` text DEFAULT NULL COMMENT 'Описание',
	`price` int(11) DEFAULT NULL COMMENT 'Стоимость',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары';

CREATE TABLE `route` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Маршрут';

CREATE TABLE `company` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Организация';

CREATE TABLE `` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='';

CREATE TABLE `` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='';

CREATE TABLE `task` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`type_id` int(11) NOT NULL COMMENT 'Тип задания',
	`date_planned` datetime NOT NULL COMMENT 'Дата плановая',
	`time` varchar(64) DEFAULT NULL COMMENT 'Время',
	/*`city_id` int(11) DEFAULT NULL COMMENT 'Город',*/
	`person_id` int(11) NOT NULL COMMENT 'Частное лицо',
	`company_id` int(11) NOT NULL COMMENT 'Организация',
	`transport_id` int(11) NOT NULL COMMENT 'Транспортная компания',
	/*`address` varchar(255) DEFAULT NULL COMMENT 'Адрес',*/
	/*`lat` decimal(10,7) DEFAULT NULL COMMENT 'Широта',*/
	/*`long` decimal(10,7) DEFAULT NULL COMMENT 'Долгота',*/
	`price` int(11) DEFAULT NULL COMMENT 'Стоимость',
	`comment` text DEFAULT NULL COMMENT 'Примечание',
	`courier_id` int(11) DEFAULT NULL COMMENT 'Исполнитель',
	/* Возможно оставить только признак или только дату выполнения */
	`is_finished` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Признак выполнения',
	`date_finished` datetime DEFAULT NULL COMMENT 'Дата выполнения',
	`status` enum('new','finished','canceled','failed') NOT NULL COMMENT 'Статус задания',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
	FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
	FOREIGN KEY (`courier_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Задания';

CREATE TABLE `task_product` (
	`task_id` int(11) NOT NULL COMMENT 'Задание',
	`product_id` int(11) NOT NULL COMMENT 'Товар',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
	FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
	FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары в задании';
