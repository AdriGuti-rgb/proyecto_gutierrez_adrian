-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-02-2024 a las 13:57:33
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS proyecto_integrador;
CREATE DATABASE proyecto_integrador;
USE proyecto_integrador;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_integrador`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` varchar(20) NOT NULL,
  `type` varchar(40) DEFAULT NULL,
  `ages` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `type`, `ages`) VALUES
('02f8wll37kw4', 'Cadete Masculino', '15-17'),
('04g4fhb62fn9', 'Cadete Femenino', '15-17'),
('20g9ofq49jj1', 'Junior Masculino', '18-20'),
('20s0tqp46hc5', 'Junior Femenino', '18-20'),
('24q4jjp22ue1', 'Senior Masculino', '21'),
('41e1khc20eh1', 'Senior Femenino', '21'),
('62r1uem02dl2', 'Promesa Masculino', '21-39'),
('63b1rvo95yo8', 'Promesa Femenino', '21-39'),
('75g8gux37hj6', 'Veterana A Masculino', '40-51'),
('76d0jcz21ba6', 'Veterana A Femenino', '40-51'),
('84c4uht30ds9', 'Veterana B Masculino', '>51'),
('88f6jqs30yu7', 'Veterana B Femenino', '>51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favourites`
--

CREATE TABLE `favourites` (
  `id_user` varchar(20) NOT NULL,
  `id_race` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `favourites`
--

-- INSERT INTO `favourites` (`id_user`, `id_race`) VALUES
-- ('68a7573d413676f09bf1', '3a50f54de468fbf6cff5'),
-- ('68a7573d413676f09bf1', '3bef3523e01ccc811f76');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalities`
--

CREATE TABLE `modalities` (
  `id` varchar(20) NOT NULL,
  `type` varchar(40) DEFAULT NULL,
  `first_prize` float DEFAULT NULL,
  `second_prize` float DEFAULT NULL,
  `third_prize` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modalities`
--

INSERT INTO `modalities` (`id`, `type`, `first_prize`, `second_prize`, `third_prize`) VALUES
('00p9ajk35ew0', 'Maraton', 291.77, 152, 142.55),
('01j5gic48lj6', 'Cross Country', 298, 163.62, 132.19),
('43o0aja32wa6', 'Trail Running', 291.98, 243.82, 96.03),
('99r4osm75ys5', 'Ultra Maraton', 262.42, 166.19, 135.83);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `older_clasifications`
--

CREATE TABLE `older_clasifications` (
  `id` varchar(20) NOT NULL,
  `winner` varchar(40) DEFAULT NULL,
  `second_place` varchar(40) DEFAULT NULL,
  `third_place` varchar(40) DEFAULT NULL,
  `year_race` year(4) DEFAULT NULL,
  `time_race` time NOT NULL,
  `id_race` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `older_clasifications`
--

-- INSERT INTO `older_clasifications` (`id`, `winner`, `second_place`, `third_place`, `year_race`, `time_race`, `id_race`) VALUES
-- ('0', NULL, NULL, NULL, NULL, '00:00:00', NULL),
-- ('315af475892841e002d0', 'a', 'D', 'H', '2023', '10:10:10', 'bad96e6b499f87ae0b8a'),
-- ('d48bde2963a3c73516f7', 'Adrian', 'Juan', 'David', '2023', '10:09:12', '3a50f54de468fbf6cff5'),
-- ('e5390b0fce486c0021f0', 'Tu', 'El', 'Aquel', '2021', '02:10:32', '3a50f54de468fbf6cff5'),
-- ('fe0015e699d8140e9a40', 'Paco', 'Paca', 'Paquito', '2023', '11:09:12', '3a50f54de468fbf6cff5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `older_photos`
--

CREATE TABLE `older_photos` (
  `id` varchar(20) NOT NULL,
  `url` varchar(500) DEFAULT NULL,
  `id_race` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `older_photos`
--

-- INSERT INTO `older_photos` (`id`, `url`, `id_race`) VALUES
-- -- ('14e1bd2eaa9c9f16c1b9', 'coor1.png', 'bad96e6b499f87ae0b8a'),
-- -- ('2232bc1c37238d944ab3', 'prueba 13.png', '3a50f54de468fbf6cff5'),
-- -- ('2d0ef19ae4c42614be01', 'prueba 21.png', '3bef3523e01ccc811f76'),
-- -- ('378a296ab04f5030d1bf', 'prueba 11.png', '3a50f54de468fbf6cff5'),
-- -- ('775242637ac4dd75fc72', 'prueba 12.png', '3a50f54de468fbf6cff5'),
-- -- ('86d7c61d6777274368b6', 'prueba 20.png', '3bef3523e01ccc811f76'),
-- -- ('b22e5fa73cb3aa78bf16', 'coor2.png', 'bad96e6b499f87ae0b8a'),
-- -- ('d6d1a3cf2fdafeeb08ff', 'coor0.png', 'bad96e6b499f87ae0b8a'),
-- -- ('f77209cf7b86c2eeee9d', 'prueba 10.png', '3a50f54de468fbf6cff5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizers`
--

CREATE TABLE `organizers` (
  `id_user` varchar(20) NOT NULL,
  `phone` int(9) DEFAULT NULL,
  `club` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `organizers`
--

INSERT INTO `organizers` (`id_user`, `phone`, `club`) VALUES
('68a7573d413676f09bf1', 184293002, 'IES San Andres');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `races`
--

CREATE TABLE `races` (
  `id` varchar(20) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `race_day` date DEFAULT NULL,
  `positive_slope` float DEFAULT NULL,
  `negative_slope` float DEFAULT NULL,
  `total_slope` float DEFAULT NULL,
  `distance` float DEFAULT NULL,
  `poblation` varchar(50) DEFAULT NULL,
  `main_photo` varchar(100) DEFAULT NULL,
  `regulation` varchar(100) NOT NULL,
  `webRef` varchar(50) NOT NULL,
  `coor` longtext NOT NULL,
  `id_category` varchar(20) DEFAULT NULL,
  `id_modality` varchar(20) DEFAULT NULL,
  `id_organizer` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `races`
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `races_services`
--

CREATE TABLE `races_services` (
  `id_race` varchar(20) NOT NULL,
  `id_service` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `races_services`
--

-- INSERT INTO `races_services` (`id_race`, `id_service`) VALUES
-- ('3a50f54de468fbf6cff5', '12b6hah53jc9'),
-- ('3a50f54de468fbf6cff5', '55h1ngq99rc1'),
-- ('3a50f54de468fbf6cff5', '89p0gjq46ll5'),
-- ('3bef3523e01ccc811f76', '55h1ngq99rc1'),
-- ('3bef3523e01ccc811f76', '64s5stg45yh4'),
-- ('bad96e6b499f87ae0b8a', '12b6hah53jc9'),
-- ('bad96e6b499f87ae0b8a', '89p0gjq46ll5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `id` varchar(20) NOT NULL,
  `type` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`id`, `type`) VALUES
('12b6hah53jc9', 'Tiempos intermedios'),
('14n1hrj58qz8', 'Zonas ecologicas'),
('55h1ngq99rc1', 'Avituallamiento liquido'),
('61c0bcg91ac2', 'Parking'),
('64s5stg45yh4', 'Avituallamiento solido'),
('89p0gjq46ll5', 'Puestos de socorro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `mail`, `pass`, `city`, `photo`) VALUES
('68a7573d413676f09bf1', 'Adrian Gutierrez Usoz', 'adriGuti', 'adri.@mail.com', '$2y$10$ujKWbFwtyMGMBXg7Vegeqe.hbWtpq0QXTes1elAlKS4hzM8iOZ4G.', 'Gipuzkoa', 'adriGuti.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id_user`,`id_race`),
  ADD KEY `id_race` (`id_race`);

--
-- Indices de la tabla `modalities`
--
ALTER TABLE `modalities`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `older_clasifications`
--
ALTER TABLE `older_clasifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_race` (`id_race`);

--
-- Indices de la tabla `older_photos`
--
ALTER TABLE `older_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_race` (`id_race`);

--
-- Indices de la tabla `organizers`
--
ALTER TABLE `organizers`
  ADD PRIMARY KEY (`id_user`);

--
-- Indices de la tabla `races`
--
ALTER TABLE `races`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_modality` (`id_modality`),
  ADD KEY `id_organizer` (`id_organizer`);

--
-- Indices de la tabla `races_services`
--
ALTER TABLE `races_services`
  ADD PRIMARY KEY (`id_race`,`id_service`),
  ADD KEY `id_service` (`id_service`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD UNIQUE KEY `pass` (`pass`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`id_race`) REFERENCES `races` (`id`);

--
-- Filtros para la tabla `older_clasifications`
--
ALTER TABLE `older_clasifications`
  ADD CONSTRAINT `older_clasifications_ibfk_1` FOREIGN KEY (`id_race`) REFERENCES `races` (`id`);

--
-- Filtros para la tabla `older_photos`
--
ALTER TABLE `older_photos`
  ADD CONSTRAINT `older_photos_ibfk_1` FOREIGN KEY (`id_race`) REFERENCES `races` (`id`);

--
-- Filtros para la tabla `organizers`
--
ALTER TABLE `organizers`
  ADD CONSTRAINT `organizers_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `races`
--
ALTER TABLE `races`
  ADD CONSTRAINT `races_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `races_ibfk_2` FOREIGN KEY (`id_modality`) REFERENCES `modalities` (`id`),
  ADD CONSTRAINT `races_ibfk_2` FOREIGN KEY (`id_organizer`) REFERENCES `organizers` (`id`);

--
-- Filtros para la tabla `races_services`
--
ALTER TABLE `races_services`
  ADD CONSTRAINT `races_services_ibfk_1` FOREIGN KEY (`id_race`) REFERENCES `races` (`id`),
  ADD CONSTRAINT `races_services_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
