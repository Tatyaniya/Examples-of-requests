-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 06 2020 г., 18:44
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `php1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cats`
--

CREATE TABLE `cats` (
  `id_cat` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `cats`
--

INSERT INTO `cats` (`id_cat`, `title`) VALUES
(1, 'Phones'),
(2, 'Notebooks'),
(3, 'Mouses');

-- --------------------------------------------------------

--
-- Структура таблицы `departaments`
--

CREATE TABLE `departaments` (
  `id_dep` int(10) UNSIGNED NOT NULL,
  `title` varchar(256) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `address` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `departaments`
--

INSERT INTO `departaments` (`id_dep`, `title`, `phone`, `email`, `address`) VALUES
(1, 'IT', '11111111', '1@1', 'ул.Нз, д.404');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id_products` int(10) UNSIGNED NOT NULL,
  `id_cat` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `dt_add` timestamp NOT NULL DEFAULT current_timestamp(),
  `sale` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id_products`, `id_cat`, `title`, `description`, `dt_add`, `sale`) VALUES
(1, 1, 'Inpone X', '1', '2020-02-05 12:36:37', 0),
(2, 1, 'Iphone X+X', 'Coming soon', '2020-02-05 12:36:37', 20),
(3, 2, 'Note Asus NZ2', '2', '2020-02-05 12:36:48', 10),
(4, 2, 'Acer Game 1', '1', '2020-02-06 11:18:16', 15),
(5, 2, 'Some NZ', '2', '2020-02-06 11:18:29', 0),
(6, 3, 'Round Optic NZ', '2', '2020-02-06 11:23:22', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `shops`
--

CREATE TABLE `shops` (
  `id_shop` int(10) UNSIGNED NOT NULL,
  `title` varchar(256) NOT NULL,
  `site` varchar(128) NOT NULL,
  `address` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `shops`
--

INSERT INTO `shops` (`id_shop`, `title`, `site`, `address`) VALUES
(1, 'Mvideo', 'mvideo', 'qwewqe'),
(4, 'TekhnoSila', 't.s', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `shops_products`
--

CREATE TABLE `shops_products` (
  `id_shop` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `cost` int(10) UNSIGNED NOT NULL,
  `rest` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `shops_products`
--

INSERT INTO `shops_products` (`id_shop`, `id_product`, `cost`, `rest`) VALUES
(1, 1, 1000, 0),
(1, 2, 2000, 0),
(4, 1, 3000, 0),
(4, 2, 3000, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cats`
--
ALTER TABLE `cats`
  ADD PRIMARY KEY (`id_cat`);

--
-- Индексы таблицы `departaments`
--
ALTER TABLE `departaments`
  ADD PRIMARY KEY (`id_dep`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_products`),
  ADD KEY `id_cat` (`id_cat`);

--
-- Индексы таблицы `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id_shop`);

--
-- Индексы таблицы `shops_products`
--
ALTER TABLE `shops_products`
  ADD PRIMARY KEY (`id_shop`,`id_product`),
  ADD KEY `id_product` (`id_product`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cats`
--
ALTER TABLE `cats`
  MODIFY `id_cat` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `departaments`
--
ALTER TABLE `departaments`
  MODIFY `id_dep` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id_products` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `shops`
--
ALTER TABLE `shops`
  MODIFY `id_shop` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_cat`) REFERENCES `cats` (`id_cat`);

--
-- Ограничения внешнего ключа таблицы `shops_products`
--
ALTER TABLE `shops_products`
  ADD CONSTRAINT `shops_products_ibfk_1` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id_shop`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shops_products_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_products`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
