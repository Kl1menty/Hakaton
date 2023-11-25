-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 24 2023 г., 17:43
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `u1835076_flask_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blog`
--

CREATE TABLE `blog` (
  `id_post` int(11) NOT NULL,
  `title_post` varchar(100) DEFAULT NULL,
  `author_post` int(11) DEFAULT NULL,
  `data_time_post` datetime DEFAULT NULL,
  `url_post` varchar(150) DEFAULT NULL,
  `path_im_post` varchar(150) DEFAULT NULL,
  `text_post` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `title_category` varchar(50) DEFAULT NULL,
  `url_category` varchar(50) DEFAULT NULL,
  `path_im_category` varchar(50) DEFAULT NULL,
  `comm_category` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--

CREATE TABLE `gallery` (
  `id_gallery` int(11) NOT NULL,
  `path_im` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `id_elem_menu` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `url_page` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `dropdown` varchar(50) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id_elem_menu`, `title`, `url_page`, `icon`, `dropdown`, `parent`) VALUES
(1, 'Главная', 'index', 'dw dw-home', 'no-arrow', 0),
(2, 'Меню', '#', 'dw dw-home', NULL, 0),
(3, 'Бизнес ланчи', '#', NULL, 'no-arrow', 2),
(4, 'Всё меню', 'products', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id_products` int(11) NOT NULL,
  `title_products` varchar(100) DEFAULT NULL,
  `text_products` text DEFAULT NULL,
  `cost_products` int(11) DEFAULT NULL,
  `path_im` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id_products`, `title_products`, `text_products`, `cost_products`, `path_im`) VALUES
(1, 'Блюдо 1', 'Описание', 100, 'placeholder.jpg'),
(2, 'Блюдо 2', 'Описание', 200, 'placeholder.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `shopping_card`
--

CREATE TABLE `shopping_card` (
  `id_shopping_card` int(11) NOT NULL,
  `id_user_card` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shopping_card`
--

INSERT INTO `shopping_card` (`id_shopping_card`, `id_user_card`, `id_product`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 2),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id_shopping_card` int(11) NOT NULL,
  `id_user_card` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `type_users`
--

CREATE TABLE `type_users` (
  `id_type` int(11) NOT NULL,
  `title_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `type_users`
--

INSERT INTO `type_users` (`id_type`, `title_type`) VALUES
(1, 'admin'),
(2, 'manager'),
(3, 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `login_user` varchar(50) DEFAULT NULL,
  `password_user` varchar(256) DEFAULT NULL,
  `email_user` varchar(50) DEFAULT NULL,
  `first_name_user` varchar(50) DEFAULT NULL,
  `last_name_user` varchar(50) DEFAULT NULL,
  `age_user` int(11) DEFAULT NULL,
  `gender_user` varchar(50) DEFAULT NULL,
  `path_im_user` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `city_user` varchar(50) DEFAULT NULL,
  `type_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `login_user`, `password_user`, `email_user`, `first_name_user`, `last_name_user`, `age_user`, `gender_user`, `path_im_user`, `phone_number`, `city_user`, `type_user`) VALUES
(1, 'a', 'pbkdf2:sha256:600000$4SKMT87vsdxzjQJr$3d8dc8671aa280ff341fb0f6e263d0bc87597f9b762115b398ae1ce364ba3401', 'a@a.a', 'a', 'a', 2023, 'male', 'up.png', '8', 'a', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id_post`),
  ADD UNIQUE KEY `title_post` (`title_post`),
  ADD KEY `author_post` (`author_post`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`),
  ADD UNIQUE KEY `title_category` (`title_category`);

--
-- Индексы таблицы `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id_gallery`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_elem_menu`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_products`),
  ADD UNIQUE KEY `title_products` (`title_products`);

--
-- Индексы таблицы `shopping_card`
--
ALTER TABLE `shopping_card`
  ADD PRIMARY KEY (`id_shopping_card`),
  ADD KEY `id_user_card` (`id_user_card`),
  ADD KEY `id_product` (`id_product`);

--
-- Индексы таблицы `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id_shopping_card`);

--
-- Индексы таблицы `type_users`
--
ALTER TABLE `type_users`
  ADD PRIMARY KEY (`id_type`),
  ADD UNIQUE KEY `title_type` (`title_type`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `ix_users_email_user` (`email_user`),
  ADD KEY `type_user` (`type_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `blog`
--
ALTER TABLE `blog`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id_gallery` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id_elem_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id_products` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `shopping_card`
--
ALTER TABLE `shopping_card`
  MODIFY `id_shopping_card` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `id_shopping_card` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `type_users`
--
ALTER TABLE `type_users`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`author_post`) REFERENCES `users` (`id_user`);

--
-- Ограничения внешнего ключа таблицы `shopping_card`
--
ALTER TABLE `shopping_card`
  ADD CONSTRAINT `shopping_card_ibfk_1` FOREIGN KEY (`id_user_card`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `shopping_card_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_products`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type_user`) REFERENCES `type_users` (`id_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
