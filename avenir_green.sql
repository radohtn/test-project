-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 06 mai 2020 à 06:21
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `avenir_green`
--

-- --------------------------------------------------------

--
-- Structure de la table `file`
--

DROP TABLE IF EXISTS `file`;
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8C9F3610166D1F9C` (`project_id`),
  KEY `IDX_8C9F36106BF700BD` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `file`
--

INSERT INTO `file` (`id`, `filename`, `project_id`, `status_id`) VALUES
(1, 'nom_du_fichier_9e8e7.pdf', NULL, 3),
(2, 'nom_du_fichier_3cc4.pdf', NULL, 3),
(3, 'nom_du_fichier_b40ac.pdf', 1, 1),
(6, 'nom_du_fichier_b4750.docs', 3, NULL),
(7, 'nom_du_fichier_cbe55.docs', 2, NULL),
(8, 'nom_du_fichier_cc23d.docs', NULL, 3),
(11, 'nom_du_fichier_80ef3.png', 3, NULL),
(12, 'nom_du_fichier_7e28.png', 1, NULL),
(13, 'nom_du_fichier_98210.png', NULL, 7),
(14, 'nom_du_fichier_48g1s.pdf', NULL, 5),
(15, 'nom_du_fichier_f2ds0.docs', NULL, 4);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200505104606', '2020-05-05 10:46:12'),
('20200505150150', '2020-05-05 15:02:27'),
('20200505171019', '2020-05-05 17:10:46');

-- --------------------------------------------------------

--
-- Structure de la table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `project`
--

INSERT INTO `project` (`id`, `name`, `logo_name`) VALUES
(1, 'Mon super projet', 'logo_5eb18101e4f43png'),
(2, 'Projet utile', 'logo_5eb1810f7070apng'),
(3, 'Un projet sans égale', 'logo_5eb1811e317b4png'),
(4, 'projet à la con', 'logo_5eb1812726c0bpng'),
(5, 'juste un projet', 'logo_5eb18132e3256png');

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `logo_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `status`
--

INSERT INTO `status` (`id`, `name`, `description`, `logo_name`) VALUES
(1, 'Brief', NULL, 'import_contacts-24px.svg'),
(2, 'Compréhension', NULL, 'people_alt-24px.svg'),
(3, 'Lancement', NULL, 'rocket-ship1.png'),
(4, 'En cours', NULL, 'speed-24px.svg'),
(5, 'Recette interne', NULL, 'account_balance-24px.svg'),
(6, 'En recette', NULL, 'euro_symbol-24px.svg'),
(7, 'Validé', NULL, 'emoji_events-24px.svg');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `FK_8C9F3610166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `FK_8C9F36106BF700BD` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
