-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 05, 2018 at 02:30 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbd`
--

--
-- DROP TABLES
--

DROP TABLE IF EXISTS `addon_p`;
DROP TABLE IF EXISTS `addon_i`;
DROP TABLE IF EXISTS `addon`;
DROP TABLE IF EXISTS `l_survivant_item`;
DROP TABLE IF EXISTS `item`;
DROP TABLE IF EXISTS `l_survivant_offrande`;
DROP TABLE IF EXISTS `l_survivant_perks`;
DROP TABLE IF EXISTS `l_tueur_offrande`;
DROP TABLE IF EXISTS `l_tueur_perkt`;
DROP TABLE IF EXISTS `perk_t`;
DROP TABLE IF EXISTS `offrande`;
DROP TABLE IF EXISTS `perk_s`;
DROP TABLE IF EXISTS `perk`;
DROP TABLE IF EXISTS `pouvoir`;
DROP TABLE IF EXISTS `survivant`;
DROP TABLE IF EXISTS `tueur`;
DROP TABLE IF EXISTS `personnage`;

-- --------------------------------------------------------

--
-- Table structure for table `addon`
--

CREATE TABLE IF NOT EXISTS `addon` (
  `id_addon` int(3) NOT NULL AUTO_INCREMENT,
  `nom_a` varchar(32) DEFAULT NULL,
  `descr_a` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id_addon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `addon_i`
--

CREATE TABLE IF NOT EXISTS `addon_i` (
  `id_addon` int(3) NOT NULL,
  `id_i` int(3) NOT NULL,
  PRIMARY KEY (`id_addon`),
  KEY `I_FK_ADDON_I_ITEM` (`id_i`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `addon_p`
--

CREATE TABLE IF NOT EXISTS `addon_p` (
  `id_addon` int(3) NOT NULL,
  `id_po` int(3) NOT NULL,
  PRIMARY KEY (`id_addon`),
  KEY `I_FK_ADDON_P_POUVOIR` (`id_po`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id_i` int(3) NOT NULL AUTO_INCREMENT,
  `nom_i` varchar(32) DEFAULT NULL,
  `descr_i` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id_i`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `l_survivant_item`
--

CREATE TABLE IF NOT EXISTS `l_survivant_item` (
  `id_perso` int(3) NOT NULL,
  `id_i` int(3) NOT NULL,
  PRIMARY KEY (`id_perso`,`id_i`),
  KEY `I_FK_ASSO_6_SURVIVANT` (`id_perso`),
  KEY `I_FK_ASSO_6_ITEM` (`id_i`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `l_survivant_offrande`
--

CREATE TABLE IF NOT EXISTS `l_survivant_offrande` (
  `id_perso` int(3) NOT NULL,
  `id_o` int(3) NOT NULL,
  PRIMARY KEY (`id_perso`,`id_o`),
  KEY `I_FK_ASSO_1_SURVIVANT` (`id_perso`),
  KEY `I_FK_ASSO_1_OFFRANDE` (`id_o`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `l_survivant_perks`
--

CREATE TABLE IF NOT EXISTS `l_survivant_perks` (
  `id_perso` int(3) NOT NULL,
  `id_p` int(3) NOT NULL,
  PRIMARY KEY (`id_perso`,`id_p`),
  KEY `I_FK_ASSO_2_SURVIVANT` (`id_perso`),
  KEY `I_FK_ASSO_2_PERK_S` (`id_p`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `l_tueur_offrande`
--

CREATE TABLE IF NOT EXISTS `l_tueur_offrande` (
  `id_o` int(3) NOT NULL,
  `id_perso` int(3) NOT NULL,
  PRIMARY KEY (`id_o`,`id_perso`),
  KEY `I_FK_ASSO_3_OFFRANDE` (`id_o`),
  KEY `I_FK_ASSO_3_TUEUR` (`id_perso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `l_tueur_perkt`
--

CREATE TABLE IF NOT EXISTS `l_tueur_perkt` (
  `id_perso` int(3) NOT NULL,
  `id_p` int(3) NOT NULL,
  PRIMARY KEY (`id_perso`,`id_p`),
  KEY `I_FK_ASSO_4_TUEUR` (`id_perso`),
  KEY `I_FK_ASSO_4_PERK_T` (`id_p`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `offrande`
--

CREATE TABLE IF NOT EXISTS `offrande` (
  `id_o` int(3) NOT NULL AUTO_INCREMENT,
  `nom_o` varchar(32) DEFAULT NULL,
  `descr_o` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id_o`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perk`
--

CREATE TABLE IF NOT EXISTS `perk` (
  `id_p` int(3) NOT NULL AUTO_INCREMENT,
  `nom_p` varchar(32) DEFAULT NULL,
  `descr_p` varchar(2048) DEFAULT NULL,
  `teachable_p` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_p`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perk_s`
--

CREATE TABLE IF NOT EXISTS `perk_s` (
  `id_p` int(3) NOT NULL,
  PRIMARY KEY (`id_p`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perk_t`
--

CREATE TABLE IF NOT EXISTS `perk_t` (
  `id_p` int(3) NOT NULL,
  PRIMARY KEY (`id_p`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `personnage`
--

CREATE TABLE IF NOT EXISTS `personnage` (
  `id_perso` int(3) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(32) DEFAULT NULL,
  `nom` varchar(32) DEFAULT NULL,
  `histoire` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id_perso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pouvoir`
--

CREATE TABLE IF NOT EXISTS `pouvoir` (
  `id_po` int(3) NOT NULL AUTO_INCREMENT,
  `nom_po` varchar(32) DEFAULT NULL,
  `descr_po` varchar(2048) DEFAULT NULL,
  `id_perso` int(3) NOT NULL,
  PRIMARY KEY (`id_po`),
  KEY `I_FK_ASSO_5_TUEUR` (`id_po`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `survivant`
--

CREATE TABLE IF NOT EXISTS `survivant` (
  `id_perso` int(3) NOT NULL,
  PRIMARY KEY (`id_perso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tueur`
--

CREATE TABLE IF NOT EXISTS `tueur` (
  `id_perso` int(3) NOT NULL,
  `surnom` varchar(32) NOT NULL,
  PRIMARY KEY (`id_perso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addon_i`
--
ALTER TABLE `addon_i`
  ADD CONSTRAINT `addon_i_ibfk_1` FOREIGN KEY (`id_addon`) REFERENCES `addon` (`id_addon`),
  ADD CONSTRAINT `addon_i_ibfk_2` FOREIGN KEY (`id_i`) REFERENCES `item` (`id_i`);

--
-- Constraints for table `addon_p`
--
ALTER TABLE `addon_p`
  ADD CONSTRAINT `addon_p_ibfk_1` FOREIGN KEY (`id_addon`) REFERENCES `addon` (`id_addon`),
  ADD CONSTRAINT `addon_p_ibfk_2` FOREIGN KEY (`id_po`) REFERENCES `pouvoir` (`id_po`);

--
-- Constraints for table `l_survivant_item`
--
ALTER TABLE `l_survivant_item`
  ADD CONSTRAINT `l_survivant_item_ibfk_1` FOREIGN KEY (`id_perso`) REFERENCES `survivant` (`id_perso`),
  ADD CONSTRAINT `l_survivant_item_ibfk_2` FOREIGN KEY (`id_i`) REFERENCES `item` (`id_i`);

--
-- Constraints for table `l_survivant_offrande`
--
ALTER TABLE `l_survivant_offrande`
  ADD CONSTRAINT `l_survivant_offrande_ibfk_1` FOREIGN KEY (`id_perso`) REFERENCES `survivant` (`id_perso`),
  ADD CONSTRAINT `l_survivant_offrande_ibfk_2` FOREIGN KEY (`id_o`) REFERENCES `offrande` (`id_o`);

--
-- Constraints for table `l_survivant_perks`
--
ALTER TABLE `l_survivant_perks`
  ADD CONSTRAINT `l_survivant_perks_ibfk_1` FOREIGN KEY (`id_perso`) REFERENCES `survivant` (`id_perso`),
  ADD CONSTRAINT `l_survivant_perks_ibfk_2` FOREIGN KEY (`id_p`) REFERENCES `perk_s` (`id_p`);

--
-- Constraints for table `l_tueur_offrande`
--
ALTER TABLE `l_tueur_offrande`
  ADD CONSTRAINT `l_tueur_offrande_ibfk_1` FOREIGN KEY (`id_perso`) REFERENCES `tueur` (`id_perso`),
  ADD CONSTRAINT `l_tueur_offrande_ibfk_2` FOREIGN KEY (`id_o`) REFERENCES `offrande` (`id_o`);

--
-- Constraints for table `l_tueur_perkt`
--
ALTER TABLE `l_tueur_perkt`
  ADD CONSTRAINT `l_tueur_perkt_ibfk_1` FOREIGN KEY (`id_p`) REFERENCES `perk_t` (`id_p`),
  ADD CONSTRAINT `l_tueur_perkt_ibfk_2` FOREIGN KEY (`id_perso`) REFERENCES `tueur` (`id_perso`);

--
-- Constraints for table `perk_s`
--
ALTER TABLE `perk_s`
  ADD CONSTRAINT `perk_s_ibfk_1` FOREIGN KEY (`id_p`) REFERENCES `perk` (`id_p`);

--
-- Constraints for table `pouvoir`
--
ALTER TABLE `pouvoir`
  ADD CONSTRAINT `pouvoir_ibfk_1` FOREIGN KEY (`id_perso`) REFERENCES `tueur` (`id_perso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
