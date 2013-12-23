-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Palvelin: 127.0.0.1
-- Luontiaika: 23.12.2013 klo 02:17
-- Palvelimen versio: 5.5.27-log
-- PHP:n versio: 5.4.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Tietokanta: `peuranie`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `banned_users`
--

CREATE TABLE IF NOT EXISTS `banned_users` (
  `place_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `place_id` (`place_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Vedos taulusta `banned_users`
--

INSERT INTO `banned_users` (`place_id`, `user_id`) VALUES
(3, 15),
(3, 1),
(1, 15),
(1, 16),
(4, 17),
(3, 17);

-- --------------------------------------------------------

--
-- Rakenne taululle `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `place_id` int(10) NOT NULL,
  `user_id` int(20) DEFAULT NULL,
  `date` date NOT NULL,
  `order_start` time NOT NULL,
  `order_end` time NOT NULL,
  `confirmation` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `place_id` (`place_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- Vedos taulusta `orders`
--

INSERT INTO `orders` (`id`, `timestamp`, `place_id`, `user_id`, `date`, `order_start`, `order_end`, `confirmation`) VALUES
(1, '2013-11-21 16:48:00', 1, 1, '2013-04-03', '18:07:02', '23:00:00', 0),
(2, '2013-11-21 16:48:00', 3, 10, '2013-04-15', '09:00:00', '17:00:00', 0),
(3, '2013-11-21 16:48:00', 3, 10, '2013-04-25', '09:00:00', '17:00:00', 0),
(4, '2013-11-21 16:48:00', 1, 10, '2013-03-25', '09:00:00', '17:00:00', 0),
(5, '2013-11-21 16:48:00', 1, 2, '2013-04-04', '09:00:00', '17:00:00', 0),
(6, '2013-11-21 16:48:00', 1, 2, '2013-04-03', '09:00:00', '17:00:00', 0),
(7, '2013-11-21 16:48:00', 1, 3, '2013-04-05', '09:00:00', '17:00:00', 0),
(8, '2013-11-21 16:48:00', 1, 2, '2013-04-30', '09:00:00', '17:00:00', 0),
(9, '2013-11-21 16:48:00', 1, NULL, '2013-04-30', '07:00:00', '07:00:00', 0),
(10, '2013-11-21 16:48:00', 1, 10, '2013-04-30', '09:00:00', '17:00:00', 0),
(11, '2013-11-21 16:48:00', 1, 10, '2013-04-20', '09:00:00', '17:00:00', 0),
(13, '2013-11-21 16:48:00', 3, 10, '2013-04-20', '09:00:00', '17:00:00', 0),
(16, '2013-11-21 16:48:00', 1, 1, '2013-04-05', '09:00:00', '17:00:00', 0),
(20, '2013-11-21 16:48:00', 1, 2, '2013-04-04', '09:00:00', '17:00:00', 0),
(21, '2013-11-21 16:48:00', 3, 1, '2013-04-15', '09:00:00', '17:00:00', 0),
(22, '2013-11-21 16:48:00', 3, 2, '2013-04-15', '09:00:00', '17:00:00', 0),
(23, '2013-11-21 16:48:00', 1, NULL, '2013-04-08', '09:17:00', '17:10:00', 0),
(25, '2013-11-21 16:48:00', 3, 1, '2013-04-30', '09:00:00', '17:00:00', 0),
(27, '2013-11-21 16:48:00', 3, 1, '2016-04-13', '16:15:00', '17:15:00', 0),
(32, '2013-11-21 16:48:00', 3, 2, '2017-04-13', '12:00:00', '18:00:00', 0),
(33, '2013-11-21 16:48:00', 3, 1, '2018-04-13', '00:00:00', '00:00:00', 0),
(40, '2013-11-21 16:48:00', 1, 1, '2013-04-17', '00:00:00', '00:00:00', 0),
(41, '2013-11-21 16:48:00', 1, 1, '2013-04-17', '00:00:00', '00:00:00', 0),
(42, '2013-11-21 16:48:00', 1, 1, '2013-04-16', '00:00:00', '00:00:00', 0),
(43, '2013-11-21 16:48:00', 1, NULL, '2013-04-26', '07:00:00', '07:00:00', 0),
(44, '2013-11-21 16:48:00', 1, 0, '2013-04-26', '07:00:00', '07:00:00', 0),
(48, '2013-11-21 16:48:00', 1, 1, '2013-04-15', '00:00:00', '00:00:00', 0),
(52, '2013-11-21 16:48:00', 1, 16, '2013-05-01', '07:00:00', '07:00:00', 0),
(64, '2013-11-21 16:48:00', 3, 1, '2013-04-25', '07:00:00', '13:00:00', 0),
(65, '2013-11-21 16:48:00', 3, 1, '2013-05-11', '07:00:00', '17:00:00', 0),
(66, '2013-11-21 16:48:00', 1, 0, '2013-05-02', '07:00:00', '16:00:00', 0),
(67, '2013-11-21 16:48:00', 1, 12, '2013-05-03', '07:00:00', '14:00:00', 0),
(68, '2013-11-21 16:48:00', 3, 0, '2013-05-10', '07:00:00', '10:00:00', 0),
(70, '2013-11-21 16:48:00', 3, 10, '2013-08-20', '10:00:00', '15:00:00', 0),
(73, '2013-11-21 16:48:00', 3, 0, '2013-05-18', '07:00:00', '07:00:00', 0),
(75, '2013-11-21 16:48:00', 3, 13, '2013-05-02', '07:00:00', '07:00:00', 0),
(76, '2013-11-21 16:48:00', 3, 13, '2013-05-08', '07:00:00', '07:00:00', 0),
(77, '2013-11-21 16:48:00', 1, 13, '2013-04-22', '07:00:00', '07:00:00', 0),
(79, '2013-11-21 16:48:00', 3, 13, '2013-05-19', '07:00:00', '07:00:00', 0),
(83, '2013-11-21 16:48:00', 1, 1, '2013-09-30', '17:00:00', '21:00:00', 0),
(85, '2013-11-21 16:48:00', 1, NULL, '2013-09-21', '17:00:00', '21:00:00', 0),
(87, '2013-11-21 16:48:00', 3, 12, '2013-05-13', '17:00:00', '21:00:00', 0),
(90, '2013-11-30 16:43:35', 3, 16, '2013-11-01', '09:00:00', '17:00:00', 0),
(92, '2013-12-23 00:27:05', 1, 19, '2013-11-01', '09:00:00', '17:00:00', 0),
(93, '2013-11-29 19:46:51', 3, 16, '2013-05-17', '09:00:00', '17:00:00', 0),
(95, '2013-11-30 17:48:24', 4, 15, '2013-11-02', '09:00:00', '17:00:00', 0),
(96, '2013-12-23 00:34:31', 3, 19, '2013-12-02', '09:00:00', '17:00:00', 0);

-- --------------------------------------------------------

--
-- Rakenne taululle `places`
--

CREATE TABLE IF NOT EXISTS `places` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `contact` varchar(25) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Vedos taulusta `places`
--

INSERT INTO `places` (`id`, `name`, `phone`, `contact`, `address`, `info`) VALUES
(1, 'Pankki', 'asdas', 'Pankkiiri', 'sdfaasdfsdaf', 'ASDASD'),
(3, 'Kauppa', '', '', 'ASDASd', 'Uuus'),
(4, 'Apteekki', '123456789', 'Outi Apteekkari', 'Alempi kakkakuja 2', 'Ota omat eväät');

-- --------------------------------------------------------

--
-- Rakenne taululle `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Vedos taulusta `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(0, 'moderator'),
(1, 'admin'),
(2, 'user'),
(3, 'pharmacy'),
(4, 'orderadmin');

-- --------------------------------------------------------

--
-- Rakenne taululle `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Users taulu' AUTO_INCREMENT=20 ;

--
-- Vedos taulusta `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`, `email`, `address`, `organization_id`) VALUES
(1, 'Apina', 'ae5d3b804b996dbb4371ee967012f54841a62a035dbcc7ce36bba4a1da71e8197ead937398fafe15', 'Apina', 'Kaapeli', 'asdasd@asdasd.com', 'asdasdasdasdasd ', NULL),
(15, 'aapo', 'ac0c14fc0c7643f62883f8801f49f8fd2b1902ba256e20e619ec0ecbd58645021fc679b875baa8ee', 'Aapo', 'Ahdas', '', '', NULL),
(16, 'user', '5a314f35e195bca19f53c03b8e3913019ffd188b348c5a155c5a27debc774f6b971f66ee50e98d14', 'Kille', 'Käyttäjä', 'minun@maili.com', '', NULL),
(17, 'Pharmacy', '7dea47d458181a7a99ff25a371fa4e96acd4c7c214605b946a48bd2eb04c5975f53303ff0f11708f', 'Arvo', 'Apteekki', 'email@email.com', 'Adress', 3),
(18, 'sdfdsfad', 'b8d0b7cf2afc24d45d078d9b804fe5e61f723f74b762cb445f4d32bddd7de12c9042b1c97fb5b109', 'sadfasd', 'sdfaf', 'email@email.com', '', NULL),
(19, 'Roope', '8ee17735d42db1e4e659c5718132ae4f5b8e9a4a9d556680230b43e3b03e646d1a590809cf47c756', 'Roope', 'Ankka', 'kulta@on.paras', 'Rahalaari 32', 3);

-- --------------------------------------------------------

--
-- Rakenne taululle `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(6) NOT NULL,
  `role_id` int(6) NOT NULL,
  UNIQUE KEY `UK_g1uebn6mqk9qiaw45vnacmyo2` (`user_id`),
  KEY `user` (`user_id`),
  KEY `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vedos taulusta `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(15, 1),
(19, 2),
(17, 3),
(18, 3),
(16, 4);

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `banned_users`
--
ALTER TABLE `banned_users`
  ADD CONSTRAINT `banned_users_ibfk_3` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banned_users_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Rajoitteet taululle `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Rajoitteet taululle `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `places` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Rajoitteet taululle `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
