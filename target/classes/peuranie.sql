-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Palvelin: 127.0.0.1
-- Luontiaika: 01.12.2013 klo 02:31
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
  PRIMARY KEY (`id`),
  KEY `place_id` (`place_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=96 ;

--
-- Vedos taulusta `orders`
--

INSERT INTO `orders` (`id`, `timestamp`, `place_id`, `user_id`, `date`, `order_start`, `order_end`) VALUES
(1, '2013-11-21 16:48:00', 1, 1, '2013-04-03', '18:07:02', '23:00:00'),
(2, '2013-11-21 16:48:00', 3, 10, '2013-04-15', '09:00:00', '17:00:00'),
(3, '2013-11-21 16:48:00', 3, 10, '2013-04-25', '09:00:00', '17:00:00'),
(4, '2013-11-21 16:48:00', 1, 10, '2013-03-25', '09:00:00', '17:00:00'),
(5, '2013-11-21 16:48:00', 1, 2, '2013-04-04', '09:00:00', '17:00:00'),
(6, '2013-11-21 16:48:00', 1, 2, '2013-04-03', '09:00:00', '17:00:00'),
(7, '2013-11-21 16:48:00', 1, 3, '2013-04-05', '09:00:00', '17:00:00'),
(8, '2013-11-21 16:48:00', 1, 2, '2013-04-30', '09:00:00', '17:00:00'),
(9, '2013-11-21 16:48:00', 1, NULL, '2013-04-30', '07:00:00', '07:00:00'),
(10, '2013-11-21 16:48:00', 1, 10, '2013-04-30', '09:00:00', '17:00:00'),
(11, '2013-11-21 16:48:00', 1, 10, '2013-04-20', '09:00:00', '17:00:00'),
(13, '2013-11-21 16:48:00', 3, 10, '2013-04-20', '09:00:00', '17:00:00'),
(16, '2013-11-21 16:48:00', 1, 1, '2013-04-05', '09:00:00', '17:00:00'),
(20, '2013-11-21 16:48:00', 1, 2, '2013-04-04', '09:00:00', '17:00:00'),
(21, '2013-11-21 16:48:00', 3, 1, '2013-04-15', '09:00:00', '17:00:00'),
(22, '2013-11-21 16:48:00', 3, 2, '2013-04-15', '09:00:00', '17:00:00'),
(23, '2013-11-21 16:48:00', 1, NULL, '2013-04-08', '09:17:00', '17:10:00'),
(25, '2013-11-21 16:48:00', 3, 1, '2013-04-30', '09:00:00', '17:00:00'),
(27, '2013-11-21 16:48:00', 3, 1, '2016-04-13', '16:15:00', '17:15:00'),
(32, '2013-11-21 16:48:00', 3, 2, '2017-04-13', '12:00:00', '18:00:00'),
(33, '2013-11-21 16:48:00', 3, 1, '2018-04-13', '00:00:00', '00:00:00'),
(40, '2013-11-21 16:48:00', 1, 1, '2013-04-17', '00:00:00', '00:00:00'),
(41, '2013-11-21 16:48:00', 1, 1, '2013-04-17', '00:00:00', '00:00:00'),
(42, '2013-11-21 16:48:00', 1, 1, '2013-04-16', '00:00:00', '00:00:00'),
(43, '2013-11-21 16:48:00', 1, NULL, '2013-04-26', '07:00:00', '07:00:00'),
(44, '2013-11-21 16:48:00', 1, 0, '2013-04-26', '07:00:00', '07:00:00'),
(48, '2013-11-21 16:48:00', 1, 1, '2013-04-15', '00:00:00', '00:00:00'),
(52, '2013-11-21 16:48:00', 1, 16, '2013-05-01', '07:00:00', '07:00:00'),
(64, '2013-11-21 16:48:00', 3, 1, '2013-04-25', '07:00:00', '13:00:00'),
(65, '2013-11-21 16:48:00', 3, 1, '2013-05-11', '07:00:00', '17:00:00'),
(66, '2013-11-21 16:48:00', 1, 0, '2013-05-02', '07:00:00', '16:00:00'),
(67, '2013-11-21 16:48:00', 1, 12, '2013-05-03', '07:00:00', '14:00:00'),
(68, '2013-11-21 16:48:00', 3, 0, '2013-05-10', '07:00:00', '10:00:00'),
(70, '2013-11-21 16:48:00', 3, 10, '2013-08-20', '10:00:00', '15:00:00'),
(73, '2013-11-21 16:48:00', 3, 0, '2013-05-18', '07:00:00', '07:00:00'),
(75, '2013-11-21 16:48:00', 3, 13, '2013-05-02', '07:00:00', '07:00:00'),
(76, '2013-11-21 16:48:00', 3, 13, '2013-05-08', '07:00:00', '07:00:00'),
(77, '2013-11-21 16:48:00', 1, 13, '2013-04-22', '07:00:00', '07:00:00'),
(79, '2013-11-21 16:48:00', 3, 13, '2013-05-19', '07:00:00', '07:00:00'),
(83, '2013-11-21 16:48:00', 1, 1, '2013-09-30', '17:00:00', '21:00:00'),
(85, '2013-11-21 16:48:00', 1, NULL, '2013-09-21', '17:00:00', '21:00:00'),
(87, '2013-11-21 16:48:00', 3, 12, '2013-05-13', '17:00:00', '21:00:00'),
(90, '2013-11-30 16:43:35', 3, 16, '2013-11-01', '09:00:00', '17:00:00'),
(92, '2013-11-29 12:37:04', 1, 12, '2013-11-01', '09:00:00', '17:00:00'),
(93, '2013-11-29 19:46:51', 3, 16, '2013-05-17', '09:00:00', '17:00:00'),
(95, '2013-11-30 17:48:24', 4, 15, '2013-11-02', '09:00:00', '17:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Vedos taulusta `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(0, 'moderator'),
(1, 'admin'),
(2, 'user'),
(3, 'pharmacy');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Users taulu' AUTO_INCREMENT=19 ;

--
-- Vedos taulusta `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`, `email`, `address`) VALUES
(1, 'Apina', 'ae5d3b804b996dbb4371ee967012f54841a62a035dbcc7ce36bba4a1da71e8197ead937398fafe15', 'Apina', 'Kaapeli', 'asdasd@asdasd.com', 'asdasdasdasdasd '),
(15, 'aapo', 'ac0c14fc0c7643f62883f8801f49f8fd2b1902ba256e20e619ec0ecbd58645021fc679b875baa8ee', 'Aapo', 'Ahdas', '', ''),
(16, 'user', '5a314f35e195bca19f53c03b8e3913019ffd188b348c5a155c5a27debc774f6b971f66ee50e98d14', 'user', 'user', 'minun@maili.com', 'OSOITE'),
(17, 'Pharmacy', '7dea47d458181a7a99ff25a371fa4e96acd4c7c214605b946a48bd2eb04c5975f53303ff0f11708f', 'Apteekki etunimi', 'Apteekki sukunimi', 'email@email.com', 'Adress'),
(18, 'sdfdsfad', 'b8d0b7cf2afc24d45d078d9b804fe5e61f723f74b762cb445f4d32bddd7de12c9042b1c97fb5b109', 'sadfasd', 'sdfaf', 'email@email.com', '');

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
(17, 1),
(16, 2),
(18, 3);

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
-- Rajoitteet taululle `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
