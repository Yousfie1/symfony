-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 10 mei 2022 om 15:22
-- Serverversie: 10.4.22-MariaDB
-- PHP-versie: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizza`
--
DROP DATABASE IF EXISTS `pizza`;
CREATE DATABASE IF NOT EXISTS `pizza` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pizza`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `category`
--

INSERT INTO `category` (`id`, `name`, `image`) VALUES
(1, 'vispizza', 'img/vispizza.png'),
(2, 'vleespizza', 'img/vleespizza.png'),
(3, 'vegetarische pizza\'s', 'img/veggiepizza.png'),
(4, 'Dranken', 'img/dranken.png');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220329120027', '2022-05-10 13:23:51', 57),
('DoctrineMigrations\\Version20220510121005', '2022-05-10 14:18:26', 150);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pizza`
--

DROP TABLE IF EXISTS `pizza`;
CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `pizza`
--

INSERT INTO `pizza` (`id`, `category_id`, `name`, `image`, `price`) VALUES
(1, 1, 'Tuna Treat pizza', 'img/vispizza.png', '12.99'),
(2, 2, 'gyros pizza', 'img/gyrospizza.png', '12.99'),
(3, 2, 'East Side Shoarma pizza', 'img/Eastsidepizza.png', '12.99'),
(4, 2, 'Pulled Chicken', 'img/pulledpizza.png', '12.99'),
(5, 2, 'Double Pepperoni pizza', 'double_Pepperoni.png', '14.99'),
(6, 2, 'Spicy Tandoori Chicken', 'Tandoori.png', '13.50'),
(7, 2, 'Italian Garlic Chicken', 'Italian.png', '16.99'),
(8, 2, 'BBQ Meatlovers pizza', 'BBQ_meatlovers.png', '16.99'),
(9, 3, 'Courgette pizza', 'img/courgette.png', '12.99'),
(10, 3, 'Margherita pizza', 'img/Margherita.png', '12.99'),
(11, 3, 'Zwarte Truffel pizza', 'img/Zwarte_Truffel.png', '12.99'),
(12, 2, 'Caprese pizza', 'Caprese.png', '14.99');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CFDD826F12469DE2` (`category_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `FK_CFDD826F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
