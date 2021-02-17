-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 17 2021 г., 22:49
-- Версия сервера: 10.4.14-MariaDB
-- Версия PHP: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id_art` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `content` text NOT NULL,
  `dt_art` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_cat` int(11) UNSIGNED NOT NULL,
  `image` text DEFAULT NULL,
  `id_user` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id_art`, `title`, `content`, `dt_art`, `id_cat`, `image`, `id_user`) VALUES
(3, 'errrryr', 'dfgdfgdfgdfsg', '2021-02-09 22:26:33', 1, NULL, 1),
(4, 'eyrtyrt', 'shyrsyreyrw', '2021-02-09 22:26:33', 2, NULL, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `articles_tags`
--

CREATE TABLE `articles_tags` (
  `id_articles` int(11) NOT NULL,
  `id_tags` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `articles_tags`
--

INSERT INTO `articles_tags` (`id_articles`, `id_tags`) VALUES
(3, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `cats`
--

CREATE TABLE `cats` (
  `id_cat` int(11) UNSIGNED NOT NULL,
  `title` varchar(256) NOT NULL,
  `cat_url` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `cats`
--

INSERT INTO `cats` (`id_cat`, `title`, `cat_url`) VALUES
(1, '1', '111'),
(2, '2', '222');

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id_tags` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `tag_url` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id_tags`, `title`, `tag_url`) VALUES
(1, '1', '111'),
(2, '2', '222');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `login` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `login`, `password`, `email`, `phone`) VALUES
(1, 'hhhhh', 'dsgdgdgds', 'sdgdgdgdg', 464645654),
(2, 'rrrr', 'fddhsfdfd', 'fhdfsgfdhgsfd', 456547547);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_art`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_cat` (`id_cat`);

--
-- Индексы таблицы `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD PRIMARY KEY (`id_articles`,`id_tags`),
  ADD KEY `id_tags` (`id_tags`);

--
-- Индексы таблицы `cats`
--
ALTER TABLE `cats`
  ADD PRIMARY KEY (`id_cat`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id_tags`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id_art` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `cats`
--
ALTER TABLE `cats`
  MODIFY `id_cat` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id_tags` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`id_cat`) REFERENCES `cats` (`id_cat`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD CONSTRAINT `articles_tags_ibfk_1` FOREIGN KEY (`id_articles`) REFERENCES `articles` (`id_art`) ON UPDATE CASCADE,
  ADD CONSTRAINT `articles_tags_ibfk_2` FOREIGN KEY (`id_tags`) REFERENCES `tags` (`id_tags`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
