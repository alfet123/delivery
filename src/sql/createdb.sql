CREATE DATABASE `delivery` CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

USE `delivery`;

CREATE TABLE `user` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`login` varchar(64) NOT NULL COMMENT 'Логин',
	`password` varchar(64) NOT NULL COMMENT 'Пароль',
	`role` enum('manager','courier') NOT NULL COMMENT 'Роль пользователя',
	`name` varchar(64) NOT NULL COMMENT 'Имя пользователя',
	`phone` varchar(32) NOT NULL COMMENT 'Телефон',
	`email` varchar(64) NOT NULL COMMENT 'E-mail',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

CREATE TABLE `task` (
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор',
	`customer_id` int(11) NOT NULL COMMENT 'Заказчик',
	`name` varchar(64) NOT NULL COMMENT 'Мне нужно',
	`description` text NOT NULL COMMENT 'Подробности задания',
	`category_id` int(11) NOT NULL COMMENT 'Категория задания',
	`city_id` int(11) DEFAULT NULL COMMENT 'Город',
	`address` varchar(255) DEFAULT NULL COMMENT 'Адрес',
	`lat` decimal(10,7) DEFAULT NULL COMMENT 'Широта',
	`long` decimal(10,7) DEFAULT NULL COMMENT 'Долгота',
	`budget` int(11) DEFAULT NULL COMMENT 'Бюджет',
	`status` int(11) NOT NULL COMMENT 'Статус задания',
	`contractor_id` int(11) DEFAULT NULL COMMENT 'Исполнитель',
	`expire` datetime DEFAULT NULL COMMENT 'Срок завершения работы',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
	FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`),
	FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
	FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
	FOREIGN KEY (`contractor_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Задания';

