-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 17 2024 г., 19:43
-- Версия сервера: 8.0.30
-- Версия PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `demo`
--

-- --------------------------------------------------------

--
-- Структура таблицы `demo_cart`
--

CREATE TABLE `demo_cart` (
  `id` int NOT NULL,
  `count` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `demo_category`
--

CREATE TABLE `demo_category` (
  `id` int NOT NULL,
  `name` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `demo_iteminorder`
--

CREATE TABLE `demo_iteminorder` (
  `id` int NOT NULL,
  `count` int NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `demo_order`
--

CREATE TABLE `demo_order` (
  `id` int NOT NULL,
  `date` datetime NOT NULL,
  `status` varchar(254) NOT NULL,
  `rejection_reason` text NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `demo_product`
--

CREATE TABLE `demo_product` (
  `id` int NOT NULL,
  `name` varchar(254) NOT NULL,
  `date` datetime NOT NULL,
  `photo_file` varchar(254) NOT NULL,
  `year` int NOT NULL,
  `country` varchar(254) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `count` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `demo_user`
--

CREATE TABLE `demo_user` (
  `id` int NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `name` varchar(254) NOT NULL,
  `surname` varchar(254) NOT NULL,
  `patronymic` varchar(254) NOT NULL,
  `username` varchar(254) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(254) NOT NULL,
  `role` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `demo_cart`
--
ALTER TABLE `demo_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `demo_category`
--
ALTER TABLE `demo_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `demo_iteminorder`
--
ALTER TABLE `demo_iteminorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `demo_order`
--
ALTER TABLE `demo_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `demo_product`
--
ALTER TABLE `demo_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `demo_user`
--
ALTER TABLE `demo_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `demo_cart`
--
ALTER TABLE `demo_cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `demo_category`
--
ALTER TABLE `demo_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `demo_iteminorder`
--
ALTER TABLE `demo_iteminorder`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `demo_order`
--
ALTER TABLE `demo_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `demo_product`
--
ALTER TABLE `demo_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `demo_user`
--
ALTER TABLE `demo_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `demo_cart`
--
ALTER TABLE `demo_cart`
  ADD CONSTRAINT `demo_cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `demo_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demo_cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `demo_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `demo_category`
--
ALTER TABLE `demo_category`
  ADD CONSTRAINT `demo_category_ibfk_1` FOREIGN KEY (`id`) REFERENCES `demo_product` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `demo_iteminorder`
--
ALTER TABLE `demo_iteminorder`
  ADD CONSTRAINT `demo_iteminorder_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `demo_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demo_iteminorder_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `demo_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `demo_order`
--
ALTER TABLE `demo_order`
  ADD CONSTRAINT `demo_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `demo_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
