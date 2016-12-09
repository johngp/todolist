-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 09, 2016 at 06:28 PM
-- Server version: 5.5.53-0+deb8u1
-- PHP Version: 5.6.27-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `todolist`
--

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE IF NOT EXISTS `Category` (
`id_category` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`id_category`, `name`) VALUES
(1, 'Jeux Vidéos');

-- --------------------------------------------------------

--
-- Table structure for table `Task`
--

CREATE TABLE IF NOT EXISTS `Task` (
`id_task` bigint(20) NOT NULL,
  `label` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `beginningDate` date NOT NULL,
  `endingDate` date NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `isEnded` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Task`
--

INSERT INTO `Task` (`id_task`, `label`, `beginningDate`, `endingDate`, `id_category`, `id_user`, `isEnded`) VALUES
(1, 'Tache de t\r\nest', '2016-10-18', '2016-11-09', 1, 1, 0),
(2, 'Tache coucou', '2016-11-02', '2016-11-04', 1, 1, 0),
(3, 'Tache finie', '2016-12-04', '2016-12-06', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
`id_user` bigint(20) NOT NULL,
  `name` varchar(250) COLLATE utf8_bin NOT NULL,
  `surname` varchar(250) COLLATE utf8_bin NOT NULL,
  `USER_TYPE` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`id_user`, `name`, `surname`, `USER_TYPE`) VALUES
(1, 'Moi', 'C''est moi', 'USER_FREE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
 ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `Task`
--
ALTER TABLE `Task`
 ADD PRIMARY KEY (`id_task`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
 ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
MODIFY `id_category` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Task`
--
ALTER TABLE `Task`
MODIFY `id_task` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
MODIFY `id_user` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;