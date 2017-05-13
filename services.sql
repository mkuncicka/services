-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas generowania: 12 Maj 2017, 16:58
-- Wersja serwera: 5.7.17-0ubuntu0.16.04.2
-- Wersja PHP: 5.6.30-10+deb.sury.org~xenial+2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `services`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `question` int(11) DEFAULT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `answer`
--

INSERT INTO `answer` (`id`, `question`, `text`) VALUES
(1, 1, 'Odp 1'),
(2, 1, 'Odp 2'),
(3, 1, 'Odp 3'),
(4, 2, 'Odp 1'),
(5, 2, 'Odp 2'),
(6, 2, 'Odp 3'),
(7, 3, 'Odp 1'),
(8, 3, 'Odp 2'),
(9, 3, 'Odp 3'),
(10, 4, 'Odp 1'),
(11, 4, 'Odp 2'),
(12, 4, 'Odp 3'),
(13, 5, 'Odp 1'),
(14, 5, 'Odp 2'),
(15, 5, 'Odp 3');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `test_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `question`
--

INSERT INTO `question` (`id`, `text`, `test_id`) VALUES
(1, 'Pytanie 1', 1),
(2, 'Pytanie 2', 1),
(3, 'Pytanie 1', 2),
(4, 'Pytanie 2', 2),
(5, 'Pytanie 3', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `test`
--

INSERT INTO `test` (`id`, `title`) VALUES
(1, 'Pierwszy test'),
(2, 'Drugi Test');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DADD4A25B6F7494E` (`question`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B6F7494E1E5D0459` (`test_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT dla tabeli `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `FK_DADD4A25B6F7494E` FOREIGN KEY (`question`) REFERENCES `question` (`id`);

--
-- Ograniczenia dla tabeli `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_B6F7494E1E5D0459` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
