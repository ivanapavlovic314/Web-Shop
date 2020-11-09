SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `webprodavnica` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `webprodavnica`;

DROP TABLE IF EXISTS `kupac`;
CREATE TABLE `kupac` (
  `id` int(10) UNSIGNED NOT NULL,
  `ime` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `telefon` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `adresa` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `grad` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `pposeta` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Detalji o kupcu';

INSERT INTO `kupac` (`id`, `ime`, `prezime`, `email`, `telefon`, `adresa`, `grad`, `pposeta`) VALUES
(1, 'Nikola', 'Pavlovic', 'npavlovic@gmail.com', '+381648822450', 'Deset avijaticara 5', 'Beograd', '2020-07-28 18:30:18'),
(2, 'Ivana', 'Obradovic', 'iobradovic@gmail.com', '+381638882232', 'Save Kovacevica 12', 'Krusevac', '2020-07-28 19:01:51'),
(3, 'Una', 'Sovic', 'usovic@gmail.com', '+381652214423', 'Narodnog fronta 11', 'Sabac', '2020-07-28 18:39:39'),
(4, 'Nevena', 'Loncar', 'nloncar@gmail.com', '+38162332071', 'Bulevar Oslobodjenja 5', 'Beograd', '2020-07-28 18:40:20'),
(5, 'Snezana', 'Bozic', 'sbozic@gmail.com', '+38163323445', 'Desanke Maksimovic 17', 'Beograd', '2020-07-28 19:01:08'),
(6, 'Biljana', 'Popovic', 'biljap@yahoo.com', '+381642259970', 'Save Kovacevica 20', 'Beograd', '2020-07-27 16:51:01'),
(7, 'Voja', 'Milojevic', 'milev@gmail.com', '+381642259970', 'Pozeska 25', 'Sabac', 'Bez aktivnosti');

DROP TABLE IF EXISTS `kupovina`;
CREATE TABLE `kupovina` (
  `id` int(10) UNSIGNED NOT NULL,
  `iznos` double(10,2) NOT NULL,
  `vreme` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `listaProizvoda` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `kupac` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Detalji kupovine';

INSERT INTO `kupovina` (`id`, `iznos`, `vreme`, `listaProizvoda`, `kupac`) VALUES
(1, 1500.00, '25/05/2020', 'samo osnovne namirnice', 2),
(2, 2578.59, '24/07/2020', 'slatkisi', 4),
(3, 255.14, '24/07/2020', 'dorucak u pekari', 3),
(4, 654.25, '24/07/2020', 'delikates i mleko', 2),
(5, 4785.14, '24/07/2020', 'govedina i konzervirano', 5),
(6, 456.21, '24/07/2020', 'pice i slatkisi', 1),
(7, 2534.94, '2020-07-25 20:56:27', 'nullSuvi vrat - [1 kom];Ananas - [2 kom];Pileci file - [3 kom];', 6),
(8, 4174.93, '2020-07-27 16:39:53', 'nullSuvi vrat - [3 kom];Ananas - [4 kom];', 5),
(9, 4354.87, '2020-07-27 16:44:35', 'nullSuvi vrat - [3 kom];Ananas - [4 kom];Moja kravica kiselo mleko - [6 kom];', 5),
(10, 27049.80, '2020-07-27 18:56:45', 'nullPecenica svinjska - [10 kom];Suvi vrat - [10 kom];', 3),
(11, 1779.95, '2020-07-27 18:59:48', 'Kupljeno: Ananas - [2 kom];Teleci medaljoni - [3 kom];', 5),
(12, 2879.96, '2020-07-27 22:19:41', 'Kupljeno: Pecenica svinjska - 1kom];Maslina crna bez kospe - 3kom];', 2),
(13, 1543.97, '2020-07-27 22:23:29', 'Kupljeno: Ananas - 1kom];Kokosovo mleko - 2kom];', 1),
(14, 3845.91, '2020-07-28 17:26:49', 'Kupljeno: Maslina crna bez kospe - 3kom];Pasulj crveni - 6kom];', 2),
(15, 1558.97, '2020-07-28 17:29:30', 'Kupljeno: Masline crne - 1kom;Kokosovo mleko - 2kom;', 1),
(16, 1558.97, '2020-07-28 17:41:21', 'Kupljeno: Masline crne - 5kom;Kokosovo mleko - 2kom;', 3),
(17, 5807.90, '2020-07-28 17:45:21', 'Kupljeno: Kokosovo mleko - 4kom;Teleci medaljoni - 6kom;', 4),
(18, 5807.90, '2020-07-28 17:46:56', 'Kupljeno: Kokosovo mleko - 4kom;Teleci medaljoni - 6kom;', 4),
(19, 5807.90, '2020-07-28 17:52:32', 'Kupljeno: Kokosovo mleko - 4kom;Teleci medaljoni - 6kom;', 4),
(20, 6968.88, '2020-07-28 17:55:37', 'Kupljeno: Pasulj crveni - 5kom;Kokosovo mleko - 7kom;', 3),
(21, 50.00, '2020-07-28 18:39:39', 'Kupljeno: Razani hleb - 1kom;', 3),
(22, 1799.94, '2020-07-28 18:40:20', 'Kupljeno: Maslina crna bez kospe - 3kom;Ananas - 3kom;', 4),
(23, 90.00, '2020-07-28 19:01:08', 'Kupljeno: Beli hleb - 1kom;Razani hleb - 1kom;', 5),
(24, 2570.94, '2020-07-28 19:01:51', 'Kupljeno: Masline crne - 3kom;Kokosovo mleko - 3kom;', 2);

DROP TABLE IF EXISTS `proizvod`;
CREATE TABLE `proizvod` (
  `id` int(10) UNSIGNED NOT NULL,
  `naziv` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cena` double(6,2) NOT NULL,
  `opis` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `lager` int(11) DEFAULT NULL,
  `kategorija` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `proizvod` (`id`, `naziv`, `cena`, `opis`, `lager`, `kategorija`) VALUES
(1, 'Pecenica svinjska', 1499.99, 'Suhomesnati proizvodi 1kg', 29, 'Delikates'),
(2, 'Cajna kobasica', 999.99, 'Carnex akcija', 18, 'Delikates'),
(3, 'Maslina crna bez kospe', 459.99, 'Grcka maslina rinfuz', 117, 'Delikates'),
(4, 'Suvi vrat', 1204.99, 'Suhomesnato vakuum', 55, 'Delikates'),
(5, 'Pasulj crveni', 410.99, '200g', 39, 'Konzervirano'),
(6, 'Masline crne', 154.99, 'Bez kospe ocedjene (380g)', 35, 'Konzervirano'),
(7, 'Ananas', 139.99, 'Kolutici (400g)', 199, 'Konzervirano'),
(8, 'Kokosovo mleko', 701.99, 'bez secera (125ml)', 71, 'Konzervirano'),
(9, 'Teleci medaljoni', 499.99, 'Sveze telece meso (1kg)', -14, 'Mesara'),
(10, 'Cureca prsa', 299.99, 'Curetina pakovana (500g)', 9, 'Mesara'),
(11, 'Pileci file', 349.99, 'Pilece meso rinfuz (1kg)', 14, 'Mesara'),
(12, 'Rostiljska kobasica', 455.90, 'Mesne preradjevine (1kg)', 12, 'Mesara'),
(13, 'Mleko uht alpsko', 40.99, '3.5%mm (0.2L)', 50, 'Mlecni proizvodi'),
(14, 'President sir Emmental', 154.99, 'Top list President (330g)', 57, 'Mlecni proizvodi'),
(15, 'Moja kravica kiselo mleko', 29.99, 'Imlek 2.8%mm (120ml)', 144, 'Mlecni proizvodi'),
(16, 'President maslac', 204.99, 'Neslani (125g)', 100, 'Mlecni proizvodi'),
(17, 'Toalet papir', 211.99, 'Perfex troslojni', 200, 'Neprehrana'),
(18, 'Pasta za zube', 159.99, 'Colgate (125ml)', 49, 'Neprehrana'),
(19, 'Sredstvo za ciscenje parketa', 429.99, '(750ml)', 122, 'Neprehrana'),
(20, 'Sijalica stedljiva', 204.99, 'Lumax (18W)', 142, 'Neprehrana'),
(21, 'Secer', 40.99, 'Beli (1kg)', 78, 'Osnovne namirnice'),
(22, 'Brasno belo', 67.99, 'T400 (1kg)', 50, 'Osnovne namirnice'),
(23, 'Ulje', 29.99, 'Vital (1l)', 10, 'Osnovne namirnice'),
(24, 'So kuhinjska', 74.99, 'Jodirana (1kg)', 100, 'Osnovne namirnice'),
(25, 'Obicna kifla', 25.00, '250g', 50, 'Pekara'),
(26, 'Beli hleb', 40.00, '1kg', 99, 'Pekara'),
(27, 'Razani hleb', 50.00, '1kg', 98, 'Pekara'),
(28, 'Strudla sa dzemom', 70.00, 'Sumsko voce (250g)', 40, 'Pekara'),
(29, 'Voda negazirana', 55.00, 'Rosa (1,5l)', 51, 'Voda i pice'),
(30, 'Voda gazirana', 44.99, 'Mivela (1l)', 119, 'Voda i pice'),
(31, 'Pivo svetlo', 89.99, 'Lav (0,5l)', 200, 'Voda i pice'),
(32, 'Vino crveno', 399.00, 'Podgoricki vinogradi (0,7l)', 40, 'Voda i pice'),
(33, 'Cips', 125.00, ' rebrasti 250g', 54, 'Slatkisi i grickalice'),
(34, 'Stapici', 139.99, ' sa kikirikijem 150g', 100, 'Slatkisi i grickalice'),
(35, 'Cokolada bela', 150.00, 'Milka 100g', 102, 'Slatkisi i grickalice'),
(36, 'Gumene bombone', 70.00, 'Kupina i malina (150g)', 47, 'Slatkisi i grickalice');


ALTER TABLE `kupac`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `kupovina`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `proizvod`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `kupac`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `kupovina`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

ALTER TABLE `proizvod`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
