-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Lun 23 Janvier 2017 à 21:15
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `mydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `idcontacts` int(11) NOT NULL,
  `users_idusers` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `titre` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `ville` varchar(25) NOT NULL,
  `pays` varchar(25) NOT NULL,
  `service` varchar(45) DEFAULT NULL,
  `departement` varchar(45) DEFAULT NULL,
  `entreprise` varchar(45) DEFAULT NULL,
  `comment` text NOT NULL,
  `type_contact` varchar(45) DEFAULT NULL,
  `user_link` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `date_modif` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `contacts`
--

INSERT INTO `contacts` (`idcontacts`, `users_idusers`, `nom`, `prenom`, `titre`, `phone`, `email`, `adresse`, `ville`, `pays`, `service`, `departement`, `entreprise`, `comment`, `type_contact`, `user_link`, `date_create`, `date_modif`) VALUES
(1, 1, 'Rakoto', 'Vao', 'Mr', '0330012300', 'vao@mail.com', 'Lot 123', 'Toliara', 'Madagascar', 'Système d\'Information', 'Secrétaire Général', 'MEPATE', 'Cette méthode est semblable', 'myVcard', 0, '2016-12-22 09:04:42', '2016-12-22 09:04:42'),
(2, 1, 'Ravao', 'Hita', 'Mr', '0343312300', 'hita@mail.com', 'Anosy', 'Antananarivo', 'Madagascar', 'DRH', 'SGA', 'MEPATE', 'No comment', 'myContact', 0, '2016-12-22 09:04:42', '2016-12-22 09:04:42');

-- --------------------------------------------------------

--
-- Structure de la table `files`
--

CREATE TABLE `files` (
  `idfiles` int(11) NOT NULL,
  `filename` text,
  `filetype` varchar(255) NOT NULL,
  `filesize` int(11) NOT NULL,
  `date_upload` datetime,
  `date_modif` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `files`
--

INSERT INTO `files` (`idfiles`, `filename`, `filetype`, `filesize`, `date_upload`, `date_modif`) VALUES
(1, 'sary.jpg', 'image/jpeg', 1230012, '2016-12-22 08:44:04', '2016-12-22 08:44:04'),
(2, 'doc.pdf', 'application/pdf', 541789, '2016-12-22 08:44:04', '2016-12-22 08:44:04');

-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

CREATE TABLE `groupes` (
  `idgroupes` int(11) NOT NULL,
  `nom_group` varchar(45) DEFAULT NULL,
  `infogroup` text NOT NULL,
  `comment` text NOT NULL,
  `type_group` varchar(45) DEFAULT NULL,
  `max_membre` int(11) DEFAULT NULL,
  `date_create` datetime NOT NULL,
  `date_modif` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `groupes`
--

INSERT INTO `groupes` (`idgroupes`, `nom_group`, `infogroup`, `comment`, `type_group`, `max_membre`, `date_create`, `date_modif`) VALUES
(1, 'goropy', 'goropy ohatra', 'goropy ohatry avao', 'public', 0, '2016-12-22 08:55:39', '2016-12-22 08:55:39');

-- --------------------------------------------------------

--
-- Structure de la table `groupes_has_contacts`
--

CREATE TABLE `groupes_has_contacts` (
  `groupes_idgroupes` int(11) NOT NULL,
  `contacts_idcontacts` int(11) NOT NULL,
  `date_share` datetime
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `groupes_has_files`
--

CREATE TABLE `groupes_has_files` (
  `groupes_idgroupes` int(11) NOT NULL,
  `files_idfiles` int(11) NOT NULL,
  `date_share` datetime
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `idmessages` int(11) NOT NULL,
  `sujet_msg` varchar(45) DEFAULT NULL,
  `contenu` text NOT NULL,
  `atach` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `date_send` datetime NOT NULL,
  `vue` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `messages`
--

INSERT INTO `messages` (`idmessages`, `sujet_msg`, `contenu`, `atach`, `size`, `date_send`, `vue`) VALUES
(1, 'slt', 'coucou', 'cv.docx', 2318976, '2017-01-17 03:16:15', 'NON'),
(2, 'bonjour', 'coucou', '', 3453633, '2016-12-22 14:34:45', 'NON');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `idsettings` int(11) NOT NULL,
  `users_idusers` int(11) NOT NULL,
  `lang` varchar(2) NOT NULL,
  `session` int(11) NOT NULL,
  `start_page` varchar(10) NOT NULL,
  `date_modif` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `settings`
--

INSERT INTO `settings` (`idsettings`, `users_idusers`, `lang`, `session`, `start_page`, `date_modif`) VALUES
(1, 1, 'mg', 30, 'contact', '2016-12-22 09:15:00');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `idusers` int(11) NOT NULL,
  `nom_user` varchar(45) DEFAULT NULL,
  `prenom_user` varchar(45) DEFAULT NULL,
  `email_user` varchar(45) DEFAULT NULL,
  `pass_user` varchar(254) DEFAULT NULL,
  `photo_user` text,
  `state_user` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`idusers`, `nom_user`, `prenom_user`, `email_user`, `pass_user`, `photo_user`, `state_user`) VALUES
(1, 'User', 'Test 01', 'test@mail.com', 'pass', 'default', 'OUI'),
(2, 'beza', 'Test 02', 'test2@mail.com', 'pass', 'default', 'OUI'),
(3, 'rakoto', 'beza', 'beza@mail.com', 'pass', 'default', 'OUI'),
(4, 'ravao', 'hita', 'hita@mail.com', 'ravao', 'defaut', 'OUI');

-- --------------------------------------------------------

--
-- Structure de la table `users_has_files`
--

CREATE TABLE `users_has_files` (
  `users_idusers` int(11) NOT NULL,
  `files_idfiles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users_has_files`
--

INSERT INTO `users_has_files` (`users_idusers`, `files_idfiles`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `users_has_groupes`
--

CREATE TABLE `users_has_groupes` (
  `users_idusers` int(11) NOT NULL,
  `groupes_idgroupes` int(11) NOT NULL,
  `type_membre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users_has_groupes`
--

INSERT INTO `users_has_groupes` (`users_idusers`, `groupes_idgroupes`, `type_membre`) VALUES
(1, 1, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `users_receive_messages`
--

CREATE TABLE `users_receive_messages` (
  `users_idusers` int(11) NOT NULL,
  `users_idsender` int(11) NOT NULL,
  `messages_idmessages` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users_receive_messages`
--

INSERT INTO `users_receive_messages` (`users_idusers`, `users_idsender`, `messages_idmessages`) VALUES
(1, 2, 1),
(1, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `users_save_messages`
--

CREATE TABLE `users_save_messages` (
  `messages_idmessages` int(11) NOT NULL,
  `users_idsender` int(11) NOT NULL,
  `recever` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users_save_messages`
--

INSERT INTO `users_save_messages` (`messages_idmessages`, `users_idsender`, `recever`) VALUES
(1, 1, 'rakoto');

-- --------------------------------------------------------

--
-- Structure de la table `users_send_messages`
--

CREATE TABLE `users_send_messages` (
  `users_idusers` int(11) NOT NULL,
  `users_idrecever` int(11) NOT NULL,
  `messages_idmessages` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users_send_messages`
--

INSERT INTO `users_send_messages` (`users_idusers`, `users_idrecever`, `messages_idmessages`) VALUES
(1, 2, 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`idcontacts`),
  ADD KEY `fk_contacts_users1_idx` (`users_idusers`);

--
-- Index pour la table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`idfiles`);

--
-- Index pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD PRIMARY KEY (`idgroupes`);

--
-- Index pour la table `groupes_has_contacts`
--
ALTER TABLE `groupes_has_contacts`
  ADD PRIMARY KEY (`groupes_idgroupes`,`contacts_idcontacts`),
  ADD KEY `fk_groupes_has_contacts_contacts1_idx` (`contacts_idcontacts`),
  ADD KEY `fk_groupes_has_contacts_groupes1_idx` (`groupes_idgroupes`);

--
-- Index pour la table `groupes_has_files`
--
ALTER TABLE `groupes_has_files`
  ADD PRIMARY KEY (`groupes_idgroupes`,`files_idfiles`),
  ADD KEY `fk_groupes_has_files_files1_idx` (`files_idfiles`),
  ADD KEY `fk_groupes_has_files_groupes1_idx` (`groupes_idgroupes`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`idmessages`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`idsettings`,`users_idusers`),
  ADD KEY `fk_settings_users1_idx` (`users_idusers`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`);

--
-- Index pour la table `users_has_files`
--
ALTER TABLE `users_has_files`
  ADD PRIMARY KEY (`users_idusers`,`files_idfiles`),
  ADD KEY `fk_users_has_files_files1_idx` (`files_idfiles`),
  ADD KEY `fk_users_has_files_users1_idx` (`users_idusers`);

--
-- Index pour la table `users_has_groupes`
--
ALTER TABLE `users_has_groupes`
  ADD PRIMARY KEY (`users_idusers`,`groupes_idgroupes`),
  ADD KEY `fk_users_has_groupes_groupes1_idx` (`groupes_idgroupes`),
  ADD KEY `fk_users_has_groupes_users_idx` (`users_idusers`);

--
-- Index pour la table `users_receive_messages`
--
ALTER TABLE `users_receive_messages`
  ADD PRIMARY KEY (`users_idusers`,`users_idsender`,`messages_idmessages`),
  ADD KEY `fk_users_has_messages_messages2_idx` (`messages_idmessages`),
  ADD KEY `fk_users_has_messages_users2_idx` (`users_idusers`);

--
-- Index pour la table `users_save_messages`
--
ALTER TABLE `users_save_messages`
  ADD PRIMARY KEY (`messages_idmessages`,`users_idsender`);

--
-- Index pour la table `users_send_messages`
--
ALTER TABLE `users_send_messages`
  ADD PRIMARY KEY (`users_idusers`,`users_idrecever`,`messages_idmessages`),
  ADD KEY `fk_users_has_messages_messages1_idx` (`messages_idmessages`),
  ADD KEY `fk_users_has_messages_users1_idx` (`users_idusers`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `idcontacts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `files`
--
ALTER TABLE `files`
  MODIFY `idfiles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `groupes`
--
ALTER TABLE `groupes`
  MODIFY `idgroupes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `idmessages` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `idsettings` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `fk_contacts_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `groupes_has_contacts`
--
ALTER TABLE `groupes_has_contacts`
  ADD CONSTRAINT `fk_groupes_has_contacts_contacts1` FOREIGN KEY (`contacts_idcontacts`) REFERENCES `contacts` (`idcontacts`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_groupes_has_contacts_groupes1` FOREIGN KEY (`groupes_idgroupes`) REFERENCES `groupes` (`idgroupes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `groupes_has_files`
--
ALTER TABLE `groupes_has_files`
  ADD CONSTRAINT `fk_groupes_has_files_files1` FOREIGN KEY (`files_idfiles`) REFERENCES `files` (`idfiles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_groupes_has_files_groupes1` FOREIGN KEY (`groupes_idgroupes`) REFERENCES `groupes` (`idgroupes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `fk_settings_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users_has_files`
--
ALTER TABLE `users_has_files`
  ADD CONSTRAINT `fk_users_has_files_files1` FOREIGN KEY (`files_idfiles`) REFERENCES `files` (`idfiles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_files_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users_has_groupes`
--
ALTER TABLE `users_has_groupes`
  ADD CONSTRAINT `fk_users_has_groupes_groupes1` FOREIGN KEY (`groupes_idgroupes`) REFERENCES `groupes` (`idgroupes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_groupes_users` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users_receive_messages`
--
ALTER TABLE `users_receive_messages`
  ADD CONSTRAINT `fk_users_has_messages_messages2` FOREIGN KEY (`messages_idmessages`) REFERENCES `messages` (`idmessages`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_messages_users2` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users_send_messages`
--
ALTER TABLE `users_send_messages`
  ADD CONSTRAINT `fk_users_has_messages_messages1` FOREIGN KEY (`messages_idmessages`) REFERENCES `messages` (`idmessages`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_messages_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
