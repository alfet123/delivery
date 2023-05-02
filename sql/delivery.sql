-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 02 2023 г., 15:42
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
  `date_planned` datetime NOT NULL COMMENT 'Дата плановая',
  `address` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Адрес',
  `name` varchar(64) NOT NULL COMMENT 'Контактное лицо',
  `phone` varchar(32) NOT NULL COMMENT 'Телефон',
  `company` varchar(64) DEFAULT NULL COMMENT 'Организация',
  `transport_id` int DEFAULT NULL COMMENT 'Транспортная компания',
  `cost` int NOT NULL DEFAULT '0' COMMENT 'Стоимость',
  `comment` text COMMENT 'Примечание',
  `courier_id` int DEFAULT NULL COMMENT 'Исполнитель',
  `is_finished` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Признак выполнения',
  `date_finished` datetime DEFAULT NULL COMMENT 'Дата выполнения',
  `status` enum('new','finished','canceled','failed') NOT NULL DEFAULT 'new' COMMENT 'Статус задания',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Задания';

--
-- Дамп данных таблицы `task`
--

INSERT INTO `task` (`id`, `type_id`, `date_planned`, `address`, `name`, `phone`, `company`, `transport_id`, `cost`, `comment`, `courier_id`, `is_finished`, `date_finished`, `status`, `created_at`) VALUES
(1, 1, '2023-05-02 15:30:12', '8 Марта, 197', 'Иванов Иван Иванович', '123-45-67', NULL, NULL, 12345, NULL, NULL, 0, '2023-05-02 15:30:12', 'new', '2023-05-02 10:34:41'),
(2, 2, '2023-05-02 15:36:27', 'Город, улица, дом', 'Петров Петр Петрович', '345-67-89', NULL, 1, 1200, NULL, NULL, 0, '2023-05-02 15:36:27', 'new', '2023-05-02 10:39:20');

-- --------------------------------------------------------

--
-- Структура таблицы `task_product`
--

CREATE TABLE `task_product` (
  `task_id` int NOT NULL COMMENT 'Задание',
  `product_id` int NOT NULL COMMENT 'Товар',
  `price` int NOT NULL DEFAULT '0' COMMENT 'Цена',
  `count` int NOT NULL DEFAULT '1' COMMENT 'Количество',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Товары в задании';

--
-- Дамп данных таблицы `task_product`
--

INSERT INTO `task_product` (`task_id`, `product_id`, `price`, `count`, `created_at`) VALUES
(1, 1, 12345, 1, '2023-05-02 10:35:25'),
(2, 4, 500, 2, '2023-05-02 10:39:46');

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
(1, 'Прямая доставка', '2023-05-02 04:29:23'),
(2, 'Доставка через ТК', '2023-05-02 04:29:23'),
(3, 'Получение товара', '2023-05-02 04:30:09'),
(4, 'Возврат от покупателя', '2023-05-02 04:30:09');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=3;

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
