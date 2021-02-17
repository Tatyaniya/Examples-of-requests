SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `php1-hw3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id_article` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_cat` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `dt_add` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id_article`, `id_user`, `id_cat`, `title`, `content`, `dt_add`, `status`) VALUES
(1, 1, 1, 'Загрузка картинки', 'уцкуцкуцк', '2020-02-12 17:43:22', 1),
(2, 1, 1, 'Работа с PDO', '34324324', '2020-02-12 17:43:46', 1),
(3, 2, 3, 'Зачем нужны индексы', 'куцкуцкуц', '2020-02-12 17:44:44', 1),
(4, 2, 2, 'Файл по частям на сервер ajax', 'ewrewrewrew', '2020-02-12 17:45:03', 1),
(5, 2, 2, 'JJ es6 new OOP', 'ewrewr', '2020-02-12 17:45:21', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `articles_tags`
--

CREATE TABLE `articles_tags` (
  `id_article` int(10) UNSIGNED NOT NULL,
  `id_tag` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `articles_tags`
--

INSERT INTO `articles_tags` (`id_article`, `id_tag`) VALUES
(1, 1),
(1, 2),
(2, 2),
(4, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `cats`
--

CREATE TABLE `cats` (
  `id_cat` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `cats`
--

INSERT INTO `cats` (`id_cat`, `title`, `url`) VALUES
(1, 'Основы PHP', 'osnovy-php'),
(2, 'Основы Javascript', 'osnovy-js'),
(3, 'Основы SQL', 'sql-basics');

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id_tag` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id_tag`, `title`, `url`) VALUES
(1, 'Загрузка файла на сервер', 'file-upload'),
(2, 'Основы ООП', 'osnovy-oop');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `login` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `login`, `password`, `name`) VALUES
(1, 'admin', 'ewrewrewrrt436t43y34y', 'Admin'),
(2, 'manager', 'qwerty', 'Some Manager');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_cat` (`id_cat`);

--
-- Индексы таблицы `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD PRIMARY KEY (`id_article`,`id_tag`),
  ADD KEY `id_tag` (`id_tag`);

--
-- Индексы таблицы `cats`
--
ALTER TABLE `cats`
  ADD PRIMARY KEY (`id_cat`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id_tag`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id_article` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `cats`
--
ALTER TABLE `cats`
  MODIFY `id_cat` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id_tag` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`id_cat`) REFERENCES `cats` (`id_cat`);

--
-- Ограничения внешнего ключа таблицы `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD CONSTRAINT `articles_tags_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id_article`),
  ADD CONSTRAINT `articles_tags_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id_tag`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
