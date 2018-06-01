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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `addon_i`
--

CREATE TABLE IF NOT EXISTS `addon_i` (
  `id_addon` int(3) NOT NULL,
  `id_i` int(3) NOT NULL,
  PRIMARY KEY (`id_addon`),
  KEY `I_FK_ADDON_I_ITEM` (`id_i`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `addon_p`
--

CREATE TABLE IF NOT EXISTS `addon_p` (
  `id_addon` int(3) NOT NULL,
  `id_po` int(3) NOT NULL,
  PRIMARY KEY (`id_addon`),
  KEY `I_FK_ADDON_P_POUVOIR` (`id_po`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id_i` int(3) NOT NULL AUTO_INCREMENT,
  `nom_i` varchar(32) DEFAULT NULL,
  `descr_i` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id_i`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `offrande`
--

CREATE TABLE IF NOT EXISTS `offrande` (
  `id_o` int(3) NOT NULL AUTO_INCREMENT,
  `nom_o` varchar(32) DEFAULT NULL,
  `descr_o` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id_o`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perk`
--

CREATE TABLE IF NOT EXISTS `perk` (
  `id_p` int(3) NOT NULL AUTO_INCREMENT,
  `nom_p` varchar(32) DEFAULT NULL,
  `descr_p` varchar(32) DEFAULT NULL,
  `teachable_p` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_p`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perk_s`
--

CREATE TABLE IF NOT EXISTS `perk_s` (
  `id_p` int(3) NOT NULL,
  PRIMARY KEY (`id_p`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perk_t`
--

CREATE TABLE IF NOT EXISTS `perk_t` (
  `id_p` int(3) NOT NULL,
  PRIMARY KEY (`id_p`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `survivant`
--

CREATE TABLE IF NOT EXISTS `survivant` (
  `id_perso` int(3) NOT NULL,
  PRIMARY KEY (`id_perso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tueur`
--

CREATE TABLE IF NOT EXISTS `tueur` (
  `id_perso` int(3) NOT NULL,
  `surnom` varchar(32) NOT NULL,
  PRIMARY KEY (`id_perso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- LES ADDONS DES ITEMS (SURVIVANT)
-- Flashlight
INSERT INTO addon(nom_a, descr_a) VALUES("Batterie", "Allonge le temps d'utilisation de la torche de 2/4/6 secondes.");
INSERT INTO addon(nom_a, descr_a) VALUES("Lentille", "Elargit plus ou moins le faisceau lumineux, augmente plus ou moins la portée et la puissance.");
INSERT INTO addon(nom_a, descr_a) VALUES("Ampoule", "Augmente plus ou moins l'efficacité du faisceau. Les meilleures ampoules aussi la consommation d'énergie.");
INSERT INTO addon(nom_a, descr_a) VALUES("Poignée", "Augmente la précision de la torche.");
-- Key
INSERT INTO addon(nom_a, descr_a) VALUES("Corde de prière", "Ajoute 10 secondes d'utilisation à la clé.");
INSERT INTO addon(nom_a, descr_a) VALUES("Jeton rongé", "Révèle l'aura des survivants dans les 24 mètres.");
INSERT INTO addon(nom_a, descr_a) VALUES("Perles de prière", "Ajoute 15 secondes d'utilisation à la clé.");
INSERT INTO addon(nom_a, descr_a) VALUES("Perle rayée", "Augmente modérément la distance de détection de l'aura.");
INSERT INTO addon(nom_a, descr_a) VALUES("Jeton doré", "Révèle l'aura des survivants dans les 48 mètres.");
INSERT INTO addon(nom_a, descr_a) VALUES("Ambre de sang", "Révèle l'aura du Tueur dans les 32 mètres. Consomme fortement l'énergie de la clé.");
INSERT INTO addon(nom_a, descr_a) VALUES("Miroir opaque", "Permet de conserver la clé après avoir ouvert la trappe mais détruit l'accessoire.");
INSERT INTO addon(nom_a, descr_a) VALUES("Anneau tressé", "Permet de conserver la clé en cas de mort/sacrifice mais détruit l'accessoire.");
-- Map
INSERT INTO addon(nom_a, descr_a) VALUES("Carte Addenda", "Ajoute 5 secondes de charge.");
INSERT INTO addon(nom_a, descr_a) VALUES("Perle de verre", "Débloque l'action secondaire permettant de marquer un emplacement.");
INSERT INTO addon(nom_a, descr_a) VALUES("Ficelle rouge", "Permet de repérer les possessions du tueur.");
INSERT INTO addon(nom_a, descr_a) VALUES("Gelée ignifuge", "Réduit modérément la combustion de la carte.");
INSERT INTO addon(nom_a, descr_a) VALUES("Cachet étrange", "Augmente modérément la portée de la carte.");
INSERT INTO addon(nom_a, descr_a) VALUES("Fil jaune", "Permet de repérer les portes de sortie.");
INSERT INTO addon(nom_a, descr_a) VALUES("Corde de soie noire", "Permet de repérer la Trappe.");
INSERT INTO addon(nom_a, descr_a) VALUES("Cachet ancien", "Augmente considérablement la portée de la carte.");
INSERT INTO addon(nom_a, descr_a) VALUES("Perle de cristal", "Les autres survivants peuvent voir l'aura de la carte lors de son utilisation.");
-- Med-kit
INSERT INTO addon(nom_a, descr_a) VALUES("Bandages", "Ajoute 6 charges à la trousse.");
INSERT INTO addon(nom_a, descr_a) VALUES("Pansement adhérent", "Ajoute 6 charges à la trousse et augmente légèrement la vitesse de soin.");
INSERT INTO addon(nom_a, descr_a) VALUES("Pansements hydrogels", "Ajoute 10 charges à la trousse.");
INSERT INTO addon(nom_a, descr_a) VALUES("Sutures cutanées", "Augmente légèrement la vitesse de soin.");
INSERT INTO addon(nom_a, descr_a) VALUES("Ciseaux chirurgicaux", "Augmente modérément la vitesse de soin.");
INSERT INTO addon(nom_a, descr_a) VALUES("Pansement abdominal", "Augmente considérablement la vitesse de soin et réduit la charge de 25%.");
INSERT INTO addon(nom_a, descr_a) VALUES("Gants de caoutchouc", "Diminue légèrement la difficulté des tests d'habileté.");
INSERT INTO addon(nom_a, descr_a) VALUES("Éponge", "Diminue modérément la difficulté des tests d'habileté.");
INSERT INTO addon(nom_a, descr_a) VALUES("Suture chirurgicale", "Augmente légèrement la chance de déclencher un test d'habileté, réduit modérément la zone de réussite des tests d'habileté et augmente modérément la vitesse de soin.");
INSERT INTO addon(nom_a, descr_a) VALUES("Poudre styptique", "Réduit la charge de 25%, l'action secondaire soigne instantanément un état blessé et consomme la trousse de soin à l'utilisation.");
INSERT INTO addon(nom_a, descr_a) VALUES("Seringue anti-hémorragique", "Réduit la charge de 50%. L'action secondaire soigne entièrement. Consomme la trousse de soin à l’utilisation.");
-- Toolbox
INSERT INTO addon(nom_a, descr_a) VALUES("Chiffon propre", "Augmente légèrement la vitesse de réparation.");
INSERT INTO addon(nom_a, descr_a) VALUES("Ferraille", "Ajoute 15 charges à la boîte.");
INSERT INTO addon(nom_a, descr_a) VALUES("Pince à ressort", "Augmente légèrement la zone de réussite des tests d'habileté.");
INSERT INTO addon(nom_a, descr_a) VALUES("Clé ajustable", "Augmente modérément la zone de réussite des tests d'habileté.");
INSERT INTO addon(nom_a, descr_a) VALUES("Manuel d'instructions", "Augmente modérément l'efficacité de la réparation.");
INSERT INTO addon(nom_a, descr_a) VALUES("Bobine de fil", "Ajoute 30 charges à la boîte.");
INSERT INTO addon(nom_a, descr_a) VALUES("Gants de protection", "Augmente légèrement la chance de réussir un test d'habileté lors d'un sabotage. Augmente légèrement la zone de succès des tests d'habileté d'un sabotage. Réduit considérablement la pénalité d'échec à un test d'habileté lors d'un sabotage.");
INSERT INTO addon(nom_a, descr_a) VALUES("Pivots", "Augmente modérément la vitesse de réparation.");
INSERT INTO addon(nom_a, descr_a) VALUES("Coups-câbles", "Augmente légèrement la vitesse de sabotage.");
INSERT INTO addon(nom_a, descr_a) VALUES("Scie à métaux", "Augmente modérément la vitesse de sabotage.");
INSERT INTO addon(nom_a, descr_a) VALUES("Pièce neuve", "Réduit la charge de 50%. Dès la fin d'utilisation, répare instantanément le générateur mais consomme la boîte à outils à l'utilisation.");
-- LES ADDONS DES POUVOIRS (TUEUR)
-- Blackened Catalyst
INSERT INTO addon(nom_a, descr_a) VALUES("Collier de corde", "Diminue légèrement le temps de pose des pièges Phantasm.");
INSERT INTO addon(nom_a, descr_a) VALUES("Coquille d'oeuf en poudre", "Augmente légèrement la durée du piège Phantasm déclenché.");
INSERT INTO addon(nom_a, descr_a) VALUES("Boue morte", "Augmente légèrement la distance d'où la Harpie peut se téléporter à ses pièges.");
INSERT INTO addon(nom_a, descr_a) VALUES("Eau de marécage", "Augmente légèrement la zone de déclenchement des pièges Phantasm.");
INSERT INTO addon(nom_a, descr_a) VALUES("Chatons de Chatte Saule", "Révèle l'aura du survivant pendant 2 secondes lorsqu'il déclenche le piège Phantasm.
Réduit légèrement la zone de déclenchement des pièges Phantasm.");
INSERT INTO addon(nom_a, descr_a) VALUES("Demi coquille d'oeuf", "Augmente modérément la durée du piège Phantasm déclenché.
Diminue légèrement la distance d'où la Harpie peut se téléporter à ses pièges.");
INSERT INTO addon(nom_a, descr_a) VALUES("Ailes de libellule", "Augmente modérément la distance d'où la Harpie peut se téléporter à ses pièges.
Augmente légèrement le temps de pose des pièges Phantasm.");
INSERT INTO addon(nom_a, descr_a) VALUES("Collier en cyprès", "Réduit modérément le temps de pose des pièges Phantasm.");
INSERT INTO addon(nom_a, descr_a) VALUES("Eau ensanglantée", "Augmente modérément la zone de déclenchement des pièges Phantasm.");
INSERT INTO addon(nom_a, descr_a) VALUES("Couronne de Saule", "Révèle l'aura du survivant pendant 4 secondes quand il déclenche le piège Phantasm.
Réduit modérément la zone de déclenchement des pièges Phantasm.");
INSERT INTO addon(nom_a, descr_a) VALUES("Collier d'orchidée des marais", "Diminue considérablement le temps de pose des pièges Phantasm.");
INSERT INTO addon(nom_a, descr_a) VALUES("Cigale séchée", "Augmente considérablement la distance d'où la Harpie peut se téléporter à ses pièges.
Augmente modérément le temps de pose des pièges Phantasm.");
INSERT INTO addon(nom_a, descr_a) VALUES("Oeuf de tortue fissuré", "Augmente considérablement la durée du piège Phantasm déclenché.
Diminue modérément la distance d'où la Harpie peut se téléporter à ses pièges.");
INSERT INTO addon(nom_a, descr_a) VALUES("Boue ensanglantée", "Augmente considérablement la zone de déclenchement des pièges Phantasm.
Diminue légèrement la durée du piège Phantasm déclenché.");
INSERT INTO addon(nom_a, descr_a) VALUES("Main effrayée", "Les fantômes de boue peuvent faire collision.
Réduit modérément la vitesse de déplacement du Hag.
Supprime la capacité de la Harpie à se téléporter dans ses pièges.
Confère 300% de points de sang à partir du score de Sournoiserie.
Supprime les autres addons pour ce niveau.");
INSERT INTO addon(nom_a, descr_a) VALUES("Manilles rouillées", "Les pièges ne génèrent pas un fantôme de la Harpie.
Les pièges Phantasm déclenchés ne donnent aucune indication sur leur déclenchement au survivant.");
INSERT INTO addon(nom_a, descr_a) VALUES("Coeur de Granma", "Réduit le rayon de terreur de The Hag à 0m lorsqu'un Survivant déclenche un piège Phantasm.
Augmente le rayon de terreur d'un fantôme de boue à 16m pour la durée du piège Phantasm déclenché.");
INSERT INTO addon(nom_a, descr_a) VALUES("Oreille défigurée", "Les survivants qui déclenchent un piège Phantasm sont assourdis pendant 6 secondes.
Diminue considérablement la durée du piège Phantasm déclenché.");
INSERT INTO addon(nom_a, descr_a) VALUES("Chaussure détrempée", "Les survivants dans la zone des pièges déclenchés souffriront de l'effet de statut entravé (ralentissement).
Supprime la capacité de la Harpie à se téléporter vers ses Pièges.");
INSERT INTO addon(nom_a, descr_a) VALUES("Chiffon mentholé", "La Harpie peut se téléporter à n'importe quel piège activé dans le niveau.
La téléportation du piège fantasmatique a un temps de recharge de 15 secondes.");
-- Chainsaw
INSERT INTO addon(nom_a, descr_a) VALUES("Lime pour tronçonneuse", "Réduit légèrement le bruit.");
INSERT INTO addon(nom_a, descr_a) VALUES("Bougie d'allumage", "Réduit légèrement le temps de charge.");
INSERT INTO addon(nom_a, descr_a) VALUES("Huile végétale", "Réduit légèrement le temps recharge de la compétence.");
INSERT INTO addon(nom_a, descr_a) VALUES("Longue barre de guidage", "Augmente légèrement la portée.");
INSERT INTO addon(nom_a, descr_a) VALUES("Jauge", "Réduit légèrement la pénalité de collision.");
INSERT INTO addon(nom_a, descr_a) VALUES("Apprêt", "Réduit modérément le temps de charge.");
INSERT INTO addon(nom_a, descr_a) VALUES("Lubrifiant", "Réduit modérément le temps de recharge de la compétence.");
INSERT INTO addon(nom_a, descr_a) VALUES("Bottes crantées", "Augmente modérément la capacité à changer de direction pendant l'activation.");
INSERT INTO addon(nom_a, descr_a) VALUES("Régulateur de vitesse", "- Bonus de 50% de points de sang
- La tronçonneuse n’inflige plus automatiquement l'état critique.");
INSERT INTO addon(nom_a, descr_a) VALUES("Silencieux fait maison", "Réduit modérément le bruit.");
INSERT INTO addon(nom_a, descr_a) VALUES("Gravures de mort", "- Augmente légèrement la vitesse de la tronçonneuse
- Augmente légèrement le temps de charge.");
INSERT INTO addon(nom_a, descr_a) VALUES("Chaîne macabre", "Réduit modérément la vitesse de réparation des survivants touchés.");
INSERT INTO addon(nom_a, descr_a) VALUES("Chaîne rouillée", "Augmente considérablement le temps de soin des survivants touchés.");
INSERT INTO addon(nom_a, descr_a) VALUES("Gravures de Ruine", "- Augmente modérément la vitesse de la tronçonneuse
- Augmente légèrement le temps de charge.");
INSERT INTO addon(nom_a, descr_a) VALUES("Guide du tuning pour carburateur", "- Réduit modérément le temps de charge
- Réduit légèrement le temps de recharge de la compétence
- Réduit légèrement la pénalité de collision
- Réduit légèrement le bruit.");
INSERT INTO addon(nom_a, descr_a) VALUES("Châssis léger", "- Réduit légèrement la portée
- Réduit considérablement la pénalité de collision.");
INSERT INTO addon(nom_a, descr_a) VALUES("Le mélange de Thomson", "- Réduit considérablement le temps de recharge de la compétence
- Réduit légèrement le temps de charge.");
INSERT INTO addon(nom_a, descr_a) VALUES("Chaîne polluée", "- Réduit légèrement la vitesse de réparation des survivants touchés
- Augmente considérablement le temps de soin des survivants touchés.");
INSERT INTO addon(nom_a, descr_a) VALUES("Alcool de contrebande de Thomson", "- Augmente énormément la capacité à changer de direction
- Augmente considérablement la pénalité de collision.");
-- Carter's Spark
-- INSERT INTO addon(nom_a, descr_a) VALUES("", "");
-- Spencer's Last Breath
-- INSERT INTO addon(nom_a, descr_a) VALUES("", "");
-- Wailing Bell
INSERT INTO addon(nom_a, descr_a) VALUES("Guerrier aveugle - Suie", "Augmente légèrement la résistance à la lumière.");
INSERT INTO addon(nom_a, descr_a) VALUES("Coup d’œil - Suie", "Réduit légèrement la vitesse de disparition.");
INSERT INTO addon(nom_a, descr_a) VALUES("Battant en os", "Réduit légèrement la portée du bruit de la cloche.");
INSERT INTO addon(nom_a, descr_a) VALUES("Chasse rapide - Boue", "Réduit légèrement le temps de disparition.");
INSERT INTO addon(nom_a, descr_a) VALUES("Omniscient - Boue", "En étant invisible, fait apparaitre l'aura des survivants dans les 4 mètres.");
INSERT INTO addon(nom_a, descr_a) VALUES("Guerrier aveugle - Boue", "Augmente modérément la résistance à la lumière.");
INSERT INTO addon(nom_a, descr_a) VALUES("Coup d'oeil - Boue", "Réduit modérément le temps de disparition.");
INSERT INTO addon(nom_a, descr_a) VALUES("Tempête - Suie", "Bonus de vitesse durant 0.5 secondes à la réapparition.");
INSERT INTO addon(nom_a, descr_a) VALUES("Chasse rapide - Boue", "Réduit modérément le temps de disparition.");
INSERT INTO addon(nom_a, descr_a) VALUES("Battant archaïque", "Réduit modérément la portée du bruit de la cloche.");
INSERT INTO addon(nom_a, descr_a) VALUES("Chasse rapide - Blanc", "Réduit considérablement le temps de disparition.");
INSERT INTO addon(nom_a, descr_a) VALUES("Le fantôme - Suie", "- En étant immobile, confère l'état 'discret' au moment de réapparaitre
- L'état discret réduit la zone de terreur à 0 mètres jusqu'au prochain mouvement.");
INSERT INTO addon(nom_a, descr_a) VALUES("Tempête - Boue", "Bonus de vitesse durant 1 seconde à la réapparition.");
INSERT INTO addon(nom_a, descr_a) VALUES("Omniscient - Blanc", "En étant invisible, fait apparaitre l'aura des survivants dans les 6 mètres.");
INSERT INTO addon(nom_a, descr_a) VALUES("Guerrier aveugle - Blanc", "Augmente considérablement la résistance à la lumière.");
INSERT INTO addon(nom_a, descr_a) VALUES("Omniscient - Sang", "En étant invisible, fait apparaitre l'aura des survivants dans les 8 mètres.");
INSERT INTO addon(nom_a, descr_a) VALUES("Guerrier aveugle - Sang", "Augmente énormément la résistance à la lumière.");
INSERT INTO addon(nom_a, descr_a) VALUES("Tempête - Sang", "Bonus de vitesse durant 1,5 secondes à la réapparition.");
INSERT INTO addon(nom_a, descr_a) VALUES("Omniscient - Esprit", "En étant invisible, fait apparaitre l'aura des survivants dans les 10 mètres.");
INSERT INTO addon(nom_a, descr_a) VALUES("Guerrier aveugle - Esprit", "Immunité à la lumière.");
-- Bear Trap
INSERT INTO addon(nom_a, descr_a) VALUES("Mâchoires dentées", "Inflige un lourd effet de saignement.");
INSERT INTO addon(nom_a, descr_a) VALUES("Puissant ressort hélicoïdal", "- Augmente légèrement la difficulté pour se libérer du piège
- Augmente légèrement le temps de sauvetage
- Augmente légèrement le temps de pose.");
INSERT INTO addon(nom_a, descr_a) VALUES("Gants de trappeur", "Réduit légèrement le temps de pose.");
INSERT INTO addon(nom_a, descr_a) VALUES("Teinture à bois", "Assombrit modérément les pièges.");
INSERT INTO addon(nom_a, descr_a) VALUES("Ressort secondaire", "Augmente modérément le temps nécessaire au sabotage.");
INSERT INTO addon(nom_a, descr_a) VALUES("Sac de Piégeur", "Commence la partie avec 2 pièges.");
INSERT INTO addon(nom_a, descr_a) VALUES("Bloc de cire", "Réduit modérément la zone de succès des tests d'habileté du sabotage.");
INSERT INTO addon(nom_a, descr_a) VALUES("Kit de 4 ressorts hélicoïdaux", "- Augmente modérément la difficulté pour se libérer du piège
- Augmente modérément le temps de sauvetage
- Augmente légèrement le temps de pose.");
INSERT INTO addon(nom_a, descr_a) VALUES("Piégeurs", "Réduit modérément le temps de pose.");
INSERT INTO addon(nom_a, descr_a) VALUES("Outil de fixation", "- Augmente modérément le temps de sabotage
- Augmente modérément le temps de désactivation
- Augmente légèrement le temps de pose
- Réduit légèrement la zone de succès des tests d'habileté.");
INSERT INTO addon(nom_a, descr_a) VALUES("Outil de réglage", "Réduit considérablement le temps de pose.");
INSERT INTO addon(nom_a, descr_a) VALUES("Bouteille de goudron", "Assombrit considérablement le pièges.");
INSERT INTO addon(nom_a, descr_a) VALUES("Ressort huileux", "- Augmente modérément le temps de sabotage
- Réduit légèrement la zone de succès des tests d'habileté.");
INSERT INTO addon(nom_a, descr_a) VALUES("Mâchoires rouillées", "- Augmente modérément le temps nécessaire pour se soigner
- Réduit légèrement le temps de sabotage.");
INSERT INTO addon(nom_a, descr_a) VALUES("Pierre à polir", "50% de chance d'infliger l'état critique.");
INSERT INTO addon(nom_a, descr_a) VALUES("Ressort ensanglanté", "- Augmente énormément le temps de sabotage
- Augmente légèrement le temps de pose
- Réduit modérément la zone de succès des tests d’habileté.");
INSERT INTO addon(nom_a, descr_a) VALUES("Sac cousu", "Commence la partie avec 3 pièges.");
INSERT INTO addon(nom_a, descr_a) VALUES("Pierre en diamant", "Inflige l'état critique.");

-- LES PERSONNAGES
-- SURVIVANTS
INSERT INTO personnage(prenom, nom, histoire) VALUES("Ace", "Visconti", "Ace est un arnaqueur hors-pair capable de se tirer de presque toutes les situations périlleuses. Mais a-t-il ce qu'il faut pour échapper à tous ces Tueurs sadiques ? Rien n'est moins sûr, même si ses compétences lui seront d'une grande aide.");
INSERT INTO personnage(prenom, nom, histoire) VALUES("Meg", "Thomas", "En tant qu'ancienne athlète, Meg espère bien s'en tirer en mettant à profit ses compétences physiques.");
INSERT INTO personnage(prenom, nom, histoire) VALUES("Feng", "Min", "Véritable PGM, Feng Min à fait de la maîtrise des jeux vidéo son seul but dans la vie, délaissant au passage tout qui qui aurait pu lui permettre de tisser des liens avec les personne ayant croisé sa route.");
INSERT INTO personnage(prenom, nom, histoire) VALUES("Nea", "Karlsson", "Depuis son plus jeune age, Nea est une dure à cuir habituée aux petits délits et autres actes de provocation, un état de fait qui lui à valu de nombreux problèmes avec les autorités.");
INSERT INTO personnage(prenom, nom, histoire) VALUES("Dwight", "Fairfield", "Maltraité tout au long de sa vie, Dwight à l'occasion de briller lors des horribles évènements narrés dans le jeu.");
INSERT INTO personnage(prenom, nom, histoire) VALUES("Claudette", "Morel", "Claudette est une spécialiste des plantes et pourra compter sur ses compétences hors du commun.");
INSERT INTO personnage(prenom, nom, histoire) VALUES("Jake", "Park", "Gosse de riche, Jake n'a jamais eu le volonté de marcher sur les traces de son père et à préféré vivre à sa façon dans la forêt.");
-- TUEURS
INSERT INTO personnage(prenom, nom, histoire) VALUES("Lisa", "Sherwood", "La Harpie est une Tueuse un peu particulière, ses capacités spéciales étant principalement portées sur la malédiction et l'envoûtement des totems réduisant considérablement les capacités des survivants.");
INSERT INTO personnage(prenom, nom, histoire) VALUES("Max Jr.", "Thompson", "Tout droit sorti de la Colline à des yeux, Le Montagnard est capable de pourchasser rapidement ses proies avant de leur infliger de graves blessures avec sa tronçonneuse.");
INSERT INTO personnage(prenom, nom, histoire) VALUES("Herman", "Carter", "Le Docteur est un adepte de la thérapie par chocs électriques. Une technique qu'il se plait à appliquer sur ses victimes jusqu’à ce qu'elles sombrent dans la folie.");
INSERT INTO personnage(prenom, nom, histoire) VALUES("Sally", "Smithson", "Hantée par des fragments de son passé, l'Infirmière est capable de repérer à très grande distance les soins apportés aux blessés par les Survivants. Cette compétence en fait une pisteuses hors pair.");
INSERT INTO personnage(prenom, nom, histoire) VALUES("Philip", "Ojomo", "Le Spectre est un Tueur spécialisé dans la furtivité capable d'apparaitre et de disparaitre à volonté grâce à sa cloche d’Invisibilité.");
INSERT INTO personnage(prenom, nom, histoire) VALUES("Evan", "MacMilan", "Le Piégeur est un tueur spécialisé dans la pose de pièges lui permettant d'immobiliser facilement ses proies.");

-- LES SURVIVANTS
INSERT INTO survivant(id_perso) VALUES(1);
INSERT INTO survivant(id_perso) VALUES(2);
INSERT INTO survivant(id_perso) VALUES(3);
INSERT INTO survivant(id_perso) VALUES(4);
INSERT INTO survivant(id_perso) VALUES(5);
INSERT INTO survivant(id_perso) VALUES(6);
INSERT INTO survivant(id_perso) VALUES(7);

-- LES TUEURS
INSERT INTO tueur(id_perso, surnom) VALUES(8, "The Hag");
INSERT INTO tueur(id_perso, surnom) VALUES(9, "The Hillbilly");
INSERT INTO tueur(id_perso, surnom) VALUES(10, "The Doctor");
INSERT INTO tueur(id_perso, surnom) VALUES(11, "The Nurse");
INSERT INTO tueur(id_perso, surnom) VALUES(12, "The Wraith");
INSERT INTO tueur(id_perso, surnom) VALUES(13, "The Trapper");

-- LES POUVOIRS
INSERT INTO pouvoir(nom_po, descr_po, id_perso) VALUES("Blackened Catalyst", "Catalyseur Noirci. Permet de faire apparaitre jusqu'à 10 pièges fantomatiques. Au déclenchement d'un piège, la Harpie peut se téléporter directement sur les lieux dans un rayon de 32 mètres. Les pièges font également apparaitre une copie de la Harpie pouvant désorienter les survivants et les laisser vulnérables à une embuscade.", 8);
INSERT INTO pouvoir(nom_po, descr_po, id_perso) VALUES("The Chainsaw", "Tronçonneuse. Vous vous lancez dans un long sprint , il est plus difficile de changer de trajectoire mais toucher un survivant le mettra automatiquement dans état critique. Foncer dans un mur vous étourdira, mais vous pouvez rapidement détruire les barricades durant la course.", 9);
INSERT INTO pouvoir(nom_po, descr_po, id_perso) VALUES("Carter's Spark", "L'étincelle de Carter. Permet d'utiliser les modes 'Traitement' et 'Punition'. En mode 'Punition' le Docteur peut accomplir les actions de base des Tueurs.
En mode 'Traitement', le Docteur est plus lent mais il génère un champ électrique autour de lui infligeant un effet de folie aux survivants, plus ceux-ci sont proches, plus l'effet est important. Il peut également déclencher un arc électrique à distance augmentant cet effet.
Folie I = Les survivants hurlent, révélant leur position.
Folie II = Les survivant hurlent et souffrent d'hallucinations, voyant le docteur là où il n'est pas. Le Docteur peut repérer les auras avec le bon accessoire équipé.
Folie III = Les survivant hurlent et souffrent d'hallucinations, voyant parfois le docteur entouré d'une aura amicale. Ils ne peuvent plus appliquer de soins, réparer les générateurs ou saboter les crochets avant de sortir de cet état.", 10);
INSERT INTO pouvoir(nom_po, descr_po, id_perso) VALUES("Spencer's Last Breath", "Dernier souffle de Spencer. Vous permet de vous téléporter jusqu'à deux fois de suite. Maintenir la charge vous permet de vous téléporter sur de plus longues distances. Vous pouvez attaquer dans la seconde suivant la fin du déplacement. A la fin de chaque téléportation, vous êtes étourdit pendant quelques secondes, si vous vous téléportez deux fois, l'étourdissement est plus long.", 11);
INSERT INTO pouvoir(nom_po, descr_po, id_perso) VALUES("Wailing Bell", "Cloche des Lamentations. Vous rend presque totalement invisible, les survivants ne peuvent plus entendre vos battements de cœur et vous bougez plus rapidement. Vous ne pouvez pas attaquer ou interagir avec des objets en étant invisible.", 12);
INSERT INTO pouvoir(nom_po, descr_po, id_perso) VALUES("Bear Trap", "Piège à ours. Le Piégeur peut poser des pièges à ours pour immobiliser et blesser les survivants. Il commence la partie avec 1 piège et peut en récupérer 5 autres sur la carte. Le Piégeur peut être bloqué par ses propres pièges.", 13);

-- LES ITEMS
INSERT INTO item(nom_i, descr_i) VALUES("Flashlight", "La lampe de poche est un objet utilisé pour aveugler le tueur. S'il porte un survivant sur son épaule, être aveuglé le fera lâcher ce survivant et le tueur sera étourdi pendant quelques secondes.");
INSERT INTO item(nom_i, descr_i) VALUES("Key", "La clé est un élément qui peut être utilisé pour ouvrir la trappe lorsqu'elle apparaît. Ses addons pourront améliorer sa puissance et montrer à l'utilisateur différents auras, tels que ceux des autres survivants dans leur entourage ou celui du tueur. La clé cassée ne peut pas être utilisée pour ouvrir la trappe et ne sert à rien sans addon.");
INSERT INTO item(nom_i, descr_i) VALUES("Map", "La carte est un objet qui est utilisé pour suivre et signaler des objets sur le terrain. La carte standard ne peut montrer que l'aura des générateurs environnants, mais le survivant peut également suivre divers objets comme les hooks ou les coffres en utilisant des addons qui améliorent la portée de la carte. Vous pourrez même rendre leur aura visible aux autres survivants et créer des marqueurs qui ressemblent à un pilier de lumière vive.");
INSERT INTO item(nom_i, descr_i) VALUES("Med-kit", "La trousse médicale de survie est un objet qui est utilisé pour soigner vous-même et les autres survivants. Vous pourrez soignez les autres sans utiliser un kit médical, mais cela prend beaucoup plus de temps. Sans l'utilisation d'un perk de Soin Personnel ou de cet item, un survivant ne peut pas se guérir soi-même. Différents addons peuvent être équipés pour améliorer sa vitesse de guérison ou sa durabilité.");
INSERT INTO item(nom_i, descr_i) VALUES("Toolbox", "La boîte à outils est utilisée pour réparer les générateurs plus rapidement ou saboter les hooks où le tueur accroche les survivants, auquel cas le hook est inutilisable pendant un certain temps. Les différentes boîtes à outils ont des utilisations différentes et toutes ne sont pas bonnes pour les deux utilisations. Les addons amélioreront leur vitesse et leur durabilité.");
INSERT INTO item(nom_i, descr_i) VALUES("Firecracker", "Feux d'artifice. Ils peuvent être utilisés pour aveugler, assourdir et assommer un tueur, s'ils explosent assez près d'eux. Ils sont à usage unique seulement.");

-- LES OFFRANDES
-- Des survivants
INSERT INTO offrande(nom_o, descr_o) VALUES("Sachet de Laurier", "Augmente le gain de bloodpoints de 50% dans la catégorie Objectif.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Sachet d'Amaranthe", "Augmente le gain de bloodpoints de 50% dans la catégorie Survie.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Sachet de Primevère", "Augmente le gain de bloodpoints de 50% dans la catégorie Altruisme.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Sachet de Sweet William", "Augmente le gain de bloodpoints de 50% dans la catégorie Courage.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Laurier frais", "Augmente le gain de bloodpoints de 75% dans la catégorie Objectif.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Amaranthe fraîche", "Augmente le gain de bloodpoints de 75% dans la catégorie Survie.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Primevère fraîche", "Augmente le gain de bloodpoints de 75% dans la catégorie Altruisme.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Sweet William fraîche", "Augmente le gain de bloodpoints de 75% dans la catégorie Courage.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Parfum Laurier", "Augmente le gain de bloodpoints de 100% dans la catégorie Objectif.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Parfum Amaranthe", "Augmente le gain de bloodpoints de 100% dans la catégorie Survie.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Parfum Primevère", "Augmente le gain de bloodpoints de 100% dans la catégorie Altruisme.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Parfum Sweet William", "Augmente le gain de bloodpoints de 100% dans la catégorie Courage.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Enveloppe", "Accorde un bonus de 25% dans chaque catégorie. Personnel.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Enveloppe reliée", "Accorde un bonus de 25% dans chaque catégorie à tous les survivants.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Escape! Cake", "Accorde un bonus de 100% dans toutes les catégories. Personnel.");
-- Des tueurs
INSERT INTO offrande(nom_o, descr_o) VALUES("Couronne de Thraupidae", "Accorde un bonus de 50% dans la catégorie Brutalité.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Couronne de Corbeau", "Accorde un bonus de 50% dans la catégorie Sournoiserie.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Couronne de Chouette", "Accorde un bonus de 50% dans la catégorie Chasse.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Couronne de Pie", "Accorde un bonus de 50% dans la catégorie Sacrifice.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Relique de couronne de Thraupidae", "Accorde un bonus de 75% dans la catégorie Brutalité.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Relique de couronne de Corbeau", "Accorde un bonus de 75% dans la catégorie Sournoiserie.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Relique de couronne de Chouette", "Accorde un bonus de 75% dans la catégorie Chasse.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Relique de couronne de Pie", "Accorde un bonus de 75% dans la catégorie Sacrifice.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Couronne Ardente de Thraupidae", "Accorde un bonus de 100% dans la catégorie Brutalité.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Couronne Ardente de Corbeau", "Accorde un bonus de 100% dans la catégorie Sournoiserie.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Couronne Ardente de Chouette", "Accorde un bonus de 100% dans la catégorie Chasse.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Couronne Ardente de Pie", "Accorde un bonus de 100% dans la catégorie Sacrifice.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Coquillage sacré", "Accorde un bonus de 25% dans toutes les catégories. Personnel.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Pudding de survivant", "Accorde un bonus de 100% dans toutes les catégories. Personnel.");
INSERT INTO offrande(nom_o, descr_o) VALUES("Serpentins sanglants", "Accorde un bonus de 100% dans toutes les catégories. Tous les joueurs.");

-- LES PERKS DES SURVIVANTS
-- Ace Visconti
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Ace in The Hole", "En récupérant un objet dans un coffre, vous avez 50% de chance d'obtenir également un accessoire inhabituel/rare/très rare.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Open Handed", "Le Coeur Sur La Main. Augmente la portée de repérage d'auras de 4/6/8 mètres.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Up The Ante", "Augmenter La Mise. Pour chaque survivant encore en vie, confère un bonus de chance de 1/2/3% à tous les autres joueurs.", 1);
-- Meg Thomas
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Adrenaline", "Adrénaline. Vos blessures sont instantanément soignées et vous courez 150% plus vite que la normale pendant 3/5/5 secondes au moment où les portes de sorties sont alimentées. Annule les effets d'épuisement précédemment appliqués mais, provoque un épuisement de 60 secondes à la fin de l'effet.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Quick & Quiet", "Rapide & Silencieux. Vous ne faites pas autant de bruit que les autres survivants. La portée de détection des actions comme se cacher dans un placard ou passer par-dessus un obstacle est réduite de 100%. Cet effet peut être activé toutes les 30 secondes.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Sprint Burst", "Course Effrénée. Vous sprintez 150% plus vite pendant 3 secondes. Provoque un effet d'épuisement pendant 60/50/40 secondes à la fin de la course.", 1);
-- Feng Min
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Alert", "Vigilance. Si le tueur détruit une barricade ou endommage un générateur dans un rayon de 12/24/36 mètres, son aura vous est révélée pendant 6 secondes. Peut être activé toutes les 60/45/30 secondes.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Lithe", "Souplesse. Durant une chasse, vous sprintez à 150% de la vitesse normale  pendant 3 secondes après être passé par-dessus un obstacle. Provoque un effet d'épuisement pendant 60/50/40 secondes.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Technician", "Technicien. Les bruits provoqués par vos réparations et la distance à laquelle ils peuvent être entendus sont réduits de 0/4/8 mètres. Si vous échouez à un test d'habileté, il y a 30/40/50% de chance d'éviter une explosion.", 1);
-- Nea Karlsson
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Balanced Landing", "Aterrissage Équilibré. Quand la compétence est active, réduit les dégâts de chute de 50/75/75%. A l'atterrissage, permet de sprinter à 0/0/150% de la vitesse normale. Provoque en effet d'épuisement pendant 40 secondes.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Streetwise", "Ad Augusta Per Angusta. Réduit la consommation de charge des objets de 10/12/15% pour vous et vos compagnons dans un rayon de 8 mètres.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Urban Evasion", "Évasion Urbaine. Indemne, augmente la vitesse de déplacement en position accroupie de 40/45/50%.", 1);
-- Dwight Fairfield
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Bound", "Lien. L'aura des alliés vous est révélée dans un rayon de 12/24/36 mètres.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Leader", "Meneur. Quand ils se trouvent dans un rayon de 8 mètres, la vitesse d'interaction des autres survivants augmente de 3/6/9%.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Prove Thyself", "Montrez ce que vous savez faire : Vous recevez un bonus de vitesse aux interactions lorsque des survivants se trouvent dans un rayon de 8 mètres.
1 survivant = Bonus de 1/2/3%.
2 survivants = Bonus de 2/4/6%.
3 survivants = Bonus de 3/6/9%.", 1);
-- Claudette Morel
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Empathy", "Empathie. Révèle l'aura des alliés blessés ou en état critique dans un rayon de 32m/64m/illimité. Ne révèle pas les auras des alliés en contact direct avec le Tueur.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Botany Knowledge", "Connaissances en botanique. Augmente la vitesse des soins de 10/15/20% et l'efficacité des objets de soin de 10/15/20%.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Self-Care", "Auto-soins. Vous pouvez vous soigner sans kit de soin à 30/40/50% de la vitesse normale. Dans ce contexte, les tests d'habileté ont une zone de réussite réduite de 20/10/0%. Augmente l'efficacité des objets de soin utilisés sur soi de 50/75/100%.", 1);
-- Jake Park
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Iron Will", "Volonté de fer. Les gémissements de douleur causés par les blessures sont réduits de 50/100/100% en étant immobile/immobile/en mouvement.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Calm Spirit", "Esprit calme. Réduit la probabilité d'alerter les animaux de 80/90/100%.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Saboteur", "Saboteur. Permet de saboter sans boite à outils à 30/40/50% de la vitesse normale. Dans ce contexte, les tests d'habileté ont une zone de réussite réduite de 20/10/0%. Augmente l'efficacité du sabotage avec une boite à outils de 50/75/100%.", 1);
-- LES PERKS DES TUEURS
-- The Hag
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Hex: The Third Seal", "Sort: Le Troisième Sceau. Un sort qui gêne la capacité de lecture d'Aura. Frapper un Survivant pendant que le Totem Hex est actif réduit l'efficacité de sa capacité de lecture d'Aura de 100%. Cet effet s'applique aux 2/3/4 derniers survivants touchés.
Les effets Hex persistent tant que le Totem Hex lié est debout.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Hex: Ruin", "Sort: Ruine. Un sort qui affecte les compétences des Survivants dans la réparation de générateurs. Les 2/3/4 derniers survivants touchés sont affectés par Ruine, ce qui entraîne une régression de 5% pour chaque test d'habileté normal sur le générateur et 0% de progression pour un test d'habileté réussi.
Les effets Hex persistent tant que le Totem Hex lié est debout.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Hex: Devour Hope", "Sort: Mangeur D'Espoir. Un sort qui base son pouvoir sur l'espoir. Le faux espoir des survivants enflamment votre faim. Quand un survivant est sauvé d'un crochet à au moins 24 mètres, Devour Hope reçoit un jeton.
2 jetons: - / - / Gagnez 5% d'accélération pendentif 10 secondes après avoir suspendu un Survivant.
3 Jetons: - / Vos attaques infligent automatiquement un état critique. / Vos attaques infligent automatiquement un état critique.
5 jetons: Confère la possibilité de tuer les Survivants de vos propres mains.
Les effets Hex persistent tant que le Totem Hex lié est debout.", 1);
-- Hillbilly
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Enduring", "Tenace. Vous êtes résistant à la douleur. Votre taux de récupération des étourdissements est augmenté de 50/60/75%.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Lightborn", "Résistance À La Lumière. Contrairement aux autres bêtes du brouillard, vous vous êtes adapté à la lumière. La résistance à l'aveuglement est augmentée de 20/40/60%. Le rétablissement de l'aveuglement est augmenté de 50%.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Tinkerer", "Réparateur. Les accessoires qui affectent le temps de charge de votre pouvoir sont 6/8/10 % plus efficaces.", 1);
-- The Doctor
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Overwhelming Presence", "Présence Écrasante. Votre présence seule suscite une grande peur. Les survivants dans votre rayon de terreur souffrent d'inefficacité. Les taux de consommation des objets de Survie touchés sont augmentés de 80/90/100%", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Monitor & Abuse", "Surveillance Et Maltraitance. Méticuleux dans votre approche, terrifiant dans votre application. Pendant une poursuite, votre rayon de terreur est augmenté de 6/7/8 mètres mètres. Sinon votre rayon de terreur est diminué de 6/7/8 mètres et votre champ de vision est légèrement / modérément / considérablement augmenté. Les gains du champ de vision ne s'additionnent pas.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Overcharge", "Surcharge. Vous êtes alimenté par votre haine du progrès. Surchargez un générateur en exécutant l'action Endommager un générateur.
Le prochain Survivant intéragissant avec ce Générateur est confronté à un test d'habileté modérément / considérablement / énormément difficile. Si la vérification des compétences échoue, une régression supplémentaire de 3/4/5% est générée.", 1);
-- The Nurse
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Stridor", "Stridor. Vous êtes extrêmement sensible à la respiration de votre proie. La respiration des survivants en difficulté est 25/50/50 % plus forte et la respiration normale est 0/0/25 % plus forte.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Thanatophobia", "Thanatophobie. Leur courage disparaît à leur inéluctable tépas. Tous les survivants reçoivent des pénalités de réparation, soins et sabotage pour chaque survivant blessé, mourrant ou suspendu au crochet.
1 survivant blessé, mourant ou suspendu au crochet : 4/5/6 % de vitesse réduite.
2 survivant blessé, mourant ou suspendu au crochet : 7/8/9 % de vitesse réduite.
3 survivant blessé, mourant ou suspendu au crochet : 10/11/12 % de vitesse réduite.
4 survivant blessé, mourant ou suspendu au crochet : 13/14/15 % de vitesse réduite.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("A Nurse's Calling", "Vocation De L'Infirmière. Débloque une capacité de repérage d'auras. Les Auras des Survivants qui donnent des soins ou en reçoivent vous sont révélées dans un rayon de 20/24/28 mètres.", 1);
-- The Wraith
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Predator", "Prédateur. Votre capacité de pistage développée vous permet de suivre les traces laissées par des proies sur une plus longue période. Les empreintes restent visibles 1/2/3 secondes de plus que la normale.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Bloodhound", "Chien De Sang. Tel un chien de chasse, vous flairez les traces de sang à grande distance. Les traces de sang frais sont légèrement/modérément/considérablement visibles et peuvent être suivies pendant 2/3/4 secondes de plus que la normale.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Shadowborn", "Résistance À L'Obscurité. Vous avez une vue perçante dans l'obscurité. Votre champ de vision est 25/30/35 % supérieur à la normale.", 1);
-- The Trapper
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Unnerving Presence", "Présence Perturbante. Votre seule présence inspire la peur. Les Survivants se trouvent dans votre Rayon de Terreur ont 6/8/10 % de chances supplémentaires d'activer des tests d'habileté lors des réparations, soins et sabotages. Les zones de succès sont réduites de 40/50/60 %.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Brutal Strength", "Force Brute. Votre force immense vous permet de broyer les défenses de vos proies. Détruisez les Barricades 10/15/20 % plus vite.", 1);
INSERT INTO perk(nom_p, descr_p, teachable_p) VALUES("Agitation", "Excitation. Vous êtes tout excité à l'idée de suspendre votre proie. Augmente votre vitesse quand vous transportez un corps de 6/12/18 %. Pendant le transport du corps, votre Rayon de Terreur augmente de 6/8/12 mètres.", 1);

-- LES PERKS "SURVIVANTS"
-- Ace Visconti
INSERT INTO perk_s(id_p) VALUES(1);
INSERT INTO perk_s(id_p) VALUES(2);
INSERT INTO perk_s(id_p) VALUES(3);
-- Meg Thomas
INSERT INTO perk_s(id_p) VALUES(4);
INSERT INTO perk_s(id_p) VALUES(5);
INSERT INTO perk_s(id_p) VALUES(6);
-- Feng Min
INSERT INTO perk_s(id_p) VALUES(7);
INSERT INTO perk_s(id_p) VALUES(8);
INSERT INTO perk_s(id_p) VALUES(9);
-- Nea Karlsson
INSERT INTO perk_s(id_p) VALUES(10);
INSERT INTO perk_s(id_p) VALUES(11);
INSERT INTO perk_s(id_p) VALUES(12);
-- Dwight Fairfield
INSERT INTO perk_s(id_p) VALUES(13);
INSERT INTO perk_s(id_p) VALUES(14);
INSERT INTO perk_s(id_p) VALUES(15);
-- Claudette Morel
INSERT INTO perk_s(id_p) VALUES(16);
INSERT INTO perk_s(id_p) VALUES(17);
INSERT INTO perk_s(id_p) VALUES(18);
-- Jake Park
INSERT INTO perk_s(id_p) VALUES(19);
INSERT INTO perk_s(id_p) VALUES(20);
INSERT INTO perk_s(id_p) VALUES(21);

-- LES PERKS "TUEURS"
-- The Hag
INSERT INTO perk_t(id_p) VALUES(22);
INSERT INTO perk_t(id_p) VALUES(23);
INSERT INTO perk_t(id_p) VALUES(24);
-- Hillbilly
INSERT INTO perk_t(id_p) VALUES(25);
INSERT INTO perk_t(id_p) VALUES(26);
INSERT INTO perk_t(id_p) VALUES(27);
-- The Doctor
INSERT INTO perk_t(id_p) VALUES(28);
INSERT INTO perk_t(id_p) VALUES(29);
INSERT INTO perk_t(id_p) VALUES(30);
-- The Nurse
INSERT INTO perk_t(id_p) VALUES(31);
INSERT INTO perk_t(id_p) VALUES(32);
INSERT INTO perk_t(id_p) VALUES(33);
-- The Wraith
INSERT INTO perk_t(id_p) VALUES(34);
INSERT INTO perk_t(id_p) VALUES(35);
INSERT INTO perk_t(id_p) VALUES(36);
-- The Trapper
INSERT INTO perk_t(id_p) VALUES(37);
INSERT INTO perk_t(id_p) VALUES(38);
INSERT INTO perk_t(id_p) VALUES(39);

-- ASSOCIATIONS ITEM-ADDONs
-- flashlight et ses addons
INSERT INTO addon_i(id_addon, id_i) VALUES(1, 1);
INSERT INTO addon_i(id_addon, id_i) VALUES(2, 1);
INSERT INTO addon_i(id_addon, id_i) VALUES(3, 1);
INSERT INTO addon_i(id_addon, id_i) VALUES(4, 1);
-- key et ses addons
INSERT INTO addon_i(id_addon, id_i) VALUES(5, 2);
INSERT INTO addon_i(id_addon, id_i) VALUES(6, 2);
INSERT INTO addon_i(id_addon, id_i) VALUES(7, 2);
INSERT INTO addon_i(id_addon, id_i) VALUES(8, 2);
INSERT INTO addon_i(id_addon, id_i) VALUES(9, 2);
INSERT INTO addon_i(id_addon, id_i) VALUES(10, 2);
INSERT INTO addon_i(id_addon, id_i) VALUES(11, 2);
INSERT INTO addon_i(id_addon, id_i) VALUES(12, 2);
-- map et ses addons
INSERT INTO addon_i(id_addon, id_i) VALUES(13, 3);
INSERT INTO addon_i(id_addon, id_i) VALUES(14, 3);
INSERT INTO addon_i(id_addon, id_i) VALUES(15, 3);
INSERT INTO addon_i(id_addon, id_i) VALUES(16, 3);
INSERT INTO addon_i(id_addon, id_i) VALUES(17, 3);
INSERT INTO addon_i(id_addon, id_i) VALUES(18, 3);
INSERT INTO addon_i(id_addon, id_i) VALUES(19, 3);
INSERT INTO addon_i(id_addon, id_i) VALUES(20, 3);
INSERT INTO addon_i(id_addon, id_i) VALUES(21, 3);
-- med-kit et ses addons
INSERT INTO addon_i(id_addon, id_i) VALUES(22, 4);
INSERT INTO addon_i(id_addon, id_i) VALUES(23, 4);
INSERT INTO addon_i(id_addon, id_i) VALUES(24, 4);
INSERT INTO addon_i(id_addon, id_i) VALUES(25, 4);
INSERT INTO addon_i(id_addon, id_i) VALUES(26, 4);
INSERT INTO addon_i(id_addon, id_i) VALUES(27, 4);
INSERT INTO addon_i(id_addon, id_i) VALUES(28, 4);
INSERT INTO addon_i(id_addon, id_i) VALUES(29, 4);
INSERT INTO addon_i(id_addon, id_i) VALUES(30, 4);
INSERT INTO addon_i(id_addon, id_i) VALUES(31, 4);
INSERT INTO addon_i(id_addon, id_i) VALUES(32, 4);
-- toolbox et ses addons
INSERT INTO addon_i(id_addon, id_i) VALUES(33, 5);
INSERT INTO addon_i(id_addon, id_i) VALUES(34, 5);
INSERT INTO addon_i(id_addon, id_i) VALUES(35, 5);
INSERT INTO addon_i(id_addon, id_i) VALUES(36, 5);
INSERT INTO addon_i(id_addon, id_i) VALUES(37, 5);
INSERT INTO addon_i(id_addon, id_i) VALUES(38, 5);
INSERT INTO addon_i(id_addon, id_i) VALUES(39, 5);
INSERT INTO addon_i(id_addon, id_i) VALUES(40, 5);
INSERT INTO addon_i(id_addon, id_i) VALUES(41, 5);
INSERT INTO addon_i(id_addon, id_i) VALUES(42, 5);
INSERT INTO addon_i(id_addon, id_i) VALUES(43, 5);

-- ASSOCIATIONS POUVOIR-ADDONs
-- BLACKENED CATALYST et ses addons
INSERT INTO addon_p(id_addon, id_po) VALUES(44, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(45, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(46, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(47, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(48, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(49, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(50, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(51, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(52, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(53, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(54, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(55, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(56, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(57, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(58, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(59, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(60, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(61, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(62, 1);
INSERT INTO addon_p(id_addon, id_po) VALUES(63, 1);
-- THE CHAIN SAW et ses addons
INSERT INTO addon_p(id_addon, id_po) VALUES(64, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(65, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(66, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(67, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(68, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(69, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(70, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(71, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(72, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(73, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(74, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(75, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(76, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(77, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(78, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(79, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(80, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(81, 2);
INSERT INTO addon_p(id_addon, id_po) VALUES(82, 2);
-- CARTER'S SPARK et ses addons
-- INSERT INTO addon_p(id_addon, id_po) VALUES(, 3);
-- SPENCER'S LAST BREATH et ses addons
-- INSERT INTO addon_p(id_addon, id_po) VALUES(, 4);
-- THE WAILING BELL et ses addons
INSERT INTO addon_p(id_addon, id_po) VALUES(83, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(84, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(85, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(86, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(87, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(88, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(89, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(90, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(91, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(92, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(93, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(94, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(95, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(96, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(97, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(98, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(99, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(100, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(101, 5);
INSERT INTO addon_p(id_addon, id_po) VALUES(102, 5);
-- BEAR TRAP et ses addons
INSERT INTO addon_p(id_addon, id_po) VALUES(103, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(104, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(105, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(106, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(107, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(108, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(109, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(110, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(111, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(112, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(113, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(114, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(115, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(116, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(117, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(118, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(119, 6);
INSERT INTO addon_p(id_addon, id_po) VALUES(120, 6);

-- INSERT INTO l_survivant_item(id_perso, id_i) VALUES(, );

-- INSERT INTO l_survivant_offrande(id_perso, id_o) VALUES(, );

-- INSERT INTO l_tueur_offrande(id_o, id_perso) VALUES(, );

-- liens SURVIVANT-PERK
-- Ace Visconti
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(1, 1);
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(1, 2);
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(1, 3);
-- Meg Thomas
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(2, 4);
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(2, 5);
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(2, 6);
-- Feng Min
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(3, 7);
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(3, 8);
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(3, 9);
-- Nea Karlsson
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(4, 10);
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(4, 11);
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(4, 12);
-- Dwight Fairfield
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(5, 13);
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(5, 14);
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(5, 15);
-- Claudette Morel
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(6, 16);
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(6, 17);
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(6, 18);
-- Jake Park
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(7, 19);
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(7, 20);
INSERT INTO l_survivant_perks(id_perso, id_p) VALUES(7, 21);

-- liens TUEUR-PERK
-- The Hag
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(8, 22);
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(8, 23);
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(8, 24);
-- Hillbilly
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(9, 25);
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(9, 26);
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(9, 27);
-- The Doctor
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(10, 28);
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(10, 29);
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(10, 30);
-- The Nurse
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(11, 31);
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(11, 32);
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(11, 33);
-- The Wraith
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(12, 34);
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(12, 35);
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(12, 36);
-- The Trapper
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(13, 37);
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(13, 38);
INSERT INTO l_tueur_perkt(id_perso, id_p) VALUES(13, 39);
