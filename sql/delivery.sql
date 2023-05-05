-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 05 2023 г., 10:22
-- Версия сервера: 8.0.32-0ubuntu0.22.04.2
-- Версия PHP: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `delivery`
--

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL COMMENT 'Идентификатор',
  `code` varchar(32) NOT NULL COMMENT 'Артикул',
  `name` varchar(64) NOT NULL COMMENT 'Название товара',
  `description` text COMMENT 'Описание товара',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Товары';

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `code`, `name`, `description`, `created_at`) VALUES
(1, '1111', 'Кресло-качалка', 'Кресло-качалка', '2023-05-02 04:33:02'),
(2, '2222', 'Глобус-бар', 'Глобус-бар', '2023-05-02 04:36:36'),
(3, '3333', 'Подвесное кресло', 'Подвесное кресло', '2023-05-02 04:36:36'),
(4, '4444', 'Набор для каллиграфии', 'Набор для каллиграфии', '2023-05-02 04:36:36'),
(5, '5555', 'Кресло из ротанга', 'Кресло из ротанга', '2023-05-02 04:36:36');

-- --------------------------------------------------------

--
-- Структура таблицы `task`
--

CREATE TABLE `task` (
  `id` int NOT NULL COMMENT 'Идентификатор',
  `type_id` int NOT NULL COMMENT 'Тип задания',
  `date_planned` date NOT NULL COMMENT 'Дата плановая',
  `address` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Адрес',
  `person` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Контактное лицо',
  `phone` varchar(32) NOT NULL COMMENT 'Телефон',
  `company` varchar(64) DEFAULT NULL COMMENT 'Организация',
  `transport_id` int DEFAULT NULL COMMENT 'Транспортная компания',
  `cost` int NOT NULL DEFAULT '0' COMMENT 'Стоимость',
  `comment` text COMMENT 'Примечание',
  `courier_id` int DEFAULT NULL COMMENT 'Исполнитель',
  `is_finished` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Признак выполнения',
  `date_finished` date DEFAULT NULL COMMENT 'Дата выполнения',
  `status` enum('new','finished','canceled','failed') NOT NULL DEFAULT 'new' COMMENT 'Статус задания',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Задания';

--
-- Дамп данных таблицы `task`
--

INSERT INTO `task` (`id`, `type_id`, `date_planned`, `address`, `person`, `phone`, `company`, `transport_id`, `cost`, `comment`, `courier_id`, `is_finished`, `date_finished`, `status`, `created_at`) VALUES
(1, 1, '2023-05-01', '8 Марта, 197', 'Иванов Иван Иванович', '123-45-67', NULL, NULL, 0, NULL, NULL, 1, NULL, 'new', '2023-05-02 10:34:41'),
(2, 1, '2023-05-01', 'Город, улица, дом', 'Петров Петр Петрович', '345-67-89', NULL, 1, 0, NULL, NULL, 1, NULL, 'new', '2023-05-02 10:39:20'),
(3, 1, '2023-05-02', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:25:27'),
(4, 1, '2023-05-02', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 1, NULL, 'new', '2023-05-04 05:28:55'),
(5, 1, '2023-05-02', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 1, NULL, 'new', '2023-05-04 05:28:55'),
(6, 1, '2023-05-03', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 1, NULL, 'new', '2023-05-04 05:28:55'),
(7, 1, '2023-05-04', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 1, NULL, 'new', '2023-05-04 05:28:55'),
(8, 1, '2023-05-04', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(9, 1, '2023-05-04', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 1, NULL, 'new', '2023-05-04 05:28:55'),
(10, 1, '2023-05-04', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, 2, 0, NULL, NULL, 1, NULL, 'new', '2023-05-04 05:28:55'),
(11, 1, '2023-05-05', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 1, NULL, 'new', '2023-05-04 05:28:55'),
(12, 1, '2023-05-05', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(13, 1, '2023-05-06', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(14, 1, '2023-05-06', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(15, 1, '2023-05-06', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(16, 1, '2023-04-26', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(17, 1, '2023-04-27', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(18, 1, '2023-04-27', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(19, 1, '2023-04-27', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(20, 1, '2023-04-28', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(21, 1, '2023-04-28', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(22, 1, '2023-05-08', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(23, 1, '2023-05-08', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(24, 1, '2023-05-08', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(25, 1, '2023-05-10', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(26, 1, '2023-05-10', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55'),
(27, 1, '2023-05-11', 'Улица, Дом', 'Неизвестный покупатель', '000-00-00', NULL, NULL, 0, NULL, NULL, 0, NULL, 'new', '2023-05-04 05:28:55');

-- --------------------------------------------------------

--
-- Структура таблицы `task_product`
--

CREATE TABLE `task_product` (
  `id` int NOT NULL COMMENT 'Идентификатор',
  `task_id` int NOT NULL COMMENT 'Задание',
  `product_id` int NOT NULL COMMENT 'Товар',
  `price` int NOT NULL DEFAULT '0' COMMENT 'Цена',
  `count` int NOT NULL DEFAULT '1' COMMENT 'Количество',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Товары в задании';

--
-- Дамп данных таблицы `task_product`
--

INSERT INTO `task_product` (`id`, `task_id`, `product_id`, `price`, `count`, `created_at`) VALUES
(1, 1, 1, 0, 1, '2023-05-04 10:37:30'),
(2, 2, 2, 0, 1, '2023-05-04 10:41:55'),
(3, 4, 3, 0, 1, '2023-05-04 10:41:55'),
(4, 4, 4, 0, 1, '2023-05-04 10:41:55'),
(5, 5, 5, 0, 1, '2023-05-04 10:41:55'),
(6, 6, 1, 0, 1, '2023-05-04 10:41:55'),
(7, 7, 2, 0, 1, '2023-05-04 10:41:55'),
(8, 9, 3, 0, 1, '2023-05-04 10:41:55'),
(9, 9, 4, 0, 1, '2023-05-04 10:41:55'),
(10, 10, 5, 0, 1, '2023-05-04 10:41:55'),
(11, 11, 1, 0, 1, '2023-05-04 10:41:55'),
(12, 12, 2, 0, 1, '2023-05-04 10:41:55'),
(13, 13, 3, 0, 1, '2023-05-04 10:41:55'),
(14, 14, 4, 0, 1, '2023-05-04 10:41:55'),
(15, 15, 5, 0, 1, '2023-05-04 10:41:55'),
(16, 16, 1, 0, 1, '2023-05-04 10:41:55'),
(17, 17, 2, 0, 1, '2023-05-04 10:41:55'),
(18, 18, 3, 0, 1, '2023-05-04 10:41:55'),
(19, 19, 4, 0, 1, '2023-05-04 10:41:55'),
(20, 20, 5, 0, 1, '2023-05-04 10:41:55'),
(21, 21, 1, 0, 1, '2023-05-04 10:41:55'),
(22, 22, 2, 0, 1, '2023-05-04 10:41:55'),
(23, 23, 3, 0, 1, '2023-05-04 10:41:55'),
(24, 24, 4, 0, 1, '2023-05-04 10:41:55'),
(25, 25, 5, 0, 1, '2023-05-04 10:41:55'),
(26, 26, 1, 0, 1, '2023-05-04 10:41:55'),
(27, 27, 2, 0, 1, '2023-05-04 10:41:55');

-- --------------------------------------------------------

--
-- Структура таблицы `transport`
--

CREATE TABLE `transport` (
  `id` int NOT NULL COMMENT 'Идентификатор',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Название',
  `address` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Адрес',
  `phone` varchar(32) NOT NULL COMMENT 'Телефон',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Транспортная компания';

--
-- Дамп данных таблицы `transport`
--

INSERT INTO `transport` (`id`, `name`, `address`, `phone`, `created_at`) VALUES
(1, 'Кит', '8 Марта, 269', '', '2023-05-02 05:13:40'),
(2, 'CDEK', 'Титова, 19', '', '2023-05-02 05:13:40');

-- --------------------------------------------------------

--
-- Структура таблицы `type`
--

CREATE TABLE `type` (
  `id` int NOT NULL COMMENT 'Идентификатор',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Название типа задания',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Тип задания';

--
-- Дамп данных таблицы `type`
--

INSERT INTO `type` (`id`, `name`, `created_at`) VALUES
(1, 'Доставка', '2023-05-02 04:29:23'),
(2, 'Получение', '2023-05-02 04:29:23'),
(3, 'Возврат', '2023-05-02 04:30:09');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL COMMENT 'Идентификатор',
  `login` varchar(32) NOT NULL COMMENT 'Логин',
  `password` varchar(64) NOT NULL COMMENT 'Пароль',
  `role` enum('admin','manager','courier') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Роль пользователя',
  `name` varchar(64) NOT NULL COMMENT 'Имя пользователя',
  `phone` varchar(32) DEFAULT NULL COMMENT 'Телефон',
  `email` varchar(64) DEFAULT NULL COMMENT 'E-mail',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Пользователи';

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `role`, `name`, `phone`, `email`, `created_at`) VALUES
(1, 'admin', '$2y$10$YBLpTWvF/aoicGvdNi5Yb.Z0cCxHU4cIdI6UjbdIWmomK.3yJCMme', 'admin', 'Admin', NULL, NULL, '2023-04-26 08:28:54');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `transport_id` (`transport_id`),
  ADD KEY `courier_id` (`courier_id`);

--
-- Индексы таблицы `task_product`
--
ALTER TABLE `task_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `task`
--
ALTER TABLE `task`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `task_product`
--
ALTER TABLE `task_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `transport`
--
ALTER TABLE `transport`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `type`
--
ALTER TABLE `type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `task_ibfk_2` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`id`),
  ADD CONSTRAINT `task_ibfk_3` FOREIGN KEY (`courier_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `task_product`
--
ALTER TABLE `task_product`
  ADD CONSTRAINT `task_product_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  ADD CONSTRAINT `task_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
