-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-01-2024 a las 16:44:36
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_integrador`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `pass` varchar(16) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `phone` float DEFAULT NULL,
  `club` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `rol` enum('Anonimous','User','Organizer') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `mail`, `pass`, `city`, `phone`, `club`, `photo`, `rol`) VALUES
('1', 'Lee Cartlidge', 'lcartlidge0', 'lcartlidge0@yellowpages.com', 'kJ2_1+#XPZ', 'Xiji', 276, 'Maggio-Wyman', '82.133.212.57', 'Anonimous'),
('10', 'Dotti Ceaser', 'dceaser9', 'dceaser9@ucsd.edu', 'gP8.6>$o*rv', 'Kalýves Polygýrou', 438, 'Marks, Doyle and Kertzmann', '31.62.174.210', 'Organizer'),
('11', 'Anne Dunton', 'aduntona', 'aduntona@printfriendly.com', 'fB5/k7xZ', 'Martingança', 487, 'Blick-Lubowitz', '254.206.83.226', 'Organizer'),
('12', 'Tirrell Lates', 'tlatesb', 'tlatesb@shareasale.com', 'qV4<`)QB', 'Wetzlar', 652, 'Abbott, Yost and Kiehn', '225.69.101.170', 'User'),
('13', 'Spence Terzza', 'sterzzac', 'sterzzac@gravatar.com', 'mS0#L~kcy~I', 'Sembungan Kidul', 220, 'Collier Group', '7.137.237.128', 'Organizer'),
('14', 'Felicia Evequot', 'fevequotd', 'fevequotd@scientificamerican.com', 'bK2Taet', 'Sibanicú', 709, 'Abbott and Sons', '204.156.134.238', 'Organizer'),
('15', 'Wes Labarre', 'wlabarree', 'wlabarree@google.nl', 'vS9+Je,,?R', 'Taibai', 197, 'Ruecker, Effertz and Kub', '210.87.42.120', 'Anonimous'),
('16', 'Marlo Prati', 'mpratif', 'mpratif@cam.ac.uk', 'zG1>7`r<q19/RT', 'Rokiškis', 292, 'Wunsch-Connelly', '79.109.179.191', 'Anonimous'),
('17', 'Kaylee Greenham', 'kgreenhamg', 'kgreenhamg@etsy.com', 'gS3\"(T@kr!', 'Rungis', 427, 'Grimes Inc', '151.156.133.246', 'Organizer'),
('18', 'Frants Themann', 'fthemannh', 'fthemannh@wsj.com', 'oE9.X+wZ', 'San Francisco', 946, 'Dicki, Lesch and Macejkovic', '192.71.177.44', 'Organizer'),
('19', 'Silvia Tolussi', 'stolussii', 'stolussii@vk.com', 'lY8|W\"0_gLO)W', 'Dragash', 624, 'Streich-Grimes', '228.227.209.198', 'Organizer'),
('2', 'Emma Phlippsen', 'ephlippsen1', 'ephlippsen1@naver.com', 'nT1~W*!\"+YZk4A', 'Shicheng', 243, 'Brown and Sons', '196.125.142.81', 'Organizer'),
('20', 'Ugo Mundford', 'umundfordj', 'umundfordj@bing.com', 'xX7*qq|r', 'Mao', 651, 'Homenick and Sons', '232.164.235.6', 'User'),
('3', 'Dot Prodrick', 'dprodrick2', 'dprodrick2@kickstarter.com', 'gG1.<li7W~qdlYE!', 'Wierzchosławice', 265, 'Botsford-Kuhic', '161.131.204.97', 'Anonimous'),
('4', 'Heida Grinikhin', 'hgrinikhin3', 'hgrinikhin3@epa.gov', 'lV5\"JuwQ~d', 'Tuanjie', 523, 'Marks, Doyle and Bergstrom', '176.81.75.73', 'Organizer'),
('5', 'Twyla Rawkesby', 'trawkesby4', 'trawkesby4@economist.com', 'yP1#3wPuR', 'Sudogda', 315, 'Wintheiser Group', '255.192.160.147', 'User'),
('6', 'Anneliese Tasseler', 'atasseler5', 'atasseler5@ucsd.edu', 'tM4)svD8c5\"{@Gh', 'Shawnee Mission', 913, 'Simonis, Breitenberg and Hyatt', '11.190.172.131', 'Anonimous'),
('7', 'Daphne Nanninini', 'dnanninini6', 'dnanninini6@chicagotribune.com', 'pI0!ygO{#P@Dd=F3', 'Torreira', 888, 'McDermott-Crona', '116.227.158.220', 'Anonimous'),
('8', 'Ezekiel Lodo', 'elodo7', 'elodo7@usda.gov', 'wI6)\dV7Z|OF6', 'Xuxiake', 962, 'Dietrich-Hegmann', '8.61.187.205', 'User'),
('9', 'Mariana Shovlar', 'mshovlar8', 'mshovlar8@google.fr', 'wM1!l#/r0p(4Ah', 'Sinarbakti', 583, 'Herzog-Rempel', '146.69.15.93', 'Anonimous');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
