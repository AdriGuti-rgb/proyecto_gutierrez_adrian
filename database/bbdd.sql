-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-01-2024 a las 23:09:01
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS proyecto_integrador;

CREATE DATABASE proyecto_integrador;

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
  `id_race` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `name` varchar(60) UNIQUE DEFAULT NULL,
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

INSERT INTO `races` (`id`, `name`, `race_day`, `positive_slope`, `negative_slope`, `total_slope`, `distance`,`poblation`, `main_photo`, `id_category`, `id_modality`) VALUES
('3fcecc005ed9878ed0d6', 'Transcandmia', '2024-02-09', 2104.3, 1485.8, 3590.1, 21, 'Madrid', 'C:fakepath2a2e7f0f60b750dfb36c15c268d0118d.jpg', '62r1uem02dl2', '43o0aja32wa6'),
('40aaf666fcdaadc7a22d', 'Alguna', '2024-03-02', 475.6, 476.8, 952.4, 23, 'Barcelona', 'C:fakepathimages.jpeg', '41e1khc20eh1', '43o0aja32wa6'),
('443079dd068be778a81a', 'Prueba 3', '2024-05-17', 1661, 1630.4, 3291.4, 32, 'Donosti', 'C:fakepathCaptura de pantalla 2023-10-10 002722.png', '63b1rvo95yo8', '99r4osm75ys5'),
('5bb6af13e4c5a18ed849', 'asd', '2024-01-25', 1506.3, 1506.7, 3013, 12, 'few', 'C:fakepathCaptura de pantalla 2023-11-15 144224.png', '02f8wll37kw4', '00p9ajk35ew0'),
('6c4b8dd5d19967ce3e4d', 'Alguna', '2024-04-24', 1499.21, 1506.7, 3005.91, 90, 'Vegacervera', 'C:fakepathSin título.png', '02f8wll37kw4', '01j5gic48lj6'),
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
('28s7fcv53io5', 'Leonhard Ranger', 'lrangeru', 'lrangeru@wp.com', 'gG1_4Y~Ir.\y.WzB', 'Asahikawa', 'Semper.xls'),
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
('60b7djg91ix8', 'Dionne Ballendine', 'dballendinex', 'dballendinex@salon.com', 'oW4}Yob\K=u', 'Chengcun', 'Ullamcorper.xls'),
('61z6lqu58gh2', 'Anatole Filippyev', 'afilippyev1g', 'afilippyev1g@ted.com', 'fT7}epZ!g', 'Canomoy', 'ElementumNullam.mp3'),
('62z4wij91uu5', 'Ursula Danilyuk', 'udanilyukk', 'udanilyukk@archive.org', 'uB5?vfgO', 'Windsor', 'TempusVel.avi'),
('63d8iew33xv3', 'Dougie Maliffe', 'dmaliffeg', 'dmaliffeg@abc.net.au', 'rG0!zTH8w', 'Sérvia', 'HabitassePlateaDictumst.gif'),
('64r6qgh43bv4', 'Margaux McClurg', 'mmcclurgq', 'mmcclurgq@wix.com', 'iQ0Hn=Ag', 'Wangi', 'Vivamus.doc'),
('72c2xlb32zs1', 'Aurlie Volleth', 'avolleth1d', 'avolleth1d@sciencedirect.com', 'gK4@yzEaQY#Gdn', 'Sucha', 'VelEnimSit.xls'),
('72z7tbf49ix6', 'Roselia Kempshall', 'rkempshall1m', 'rkempshall1m@miibeian.gov.cn', 'hS2=Wyr~|RClVi', 'Disina', 'ProinEu.gif'),
('74b6tho53sb6', 'Elisabet Woodcroft', 'ewoodcroft1i', 'ewoodcroft1i@taobao.com', 'fL7\rtt!3qxa_jq', 'Vallenar', 'EstQuam.gif'),
('74w6wut98le6', 'Horatio Sang', 'hsangj', 'hsangj@xrea.com', 'nN5_!3DD,', 'Boca Suno', 'OrciEgetOrci.mp3'),
('75k8qfv99ug9', 'Rowland Pimblott', 'rpimblott1e', 'rpimblott1e@edublogs.org', 'eP7)4w_uIyrdMoH', 'Umunede', 'Accumsan.ppt'),
('75o4mgj05di0', 'Ardelis Ubank', 'aubank13', 'aubank13@independent.co.uk', 'lI8(!gD#8_isw@8w', 'Sandia', 'AliquamSitAmet.doc'),
('76i3jwb46fi7', 'Bess Fellowes', 'bfellowesw', 'bfellowesw@google.nl', 'zG3*?0O&rlKx!wX8', 'Pingshan', 'OrciNullamMolestie.mp3'),
('77h7unt30sz6', 'Morganne Burkhill', 'mburkhill17', 'mburkhill17@ed.gov', 'nZ2+dl\iG|awS!rJ', 'Hedong', 'Ultrices.xls'),
('78m3mda58mq5', 'Karoly Di Filippo', 'kdi1a', 'kdi1a@delicious.com', 'pU5,7sar?weN', 'Carcassonne', 'Justo.xls'),
('79z4mem64zn8', 'Terrence Maffin', 'tmaffina', 'tmaffina@ox.ac.uk', 'pB3<H2Jmrsdstu<C', 'Parque Industrial', 'ConvallisNullaNeque.mp3'),
('80a4fhh44ht7', 'Marys Tapin', 'mtapinl', 'mtapinl@aol.com', 'uD7}cd#IEN', 'Sala', 'OrciNullamMolestie.mp3'),
('81m5tmf28qw1', 'Tisha Coultard', 'tcoultard6', 'tcoultard6@meetup.com', 'tN9\kP8Pl3yt<U$', 'Winong', 'LigulaPellentesque.txt'),
('86z3rey98ev1', 'Chanda Schimann', 'cschimann15', 'cschimann15@jugem.jp', 'eF4|Rk#ADxj', 'Shatian', 'IdMauris.mov'),
('94h6fek22jo8', 'Nahum Densumbe', 'ndensumbe3', 'ndensumbe3@nih.gov', 'dB2}(Lz>(2', 'Pavlodar', 'VitaeNisl.png'),
('97l8pkq38ua6', 'Crysta Colvin', 'ccolvin9', 'ccolvin9@samsung.com', 'iX9}@Wl.', 'Rikitgaib', 'AeneanLectus.mp3'),
('98c8dzl95nm6', 'Marianna Aingel', 'maingelz', 'maingelz@addtoany.com', 'mH3!t#S<#V8<&NVy', 'Niba', 'ConvallisEgetEleifend.avi'),
('98f1cch86ro4', 'Spike Philip', 'sphilip1h', 'sphilip1h@shareasale.com', 'kV3#8\}ZK', 'Ternopil’', 'AugueAliquamErat.mpeg'),
('98q3igw21je1', 'Edita Pea', 'epea1b', 'epea1b@nba.com', 'nY2?g{\"V3', 'Antipino', 'OrciLuctusEt.ppt');

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
