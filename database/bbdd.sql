-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 31-01-2024 a las 00:48:57
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

INSERT INTO `favourites` (`id_user`, `id_race`) VALUES
('03u7cup02ed1', '40aaf666fcdaadc7a22d');

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
  `year` date DEFAULT NULL,
  `time` time NOT NULL,
  `id_race` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `older_clasifications`
--

INSERT INTO `older_clasifications` (`id`, `winner`, `second_place`, `third_place`, `year`, `time`, `id_race`) VALUES
('BGQ60PLB3PS', 'Tanek Hewitt', 'James Hooper', 'Zane Meyers', '2015-03-16', '02:43:02', '443079dd068be778a81a'),
('BNC31CLS8CI', 'Beau Goodman', 'Ezra Lee', 'Wang Lyons', '2002-06-22', '12:32:48', '9457a318f958c1f22273'),
('BPK37EWO4IJ', 'Raja Moon', 'Malcolm Estes', 'Wayne Grant', '2006-05-17', '09:24:16', 'f434b71559b943d7f663'),
('BVS23VSJ4RO', 'Murphy Warner', 'Cody Kaufman', 'Jescie Russell', '2024-11-28', '18:29:58', 'f434b71559b943d7f663'),
('BXG00TBM0MH', 'Ezekiel Willis', 'Scarlet Melton', 'Garth Berry', '2012-05-17', '04:18:23', '3fcecc005ed9878ed0d6'),
('BYO13JPK0XN', 'Wallace Mayer', 'Macaulay Golden', 'Kirestin Salazar', '2000-04-26', '08:45:50', '40aaf666fcdaadc7a22d'),
('CEE36IJY4ES', 'Angela Mcconnell', 'Cole Lara', 'Maxwell Pierce', '2018-03-30', '10:03:58', '3fcecc005ed9878ed0d6'),
('CUO32SVE2WU', 'Aristotle Brock', 'Donna Salas', 'Martena Dunlap', '2002-03-21', '17:00:05', '40aaf666fcdaadc7a22d'),
('CWN98ASK6GV', 'Cedric Langley', 'Kirsten Solis', 'Elliott Waller', '2023-12-26', '08:51:44', '6c4b8dd5d19967ce3e4d'),
('DHE84QJO2SR', 'Kyra Hays', 'Haley Mckee', 'September Macias', '2016-06-02', '22:23:25', '3fcecc005ed9878ed0d6'),
('DIC15OOE4OM', 'Kiara Pittman', 'Mikayla Bernard', 'Christian Pugh', '2017-04-07', '23:00:00', 'f434b71559b943d7f663'),
('DOU81OBX4EL', 'Maxwell England', 'Barrett Odom', 'Maryam Harrell', '2011-12-30', '11:15:01', '3fcecc005ed9878ed0d6'),
('DVN73FBU4OI', 'Constance Avila', 'Jillian Monroe', 'Baxter Russell', '2015-12-04', '13:38:07', '443079dd068be778a81a'),
('DWM90EES5SV', 'Charles Fitzgerald', 'Ariel Mullen', 'Jerome Head', '2023-06-20', '09:39:29', '443079dd068be778a81a'),
('DZL91UFZ6OO', 'Sopoline Moses', 'Zelenia Harrison', 'Boris Rollins', '2001-10-05', '16:38:21', '6c4b8dd5d19967ce3e4d'),
('FFD76KTX6XP', 'Keith Blankenship', 'Maxwell Vinson', 'Ursula Bray', '2024-08-28', '01:04:52', '3fcecc005ed9878ed0d6'),
('FFW59PDN2RR', 'Naida Davis', 'Justina Rush', 'Brandon Lopez', '2007-08-12', '02:41:01', '40aaf666fcdaadc7a22d'),
('FIX98WTP3QH', 'Claire Thomas', 'Allen Osborn', 'Rachel Stein', '2004-09-02', '13:10:30', 'da8fd427af0bbf59ebf1'),
('FLC67KQS6KJ', 'Holmes Sloan', 'Lillith Le', 'Charity Henry', '2021-11-23', '21:51:43', 'f434b71559b943d7f663'),
('FQV55UMU8QM', 'Wesley Tillman', 'Lacota Parsons', 'Tyrone Adams', '2023-07-16', '22:44:13', '40aaf666fcdaadc7a22d'),
('FTC21MOK4PY', 'Yoko Rogers', 'Kasper Wynn', 'Ivana Fernandez', '2019-05-08', '12:38:29', '443079dd068be778a81a'),
('GBP78GOB1HC', 'Ella Roy', 'Yen Miller', 'Jane Middleton', '2011-05-21', '15:06:23', '6c4b8dd5d19967ce3e4d'),
('GQY74JXS6SL', 'Lee Jacobs', 'Allen Reed', 'Maisie Noel', '2005-10-07', '05:38:57', '5bb6af13e4c5a18ed849'),
('GXW06DPX4VX', 'Harding Whitehead', 'Hu Ochoa', 'Eleanor Lloyd', '2014-07-26', '12:34:03', 'f434b71559b943d7f663'),
('GYW64QRQ3AI', 'Gary Wong', 'Colette Robles', 'Coby Shields', '2002-04-05', '09:52:19', '6c4b8dd5d19967ce3e4d'),
('GYY63IUM8ZJ', 'Hashim Barron', 'Naida Andrews', 'Jordan Farmer', '2016-05-08', '01:50:46', 'da8fd427af0bbf59ebf1'),
('HAW65JFR5QM', 'Patrick Cochran', 'Zeph Monroe', 'Calista Harding', '2019-02-11', '02:15:39', '9457a318f958c1f22273'),
('HBY45KBP4KL', 'Nyssa Gregory', 'Yoko Miles', 'Lance Burton', '2021-12-25', '23:30:56', '5bb6af13e4c5a18ed849'),
('HHR39WYX6FB', 'Tate Lopez', 'Jamalia Herrera', 'Rooney Clemons', '2011-05-12', '01:42:31', '443079dd068be778a81a'),
('HJX22TCH4PV', 'Anika Ewing', 'Emma Fischer', 'Shea Cook', '2020-05-14', '14:16:32', '443079dd068be778a81a'),
('HLL16VUF6ZV', 'Velma Gould', 'Brian Allen', 'Darrel Soto', '2021-07-13', '21:49:34', '3fcecc005ed9878ed0d6'),
('IGP54RSO5JI', 'Lance Kennedy', 'Timothy Spence', 'Camden Turner', '2003-10-04', '23:24:36', '40aaf666fcdaadc7a22d'),
('ILI34DJY9SJ', 'Fay Oliver', 'Frances Clayton', 'Michael Garrett', '2009-03-17', '23:44:49', '5bb6af13e4c5a18ed849'),
('ILT54ULM9GN', 'Noah Atkinson', 'Jacqueline Franks', 'Deirdre Ramsey', '2017-02-04', '22:52:28', 'f434b71559b943d7f663'),
('IXB08TRY5MP', 'Josiah Roach', 'Jennifer Quinn', 'Holly Harris', '2016-11-02', '19:05:38', '443079dd068be778a81a'),
('JAF73UNJ2QO', 'Brody Travis', 'Ivy Beach', 'Walker Mercado', '2019-12-17', '17:37:45', '40aaf666fcdaadc7a22d'),
('JOJ80MYK9IR', 'Ivana Blanchard', 'Beau Wilkerson', 'Salvador Potter', '2009-11-22', '10:02:39', '6c4b8dd5d19967ce3e4d'),
('JXW07JRB2MX', 'Marvin Rasmussen', 'Tarik Nguyen', 'Barry Shaffer', '2009-12-20', '22:55:49', '5bb6af13e4c5a18ed849'),
('JYJ19KQC1ND', 'Indira Finch', 'Winter Stout', 'Kevyn Solomon', '2014-06-04', '05:13:53', 'da8fd427af0bbf59ebf1'),
('KBM41RMC7QB', 'Quintessa Carpenter', 'Malcolm Mathews', 'Kuame Koch', '2003-03-23', '04:09:22', '6c4b8dd5d19967ce3e4d'),
('KEN77TPA9WX', 'Neil Mendoza', 'Fredericka Hurst', 'Sandra Clark', '2023-01-11', '11:19:21', '3fcecc005ed9878ed0d6'),
('KIH56FFZ7UX', 'Addison Cline', 'Melvin Drake', 'Rinah Jimenez', '2017-07-27', '22:23:19', 'da8fd427af0bbf59ebf1'),
('KZY35MWT5IJ', 'Raven Cooley', 'Shaine Hawkins', 'Anne Carver', '2020-09-27', '22:27:14', '5bb6af13e4c5a18ed849'),
('LAL37GDV7YW', 'Wylie Grimes', 'Moses Hanson', 'Nerea Delaney', '2003-10-16', '20:29:35', 'da8fd427af0bbf59ebf1'),
('LMO18IME2XF', 'Brady Morales', 'Kelly Gould', 'Kellie Giles', '2011-01-10', '00:22:21', '6c4b8dd5d19967ce3e4d'),
('LQE68HRD7KR', 'Ginger Manning', 'Maggy Marsh', 'Zane Holden', '2008-04-14', '16:38:50', '443079dd068be778a81a'),
('LYB18SGJ1DP', 'Linda Robertson', 'Bell Hawkins', 'Nero Winters', '2005-06-25', '00:42:32', 'f434b71559b943d7f663'),
('LYN28LEZ9CV', 'Joshua Burnett', 'Lee Barker', 'Freya York', '2016-04-20', '15:37:57', 'da8fd427af0bbf59ebf1'),
('MFF21RAH2SI', 'Geraldine Carey', 'Bruno Cabrera', 'Kylie Parrish', '2013-10-14', '18:44:16', 'da8fd427af0bbf59ebf1'),
('MGX47ERW5MS', 'Kermit Carter', 'Rhona Rowe', 'Brennan Sweeney', '2012-05-20', '10:48:50', '443079dd068be778a81a'),
('MOH85NNW3WI', 'Addison Gallagher', 'Florence Chen', 'Owen Barlow', '2009-04-22', '21:44:08', '443079dd068be778a81a'),
('MQU70WLQ3EH', 'Phillip Mack', 'Samuel Avila', 'Reese Cross', '2005-02-03', '11:35:32', '443079dd068be778a81a'),
('MRJ49OVB6QL', 'Celeste Wiley', 'Ferdinand Hester', 'Rina Holman', '2010-01-23', '04:17:23', '5bb6af13e4c5a18ed849'),
('MYY38DFK3RC', 'Wyoming Kaufman', 'Clarke Rodriguez', 'Sean Morris', '2016-07-01', '04:12:20', '40aaf666fcdaadc7a22d'),
('NAR87VQJ2SX', 'Jin Barnett', 'Gary Hamilton', 'Joseph Manning', '2014-12-31', '22:12:30', '3fcecc005ed9878ed0d6'),
('NBV35VYS7CN', 'Alika Hart', 'Alyssa Black', 'Alice Patterson', '2024-10-16', '12:49:31', '3fcecc005ed9878ed0d6'),
('NGE02WCM6WD', 'Chantale Weaver', 'Bianca Garrison', 'John Sosa', '2014-01-10', '08:13:09', 'f434b71559b943d7f663'),
('NHH26TPB7HT', 'Shannon Estrada', 'Driscoll Serrano', 'Marvin Price', '2024-04-23', '04:05:53', '9457a318f958c1f22273'),
('NVK84MJC1VH', 'Nissim Hester', 'Hector Browning', 'Melinda Hartman', '2006-02-06', '12:45:46', '5bb6af13e4c5a18ed849'),
('OBN44SBU4OV', 'Pandora Sharpe', 'Deacon Becker', 'Jade Welch', '2008-11-09', '00:30:18', '5bb6af13e4c5a18ed849'),
('OSV54RBM9WH', 'Warren Beasley', 'Dane Huff', 'Xyla Sellers', '2017-01-04', '16:54:33', 'f434b71559b943d7f663'),
('PAL05HOY7EI', 'Willow Dean', 'Kennan Dickson', 'Eve Baldwin', '2012-04-27', '02:19:46', '40aaf666fcdaadc7a22d'),
('PUC12ZZB1FY', 'David Garrison', 'Dalton Rich', 'Vincent James', '2008-01-27', '01:13:45', '40aaf666fcdaadc7a22d'),
('PVF24SGL6GV', 'Mechelle Oliver', 'Nyssa Harris', 'Kylee Stewart', '2006-12-29', '11:01:09', 'f434b71559b943d7f663'),
('PVH41QTM4DH', 'Jade Mercer', 'Haviva Gibbs', 'Lani Meyer', '2015-10-23', '17:07:40', '5bb6af13e4c5a18ed849'),
('PWA81ZSC6GG', 'Donovan Odonnell', 'Lenore Wallace', 'Ezekiel Dejesus', '2019-11-23', '05:46:57', '443079dd068be778a81a'),
('PYK62NPP3SB', 'Alice Vasquez', 'Elvis Whitney', 'Rhonda Hoover', '2001-12-19', '17:37:05', '443079dd068be778a81a'),
('QIK33VKD7WI', 'Keegan Franks', 'Nita Michael', 'Adam Cline', '2003-02-06', '19:50:07', '40aaf666fcdaadc7a22d'),
('QKK66NNJ5MO', 'Colorado Frederick', 'Vivien Yates', 'Skyler Paul', '2004-04-29', '03:43:42', '443079dd068be778a81a'),
('QXB35ENG3JT', 'Demetrius Elliott', 'Janna Glass', 'Ella Rasmussen', '2018-12-10', '17:29:56', 'da8fd427af0bbf59ebf1'),
('QXT15JRR1ND', 'Caleb Mccarty', 'Ulla Howard', 'Gary Lawrence', '2013-08-28', '09:02:56', 'da8fd427af0bbf59ebf1'),
('RDL82WUU4TF', 'Scott Gray', 'Burton Castro', 'Nelle Booth', '2014-04-05', '16:38:14', '40aaf666fcdaadc7a22d'),
('RHG31ANI1WK', 'Porter Hurst', 'Colton Sosa', 'Noelle Miles', '2023-02-18', '21:19:06', '5bb6af13e4c5a18ed849'),
('RSR36OQF2PW', 'Kennedy Blackwell', 'Shea Wong', 'Carissa Hewitt', '2020-12-13', '00:04:06', '3fcecc005ed9878ed0d6'),
('RZP99IGJ4LX', 'Abigail Conner', 'Uta Brooks', 'Minerva Bright', '2004-11-11', '11:33:18', '9457a318f958c1f22273'),
('SIK86VLR9XI', 'Brody Hayes', 'Anne Holden', 'Zorita Thompson', '2015-06-25', '17:23:25', '40aaf666fcdaadc7a22d'),
('STN81FNE2QE', 'Hannah Clarke', 'Aileen Juarez', 'Zenia Miller', '2014-10-22', '17:18:55', '3fcecc005ed9878ed0d6'),
('SZX23LAW5QK', 'Maite Mcmahon', 'Thaddeus Montoya', 'Joel Wagner', '2022-04-29', '04:59:26', '40aaf666fcdaadc7a22d'),
('TKS21FUS0CH', 'Alika Porter', 'Drake Shepherd', 'Quynn Turner', '2007-02-03', '17:38:54', '9457a318f958c1f22273'),
('TUL55BPQ0KK', 'Nathaniel Rivas', 'Devin Garner', 'Edan Ayers', '2009-02-07', '05:55:57', '40aaf666fcdaadc7a22d'),
('TWR25PBD8BU', 'Preston Moore', 'Kai Avila', 'Hanae Foster', '2018-08-23', '21:44:49', '9457a318f958c1f22273'),
('UBD54CVZ7OL', 'Emerson Romero', 'Quynn Byrd', 'Cheyenne Poole', '2006-04-08', '10:38:42', 'da8fd427af0bbf59ebf1'),
('UCZ76KQX2PL', 'Sybill Knight', 'Victoria Hensley', 'Meredith Irwin', '2021-11-07', '20:38:31', '3fcecc005ed9878ed0d6'),
('VFN32QFC1KQ', 'Reuben Roach', 'Deirdre Duncan', 'Elvis Franklin', '2002-11-30', '20:45:55', '40aaf666fcdaadc7a22d'),
('VIY41HJG3RB', 'Calista Combs', 'Gillian Ratliff', 'Hamilton Herrera', '2000-07-27', '07:35:26', 'f434b71559b943d7f663'),
('VQS38GBR8BI', 'Chase Henry', 'Gil Sloan', 'Brittany Bass', '2024-08-02', '05:39:28', '5bb6af13e4c5a18ed849'),
('VQS60BAE5TR', 'Giacomo Black', 'Vernon Osborn', 'Kasper Bell', '2010-06-10', '16:33:23', '5bb6af13e4c5a18ed849'),
('VYM85LCQ5XV', 'Cynthia Harper', 'Venus Mullen', 'Latifah Espinoza', '2009-01-16', '19:52:00', '5bb6af13e4c5a18ed849'),
('WAI72HCO4UC', 'Barclay Wood', 'Emma Mcfarland', 'Ella Holder', '2007-08-07', '14:15:46', '3fcecc005ed9878ed0d6'),
('WDN64MDI6VL', 'Elizabeth Knapp', 'Ursula Keith', 'Zenia Mcknight', '2012-10-10', '11:03:01', '40aaf666fcdaadc7a22d'),
('WPR80LHM4VQ', 'Cleo Landry', 'Ria Sims', 'Lewis Rocha', '2022-06-14', '02:08:20', '5bb6af13e4c5a18ed849'),
('WST92FWD2YS', 'Veda Cain', 'Kaye French', 'Maryam Franklin', '2023-04-15', '04:40:20', '443079dd068be778a81a'),
('XBM63GJO6RW', 'Edan Richardson', 'Mallory Mcdonald', 'John Chang', '2011-02-06', '15:15:28', '9457a318f958c1f22273'),
('XSN15GXM1FS', 'Ivor Mcconnell', 'Sarah Velazquez', 'Larissa Rocha', '2011-12-22', '00:26:48', '5bb6af13e4c5a18ed849'),
('YHE61HRK5PY', 'Vernon Tate', 'Martha Curtis', 'Erica Mcguire', '2003-04-07', '08:02:17', '6c4b8dd5d19967ce3e4d'),
('YJV58CHD5VY', 'Jesse Chandler', 'Daria Rivas', 'Roth Hardin', '2003-08-15', '01:38:41', 'f434b71559b943d7f663'),
('YQG37VXN6PG', 'Ursula Bernard', 'Ulric Hammond', 'Jeremy Wiggins', '2022-08-13', '19:51:37', '6c4b8dd5d19967ce3e4d'),
('YRL18NKO2RV', 'Jane Perkins', 'TaShya Klein', 'Dylan Bradford', '2018-09-18', '18:07:58', '3fcecc005ed9878ed0d6'),
('ZGY21VOU3VE', 'Irene Hendricks', 'Macon Baldwin', 'Brennan Kent', '2000-05-17', '23:36:05', '3fcecc005ed9878ed0d6'),
('ZLE23TLC5RH', 'Dawn Gordon', 'Jana Hernandez', 'Helen West', '2020-06-11', '01:49:00', '3fcecc005ed9878ed0d6');

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

INSERT INTO `older_photos` (`id`, `url`, `id_race`) VALUES
('1c6e298488adc38f9e04', '2a2e7f0f60b750dfb36c15c268d0118d.jpg', '40aaf666fcdaadc7a22d'),
('26a2034bdd75d19801c6', 'Captura de pantalla 2024-01-14 203935.png', '9457a318f958c1f22273'),
('4b869d46337794dfbc4c', 'Captura de pantalla 2023-11-22 164654.png', '443079dd068be778a81a'),
('4d1c81c1d6e06906cfb7', 'Captura de pantalla 2023-11-15 145241.png', '443079dd068be778a81a'),
('5243675f92f803554ea9', 'Sin título.png', '40aaf666fcdaadc7a22d'),
('57c6b6318450112fd4ae', 'Captura de pantalla 2023-11-15 144224.png', '443079dd068be778a81a'),
('6c54db3f4374307910f9', 'Captura de pantalla 2023-11-15 195328.png', '443079dd068be778a81a'),
('6dac67fe4c59ec67d181', 'Sin título.png', '3fcecc005ed9878ed0d6'),
('8e29bbb06fe7a4ab11d9', 'Captura de pantalla 2024-01-13 131104.png', '9457a318f958c1f22273'),
('943de3e8698aa827611a', '2a2e7f0f60b750dfb36c15c268d0118d.jpg', '3fcecc005ed9878ed0d6'),
('9e222f233f442ad1f091', 'Captura de pantalla 2023-11-08 190312.png', 'da8fd427af0bbf59ebf1'),
('a4c26ba235030b6318b7', 'Captura de pantalla 2023-10-10 002722.png', '5bb6af13e4c5a18ed849'),
('b51b26beddc6f7884582', 'Captura de pantalla 2023-11-10 135118.png', '443079dd068be778a81a'),
('d06be94e8a617abdd99d', 'Captura de pantalla 2023-11-08 234526.png', 'da8fd427af0bbf59ebf1'),
('d3b4b24c75151c890571', 'images.jpeg', '3fcecc005ed9878ed0d6'),
('e866ca6f6749b42357a5', '2a2e7f0f60b750dfb36c15c268d0118d.jpg', '6c4b8dd5d19967ce3e4d');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizers`
--

CREATE TABLE `organizers` (
  `id_user` varchar(20) NOT NULL,
  `phone` float DEFAULT NULL,
  `club` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `organizers`
--

INSERT INTO `organizers` (`id_user`, `phone`, `club`) VALUES
('03u7cup02ed1', 332042000, 'Yakitri'),
('11r4evu52mf4', 506613000, 'Quinu'),
('20a6zua96se1', 421779000, 'Skidoo'),
('33c8ozw26lm4', 319017000, 'Twitterlist'),
('41g0ayn92yv8', 280330000, 'Livetube'),
('46u2bmo31ae9', 27814400, 'Blognation'),
('52v2uph05kw9', 391938000, 'Eare'),
('64r6qgh43bv4', 459286000, 'Trudeo'),
('78m3mda58mq5', 593565000, 'Livefish'),
('98q3igw21je1', 574537000, 'Aimbo');

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
  `id_category` varchar(20) DEFAULT NULL,
  `id_modality` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `races`
--

INSERT INTO `races` (`id`, `name`, `race_day`, `positive_slope`, `negative_slope`, `total_slope`, `distance`, `poblation`, `main_photo`, `id_category`, `id_modality`) VALUES
('3fcecc005ed9878ed0d6', 'Transcandmia', '2024-02-09', 2104.3, 1485.8, 3590.1, 21, 'Madrid', 'C:fakepath2a2e7f0f60b750dfb36c15c268d0118d.jpg', '62r1uem02dl2', '43o0aja32wa6'),
('40aaf666fcdaadc7a22d', 'Sabra Dios', '2024-03-02', 475.6, 476.8, 952.4, 23, 'madrid', 'C:fakepathCaptura de pantalla 2023-11-08 234526.png', '41e1khc20eh1', '43o0aja32wa6'),
('443079dd068be778a81a', 'Prueba 3', '2024-05-17', 1661, 1630.4, 3291.4, 32, 'Donosti', 'C:fakepathCaptura de pantalla 2023-10-10 002722.png', '63b1rvo95yo8', '99r4osm75ys5'),
('5bb6af13e4c5a18ed849', 'Dindongs', '2024-02-01', 1506.3, 1506.7, 3013, 120, 'Leon', 'C:fakepathCaptura de pantalla 2023-11-15 144224.png', '02f8wll37kw4', '00p9ajk35ew0'),
('6c4b8dd5d19967ce3e4d', 'Luego miro', '2024-09-09', 1499.21, 1506.7, 3005.91, 12, 'Sigo mirando', 'C:fakepathSin título.png', '02f8wll37kw4', '01j5gic48lj6'),
('9457a318f958c1f22273', 'Ultima', '2024-03-22', 1499.21, 1506.7, 3005.91, 15, 'España', 'C:fakepathCaptura de pantalla 2023-11-11 151603.png', '41e1khc20eh1', '43o0aja32wa6'),
('da8fd427af0bbf59ebf1', 'Ningun', '2024-06-14', 1353.6, 1364.4, 2718, 30, 'Leon', 'C:fakepathCaptura de pantalla 2023-11-15 145241.png', '76d0jcz21ba6', '01j5gic48lj6'),
('f434b71559b943d7f663', 'Segunda Prueba', '2024-01-25', 1041, 1036.6, 2077.6, 23, 'Leon', 'C:fakepath2a2e7f0f60b750dfb36c15c268d0118d.jpg', '41e1khc20eh1', '43o0aja32wa6');

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

INSERT INTO `races_services` (`id_race`, `id_service`) VALUES
('3fcecc005ed9878ed0d6', '12b6hah53jc9'),
('3fcecc005ed9878ed0d6', '14n1hrj58qz8'),
('3fcecc005ed9878ed0d6', '61c0bcg91ac2'),
('3fcecc005ed9878ed0d6', '64s5stg45yh4'),
('40aaf666fcdaadc7a22d', '12b6hah53jc9'),
('40aaf666fcdaadc7a22d', '89p0gjq46ll5'),
('443079dd068be778a81a', '12b6hah53jc9'),
('443079dd068be778a81a', '14n1hrj58qz8'),
('5bb6af13e4c5a18ed849', '61c0bcg91ac2'),
('6c4b8dd5d19967ce3e4d', '55h1ngq99rc1'),
('6c4b8dd5d19967ce3e4d', '61c0bcg91ac2'),
('9457a318f958c1f22273', '55h1ngq99rc1'),
('9457a318f958c1f22273', '61c0bcg91ac2'),
('9457a318f958c1f22273', '64s5stg45yh4'),
('da8fd427af0bbf59ebf1', '61c0bcg91ac2'),
('da8fd427af0bbf59ebf1', '64s5stg45yh4'),
('f434b71559b943d7f663', '55h1ngq99rc1');

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
  `pass` varchar(16) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `mail`, `pass`, `city`, `photo`) VALUES
('00m2ydk04bw9', 'Johannah Mendenhall', 'jmendenhall18', 'jmendenhall18@nyu.edu', 'tM1)+~uT', 'Bautista', 'OdioCondimentum.doc'),
('01k3bcp67tw0', 'Barbette Crackel', 'bcrackelt', 'bcrackelt@archive.org', 'kV8)HwR', 'Kompóti', 'Sodales.mov'),
('01u1hhj50ya7', 'Tyne Scimonelli', 'tscimonellib', 'tscimonellib@epa.gov', 'fF2/<C7k.F.ZV3a', 'Okinawa Número Uno', 'AugueLuctus.xls'),
('02z0msn65mm6', 'Sax Records', 'srecords16', 'srecords16@newyorker.com', 'xW3+Mq5Y', 'Mlonggo', 'Commodo.mpeg'),
('03u7cup02ed1', 'Jaclyn Sevin', 'jsevino', 'jsevino@sphinn.com', 'sY2~UEE1g%V/', 'Cabog', 'Gravida.mp3'),
('05v5pue19ri3', 'Dorie Brookbank', 'dbrookbank19', 'dbrookbank19@merriam-webster.com', 'lV6$I$1Y.', 'Ichnya', 'AmetCursusId.xls'),
('08k0uxn29kd5', 'Ad Kingscote', 'akingscoten', 'akingscoten@surveymonkey.com', 'zE4>%oo?(w', 'Cluses', 'Euismod.txt'),
('10l9szo17cl2', 'Enrique Greave', 'egreave8', 'egreave8@ameblo.jp', 'pF7./~f?', 'Norrköping', 'Duis.mp3'),
('11r4evu52mf4', 'Alphonso Bulteel', 'abulteel1c', 'abulteel1c@sun.com', 'oE8$*y2wzSWx$=8@', 'Fort Portal', 'Enim.doc'),
('16t6mqi26fm5', 'Chuck Chippin', 'cchippins', 'cchippins@newyorker.com', 'tA0@i>9pA', 'Sulengwaseng', 'NecDui.avi'),
('19d9yaz40qn3', 'Elwira Blundell', 'eblundellv', 'eblundellv@kickstarter.com', 'cE0,*b)8+L<\"ZM|', 'Jamban', 'VariusInteger.xls'),
('20a6zua96se1', 'Paulette Eastway', 'peastwayr', 'peastwayr@bloomberg.com', 'uA9,bvFu', 'Kudusan', 'NonInterdum.mp3'),
('21f9mlp90pp7', 'Abba Dyneley', 'adyneley1k', 'adyneley1k@forbes.com', 'gI3?DgP/_w+u', 'Hupalivka', 'Suspendisse.xls'),
('25e5ugr60sh7', 'Hadley MacKeeg', 'hmackeeg11', 'hmackeeg11@examiner.com', 'dC5.S9nOp}KK9', 'Ingenio', 'Metus.ppt'),
('27c2vmc10aj8', 'Florence Stanning', 'fstanning1', 'fstanning1@toplist.cz', 'iT5*c+(.3c=', 'Yangping', 'SodalesScelerisque.ppt'),
('27l5rfe75ug3', 'Sunny Dumsday', 'sdumsdayd', 'sdumsdayd@discovery.com', 'kN0,mgsucyP', 'Ciudad Nueva', 'Phasellus.gif'),
('28s7fcv53io5', 'Leonhard Ranger', 'lrangeru', 'lrangeru@wp.com', 'gG1_4Y~Ir.y.WzB', 'Asahikawa', 'Semper.xls'),
('30b2kjh47zx1', 'Konstantine McElmurray', 'kmcelmurraye', 'kmcelmurraye@about.me', 'mW3<>T9=mZQJmIa', 'Luoshanchuan', 'Luctus.ppt'),
('33c8ozw26lm4', 'Yasmin Ridgway', 'yridgway2', 'yridgway2@earthlink.net', 'mG4{h*XX)bR,g#VL', 'Piru', 'Sem.ppt'),
('34u9nrz02jm9', 'Amitie Ivakhin', 'aivakhin0', 'aivakhin0@unesco.org', 'uA8~qbeXEH9c_N', 'Agpangi', 'CubiliaCurae.doc'),
('38a6kvs39nm9', 'Mallissa Swaden', 'mswadeny', 'mswadeny@cmu.edu', 'fM4*.eYI%x&xZG', 'Maumbawa', 'Molestie.mp3'),
('38k1ysu20vs9', 'Linus Pudden', 'lpudden1j', 'lpudden1j@ox.ac.uk', 'uV4`J`l>XkakIrS', 'Armanāz', 'AnteVivamusTortor.tiff'),
('38l8cmo24jw8', 'Dillie Lebourn', 'dlebournh', 'dlebournh@canalblog.com', 'lP0<y0vBOcDpO6', 'Yelwa', 'VestibulumSitAmet.avi'),
('40r1vby21ca7', 'Nicolle Gason', 'ngasonc', 'ngasonc@cloudflare.com', 'tO6,4\"sw.$eP#', 'Qinglin', 'Diam.mp3'),
('41g0ayn92yv8', 'Lauren Crush', 'lcrush1l', 'lcrush1l@businessweek.com', 'lC6}Srev<ig', 'Cayungnan', 'UtTellusNulla.mp3'),
('43f1cvn19wt5', 'Dillon Downer', 'ddowner7', 'ddowner7@sun.com', 'bD2=vdCm}j<+V', 'Heichengzi', 'NamDuiProin.ppt'),
('43k2ukv87om2', 'Russ Jessel', 'rjesself', 'rjesself@xinhuanet.com', 'pI2&NJY9D8)M', 'Taupo', 'Fusce.xls'),
('45x5mzz92bu9', 'Dniren Ambrodi', 'dambrodi4', 'dambrodi4@bing.com', 'qF4{w?_\n9Y`txHJ', 'Iset’', 'MassaId.xls'),
('46j8acx76ib2', 'Tamqrah Eich', 'teichm', 'teichm@sourceforge.net', 'aL7}ahL_=hRbV,6', 'Tuanalepe', 'CongueElementum.tiff'),
('46u2bmo31ae9', 'Jayme McKea', 'jmckeap', 'jmckeap@berkeley.edu', 'kA7}B@3&jso', 'Rushankou', 'EgetSemperRutrum.png'),
('47a8ogv64xq9', 'Fan Beckley', 'fbeckley10', 'fbeckley10@cnbc.com', 'dX0\0T3mH', 'Luohuang', 'Eu.tiff'),
('48f2nwy13wi6', 'Merilee Williscroft', 'mwilliscroft14', 'mwilliscroft14@hubpages.com', 'dT0.}9rR', 'Lebak Timur', 'Nascetur.xls'),
('50f8auj98du5', 'Baxy Lesek', 'blesek5', 'blesek5@reuters.com', 'eA8<?NSp', 'Toledo', 'AliquamQuisTurpis.tiff'),
('51k2hrk92uf2', 'Nyssa Le feuvre', 'nle1n', 'nle1n@virginia.edu', 'xH3.gP}GS!TS1', 'Mendenrejo', 'Dolor.avi'),
('52v2uph05kw9', 'Ronni Osgar', 'rosgar12', 'rosgar12@php.net', 'lX7@dow\"\"KnzaV', 'Bryukhovetskaya', 'PedeUllamcorperAugue.tiff'),
('54o1jnk44qq6', 'Tamas Terne', 'tternei', 'tternei@boston.com', 'sH1,5tr,&OBX', 'Jiuzhou', 'PharetraMagna.mov'),
('55y8ynp48av0', 'Rickie Sylett', 'rsylett1f', 'rsylett1f@yahoo.com', 'dV1)Ie*{@', 'Capitán Bermúdez', 'Nibh.ppt'),
('60b7djg91ix8', 'Dionne Ballendine', 'dballendinex', 'dballendinex@salon.com', 'oW4}YobK=u', 'Chengcun', 'Ullamcorper.xls'),
('61z6lqu58gh2', 'Anatole Filippyev', 'afilippyev1g', 'afilippyev1g@ted.com', 'fT7}epZ!g', 'Canomoy', 'ElementumNullam.mp3'),
('62z4wij91uu5', 'Ursula Danilyuk', 'udanilyukk', 'udanilyukk@archive.org', 'uB5?vfgO', 'Windsor', 'TempusVel.avi'),
('63d8iew33xv3', 'Dougie Maliffe', 'dmaliffeg', 'dmaliffeg@abc.net.au', 'rG0!zTH8w', 'Sérvia', 'HabitassePlateaDictumst.gif'),
('64r6qgh43bv4', 'Margaux McClurg', 'mmcclurgq', 'mmcclurgq@wix.com', 'iQ0Hn=Ag', 'Wangi', 'Vivamus.doc'),
('68e3cdb297b6681761be', 'Astucia', 'astucia', 'asdasd@fwe.com', '123456789', 'Burgos', 'Astucia'),
('72c2xlb32zs1', 'Aurlie Volleth', 'avolleth1d', 'avolleth1d@sciencedirect.com', 'gK4@yzEaQY#Gdn', 'Sucha', 'VelEnimSit.xls'),
('72z7tbf49ix6', 'Roselia Kempshall', 'rkempshall1m', 'rkempshall1m@miibeian.gov.cn', 'hS2=Wyr~|RClVi', 'Disina', 'ProinEu.gif'),
('74b6tho53sb6', 'Elisabet Woodcroft', 'ewoodcroft1i', 'ewoodcroft1i@taobao.com', 'fL7\rtt!3qxa_jq', 'Vallenar', 'EstQuam.gif'),
('74w6wut98le6', 'Horatio Sang', 'hsangj', 'hsangj@xrea.com', 'nN5_!3DD,', 'Boca Suno', 'OrciEgetOrci.mp3'),
('75k8qfv99ug9', 'Rowland Pimblott', 'rpimblott1e', 'rpimblott1e@edublogs.org', 'eP7)4w_uIyrdMoH', 'Umunede', 'Accumsan.ppt'),
('75o4mgj05di0', 'Ardelis Ubank', 'aubank13', 'aubank13@independent.co.uk', 'lI8(!gD#8_isw@8w', 'Sandia', 'AliquamSitAmet.doc'),
('76i3jwb46fi7', 'Bess Fellowes', 'bfellowesw', 'bfellowesw@google.nl', 'zG3*?0O&rlKx!wX8', 'Pingshan', 'OrciNullamMolestie.mp3'),
('77h7unt30sz6', 'Morganne Burkhill', 'mburkhill17', 'mburkhill17@ed.gov', 'nZ2+dliG|awS!rJ', 'Hedong', 'Ultrices.xls'),
('78m3mda58mq5', 'Karoly Di Filippo', 'kdi1a', 'kdi1a@delicious.com', 'pU5,7sar?weN', 'Carcassonne', 'Justo.xls'),
('79z4mem64zn8', 'Terrence Maffin', 'tmaffina', 'tmaffina@ox.ac.uk', 'pB3<H2Jmrsdstu<C', 'Parque Industrial', 'ConvallisNullaNeque.mp3'),
('80a4fhh44ht7', 'Marys Tapin', 'mtapinl', 'mtapinl@aol.com', 'uD7}cd#IEN', 'Sala', 'OrciNullamMolestie.mp3'),
('81m5tmf28qw1', 'Tisha Coultard', 'tcoultard6', 'tcoultard6@meetup.com', 'tN9kP8Pl3yt<U$', 'Winong', 'LigulaPellentesque.txt'),
('86z3rey98ev1', 'Chanda Schimann', 'cschimann15', 'cschimann15@jugem.jp', 'eF4|Rk#ADxj', 'Shatian', 'IdMauris.mov'),
('94h6fek22jo8', 'Nahum Densumbe', 'ndensumbe3', 'ndensumbe3@nih.gov', 'dB2}(Lz>(2', 'Pavlodar', 'VitaeNisl.png'),
('97l8pkq38ua6', 'Crysta Colvin', 'ccolvin9', 'ccolvin9@samsung.com', 'iX9}@Wl.', 'Rikitgaib', 'AeneanLectus.mp3'),
('98c8dzl95nm6', 'Marianna Aingel', 'maingelz', 'maingelz@addtoany.com', 'mH3!t#S<#V8<&NVy', 'Niba', 'ConvallisEgetEleifend.avi'),
('98f1cch86ro4', 'Spike Philip', 'sphilip1h', 'sphilip1h@shareasale.com', 'kV3#8}ZK', 'Ternopil’', 'AugueAliquamErat.mpeg'),
('98q3igw21je1', 'Edita Pea', 'epea1b', 'epea1b@nba.com', 'nY2?g{\"V3', 'Antipino', 'OrciLuctusEt.ppt'),
('bcfee61916a9271d976e', 'zanahiria', 'zannol', 'asdfc@gde.c', '198273', 'Cantabria', 'zanahiria.png'),
('fa6b9b24af807cd344d4', 'Alegrias Facundo', 'alegria', 'asd@fwe.com', '123456', 'Cantabria', 'Alegrias Facundo');

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
  ADD KEY `id_modality` (`id_modality`);

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
  ADD CONSTRAINT `races_ibfk_2` FOREIGN KEY (`id_modality`) REFERENCES `modalities` (`id`);

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
