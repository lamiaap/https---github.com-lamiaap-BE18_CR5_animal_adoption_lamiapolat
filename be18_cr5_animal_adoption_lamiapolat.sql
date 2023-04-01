-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 01. Apr 2023 um 17:10
-- Server-Version: 10.4.27-MariaDB
-- PHP-Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `be18_cr5_animal_adoption_lamiapolat`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `animals`
--

CREATE TABLE `animals` (
  `id` int(15) NOT NULL,
  `name` varchar(300) NOT NULL,
  `size` varchar(300) NOT NULL,
  `age` int(9) NOT NULL,
  `vaccinated` enum('Yes','No') NOT NULL,
  `breed` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `status` enum('Adopted','Available') NOT NULL,
  `picture` varchar(300) NOT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `animals`
--

INSERT INTO `animals` (`id`, `name`, `size`, `age`, `vaccinated`, `breed`, `description`, `status`, `picture`, `users_id`) VALUES
(1, 'alpha', 'small', 9, 'Yes', 'british shorthair', 'British shorthairs are the most sweetest cats', 'Available', 'cat.png', NULL),
(2, 'fluffy', 'large', 12, 'Yes', 'labrador', 'The Labrador retriever is a medium to large dog breed with a short coat and sturdyt', 'Available', 'dog.png', NULL),
(3, 'liony', 'large', 10, 'No', 'lion', 'lions test test test', 'Available', 'lion.png', NULL),
(4, 'cutie', 'small', 7, 'Yes', 'bird', 'birds are cute', 'Adopted', 'bird.png', NULL),
(5, 'lovely', 'large', 10, 'No', 'bear', 'bears are cute', 'Adopted', 'bear.png', NULL),
(6, 'berry', 'small', 7, 'Yes', 'panda', 'Pandas live mainly in temperate forests high in the mountains of southwest China, where they subsist almost entirely on bamboo.', 'Available', 'panda.png', NULL),
(7, 'cherry', 'small', 7, 'Yes', 'cow', 'Cows can live to twenty-five years of age, although in the food industry they typically last no more than four or five years', 'Available', 'cow.png', NULL),
(8, 'diomondy', 'large', 11, 'Yes', 'elephants', 'Elephants are the largest land mammals on earth and have distinctly massive bodies, large ears, and long trunks. ', 'Available', 'elph.png', NULL),
(9, 'cakey', 'small', 7, 'No', 'poomeranian', 'The Pomeranian is a true \"toy\" dog, with an ideal height of eight to 11 inches and weight of only three to seven pounds (one to three kilograms)', 'Available', 'dogg.png', NULL),
(10, 'smiley', 'small', 7, 'Yes', 'test', 'test', 'Available', 'hamster.png', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `status` varchar(4) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `password`, `date_of_birth`, `email`, `picture`, `status`) VALUES
(1, 'lamia', 'pdfiojfiop', 'b85659aa167abbdd5dd2a595faaa412e8b7a1982d25807a6073ad7070666dbbd', '2023-03-14', 'lpq@gmail.com', 'avatar.png', 'adm'),
(2, 'fluffy', 'dnjnd', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '2023-03-16', 'fluffy@gmail.com', 'avatar.png', 'user'),
(4, 'lilii', 'liliiii', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '2023-04-13', 'li@gmail.com', 'avatar.png', 'user');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
