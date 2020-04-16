-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-04-2020 a las 19:03:00
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `booked`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accessories`
--

CREATE TABLE `accessories` (
  `accessory_id` smallint(5) UNSIGNED NOT NULL,
  `accessory_name` varchar(85) NOT NULL,
  `accessory_quantity` smallint(5) UNSIGNED DEFAULT NULL,
  `legacyid` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `accessories`
--

INSERT INTO `accessories` (`accessory_id`, `accessory_name`, `accessory_quantity`, `legacyid`) VALUES
(1, 'Extensor HDMI a HDMI', NULL, NULL),
(2, 'Adapatador VGA a HDMI', 4, NULL),
(3, 'Parlantes USB', 2, NULL),
(4, 'Extensor VGA a VGA', NULL, NULL),
(5, 'Equipo DTR', 1, NULL),
(6, 'Equipo DTR', 1, NULL),
(7, 'Datashow', NULL, NULL),
(8, 'Aire Acondicionado', NULL, NULL),
(9, 'Mesas', NULL, NULL),
(10, 'Sillas', NULL, NULL),
(11, 'Adapatador VGA a HDMI', NULL, NULL),
(12, 'Extensor HDMI a HDMI', NULL, NULL),
(13, 'Extensor VGA a VGA', NULL, NULL),
(14, 'Apple TV', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_activation`
--

CREATE TABLE `account_activation` (
  `account_activation_id` mediumint(8) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `activation_code` varchar(30) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `announcements`
--

CREATE TABLE `announcements` (
  `announcementid` mediumint(8) UNSIGNED NOT NULL,
  `announcement_text` text NOT NULL,
  `priority` mediumint(8) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `display_page` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `announcements`
--

INSERT INTO `announcements` (`announcementid`, `announcement_text`, `priority`, `start_date`, `end_date`, `display_page`) VALUES
(1, 'Plataforma No Disponible', 1, '2020-03-22 06:00:00', '2020-03-28 06:00:00', 1),
(2, 'Plataforma No Disponible', 2, '2020-03-22 06:00:00', '2020-03-28 06:00:00', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `announcement_groups`
--

CREATE TABLE `announcement_groups` (
  `announcementid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `announcement_resources`
--

CREATE TABLE `announcement_resources` (
  `announcementid` mediumint(8) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blackout_instances`
--

CREATE TABLE `blackout_instances` (
  `blackout_instance_id` int(10) UNSIGNED NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `blackout_series_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blackout_series`
--

CREATE TABLE `blackout_series` (
  `blackout_series_id` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `title` varchar(85) NOT NULL,
  `description` text DEFAULT NULL,
  `owner_id` mediumint(8) UNSIGNED NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `repeat_type` varchar(10) DEFAULT NULL,
  `repeat_options` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `blackout_series`
--

INSERT INTO `blackout_series` (`blackout_series_id`, `date_created`, `last_modified`, `title`, `description`, `owner_id`, `legacyid`, `repeat_type`, `repeat_options`) VALUES
(1, '2020-03-16 05:24:16', NULL, 'Mantenimiento', NULL, 2, NULL, 'none', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blackout_series_resources`
--

CREATE TABLE `blackout_series_resources` (
  `blackout_series_id` int(10) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `blackout_series_resources`
--

INSERT INTO `blackout_series_resources` (`blackout_series_id`, `resource_id`) VALUES
(1, 2),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credit_log`
--

CREATE TABLE `credit_log` (
  `credit_log_id` int(10) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `original_credit_count` decimal(7,2) DEFAULT NULL,
  `credit_count` decimal(7,2) DEFAULT NULL,
  `credit_note` varchar(1000) DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `custom_attributes`
--

CREATE TABLE `custom_attributes` (
  `custom_attribute_id` mediumint(8) UNSIGNED NOT NULL,
  `display_label` varchar(50) NOT NULL,
  `display_type` tinyint(2) UNSIGNED NOT NULL,
  `attribute_category` tinyint(2) UNSIGNED NOT NULL,
  `validation_regex` varchar(50) DEFAULT NULL,
  `is_required` tinyint(1) UNSIGNED NOT NULL,
  `possible_values` text DEFAULT NULL,
  `sort_order` tinyint(2) UNSIGNED DEFAULT NULL,
  `admin_only` tinyint(1) UNSIGNED DEFAULT NULL,
  `secondary_category` tinyint(2) UNSIGNED DEFAULT NULL,
  `secondary_entity_ids` varchar(2000) DEFAULT NULL,
  `is_private` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `custom_attributes`
--

INSERT INTO `custom_attributes` (`custom_attribute_id`, `display_label`, `display_type`, `attribute_category`, `validation_regex`, `is_required`, `possible_values`, `sort_order`, `admin_only`, `secondary_category`, `secondary_entity_ids`, `is_private`) VALUES
(1, 'Responsable', 1, 1, '/^\\s?[a-zA-Z]{2,}([- ]?[a-zA-Z]{2,}){0,3}\\s?$/', 1, NULL, 0, 0, NULL, '', 0),
(2, 'Contacto Telefónico', 1, 1, '/\\s{0,1}(2|3|8|9)\\d{3}(\\s|-){0,1}\\d{4}$/', 1, NULL, 1, 0, NULL, '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `custom_attribute_entities`
--

CREATE TABLE `custom_attribute_entities` (
  `custom_attribute_id` mediumint(8) UNSIGNED NOT NULL,
  `entity_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `custom_attribute_values`
--

CREATE TABLE `custom_attribute_values` (
  `custom_attribute_value_id` int(8) UNSIGNED NOT NULL,
  `custom_attribute_id` mediumint(8) UNSIGNED NOT NULL,
  `attribute_value` text NOT NULL,
  `entity_id` mediumint(8) UNSIGNED NOT NULL,
  `attribute_category` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `custom_attribute_values`
--

INSERT INTO `custom_attribute_values` (`custom_attribute_value_id`, `custom_attribute_id`, `attribute_value`, `entity_id`, `attribute_category`) VALUES
(1, 1, 'sad', 1, 1),
(2, 2, 'dsa', 1, 1),
(3, 1, 'sda', 2, 1),
(4, 2, 'asd', 2, 1),
(5, 1, 'asd', 3, 1),
(6, 2, 'asd', 3, 1),
(7, 1, 'ds', 4, 1),
(8, 2, 'asd', 4, 1),
(9, 1, 'asd', 5, 1),
(10, 2, 'asd', 5, 1),
(11, 1, 'Anthony Rodriguez', 6, 1),
(12, 2, '3344-2255', 6, 1),
(13, 1, 'Hard Limit', 7, 1),
(14, 2, '1233-3344', 7, 1),
(15, 1, 'Eduardo Salgado', 8, 1),
(16, 2, '3396-7777', 8, 1),
(17, 1, 'Ingenierio Oscar Cruz', 9, 1),
(18, 2, '', 9, 1),
(19, 1, 'kATTIA tHOMPSON', 10, 1),
(20, 2, '', 10, 1),
(21, 1, '', 11, 1),
(22, 2, 'sadsadsada', 11, 1),
(23, 1, 'Jorge Salgado', 12, 1),
(24, 2, 'sdaaasd', 12, 1),
(26, 2, '9988-7766', 13, 1),
(28, 2, '9988-7766', 14, 1),
(29, 1, 'Ing. Oscar Cruz', 15, 1),
(30, 2, '9988-7766', 15, 1),
(32, 2, '9988-7766', 16, 1),
(33, 1, 'Ing. Laureano', 17, 1),
(34, 2, '9988-7766', 17, 1),
(35, 1, 'Lic. Aracely Rodrguez', 18, 1),
(36, 2, '8899-7766', 18, 1),
(37, 1, 'Lic. Aracely Rodriguez', 19, 1),
(38, 2, '8899-7766', 19, 1),
(39, 1, 'Lic. Aracely Rodriguez', 20, 1),
(40, 2, '8899-7766', 20, 1),
(41, 1, 'Ing. Jorge Salgado', 21, 1),
(42, 2, '3322-1100', 21, 1),
(43, 1, 'Ing. Bryan', 22, 1),
(44, 2, '9988-9988', 22, 1),
(45, 1, 'Ing. Bryan', 23, 1),
(46, 2, '9988-9988', 23, 1),
(47, 1, 'Ing. Hector Doblado', 24, 1),
(48, 2, '22559988', 24, 1),
(49, 1, 'Ing. Rafael Maldonado', 25, 1),
(50, 2, '88997788', 25, 1),
(51, 1, 'Ing. Edwin Garcia', 26, 1),
(52, 2, '2233-4455', 26, 1),
(53, 1, 'Ing. Jorge Salgado', 27, 1),
(54, 2, '3322-1100', 27, 1),
(55, 1, 'Ing. Jorge Salgado', 28, 1),
(56, 2, '3322-1100', 28, 1),
(57, 1, 'Ing. Carlos Amador', 29, 1),
(58, 2, '8877-1100', 29, 1),
(59, 1, 'Ing. Edwin Garcia', 30, 1),
(60, 2, '2211-2211', 30, 1),
(61, 1, 'Ing. Edwin Garcia', 31, 1),
(62, 2, '2211-2211', 31, 1),
(64, 2, '8899-7788', 32, 1),
(65, 1, 'Ing. Edwin Garcia', 33, 1),
(66, 2, '2211-2211', 33, 1),
(67, 1, 'Ing. Edwin Garcia', 34, 1),
(68, 2, '2211-2211', 34, 1),
(69, 1, 'Ing. Edwin Garcia', 35, 1),
(70, 2, '2211-2211', 35, 1),
(71, 1, 'Ing. Edwin Garcia', 36, 1),
(72, 2, '2211-2211', 36, 1),
(73, 1, 'Ing. Edwin Garcia', 37, 1),
(74, 2, '2211-2211', 37, 1),
(76, 2, '3355-9988', 38, 1),
(77, 1, 'Ing. Aracely Rodriguez', 39, 1),
(78, 2, '9988-7788', 39, 1),
(79, 1, 'Ing. Oscar Cruz', 40, 1),
(80, 2, '8877-9988', 40, 1),
(81, 1, 'Ing. Oscar Cruz', 41, 1),
(82, 2, '2211-2211', 41, 1),
(83, 1, 'Ing. Rafael Maldonado', 42, 1),
(84, 2, '8877-9988', 42, 1),
(85, 1, 'Ing. Oscar Cruz', 43, 1),
(86, 2, '2211-2211', 43, 1),
(87, 1, 'Ing. Anthony Rodriguez', 44, 1),
(88, 2, '8899-8899', 44, 1),
(89, 1, 'Ing. Anthony Rodriguez', 45, 1),
(90, 2, '8899-8899', 45, 1),
(91, 1, 'Ing. Victoria Patiño', 46, 1),
(92, 2, '2288-9988', 46, 1),
(93, 1, 'Ing. Eric Rodriguez', 47, 1),
(94, 2, '8787-8989', 47, 1),
(95, 1, 'Ing. Eric Rodriguez', 48, 1),
(96, 2, '8787-8989', 48, 1),
(97, 1, 'Ing. Eric Rodriguez', 49, 1),
(98, 2, '8787-8989', 49, 1),
(99, 1, 'Ing. Hector Doblado', 50, 1),
(100, 2, '2233-8899', 50, 1),
(101, 1, 'Ing. Eric Rodriguez', 51, 1),
(102, 2, '8899-8899', 51, 1),
(103, 1, 'Ing. Eric Rodriguez', 52, 1),
(104, 2, '8899-8899', 52, 1),
(105, 1, 'Ing. Dariel Vasquez', 53, 1),
(106, 2, '88993322', 53, 1),
(107, 1, 'Ing. Dariel Vasquez', 54, 1),
(108, 2, '8899-8899', 54, 1),
(109, 1, 'Ing. Carlos Amador', 55, 1),
(110, 2, '8899-8899', 55, 1),
(111, 1, 'Ing. Kelsey Benitez', 56, 1),
(112, 2, '8899-8899', 56, 1),
(113, 1, 'Ing, Kelsey Benitez', 57, 1),
(114, 2, '8889-8999', 57, 1),
(115, 1, 'Ing. Kelsey Benitez', 58, 1),
(116, 2, '8899-8899', 58, 1),
(117, 1, 'Ing. Chuy Cho', 59, 1),
(118, 2, '3322-1100', 59, 1),
(119, 1, 'Ing. Luis Chuy Cho', 60, 1),
(120, 2, '3322-1100', 60, 1),
(121, 1, 'Inst. Dariel Vasquez', 61, 1),
(122, 2, '8899-9988', 61, 1),
(123, 1, 'Inst. Kelsey Benitez', 62, 1),
(124, 2, '8899-9988', 62, 1),
(125, 1, 'Inst. Jorge Salgado', 63, 1),
(126, 2, '3322-1100', 63, 1),
(127, 1, 'Inst. Eric Rodriguez', 64, 1),
(128, 2, '8899-0000', 64, 1),
(129, 1, 'Inst. Anthony Rodriguez', 65, 1),
(130, 2, '2200-0000', 65, 1),
(131, 1, 'Ing. Carlos Amador', 66, 1),
(132, 2, '2000-0000', 66, 1),
(133, 1, 'Ing. Anthony Rodriguez', 67, 1),
(134, 2, '8000-0000', 67, 1),
(135, 1, 'Ing. Eric Rodriguez', 68, 1),
(136, 2, '3000-0000', 68, 1),
(137, 1, 'Ing. Kelsey Benitez', 69, 1),
(138, 2, '8000-0000', 69, 1),
(139, 1, 'Ing. Kelsey Benitez', 70, 1),
(140, 2, '8000-0000', 70, 1),
(141, 1, 'Ing. Kelsey Benitez', 71, 1),
(142, 2, '8000-0000', 71, 1),
(143, 1, 'Ing. Triminio', 72, 1),
(144, 2, '2000-0000', 72, 1),
(145, 1, 'Ing. Luis Chuy Cho', 73, 1),
(146, 2, '3000-0000', 73, 1),
(147, 1, 'Ing. Luis Chuy Cho', 74, 1),
(148, 2, '3300-0000', 74, 1),
(149, 1, 'Ing. Carlos Amador', 75, 1),
(150, 2, '8000-0000', 75, 1),
(151, 1, 'Ing. Carlos Amador', 76, 1),
(152, 2, '8000-0000', 76, 1),
(153, 1, 'Ing. Edwin Garcia', 77, 1),
(154, 2, '8000-0000', 77, 1),
(155, 1, 'Ing. Rafael Maldonado', 78, 1),
(156, 2, '8000-0000', 78, 1),
(157, 1, 'Ing. Victoria Patiño', 79, 1),
(158, 2, '8000-0000', 79, 1),
(159, 1, 'Ing. Anthony Thompson', 80, 1),
(160, 2, '2000-0000', 80, 1),
(161, 1, 'Ing. Eric Rodriguez', 81, 1),
(162, 2, '2000-0000', 81, 1),
(163, 1, 'Ing. Anthony Thompson', 82, 1),
(164, 2, '8000-0000', 82, 1),
(165, 1, 'Ing. Jorge Salgado', 83, 1),
(166, 2, '8899-0055', 83, 1),
(167, 1, 'Ing.Oscar Cruz', 84, 1),
(168, 2, '8000-0000', 84, 1),
(169, 1, 'Ing. Dariel Vasquez', 85, 1),
(170, 2, '2000-0000', 85, 1),
(171, 1, 'Ing. Orlando Betancourth', 86, 1),
(172, 2, '2000-0000', 86, 1),
(173, 1, 'Ing. Orlando Betancourth', 87, 1),
(174, 2, '2000-2000', 87, 1),
(175, 1, 'Ing. Orlando Betancourth', 88, 1),
(176, 2, '2000-0000', 88, 1),
(177, 1, 'Lic. Kattia Thompson', 13, 1),
(178, 1, 'Lic. Kattia Thompson', 14, 1),
(179, 1, 'Lic. Kattia Thompson', 16, 1),
(180, 1, 'Lic. Kattia Thompson', 32, 1),
(181, 1, 'Ing. Kattia Thompson', 38, 1),
(182, 1, 'Jorge Salgado', 89, 1),
(183, 2, '8899-8899', 89, 1),
(184, 1, 'Jorge Salgado', 90, 1),
(185, 2, '8899-8899', 90, 1),
(186, 1, 'Jorge Salgado', 91, 1),
(187, 2, '2211-2211', 91, 1),
(188, 1, 'Jorge Salgado', 92, 1),
(189, 2, '2200-2200', 92, 1),
(190, 1, 'Jorge Salgado', 93, 1),
(191, 2, '2211-0000', 93, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `custom_time_blocks`
--

CREATE TABLE `custom_time_blocks` (
  `custom_time_block_id` smallint(5) UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `layout_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dbversion`
--

CREATE TABLE `dbversion` (
  `version_number` double UNSIGNED NOT NULL DEFAULT 0,
  `version_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dbversion`
--

INSERT INTO `dbversion` (`version_number`, `version_date`) VALUES
(2.1, '2020-03-16 05:23:34'),
(2.2, '2020-03-16 05:23:34'),
(2.3, '2020-03-16 05:23:34'),
(2.4, '2020-03-16 05:23:34'),
(2.5, '2020-03-16 05:23:34'),
(2.6, '2020-03-16 05:23:34'),
(2.7, '2020-03-16 05:23:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `group_id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(85) NOT NULL,
  `admin_group_id` smallint(5) UNSIGNED DEFAULT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `isdefault` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`group_id`, `name`, `admin_group_id`, `legacyid`, `isdefault`) VALUES
(1, 'Administrador Biblioteca', 2, NULL, 0),
(2, 'Administrador Plataforma', NULL, NULL, 0),
(3, 'Administrador Laboratorios', 2, NULL, 0),
(4, 'Docentes', 2, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_resource_permissions`
--

CREATE TABLE `group_resource_permissions` (
  `group_id` smallint(5) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `permission_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `group_resource_permissions`
--

INSERT INTO `group_resource_permissions` (`group_id`, `resource_id`, `permission_type`) VALUES
(2, 1, 0),
(2, 2, 0),
(2, 3, 0),
(2, 5, 0),
(2, 6, 0),
(2, 7, 0),
(2, 8, 0),
(2, 9, 0),
(2, 10, 0),
(2, 11, 0),
(2, 12, 0),
(2, 13, 0),
(2, 14, 0),
(2, 15, 0),
(2, 16, 0),
(2, 17, 0),
(2, 18, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_roles`
--

CREATE TABLE `group_roles` (
  `group_id` smallint(8) UNSIGNED NOT NULL,
  `role_id` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `group_roles`
--

INSERT INTO `group_roles` (`group_id`, `role_id`) VALUES
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `layouts`
--

CREATE TABLE `layouts` (
  `layout_id` mediumint(8) UNSIGNED NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `layout_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `layouts`
--

INSERT INTO `layouts` (`layout_id`, `timezone`, `layout_type`) VALUES
(1, 'America/New_York', 0),
(2, 'America/Tegucigalpa', 0),
(3, 'America/Tegucigalpa', 0),
(4, 'America/Tegucigalpa', 0),
(5, 'America/Tegucigalpa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_configuration`
--

CREATE TABLE `payment_configuration` (
  `payment_configuration_id` tinyint(3) UNSIGNED NOT NULL,
  `credit_cost` decimal(7,2) UNSIGNED NOT NULL,
  `credit_currency` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `payment_configuration`
--

INSERT INTO `payment_configuration` (`payment_configuration_id`, `credit_cost`, `credit_currency`) VALUES
(1, '0.00', 'USD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_gateway_settings`
--

CREATE TABLE `payment_gateway_settings` (
  `gateway_type` varchar(255) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_transaction_log`
--

CREATE TABLE `payment_transaction_log` (
  `payment_transaction_log_id` int(10) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `subtotal_amount` decimal(7,2) NOT NULL,
  `tax_amount` decimal(7,2) NOT NULL,
  `total_amount` decimal(7,2) NOT NULL,
  `transaction_fee` decimal(7,2) DEFAULT NULL,
  `currency` varchar(3) NOT NULL,
  `transaction_href` varchar(500) DEFAULT NULL,
  `refund_href` varchar(500) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `gateway_name` varchar(100) NOT NULL,
  `gateway_date_created` varchar(25) NOT NULL,
  `payment_response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peak_times`
--

CREATE TABLE `peak_times` (
  `peak_times_id` mediumint(8) UNSIGNED NOT NULL,
  `schedule_id` smallint(5) UNSIGNED NOT NULL,
  `all_day` tinyint(1) UNSIGNED NOT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `every_day` tinyint(1) UNSIGNED NOT NULL,
  `peak_days` varchar(13) DEFAULT NULL,
  `all_year` tinyint(1) UNSIGNED NOT NULL,
  `begin_month` tinyint(1) UNSIGNED NOT NULL,
  `begin_day` tinyint(1) UNSIGNED NOT NULL,
  `end_month` tinyint(1) UNSIGNED NOT NULL,
  `end_day` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotas`
--

CREATE TABLE `quotas` (
  `quota_id` mediumint(8) UNSIGNED NOT NULL,
  `quota_limit` decimal(7,2) UNSIGNED NOT NULL,
  `unit` varchar(25) NOT NULL,
  `duration` varchar(25) NOT NULL,
  `resource_id` smallint(5) UNSIGNED DEFAULT NULL,
  `group_id` smallint(5) UNSIGNED DEFAULT NULL,
  `schedule_id` smallint(5) UNSIGNED DEFAULT NULL,
  `enforced_days` varchar(15) DEFAULT NULL,
  `enforced_time_start` time DEFAULT NULL,
  `enforced_time_end` time DEFAULT NULL,
  `scope` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refund_transaction_log`
--

CREATE TABLE `refund_transaction_log` (
  `refund_transaction_log_id` int(10) UNSIGNED NOT NULL,
  `payment_transaction_log_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `total_refund_amount` decimal(7,2) NOT NULL,
  `payment_refund_amount` decimal(7,2) DEFAULT NULL,
  `fee_refund_amount` decimal(7,2) DEFAULT NULL,
  `transaction_href` varchar(500) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `gateway_date_created` varchar(25) NOT NULL,
  `refund_response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reminders`
--

CREATE TABLE `reminders` (
  `reminder_id` int(11) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `message` text NOT NULL,
  `sendtime` datetime NOT NULL,
  `refnumber` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation_accessories`
--

CREATE TABLE `reservation_accessories` (
  `series_id` int(10) UNSIGNED NOT NULL,
  `accessory_id` smallint(5) UNSIGNED NOT NULL,
  `quantity` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reservation_accessories`
--

INSERT INTO `reservation_accessories` (`series_id`, `accessory_id`, `quantity`) VALUES
(18, 5, 1),
(21, 3, 1),
(24, 3, 1),
(24, 5, 1),
(26, 2, 1),
(26, 3, 1),
(30, 2, 1),
(31, 2, 1),
(32, 5, 1),
(33, 2, 1),
(34, 2, 1),
(35, 2, 1),
(36, 2, 1),
(37, 2, 1),
(38, 3, 1),
(38, 5, 1),
(39, 3, 1),
(40, 2, 1),
(40, 5, 1),
(41, 2, 1),
(41, 5, 1),
(43, 5, 1),
(44, 2, 1),
(49, 2, 1),
(55, 5, 1),
(56, 14, 1),
(89, 5, 1),
(90, 5, 1),
(91, 5, 1),
(92, 2, 1),
(92, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation_color_rules`
--

CREATE TABLE `reservation_color_rules` (
  `reservation_color_rule_id` mediumint(8) UNSIGNED NOT NULL,
  `custom_attribute_id` mediumint(8) UNSIGNED NOT NULL,
  `attribute_type` smallint(5) UNSIGNED DEFAULT NULL,
  `required_value` text DEFAULT NULL,
  `comparison_type` smallint(5) UNSIGNED DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation_files`
--

CREATE TABLE `reservation_files` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `series_id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(250) NOT NULL,
  `file_type` varchar(75) DEFAULT NULL,
  `file_size` varchar(45) NOT NULL,
  `file_extension` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation_guests`
--

CREATE TABLE `reservation_guests` (
  `reservation_instance_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `reservation_user_level` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation_instances`
--

CREATE TABLE `reservation_instances` (
  `reservation_instance_id` int(10) UNSIGNED NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `reference_number` varchar(50) NOT NULL,
  `series_id` int(10) UNSIGNED NOT NULL,
  `checkin_date` datetime DEFAULT NULL,
  `checkout_date` datetime DEFAULT NULL,
  `previous_end_date` datetime DEFAULT NULL,
  `credit_count` decimal(7,2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reservation_instances`
--

INSERT INTO `reservation_instances` (`reservation_instance_id`, `start_date`, `end_date`, `reference_number`, `series_id`, `checkin_date`, `checkout_date`, `previous_end_date`, `credit_count`) VALUES
(71, '2020-04-06 13:00:00', '2020-04-06 14:00:00', '5e8bbc5a9bd9e016218779', 13, NULL, NULL, NULL, '0.00'),
(72, '2020-04-07 13:00:00', '2020-04-07 14:00:00', '5e8bbc5a9c12c273316194', 13, NULL, NULL, NULL, NULL),
(73, '2020-04-08 13:00:00', '2020-04-08 14:00:00', '5e8bbc5a9c131426748185', 13, NULL, NULL, NULL, NULL),
(74, '2020-04-09 13:00:00', '2020-04-09 14:00:00', '5e8bbc5a9c133649130795', 13, NULL, NULL, NULL, NULL),
(75, '2020-04-13 13:00:00', '2020-04-13 14:00:00', '5e8bbc5a9c135208436020', 13, NULL, NULL, NULL, NULL),
(76, '2020-04-14 13:00:00', '2020-04-14 14:00:00', '5e8bbc5a9c138046993153', 13, NULL, NULL, NULL, NULL),
(77, '2020-04-15 13:00:00', '2020-04-15 14:00:00', '5e8bbc5a9c13a181663356', 13, NULL, NULL, NULL, NULL),
(78, '2020-04-16 13:00:00', '2020-04-16 14:00:00', '5e8bbc5a9c13c184566527', 13, NULL, NULL, NULL, NULL),
(79, '2020-04-20 13:00:00', '2020-04-20 14:00:00', '5e8bbc5a9c13e694962180', 13, NULL, NULL, NULL, NULL),
(80, '2020-04-21 13:00:00', '2020-04-21 14:00:00', '5e8bbc5a9c140691652206', 13, NULL, NULL, NULL, NULL),
(81, '2020-04-22 13:00:00', '2020-04-22 14:00:00', '5e8bbc5a9c142791689288', 13, NULL, NULL, NULL, NULL),
(82, '2020-04-23 13:00:00', '2020-04-23 14:00:00', '5e8bbc5a9c144660896773', 13, NULL, NULL, NULL, NULL),
(83, '2020-04-27 13:00:00', '2020-04-27 14:00:00', '5e8bbc5a9c146181749205', 13, NULL, NULL, NULL, NULL),
(84, '2020-04-28 13:00:00', '2020-04-28 14:00:00', '5e8bbc5a9c148068276702', 13, NULL, NULL, NULL, NULL),
(85, '2020-04-29 13:00:00', '2020-04-29 14:00:00', '5e8bbc5a9c14a799238551', 13, NULL, NULL, NULL, NULL),
(86, '2020-04-30 13:00:00', '2020-04-30 14:00:00', '5e8bbc5a9c14c246454071', 13, NULL, NULL, NULL, NULL),
(87, '2020-04-06 14:00:00', '2020-04-06 15:00:00', '5e8bbdc7aa82c883089984', 14, NULL, NULL, NULL, '0.00'),
(88, '2020-04-07 14:00:00', '2020-04-07 15:00:00', '5e8bbdc7aae70226639482', 14, NULL, NULL, NULL, NULL),
(89, '2020-04-08 14:00:00', '2020-04-08 15:00:00', '5e8bbdc7aae79709679239', 14, NULL, NULL, NULL, NULL),
(90, '2020-04-09 14:00:00', '2020-04-09 15:00:00', '5e8bbdc7aae7d158089905', 14, NULL, NULL, NULL, NULL),
(91, '2020-04-13 14:00:00', '2020-04-13 15:00:00', '5e8bbdc7aae80327860390', 14, NULL, NULL, NULL, NULL),
(92, '2020-04-14 14:00:00', '2020-04-14 15:00:00', '5e8bbdc7aae84780416314', 14, NULL, NULL, NULL, NULL),
(93, '2020-04-15 14:00:00', '2020-04-15 15:00:00', '5e8bbdc7aae87942944635', 14, NULL, NULL, NULL, NULL),
(94, '2020-04-16 14:00:00', '2020-04-16 15:00:00', '5e8bbdc7aae8a348282555', 14, NULL, NULL, NULL, NULL),
(95, '2020-04-20 14:00:00', '2020-04-20 15:00:00', '5e8bbdc7aae8d798849482', 14, NULL, NULL, NULL, NULL),
(96, '2020-04-21 14:00:00', '2020-04-21 15:00:00', '5e8bbdc7aae90246832911', 14, NULL, NULL, NULL, NULL),
(97, '2020-04-22 14:00:00', '2020-04-22 15:00:00', '5e8bbdc7aae93794744577', 14, NULL, NULL, NULL, NULL),
(98, '2020-04-23 14:00:00', '2020-04-23 15:00:00', '5e8bbdc7aae96156423312', 14, NULL, NULL, NULL, NULL),
(99, '2020-04-27 14:00:00', '2020-04-27 15:00:00', '5e8bbdc7aae99989524094', 14, NULL, NULL, NULL, NULL),
(100, '2020-04-28 14:00:00', '2020-04-28 15:00:00', '5e8bbdc7aae9c428809917', 14, NULL, NULL, NULL, NULL),
(101, '2020-04-29 14:00:00', '2020-04-29 15:00:00', '5e8bbdc7aae9f485796984', 14, NULL, NULL, NULL, NULL),
(102, '2020-04-30 14:00:00', '2020-04-30 15:00:00', '5e8bbdc7aaea2192927324', 14, NULL, NULL, NULL, NULL),
(103, '2020-04-11 14:00:00', '2020-04-11 18:00:00', '5e8bbf0f42f51214156433', 15, NULL, NULL, NULL, NULL),
(104, '2020-04-18 14:00:00', '2020-04-18 18:00:00', '5e8bbf0f4301d959300001', 15, NULL, NULL, NULL, NULL),
(105, '2020-04-25 14:00:00', '2020-04-25 18:00:00', '5e8bbf0f43021398965076', 15, NULL, NULL, NULL, NULL),
(106, '2020-04-06 16:00:00', '2020-04-06 17:00:00', '5e8bbf83a84a4847084273', 16, NULL, NULL, NULL, '0.00'),
(107, '2020-04-07 16:00:00', '2020-04-07 17:00:00', '5e8bbf83a886d287612584', 16, NULL, NULL, NULL, NULL),
(108, '2020-04-08 16:00:00', '2020-04-08 17:00:00', '5e8bbf83a8872890817363', 16, NULL, NULL, NULL, NULL),
(109, '2020-04-09 16:00:00', '2020-04-09 17:00:00', '5e8bbf83a8874008274907', 16, NULL, NULL, NULL, NULL),
(110, '2020-04-13 16:00:00', '2020-04-13 17:00:00', '5e8bbf83a8877111819105', 16, NULL, NULL, NULL, NULL),
(111, '2020-04-14 16:00:00', '2020-04-14 17:00:00', '5e8bbf83a8879416143585', 16, NULL, NULL, NULL, NULL),
(112, '2020-04-15 16:00:00', '2020-04-15 17:00:00', '5e8bbf83a887b975780859', 16, NULL, NULL, NULL, NULL),
(113, '2020-04-16 16:00:00', '2020-04-16 17:00:00', '5e8bbf83a887d797759568', 16, NULL, NULL, NULL, NULL),
(114, '2020-04-20 16:00:00', '2020-04-20 17:00:00', '5e8bbf83a887f959849072', 16, NULL, NULL, NULL, NULL),
(115, '2020-04-21 16:00:00', '2020-04-21 17:00:00', '5e8bbf83a8882034242910', 16, NULL, NULL, NULL, NULL),
(116, '2020-04-22 16:00:00', '2020-04-22 17:00:00', '5e8bbf83a8884107130888', 16, NULL, NULL, NULL, NULL),
(117, '2020-04-23 16:00:00', '2020-04-23 17:00:00', '5e8bbf83a8886900948943', 16, NULL, NULL, NULL, NULL),
(118, '2020-04-27 16:00:00', '2020-04-27 17:00:00', '5e8bbf83a8887378729316', 16, NULL, NULL, NULL, NULL),
(119, '2020-04-28 16:00:00', '2020-04-28 17:00:00', '5e8bbf83a8889751994462', 16, NULL, NULL, NULL, NULL),
(120, '2020-04-29 16:00:00', '2020-04-29 17:00:00', '5e8bbf83a888b325309617', 16, NULL, NULL, NULL, NULL),
(121, '2020-04-30 16:00:00', '2020-04-30 17:00:00', '5e8bbf83a888e478982667', 16, NULL, NULL, NULL, NULL),
(122, '2020-04-06 17:00:00', '2020-04-06 18:00:00', '5e8bbfbf4c1f4838396107', 17, NULL, NULL, NULL, '0.00'),
(123, '2020-04-07 17:00:00', '2020-04-07 18:00:00', '5e8bbfbf4c554833263641', 17, NULL, NULL, NULL, NULL),
(124, '2020-04-08 17:00:00', '2020-04-08 18:00:00', '5e8bbfbf4c558045692680', 17, NULL, NULL, NULL, NULL),
(125, '2020-04-09 17:00:00', '2020-04-09 18:00:00', '5e8bbfbf4c55a858501760', 17, NULL, NULL, NULL, NULL),
(126, '2020-04-13 17:00:00', '2020-04-13 18:00:00', '5e8bbfbf4c55c165457896', 17, NULL, NULL, NULL, NULL),
(127, '2020-04-14 17:00:00', '2020-04-14 18:00:00', '5e8bbfbf4c55f741086206', 17, NULL, NULL, NULL, NULL),
(128, '2020-04-15 17:00:00', '2020-04-15 18:00:00', '5e8bbfbf4c561058810312', 17, NULL, NULL, NULL, NULL),
(129, '2020-04-16 17:00:00', '2020-04-16 18:00:00', '5e8bbfbf4c563113601825', 17, NULL, NULL, NULL, NULL),
(130, '2020-04-20 17:00:00', '2020-04-20 18:00:00', '5e8bbfbf4c565352277355', 17, NULL, NULL, NULL, NULL),
(131, '2020-04-21 17:00:00', '2020-04-21 18:00:00', '5e8bbfbf4c567596219210', 17, NULL, NULL, NULL, NULL),
(132, '2020-04-22 17:00:00', '2020-04-22 18:00:00', '5e8bbfbf4c569298864166', 17, NULL, NULL, NULL, NULL),
(133, '2020-04-23 17:00:00', '2020-04-23 18:00:00', '5e8bbfbf4c56b482518110', 17, NULL, NULL, NULL, NULL),
(134, '2020-04-27 17:00:00', '2020-04-27 18:00:00', '5e8bbfbf4c56d570322813', 17, NULL, NULL, NULL, NULL),
(135, '2020-04-28 17:00:00', '2020-04-28 18:00:00', '5e8bbfbf4c56f945701617', 17, NULL, NULL, NULL, NULL),
(136, '2020-04-29 17:00:00', '2020-04-29 18:00:00', '5e8bbfbf4c571125585145', 17, NULL, NULL, NULL, NULL),
(137, '2020-04-30 17:00:00', '2020-04-30 18:00:00', '5e8bbfbf4c573812680388', 17, NULL, NULL, NULL, NULL),
(138, '2020-04-06 19:00:00', '2020-04-06 20:00:00', '5e8bc06a446df137611595', 18, NULL, NULL, NULL, '0.00'),
(139, '2020-04-07 19:00:00', '2020-04-07 20:00:00', '5e8bc06a44a2f909625676', 18, NULL, NULL, NULL, NULL),
(140, '2020-04-08 19:00:00', '2020-04-08 20:00:00', '5e8bc06a44a33486959984', 18, NULL, NULL, NULL, NULL),
(141, '2020-04-09 19:00:00', '2020-04-09 20:00:00', '5e8bc06a44a35526099636', 18, NULL, NULL, NULL, NULL),
(142, '2020-04-13 19:00:00', '2020-04-13 20:00:00', '5e8bc06a44a38672454839', 18, NULL, NULL, NULL, NULL),
(143, '2020-04-14 19:00:00', '2020-04-14 20:00:00', '5e8bc06a44a3a964462428', 18, NULL, NULL, NULL, NULL),
(144, '2020-04-15 19:00:00', '2020-04-15 20:00:00', '5e8bc06a44a3c493445702', 18, NULL, NULL, NULL, NULL),
(145, '2020-04-16 19:00:00', '2020-04-16 20:00:00', '5e8bc06a44a3e761512031', 18, NULL, NULL, NULL, NULL),
(146, '2020-04-20 19:00:00', '2020-04-20 20:00:00', '5e8bc06a44a40770839594', 18, NULL, NULL, NULL, NULL),
(147, '2020-04-21 19:00:00', '2020-04-21 20:00:00', '5e8bc06a44a42180411641', 18, NULL, NULL, NULL, NULL),
(148, '2020-04-22 19:00:00', '2020-04-22 20:00:00', '5e8bc06a44a43798798893', 18, NULL, NULL, NULL, NULL),
(149, '2020-04-23 19:00:00', '2020-04-23 20:00:00', '5e8bc06a44a45073455506', 18, NULL, NULL, NULL, NULL),
(150, '2020-04-27 19:00:00', '2020-04-27 20:00:00', '5e8bc06a44a47730196879', 18, NULL, NULL, NULL, NULL),
(151, '2020-04-28 19:00:00', '2020-04-28 20:00:00', '5e8bc06a44a49109906323', 18, NULL, NULL, NULL, NULL),
(152, '2020-04-29 19:00:00', '2020-04-29 20:00:00', '5e8bc06a44a4b571854926', 18, NULL, NULL, NULL, NULL),
(153, '2020-04-30 19:00:00', '2020-04-30 20:00:00', '5e8bc06a44a4d787132238', 18, NULL, NULL, NULL, NULL),
(154, '2020-04-06 21:00:00', '2020-04-06 22:00:00', '5e8bc0d147687940757623', 19, NULL, NULL, NULL, '0.00'),
(155, '2020-04-07 21:00:00', '2020-04-07 22:00:00', '5e8bc0d147a0d382439576', 19, NULL, NULL, NULL, NULL),
(156, '2020-04-08 21:00:00', '2020-04-08 22:00:00', '5e8bc0d147a11651158860', 19, NULL, NULL, NULL, NULL),
(157, '2020-04-09 21:00:00', '2020-04-09 22:00:00', '5e8bc0d147a13680656885', 19, NULL, NULL, NULL, NULL),
(158, '2020-04-13 21:00:00', '2020-04-13 22:00:00', '5e8bc0d147a15748946273', 19, NULL, NULL, NULL, NULL),
(159, '2020-04-14 21:00:00', '2020-04-14 22:00:00', '5e8bc0d147a18212594738', 19, NULL, NULL, NULL, NULL),
(160, '2020-04-15 21:00:00', '2020-04-15 22:00:00', '5e8bc0d147a1a526118454', 19, NULL, NULL, NULL, NULL),
(161, '2020-04-16 21:00:00', '2020-04-16 22:00:00', '5e8bc0d147a1c113667480', 19, NULL, NULL, NULL, NULL),
(162, '2020-04-20 21:00:00', '2020-04-20 22:00:00', '5e8bc0d147a1e693798645', 19, NULL, NULL, NULL, NULL),
(163, '2020-04-21 21:00:00', '2020-04-21 22:00:00', '5e8bc0d147a20773739814', 19, NULL, NULL, NULL, NULL),
(164, '2020-04-22 21:00:00', '2020-04-22 22:00:00', '5e8bc0d147a22321158443', 19, NULL, NULL, NULL, NULL),
(165, '2020-04-23 21:00:00', '2020-04-23 22:00:00', '5e8bc0d147a24646134522', 19, NULL, NULL, NULL, NULL),
(166, '2020-04-27 21:00:00', '2020-04-27 22:00:00', '5e8bc0d147a26269032465', 19, NULL, NULL, NULL, NULL),
(167, '2020-04-28 21:00:00', '2020-04-28 22:00:00', '5e8bc0d147a28886007343', 19, NULL, NULL, NULL, NULL),
(168, '2020-04-29 21:00:00', '2020-04-29 22:00:00', '5e8bc0d147a2a131993700', 19, NULL, NULL, NULL, NULL),
(169, '2020-04-30 21:00:00', '2020-04-30 22:00:00', '5e8bc0d147a2c831702603', 19, NULL, NULL, NULL, NULL),
(170, '2020-04-06 22:00:00', '2020-04-06 23:00:00', '5e8bc0fb362f4538975198', 20, NULL, NULL, NULL, '0.00'),
(171, '2020-04-07 22:00:00', '2020-04-07 23:00:00', '5e8bc10bcebfd108348027', 20, NULL, NULL, NULL, NULL),
(172, '2020-04-08 22:00:00', '2020-04-08 23:00:00', '5e8bc10bcec25096309019', 20, NULL, NULL, NULL, NULL),
(173, '2020-04-09 22:00:00', '2020-04-09 23:00:00', '5e8bc10bcec67667181663', 20, NULL, NULL, NULL, NULL),
(174, '2020-04-13 22:00:00', '2020-04-13 23:00:00', '5e8bc10bcec8b843931238', 20, NULL, NULL, NULL, NULL),
(175, '2020-04-14 22:00:00', '2020-04-14 23:00:00', '5e8bc10bcecb4635248807', 20, NULL, NULL, NULL, NULL),
(176, '2020-04-15 22:00:00', '2020-04-15 23:00:00', '5e8bc10bcecd9375501402', 20, NULL, NULL, NULL, NULL),
(177, '2020-04-16 22:00:00', '2020-04-16 23:00:00', '5e8bc10bcecff307970786', 20, NULL, NULL, NULL, NULL),
(178, '2020-04-20 22:00:00', '2020-04-20 23:00:00', '5e8bc10bced25394716312', 20, NULL, NULL, NULL, NULL),
(179, '2020-04-21 22:00:00', '2020-04-21 23:00:00', '5e8bc10bced4c230419955', 20, NULL, NULL, NULL, NULL),
(180, '2020-04-22 22:00:00', '2020-04-22 23:00:00', '5e8bc10bced74267201561', 20, NULL, NULL, NULL, NULL),
(181, '2020-04-23 22:00:00', '2020-04-23 23:00:00', '5e8bc10bced9f421036144', 20, NULL, NULL, NULL, NULL),
(182, '2020-04-27 22:00:00', '2020-04-27 23:00:00', '5e8bc10bcedc8422204323', 20, NULL, NULL, NULL, NULL),
(183, '2020-04-28 22:00:00', '2020-04-28 23:00:00', '5e8bc10bcedf2413083052', 20, NULL, NULL, NULL, NULL),
(184, '2020-04-29 22:00:00', '2020-04-29 23:00:00', '5e8bc10bcee35638881085', 20, NULL, NULL, NULL, NULL),
(185, '2020-04-30 22:00:00', '2020-04-30 23:00:00', '5e8bc10bcee74838286520', 20, NULL, NULL, NULL, NULL),
(186, '2020-04-10 23:00:00', '2020-04-11 03:00:00', '5e8bc16ecc3f4282936184', 21, NULL, NULL, NULL, NULL),
(187, '2020-04-17 23:00:00', '2020-04-18 03:00:00', '5e8bc16ecc4e7607190178', 21, NULL, NULL, NULL, NULL),
(188, '2020-04-24 23:00:00', '2020-04-25 03:00:00', '5e8bc16ecc4eb864883650', 21, NULL, NULL, NULL, NULL),
(189, '2020-05-01 23:00:00', '2020-05-02 03:00:00', '5e8bc16ecc4ed083411643', 21, NULL, NULL, NULL, NULL),
(190, '2020-04-06 23:00:00', '2020-04-07 00:00:00', '5e8bc1af83b6d335081117', 22, NULL, NULL, NULL, NULL),
(191, '2020-04-07 23:00:00', '2020-04-08 00:00:00', '5e8bc1af83fd6282344238', 22, NULL, NULL, NULL, NULL),
(192, '2020-04-08 23:00:00', '2020-04-09 00:00:00', '5e8bc1af83fdc508969321', 22, NULL, NULL, NULL, NULL),
(193, '2020-04-09 23:00:00', '2020-04-10 00:00:00', '5e8bc1af83fde639881352', 22, NULL, NULL, NULL, NULL),
(194, '2020-04-13 23:00:00', '2020-04-14 00:00:00', '5e8bc1af83fe0288472520', 22, NULL, NULL, NULL, NULL),
(195, '2020-04-14 23:00:00', '2020-04-15 00:00:00', '5e8bc1af83fe3420465962', 22, NULL, NULL, NULL, NULL),
(196, '2020-04-15 23:00:00', '2020-04-16 00:00:00', '5e8bc1af83fe5493959760', 22, NULL, NULL, NULL, NULL),
(197, '2020-04-16 23:00:00', '2020-04-17 00:00:00', '5e8bc1af83fe8215412462', 22, NULL, NULL, NULL, NULL),
(198, '2020-04-20 23:00:00', '2020-04-21 00:00:00', '5e8bc1af83fea952279930', 22, NULL, NULL, NULL, NULL),
(199, '2020-04-21 23:00:00', '2020-04-22 00:00:00', '5e8bc1af83fec996874315', 22, NULL, NULL, NULL, NULL),
(200, '2020-04-22 23:00:00', '2020-04-23 00:00:00', '5e8bc1af83fee320399507', 22, NULL, NULL, NULL, NULL),
(201, '2020-04-23 23:00:00', '2020-04-24 00:00:00', '5e8bc1af83ff0099219540', 22, NULL, NULL, NULL, NULL),
(202, '2020-04-27 23:00:00', '2020-04-28 00:00:00', '5e8bc1af83ff2537543168', 22, NULL, NULL, NULL, NULL),
(203, '2020-04-28 23:00:00', '2020-04-29 00:00:00', '5e8bc1af83ff4472861744', 22, NULL, NULL, NULL, NULL),
(204, '2020-04-29 23:00:00', '2020-04-30 00:00:00', '5e8bc1af83ff6545969425', 22, NULL, NULL, NULL, NULL),
(205, '2020-04-30 23:00:00', '2020-05-01 00:00:00', '5e8bc1af83ff8143648124', 22, NULL, NULL, NULL, NULL),
(206, '2020-04-07 00:00:00', '2020-04-07 01:00:00', '5e8bc1f830e41222332808', 23, NULL, NULL, NULL, NULL),
(207, '2020-04-08 00:00:00', '2020-04-08 01:00:00', '5e8bc208f239b642307042', 23, NULL, NULL, NULL, NULL),
(208, '2020-04-09 00:00:00', '2020-04-09 01:00:00', '5e8bc208f23c2541934460', 23, NULL, NULL, NULL, NULL),
(209, '2020-04-10 00:00:00', '2020-04-10 01:00:00', '5e8bc208f23e0278342952', 23, NULL, NULL, NULL, NULL),
(210, '2020-04-14 00:00:00', '2020-04-14 01:00:00', '5e8bc208f23fc906190522', 23, NULL, NULL, NULL, NULL),
(211, '2020-04-15 00:00:00', '2020-04-15 01:00:00', '5e8bc208f2419522450397', 23, NULL, NULL, NULL, NULL),
(212, '2020-04-16 00:00:00', '2020-04-16 01:00:00', '5e8bc208f2437958121961', 23, NULL, NULL, NULL, NULL),
(213, '2020-04-17 00:00:00', '2020-04-17 01:00:00', '5e8bc208f2455460830848', 23, NULL, NULL, NULL, NULL),
(214, '2020-04-21 00:00:00', '2020-04-21 01:00:00', '5e8bc208f2472428217338', 23, NULL, NULL, NULL, NULL),
(215, '2020-04-22 00:00:00', '2020-04-22 01:00:00', '5e8bc208f2491950989457', 23, NULL, NULL, NULL, NULL),
(216, '2020-04-23 00:00:00', '2020-04-23 01:00:00', '5e8bc208f24b0238018265', 23, NULL, NULL, NULL, NULL),
(217, '2020-04-24 00:00:00', '2020-04-24 01:00:00', '5e8bc208f24ce861252967', 23, NULL, NULL, NULL, NULL),
(218, '2020-04-28 00:00:00', '2020-04-28 01:00:00', '5e8bc208f24ed212397858', 23, NULL, NULL, NULL, NULL),
(219, '2020-04-29 00:00:00', '2020-04-29 01:00:00', '5e8bc208f250d389983504', 23, NULL, NULL, NULL, NULL),
(220, '2020-04-30 00:00:00', '2020-04-30 01:00:00', '5e8bc208f252d193663102', 23, NULL, NULL, NULL, NULL),
(221, '2020-05-01 00:00:00', '2020-05-01 01:00:00', '5e8bc208f254e363242405', 23, NULL, NULL, NULL, NULL),
(222, '2020-04-07 01:00:00', '2020-04-07 02:00:00', '5e8bc24a03289501122041', 24, NULL, NULL, NULL, NULL),
(223, '2020-04-08 01:00:00', '2020-04-08 02:00:00', '5e8bc24a0361a182679693', 24, NULL, NULL, NULL, NULL),
(224, '2020-04-09 01:00:00', '2020-04-09 02:00:00', '5e8bc24a0361e928341612', 24, NULL, NULL, NULL, NULL),
(225, '2020-04-10 01:00:00', '2020-04-10 02:00:00', '5e8bc24a03621401114248', 24, NULL, NULL, NULL, NULL),
(226, '2020-04-14 01:00:00', '2020-04-14 02:00:00', '5e8bc24a03623833393755', 24, NULL, NULL, NULL, NULL),
(227, '2020-04-15 01:00:00', '2020-04-15 02:00:00', '5e8bc24a03625113311826', 24, NULL, NULL, NULL, NULL),
(228, '2020-04-16 01:00:00', '2020-04-16 02:00:00', '5e8bc24a03627744128829', 24, NULL, NULL, NULL, NULL),
(229, '2020-04-17 01:00:00', '2020-04-17 02:00:00', '5e8bc24a03629698084971', 24, NULL, NULL, NULL, NULL),
(230, '2020-04-21 01:00:00', '2020-04-21 02:00:00', '5e8bc24a0362b369036884', 24, NULL, NULL, NULL, NULL),
(231, '2020-04-22 01:00:00', '2020-04-22 02:00:00', '5e8bc24a0362e625583025', 24, NULL, NULL, NULL, NULL),
(232, '2020-04-23 01:00:00', '2020-04-23 02:00:00', '5e8bc24a0362f567514964', 24, NULL, NULL, NULL, NULL),
(233, '2020-04-24 01:00:00', '2020-04-24 02:00:00', '5e8bc24a03631943099909', 24, NULL, NULL, NULL, NULL),
(234, '2020-04-28 01:00:00', '2020-04-28 02:00:00', '5e8bc24a03633306554344', 24, NULL, NULL, NULL, NULL),
(235, '2020-04-29 01:00:00', '2020-04-29 02:00:00', '5e8bc24a03635507374060', 24, NULL, NULL, NULL, NULL),
(236, '2020-04-30 01:00:00', '2020-04-30 02:00:00', '5e8bc24a03637764134849', 24, NULL, NULL, NULL, NULL),
(237, '2020-05-01 01:00:00', '2020-05-01 02:00:00', '5e8bc24a0363a114070109', 24, NULL, NULL, NULL, NULL),
(238, '2020-04-07 02:00:00', '2020-04-07 03:00:00', '5e8bc29a73abc562451469', 25, NULL, NULL, NULL, NULL),
(239, '2020-04-08 02:00:00', '2020-04-08 03:00:00', '5e8bc29a74055053723048', 25, NULL, NULL, NULL, NULL),
(240, '2020-04-09 02:00:00', '2020-04-09 03:00:00', '5e8bc29a7405c959477869', 25, NULL, NULL, NULL, NULL),
(241, '2020-04-10 02:00:00', '2020-04-10 03:00:00', '5e8bc29a7405f918699687', 25, NULL, NULL, NULL, NULL),
(242, '2020-04-14 02:00:00', '2020-04-14 03:00:00', '5e8bc29a74062028633018', 25, NULL, NULL, NULL, NULL),
(243, '2020-04-15 02:00:00', '2020-04-15 03:00:00', '5e8bc29a74065486512674', 25, NULL, NULL, NULL, NULL),
(244, '2020-04-16 02:00:00', '2020-04-16 03:00:00', '5e8bc29a74068555711325', 25, NULL, NULL, NULL, NULL),
(245, '2020-04-17 02:00:00', '2020-04-17 03:00:00', '5e8bc29a7406b603804266', 25, NULL, NULL, NULL, NULL),
(246, '2020-04-21 02:00:00', '2020-04-21 03:00:00', '5e8bc29a7406e628925849', 25, NULL, NULL, NULL, NULL),
(247, '2020-04-22 02:00:00', '2020-04-22 03:00:00', '5e8bc29a74072873231066', 25, NULL, NULL, NULL, NULL),
(248, '2020-04-23 02:00:00', '2020-04-23 03:00:00', '5e8bc29a74075865419173', 25, NULL, NULL, NULL, NULL),
(249, '2020-04-24 02:00:00', '2020-04-24 03:00:00', '5e8bc29a74078640719950', 25, NULL, NULL, NULL, NULL),
(250, '2020-04-28 02:00:00', '2020-04-28 03:00:00', '5e8bc29a7407b370121510', 25, NULL, NULL, NULL, NULL),
(251, '2020-04-29 02:00:00', '2020-04-29 03:00:00', '5e8bc29a7407e309640741', 25, NULL, NULL, NULL, NULL),
(252, '2020-04-30 02:00:00', '2020-04-30 03:00:00', '5e8bc29a74081384180456', 25, NULL, NULL, NULL, NULL),
(253, '2020-05-01 02:00:00', '2020-05-01 03:00:00', '5e8bc29a74084516364065', 25, NULL, NULL, NULL, NULL),
(254, '2020-04-11 14:00:00', '2020-04-11 19:00:00', '5e8bc3311cd65208605809', 26, NULL, NULL, NULL, NULL),
(255, '2020-04-18 14:00:00', '2020-04-18 19:00:00', '5e8bc3311ce2e668949199', 26, NULL, NULL, NULL, NULL),
(256, '2020-04-25 14:00:00', '2020-04-25 19:00:00', '5e8bc3311ce32999842375', 26, NULL, NULL, NULL, NULL),
(257, '2020-04-10 14:00:00', '2020-04-10 18:00:00', '5e8bc530e9d4a418890449', 27, NULL, NULL, NULL, NULL),
(258, '2020-04-17 14:00:00', '2020-04-17 18:00:00', '5e8bc530e9e8c880453503', 27, NULL, NULL, NULL, NULL),
(259, '2020-04-24 14:00:00', '2020-04-24 18:00:00', '5e8bc530e9e9e721304681', 27, NULL, NULL, NULL, NULL),
(260, '2020-05-01 14:00:00', '2020-05-01 18:00:00', '5e8bc530e9ea2377063490', 27, NULL, NULL, NULL, NULL),
(261, '2020-04-06 17:00:00', '2020-04-06 18:00:00', '5e8bc569e1c13739247751', 28, NULL, NULL, NULL, '0.00'),
(262, '2020-04-07 17:00:00', '2020-04-07 18:00:00', '5e8bc569e2287488436022', 28, NULL, NULL, NULL, NULL),
(263, '2020-04-08 17:00:00', '2020-04-08 18:00:00', '5e8bc569e2291433435589', 28, NULL, NULL, NULL, NULL),
(264, '2020-04-09 17:00:00', '2020-04-09 18:00:00', '5e8bc569e2293951897939', 28, NULL, NULL, NULL, NULL),
(265, '2020-04-13 17:00:00', '2020-04-13 18:00:00', '5e8bc569e2296178834024', 28, NULL, NULL, NULL, NULL),
(266, '2020-04-14 17:00:00', '2020-04-14 18:00:00', '5e8bc569e2298496200964', 28, NULL, NULL, NULL, NULL),
(267, '2020-04-15 17:00:00', '2020-04-15 18:00:00', '5e8bc569e229a940784549', 28, NULL, NULL, NULL, NULL),
(268, '2020-04-16 17:00:00', '2020-04-16 18:00:00', '5e8bc569e229c887740421', 28, NULL, NULL, NULL, NULL),
(269, '2020-04-20 17:00:00', '2020-04-20 18:00:00', '5e8bc569e229e887937676', 28, NULL, NULL, NULL, NULL),
(270, '2020-04-21 17:00:00', '2020-04-21 18:00:00', '5e8bc569e22a0184219235', 28, NULL, NULL, NULL, NULL),
(271, '2020-04-22 17:00:00', '2020-04-22 18:00:00', '5e8bc569e22a2763878748', 28, NULL, NULL, NULL, NULL),
(272, '2020-04-23 17:00:00', '2020-04-23 18:00:00', '5e8bc569e22a4250647099', 28, NULL, NULL, NULL, NULL),
(273, '2020-04-27 17:00:00', '2020-04-27 18:00:00', '5e8bc569e22a6649968979', 28, NULL, NULL, NULL, NULL),
(274, '2020-04-28 17:00:00', '2020-04-28 18:00:00', '5e8bc569e22a8744759094', 28, NULL, NULL, NULL, NULL),
(275, '2020-04-29 17:00:00', '2020-04-29 18:00:00', '5e8bc569e22aa002366999', 28, NULL, NULL, NULL, NULL),
(276, '2020-04-30 17:00:00', '2020-04-30 18:00:00', '5e8bc569e22ac630304374', 28, NULL, NULL, NULL, NULL),
(277, '2020-04-07 00:00:00', '2020-04-07 01:00:00', '5e8bc5b5611d6640367872', 29, NULL, NULL, '2020-04-08 01:00:00', NULL),
(278, '2020-04-09 00:00:00', '2020-04-09 01:00:00', '5e8bc5ce4a08a412955447', 29, NULL, NULL, NULL, NULL),
(279, '2020-04-10 00:00:00', '2020-04-10 01:00:00', '5e8bc5ce4a0a6274222503', 29, NULL, NULL, NULL, NULL),
(280, '2020-04-14 00:00:00', '2020-04-14 01:00:00', '5e8bc5ce4a0c2752310189', 29, NULL, NULL, NULL, NULL),
(281, '2020-04-15 00:00:00', '2020-04-15 01:00:00', '5e8bc5ce4a0de986152130', 29, NULL, NULL, NULL, NULL),
(282, '2020-04-16 00:00:00', '2020-04-16 01:00:00', '5e8bc5ce4a0fa720608681', 29, NULL, NULL, NULL, NULL),
(283, '2020-04-17 00:00:00', '2020-04-17 01:00:00', '5e8bc5ce4a12a958957001', 29, NULL, NULL, NULL, NULL),
(284, '2020-04-08 00:00:00', '2020-04-08 01:00:00', '5e8bc5ce4a068560262295', 29, NULL, NULL, NULL, NULL),
(285, '2020-04-22 00:00:00', '2020-04-22 01:00:00', '5e8bc5ce4a175492832815', 29, NULL, NULL, NULL, NULL),
(286, '2020-04-23 00:00:00', '2020-04-23 01:00:00', '5e8bc5ce4a194483142098', 29, NULL, NULL, NULL, NULL),
(287, '2020-04-24 00:00:00', '2020-04-24 01:00:00', '5e8bc5ce4a1dc254964487', 29, NULL, NULL, NULL, NULL),
(288, '2020-04-28 00:00:00', '2020-04-28 01:00:00', '5e8bc5ce4a20f181222330', 29, NULL, NULL, NULL, NULL),
(289, '2020-04-29 00:00:00', '2020-04-29 01:00:00', '5e8bc5ce4a230233433670', 29, NULL, NULL, NULL, NULL),
(290, '2020-04-30 00:00:00', '2020-04-30 01:00:00', '5e8bc5ce4a26c227297396', 29, NULL, NULL, NULL, NULL),
(291, '2020-05-01 00:00:00', '2020-05-01 01:00:00', '5e8bc5ce4a28d859049234', 29, NULL, NULL, NULL, NULL),
(292, '2020-04-21 00:00:00', '2020-04-21 01:00:00', '5e8bc5ce4a155937387431', 29, NULL, NULL, NULL, NULL),
(293, '2020-04-06 13:00:00', '2020-04-06 14:00:00', '5e8bc6503c77c713453278', 30, NULL, NULL, NULL, '0.00'),
(294, '2020-04-07 13:00:00', '2020-04-07 14:00:00', '5e8bc6503cafe383197640', 30, NULL, NULL, NULL, NULL),
(295, '2020-04-08 13:00:00', '2020-04-08 14:00:00', '5e8bc6503cb02436709162', 30, NULL, NULL, NULL, NULL),
(296, '2020-04-09 13:00:00', '2020-04-09 14:00:00', '5e8bc6503cb05354379800', 30, NULL, NULL, NULL, NULL),
(297, '2020-04-13 13:00:00', '2020-04-13 14:00:00', '5e8bc6503cb07322557156', 30, NULL, NULL, NULL, NULL),
(298, '2020-04-14 13:00:00', '2020-04-14 14:00:00', '5e8bc6503cb09783040356', 30, NULL, NULL, NULL, NULL),
(299, '2020-04-15 13:00:00', '2020-04-15 14:00:00', '5e8bc6503cb0b968464494', 30, NULL, NULL, NULL, NULL),
(300, '2020-04-16 13:00:00', '2020-04-16 14:00:00', '5e8bc6503cb0d667656587', 30, NULL, NULL, NULL, NULL),
(301, '2020-04-20 13:00:00', '2020-04-20 14:00:00', '5e8bc6503cb0f017826532', 30, NULL, NULL, NULL, NULL),
(302, '2020-04-21 13:00:00', '2020-04-21 14:00:00', '5e8bc6503cb12686335390', 30, NULL, NULL, NULL, NULL),
(303, '2020-04-22 13:00:00', '2020-04-22 14:00:00', '5e8bc6503cb14638984421', 30, NULL, NULL, NULL, NULL),
(304, '2020-04-23 13:00:00', '2020-04-23 14:00:00', '5e8bc6503cb16262011753', 30, NULL, NULL, NULL, NULL),
(305, '2020-04-27 13:00:00', '2020-04-27 14:00:00', '5e8bc6503cb18139990132', 30, NULL, NULL, NULL, NULL),
(306, '2020-04-28 13:00:00', '2020-04-28 14:00:00', '5e8bc6503cb1a399366751', 30, NULL, NULL, NULL, NULL),
(307, '2020-04-29 13:00:00', '2020-04-29 14:00:00', '5e8bc6503cb1c998044841', 30, NULL, NULL, NULL, NULL),
(308, '2020-04-30 13:00:00', '2020-04-30 14:00:00', '5e8bc6503cb1e481882590', 30, NULL, NULL, NULL, NULL),
(309, '2020-04-06 14:00:00', '2020-04-06 15:00:00', '5e8bc68195169941364573', 31, NULL, NULL, NULL, '0.00'),
(310, '2020-04-07 14:00:00', '2020-04-07 15:00:00', '5e8bc681952ec026394362', 31, NULL, NULL, NULL, NULL),
(311, '2020-04-08 14:00:00', '2020-04-08 15:00:00', '5e8bc681952f1376360006', 31, NULL, NULL, NULL, NULL),
(312, '2020-04-09 14:00:00', '2020-04-09 15:00:00', '5e8bc681952f3534690909', 31, NULL, NULL, NULL, NULL),
(313, '2020-04-13 14:00:00', '2020-04-13 15:00:00', '5e8bc681952f5424160715', 31, NULL, NULL, NULL, NULL),
(314, '2020-04-06 17:00:00', '2020-04-06 18:00:00', '5e8bc6dd35bae069821477', 32, NULL, NULL, NULL, '0.00'),
(315, '2020-04-07 17:00:00', '2020-04-07 18:00:00', '5e8bc6dd361bc809109274', 32, NULL, NULL, NULL, NULL),
(316, '2020-04-08 17:00:00', '2020-04-08 18:00:00', '5e8bc6dd361c6995855000', 32, NULL, NULL, NULL, NULL),
(317, '2020-04-09 17:00:00', '2020-04-09 18:00:00', '5e8bc6dd361c9282972521', 32, NULL, NULL, NULL, NULL),
(318, '2020-04-13 17:00:00', '2020-04-13 18:00:00', '5e8bc6dd361cc534171873', 32, NULL, NULL, NULL, NULL),
(319, '2020-04-14 17:00:00', '2020-04-14 18:00:00', '5e8bc6dd361d0411346132', 32, NULL, NULL, NULL, NULL),
(320, '2020-04-15 17:00:00', '2020-04-15 18:00:00', '5e8bc6dd361d3530836473', 32, NULL, NULL, NULL, NULL),
(321, '2020-04-16 17:00:00', '2020-04-16 18:00:00', '5e8bc6dd361d6023717940', 32, NULL, NULL, NULL, NULL),
(322, '2020-04-20 17:00:00', '2020-04-20 18:00:00', '5e8bc6dd361da776019587', 32, NULL, NULL, NULL, NULL),
(323, '2020-04-21 17:00:00', '2020-04-21 18:00:00', '5e8bc6dd361dd528772631', 32, NULL, NULL, NULL, NULL),
(324, '2020-04-22 17:00:00', '2020-04-22 18:00:00', '5e8bc6dd361e0387933547', 32, NULL, NULL, NULL, NULL),
(325, '2020-04-23 17:00:00', '2020-04-23 18:00:00', '5e8bc6dd361e3290635417', 32, NULL, NULL, NULL, NULL),
(326, '2020-04-27 17:00:00', '2020-04-27 18:00:00', '5e8bc6dd361e6949879040', 32, NULL, NULL, NULL, NULL),
(327, '2020-04-28 17:00:00', '2020-04-28 18:00:00', '5e8bc6dd361e9165120230', 32, NULL, NULL, NULL, NULL),
(328, '2020-04-29 17:00:00', '2020-04-29 18:00:00', '5e8bc6dd361ec670382904', 32, NULL, NULL, NULL, NULL),
(329, '2020-04-30 17:00:00', '2020-04-30 18:00:00', '5e8bc6dd361f0332738138', 32, NULL, NULL, NULL, NULL),
(330, '2020-04-06 15:00:00', '2020-04-06 16:00:00', '5e8bc71ca0855856480715', 33, NULL, NULL, NULL, '0.00'),
(331, '2020-04-07 15:00:00', '2020-04-07 16:00:00', '5e8bc71ca0bcf968255501', 33, NULL, NULL, NULL, NULL),
(332, '2020-04-08 15:00:00', '2020-04-08 16:00:00', '5e8bc71ca0bd4824640057', 33, NULL, NULL, NULL, NULL),
(333, '2020-04-09 15:00:00', '2020-04-09 16:00:00', '5e8bc71ca0bd6574530668', 33, NULL, NULL, NULL, NULL),
(334, '2020-04-13 15:00:00', '2020-04-13 16:00:00', '5e8bc71ca0bd9831091944', 33, NULL, NULL, NULL, NULL),
(335, '2020-04-14 15:00:00', '2020-04-14 16:00:00', '5e8bc71ca0bdb503075948', 33, NULL, NULL, NULL, NULL),
(336, '2020-04-15 15:00:00', '2020-04-15 16:00:00', '5e8bc71ca0bdd679801193', 33, NULL, NULL, NULL, NULL),
(337, '2020-04-16 15:00:00', '2020-04-16 16:00:00', '5e8bc71ca0bdf554035391', 33, NULL, NULL, NULL, NULL),
(338, '2020-04-20 15:00:00', '2020-04-20 16:00:00', '5e8bc71ca0be1625006489', 33, NULL, NULL, NULL, NULL),
(339, '2020-04-21 15:00:00', '2020-04-21 16:00:00', '5e8bc71ca0be4247002173', 33, NULL, NULL, NULL, NULL),
(340, '2020-04-22 15:00:00', '2020-04-22 16:00:00', '5e8bc71ca0be6899872182', 33, NULL, NULL, NULL, NULL),
(341, '2020-04-23 15:00:00', '2020-04-23 16:00:00', '5e8bc71ca0be8188231845', 33, NULL, NULL, NULL, NULL),
(342, '2020-04-27 15:00:00', '2020-04-27 16:00:00', '5e8bc71ca0bea681891178', 33, NULL, NULL, NULL, NULL),
(343, '2020-04-28 15:00:00', '2020-04-28 16:00:00', '5e8bc71ca0bec142475986', 33, NULL, NULL, NULL, NULL),
(344, '2020-04-29 15:00:00', '2020-04-29 16:00:00', '5e8bc71ca0bee866887652', 33, NULL, NULL, NULL, NULL),
(345, '2020-04-30 15:00:00', '2020-04-30 16:00:00', '5e8bc71ca0bf0395405578', 33, NULL, NULL, NULL, NULL),
(346, '2020-04-06 16:00:00', '2020-04-06 17:00:00', '5e8bc7447a20b043881200', 34, NULL, NULL, NULL, '0.00'),
(347, '2020-04-06 18:00:00', '2020-04-06 19:00:00', '5e8bc7753659e774355474', 35, NULL, NULL, NULL, '0.00'),
(348, '2020-04-07 18:00:00', '2020-04-07 19:00:00', '5e8bc7753694f674239396', 35, NULL, NULL, NULL, NULL),
(349, '2020-04-08 18:00:00', '2020-04-08 19:00:00', '5e8bc77536953417951262', 35, NULL, NULL, NULL, NULL),
(350, '2020-04-09 18:00:00', '2020-04-09 19:00:00', '5e8bc77536955392088934', 35, NULL, NULL, NULL, NULL),
(351, '2020-04-13 18:00:00', '2020-04-13 19:00:00', '5e8bc77536958272091625', 35, NULL, NULL, NULL, NULL),
(352, '2020-04-14 18:00:00', '2020-04-14 19:00:00', '5e8bc7753695a132148040', 35, NULL, NULL, NULL, NULL),
(353, '2020-04-15 18:00:00', '2020-04-15 19:00:00', '5e8bc7753695c001907478', 35, NULL, NULL, NULL, NULL),
(354, '2020-04-16 18:00:00', '2020-04-16 19:00:00', '5e8bc7753695f235660087', 35, NULL, NULL, NULL, NULL),
(355, '2020-04-20 18:00:00', '2020-04-20 19:00:00', '5e8bc77536961355971666', 35, NULL, NULL, NULL, NULL),
(356, '2020-04-21 18:00:00', '2020-04-21 19:00:00', '5e8bc77536963890827976', 35, NULL, NULL, NULL, NULL),
(357, '2020-04-22 18:00:00', '2020-04-22 19:00:00', '5e8bc77536965417940595', 35, NULL, NULL, NULL, NULL),
(358, '2020-04-23 18:00:00', '2020-04-23 19:00:00', '5e8bc77536967278872481', 35, NULL, NULL, NULL, NULL),
(359, '2020-04-27 18:00:00', '2020-04-27 19:00:00', '5e8bc77536969438137293', 35, NULL, NULL, NULL, NULL),
(360, '2020-04-28 18:00:00', '2020-04-28 19:00:00', '5e8bc7753696b720689069', 35, NULL, NULL, NULL, NULL),
(361, '2020-04-29 18:00:00', '2020-04-29 19:00:00', '5e8bc7753696d838284868', 35, NULL, NULL, NULL, NULL),
(362, '2020-04-30 18:00:00', '2020-04-30 19:00:00', '5e8bc77536970614184693', 35, NULL, NULL, NULL, NULL),
(363, '2020-04-06 20:00:00', '2020-04-06 21:00:00', '5e8bc79c1a887099476918', 36, NULL, NULL, NULL, '0.00'),
(364, '2020-04-07 20:00:00', '2020-04-07 21:00:00', '5e8bc79c1abfd009760641', 36, NULL, NULL, NULL, NULL),
(365, '2020-04-08 20:00:00', '2020-04-08 21:00:00', '5e8bc79c1ac01449781134', 36, NULL, NULL, NULL, NULL),
(366, '2020-04-09 20:00:00', '2020-04-09 21:00:00', '5e8bc79c1ac03539890337', 36, NULL, NULL, NULL, NULL),
(367, '2020-04-13 20:00:00', '2020-04-13 21:00:00', '5e8bc79c1ac05017158641', 36, NULL, NULL, NULL, NULL),
(368, '2020-04-14 20:00:00', '2020-04-14 21:00:00', '5e8bc79c1ac07817164386', 36, NULL, NULL, NULL, NULL),
(369, '2020-04-15 20:00:00', '2020-04-15 21:00:00', '5e8bc79c1ac09723017312', 36, NULL, NULL, NULL, NULL),
(370, '2020-04-16 20:00:00', '2020-04-16 21:00:00', '5e8bc79c1ac0c593081108', 36, NULL, NULL, NULL, NULL),
(371, '2020-04-20 20:00:00', '2020-04-20 21:00:00', '5e8bc79c1ac0e011265034', 36, NULL, NULL, NULL, NULL),
(372, '2020-04-21 20:00:00', '2020-04-21 21:00:00', '5e8bc79c1ac10917933956', 36, NULL, NULL, NULL, NULL),
(373, '2020-04-22 20:00:00', '2020-04-22 21:00:00', '5e8bc79c1ac11340743484', 36, NULL, NULL, NULL, NULL),
(374, '2020-04-23 20:00:00', '2020-04-23 21:00:00', '5e8bc79c1ac13879657876', 36, NULL, NULL, NULL, NULL),
(375, '2020-04-27 20:00:00', '2020-04-27 21:00:00', '5e8bc79c1ac15844907646', 36, NULL, NULL, NULL, NULL),
(376, '2020-04-28 20:00:00', '2020-04-28 21:00:00', '5e8bc79c1ac17724718011', 36, NULL, NULL, NULL, NULL),
(377, '2020-04-29 20:00:00', '2020-04-29 21:00:00', '5e8bc79c1ac19042881147', 36, NULL, NULL, NULL, NULL),
(378, '2020-04-30 20:00:00', '2020-04-30 21:00:00', '5e8bc79c1ac1b327150462', 36, NULL, NULL, NULL, NULL),
(379, '2020-04-06 19:00:00', '2020-04-06 20:00:00', '5e8bc7d1b54f2275552326', 37, NULL, NULL, NULL, '0.00'),
(380, '2020-04-07 19:00:00', '2020-04-07 20:00:00', '5e8bc7d1b599a300151324', 37, NULL, NULL, NULL, NULL),
(381, '2020-04-08 19:00:00', '2020-04-08 20:00:00', '5e8bc7d1b599f159660750', 37, NULL, NULL, NULL, NULL),
(382, '2020-04-09 19:00:00', '2020-04-09 20:00:00', '5e8bc7d1b59a1424041225', 37, NULL, NULL, NULL, NULL),
(383, '2020-04-13 19:00:00', '2020-04-13 20:00:00', '5e8bc7d1b59a3279784966', 37, NULL, NULL, NULL, NULL),
(384, '2020-04-14 19:00:00', '2020-04-14 20:00:00', '5e8bc7d1b59a5728268923', 37, NULL, NULL, NULL, NULL),
(385, '2020-04-15 19:00:00', '2020-04-15 20:00:00', '5e8bc7d1b59a7125664603', 37, NULL, NULL, NULL, NULL),
(386, '2020-04-16 19:00:00', '2020-04-16 20:00:00', '5e8bc7d1b59aa821014687', 37, NULL, NULL, NULL, NULL),
(387, '2020-04-20 19:00:00', '2020-04-20 20:00:00', '5e8bc7d1b59ab530439927', 37, NULL, NULL, NULL, NULL),
(388, '2020-04-21 19:00:00', '2020-04-21 20:00:00', '5e8bc7d1b59ae515778167', 37, NULL, NULL, NULL, NULL),
(389, '2020-04-22 19:00:00', '2020-04-22 20:00:00', '5e8bc7d1b59b0632220264', 37, NULL, NULL, NULL, NULL),
(390, '2020-04-23 19:00:00', '2020-04-23 20:00:00', '5e8bc7d1b59b2722314159', 37, NULL, NULL, NULL, NULL),
(391, '2020-04-27 19:00:00', '2020-04-27 20:00:00', '5e8bc7d1b59b4671151478', 37, NULL, NULL, NULL, NULL),
(392, '2020-04-28 19:00:00', '2020-04-28 20:00:00', '5e8bc7d1b59b6380274499', 37, NULL, NULL, NULL, NULL),
(393, '2020-04-29 19:00:00', '2020-04-29 20:00:00', '5e8bc7d1b59b8275542145', 37, NULL, NULL, NULL, NULL),
(394, '2020-04-30 19:00:00', '2020-04-30 20:00:00', '5e8bc7d1b59ba771611705', 37, NULL, NULL, NULL, NULL),
(395, '2020-04-11 14:00:00', '2020-04-11 18:00:00', '5e8bc810392f9641756933', 38, NULL, NULL, '2020-04-11 19:00:00', NULL),
(396, '2020-04-18 14:00:00', '2020-04-18 18:00:00', '5e8bc821b0b33155812482', 38, NULL, NULL, NULL, NULL),
(397, '2020-04-25 14:00:00', '2020-04-25 18:00:00', '5e8bc821b0b57822849445', 38, NULL, NULL, NULL, NULL),
(398, '2020-04-06 22:00:00', '2020-04-06 23:00:00', '5e8bc8dceb921768435257', 39, NULL, NULL, '2020-04-06 22:00:00', '0.00'),
(413, '2020-04-06 23:00:00', '2020-04-07 00:00:00', '5e8bc9335b1a1802611789', 40, NULL, NULL, '2020-04-06 23:00:00', '0.00'),
(414, '2020-04-07 23:00:00', '2020-04-08 00:00:00', '5e8bc9335b50d458426922', 40, NULL, NULL, '2020-04-07 23:00:00', NULL),
(415, '2020-04-08 23:00:00', '2020-04-09 00:00:00', '5e8bc9335b512098833491', 40, NULL, NULL, '2020-04-08 23:00:00', NULL),
(416, '2020-04-09 23:00:00', '2020-04-10 00:00:00', '5e8bc9335b514589022839', 40, NULL, NULL, '2020-04-09 23:00:00', NULL),
(417, '2020-04-13 23:00:00', '2020-04-14 00:00:00', '5e8bc9335b516400844398', 40, NULL, NULL, '2020-04-13 23:00:00', NULL),
(418, '2020-04-14 23:00:00', '2020-04-15 00:00:00', '5e8bc9335b519204269495', 40, NULL, NULL, '2020-04-14 23:00:00', NULL),
(419, '2020-04-15 23:00:00', '2020-04-16 00:00:00', '5e8bc9335b51b298072742', 40, NULL, NULL, '2020-04-15 23:00:00', NULL),
(420, '2020-04-16 23:00:00', '2020-04-17 00:00:00', '5e8bc9335b51d911066509', 40, NULL, NULL, '2020-04-16 23:00:00', NULL),
(421, '2020-04-20 23:00:00', '2020-04-21 00:00:00', '5e8bc9335b51f095922611', 40, NULL, NULL, '2020-04-20 23:00:00', NULL),
(422, '2020-04-21 23:00:00', '2020-04-22 00:00:00', '5e8bc9335b521618423836', 40, NULL, NULL, '2020-04-21 23:00:00', NULL),
(423, '2020-04-22 23:00:00', '2020-04-23 00:00:00', '5e8bc9335b523657767556', 40, NULL, NULL, '2020-04-22 23:00:00', NULL),
(424, '2020-04-23 23:00:00', '2020-04-24 00:00:00', '5e8bc9335b525510116420', 40, NULL, NULL, '2020-04-23 23:00:00', NULL),
(425, '2020-04-27 23:00:00', '2020-04-28 00:00:00', '5e8bc9335b527371167333', 40, NULL, NULL, '2020-04-27 23:00:00', NULL),
(426, '2020-04-28 23:00:00', '2020-04-29 00:00:00', '5e8bc9335b529741114997', 40, NULL, NULL, '2020-04-28 23:00:00', NULL),
(427, '2020-04-29 23:00:00', '2020-04-30 00:00:00', '5e8bc9335b52b596971144', 40, NULL, NULL, '2020-04-29 23:00:00', NULL),
(428, '2020-04-30 23:00:00', '2020-05-01 00:00:00', '5e8bc9335b52d718986257', 40, NULL, NULL, '2020-04-30 23:00:00', NULL),
(429, '2020-04-07 00:00:00', '2020-04-07 01:00:00', '5e8bc98203327608981087', 41, NULL, NULL, '2020-04-07 00:00:00', NULL),
(430, '2020-04-08 00:00:00', '2020-04-08 01:00:00', '5e8bc9820375c506240105', 41, NULL, NULL, '2020-04-08 00:00:00', NULL),
(431, '2020-04-09 00:00:00', '2020-04-09 01:00:00', '5e8bc98203763805082189', 41, NULL, NULL, '2020-04-09 00:00:00', NULL),
(432, '2020-04-10 00:00:00', '2020-04-10 01:00:00', '5e8bc98203765985118034', 41, NULL, NULL, '2020-04-10 00:00:00', NULL),
(433, '2020-04-14 00:00:00', '2020-04-14 01:00:00', '5e8bc98203767225505515', 41, NULL, NULL, '2020-04-14 00:00:00', NULL),
(434, '2020-04-15 00:00:00', '2020-04-15 01:00:00', '5e8bc9820376a882750830', 41, NULL, NULL, '2020-04-15 00:00:00', NULL),
(435, '2020-04-16 00:00:00', '2020-04-16 01:00:00', '5e8bc9820376c920547039', 41, NULL, NULL, '2020-04-16 00:00:00', NULL),
(436, '2020-04-17 00:00:00', '2020-04-17 01:00:00', '5e8bc9820376e470033494', 41, NULL, NULL, '2020-04-17 00:00:00', NULL),
(437, '2020-04-21 00:00:00', '2020-04-21 01:00:00', '5e8bc98203770035612236', 41, NULL, NULL, '2020-04-21 00:00:00', NULL),
(438, '2020-04-22 00:00:00', '2020-04-22 01:00:00', '5e8bc98203772153447298', 41, NULL, NULL, '2020-04-22 00:00:00', NULL),
(439, '2020-04-23 00:00:00', '2020-04-23 01:00:00', '5e8bc98203774591935955', 41, NULL, NULL, '2020-04-23 00:00:00', NULL),
(440, '2020-04-24 00:00:00', '2020-04-24 01:00:00', '5e8bc98203776277078075', 41, NULL, NULL, '2020-04-24 00:00:00', NULL),
(441, '2020-04-28 00:00:00', '2020-04-28 01:00:00', '5e8bc98203778828111171', 41, NULL, NULL, '2020-04-28 00:00:00', NULL),
(442, '2020-04-29 00:00:00', '2020-04-29 01:00:00', '5e8bc9820377a010581568', 41, NULL, NULL, '2020-04-29 00:00:00', NULL),
(443, '2020-04-30 00:00:00', '2020-04-30 01:00:00', '5e8bc9820377c508675091', 41, NULL, NULL, '2020-04-30 00:00:00', NULL),
(444, '2020-05-01 00:00:00', '2020-05-01 01:00:00', '5e8bc9820377e803522356', 41, NULL, NULL, '2020-05-01 00:00:00', NULL),
(445, '2020-04-07 01:00:00', '2020-04-07 02:00:00', '5e8bc9f580675044225563', 42, NULL, NULL, NULL, NULL),
(446, '2020-04-08 01:00:00', '2020-04-08 02:00:00', '5e8bc9f580b8f693017445', 42, NULL, NULL, NULL, NULL),
(447, '2020-04-09 01:00:00', '2020-04-09 02:00:00', '5e8bc9f580ba5162750905', 42, NULL, NULL, NULL, NULL),
(448, '2020-04-10 01:00:00', '2020-04-10 02:00:00', '5e8bc9f580baa391458078', 42, NULL, NULL, NULL, NULL),
(449, '2020-04-14 01:00:00', '2020-04-14 02:00:00', '5e8bc9f580bae259369924', 42, NULL, NULL, NULL, NULL),
(450, '2020-04-15 01:00:00', '2020-04-15 02:00:00', '5e8bc9f580bb2564341988', 42, NULL, NULL, NULL, NULL),
(451, '2020-04-16 01:00:00', '2020-04-16 02:00:00', '5e8bc9f580bb6179440253', 42, NULL, NULL, NULL, NULL),
(452, '2020-04-17 01:00:00', '2020-04-17 02:00:00', '5e8bc9f580bbb077826325', 42, NULL, NULL, NULL, NULL),
(453, '2020-04-21 01:00:00', '2020-04-21 02:00:00', '5e8bc9f580bbe449487512', 42, NULL, NULL, NULL, NULL),
(454, '2020-04-22 01:00:00', '2020-04-22 02:00:00', '5e8bc9f580bc2819650137', 42, NULL, NULL, NULL, NULL),
(455, '2020-04-23 01:00:00', '2020-04-23 02:00:00', '5e8bc9f580bc4254043300', 42, NULL, NULL, NULL, NULL),
(456, '2020-04-24 01:00:00', '2020-04-24 02:00:00', '5e8bc9f580bc9069012537', 42, NULL, NULL, NULL, NULL),
(457, '2020-04-28 01:00:00', '2020-04-28 02:00:00', '5e8bc9f580bcc746052076', 42, NULL, NULL, NULL, NULL),
(458, '2020-04-29 01:00:00', '2020-04-29 02:00:00', '5e8bc9f580bd0463689982', 42, NULL, NULL, NULL, NULL),
(459, '2020-04-30 01:00:00', '2020-04-30 02:00:00', '5e8bc9f580bd4370354069', 42, NULL, NULL, NULL, NULL),
(460, '2020-05-01 01:00:00', '2020-05-01 02:00:00', '5e8bc9f580bd8279368727', 42, NULL, NULL, NULL, NULL),
(461, '2020-04-07 02:00:00', '2020-04-07 03:00:00', '5e8bca36d74ff348841770', 43, NULL, NULL, NULL, NULL),
(462, '2020-04-08 02:00:00', '2020-04-08 03:00:00', '5e8bca36d7862800977577', 43, NULL, NULL, NULL, NULL),
(463, '2020-04-09 02:00:00', '2020-04-09 03:00:00', '5e8bca36d7866892548850', 43, NULL, NULL, NULL, NULL),
(464, '2020-04-10 02:00:00', '2020-04-10 03:00:00', '5e8bca36d7868469580999', 43, NULL, NULL, NULL, NULL),
(465, '2020-04-14 02:00:00', '2020-04-14 03:00:00', '5e8bca36d786a805732231', 43, NULL, NULL, NULL, NULL),
(466, '2020-04-15 02:00:00', '2020-04-15 03:00:00', '5e8bca36d786c943063174', 43, NULL, NULL, NULL, NULL),
(467, '2020-04-16 02:00:00', '2020-04-16 03:00:00', '5e8bca36d786e349245660', 43, NULL, NULL, NULL, NULL),
(468, '2020-04-17 02:00:00', '2020-04-17 03:00:00', '5e8bca36d7870411027408', 43, NULL, NULL, NULL, NULL),
(469, '2020-04-21 02:00:00', '2020-04-21 03:00:00', '5e8bca36d7872492337997', 43, NULL, NULL, NULL, NULL),
(470, '2020-04-22 02:00:00', '2020-04-22 03:00:00', '5e8bca36d7875785110984', 43, NULL, NULL, NULL, NULL),
(471, '2020-04-23 02:00:00', '2020-04-23 03:00:00', '5e8bca36d7876258068296', 43, NULL, NULL, NULL, NULL),
(472, '2020-04-24 02:00:00', '2020-04-24 03:00:00', '5e8bca36d7878820881390', 43, NULL, NULL, NULL, NULL),
(473, '2020-04-28 02:00:00', '2020-04-28 03:00:00', '5e8bca36d787b771665696', 43, NULL, NULL, NULL, NULL),
(474, '2020-04-29 02:00:00', '2020-04-29 03:00:00', '5e8bca36d787d742002297', 43, NULL, NULL, NULL, NULL),
(475, '2020-04-30 02:00:00', '2020-04-30 03:00:00', '5e8bca36d787f208849628', 43, NULL, NULL, NULL, NULL),
(476, '2020-05-01 02:00:00', '2020-05-01 03:00:00', '5e8bca36d7881867436362', 43, NULL, NULL, NULL, NULL),
(477, '2020-04-07 16:00:00', '2020-04-07 19:00:00', '5e8bcacabd650607692915', 44, NULL, NULL, NULL, NULL),
(478, '2020-04-09 16:00:00', '2020-04-09 19:00:00', '5e8bcacabd8e6773724053', 44, NULL, NULL, NULL, NULL),
(479, '2020-04-14 16:00:00', '2020-04-14 19:00:00', '5e8bcacabd8eb503985387', 44, NULL, NULL, NULL, NULL),
(480, '2020-04-16 16:00:00', '2020-04-16 19:00:00', '5e8bcacabd8ee934670912', 44, NULL, NULL, NULL, NULL),
(481, '2020-04-21 16:00:00', '2020-04-21 19:00:00', '5e8bcacabd8f0092213514', 44, NULL, NULL, NULL, NULL),
(482, '2020-04-23 16:00:00', '2020-04-23 19:00:00', '5e8bcacabd8f3094277890', 44, NULL, NULL, NULL, NULL),
(483, '2020-04-28 16:00:00', '2020-04-28 19:00:00', '5e8bcacabd8f5899532904', 44, NULL, NULL, NULL, NULL),
(484, '2020-04-30 16:00:00', '2020-04-30 19:00:00', '5e8bcacabd8f7877385911', 44, NULL, NULL, NULL, NULL),
(485, '2020-04-07 00:00:00', '2020-04-07 01:00:00', '5e8bcb030b790923854807', 45, NULL, NULL, NULL, NULL),
(486, '2020-04-08 00:00:00', '2020-04-08 01:00:00', '5e8bcb030bb66885852483', 45, NULL, NULL, NULL, NULL),
(487, '2020-04-09 00:00:00', '2020-04-09 01:00:00', '5e8bcb030bb6b268183632', 45, NULL, NULL, NULL, NULL),
(488, '2020-04-10 00:00:00', '2020-04-10 01:00:00', '5e8bcb030bb6d526460510', 45, NULL, NULL, NULL, NULL),
(489, '2020-04-14 00:00:00', '2020-04-14 01:00:00', '5e8bcb030bb6f087688627', 45, NULL, NULL, NULL, NULL),
(490, '2020-04-15 00:00:00', '2020-04-15 01:00:00', '5e8bcb030bb71138378991', 45, NULL, NULL, NULL, NULL),
(491, '2020-04-16 00:00:00', '2020-04-16 01:00:00', '5e8bcb030bb73618168454', 45, NULL, NULL, NULL, NULL),
(492, '2020-04-17 00:00:00', '2020-04-17 01:00:00', '5e8bcb030bb75245337744', 45, NULL, NULL, NULL, NULL),
(493, '2020-04-21 00:00:00', '2020-04-21 01:00:00', '5e8bcb030bb77564842981', 45, NULL, NULL, NULL, NULL),
(494, '2020-04-22 00:00:00', '2020-04-22 01:00:00', '5e8bcb030bb79769993874', 45, NULL, NULL, NULL, NULL),
(495, '2020-04-23 00:00:00', '2020-04-23 01:00:00', '5e8bcb030bb7b848425843', 45, NULL, NULL, NULL, NULL),
(496, '2020-04-24 00:00:00', '2020-04-24 01:00:00', '5e8bcb030bb7d703842875', 45, NULL, NULL, NULL, NULL),
(497, '2020-04-28 00:00:00', '2020-04-28 01:00:00', '5e8bcb030bb7f490497314', 45, NULL, NULL, NULL, NULL),
(498, '2020-04-29 00:00:00', '2020-04-29 01:00:00', '5e8bcb030bb81466648222', 45, NULL, NULL, NULL, NULL),
(499, '2020-04-30 00:00:00', '2020-04-30 01:00:00', '5e8bcb030bb83829103045', 45, NULL, NULL, NULL, NULL),
(500, '2020-05-01 00:00:00', '2020-05-01 01:00:00', '5e8bcb030bb85114343755', 45, NULL, NULL, NULL, NULL),
(507, '2020-04-21 22:00:00', '2020-04-21 23:00:00', '5e8bcb69e7d2f831770821', 39, NULL, NULL, NULL, NULL),
(508, '2020-04-29 22:00:00', '2020-04-29 23:00:00', '5e8bcb69e7dcb211628504', 39, NULL, NULL, NULL, NULL),
(509, '2020-04-28 22:00:00', '2020-04-28 23:00:00', '5e8bcb69e7dab601634271', 39, NULL, NULL, NULL, NULL),
(510, '2020-04-27 22:00:00', '2020-04-27 23:00:00', '5e8bcb69e7d8b923191000', 39, NULL, NULL, NULL, NULL),
(511, '2020-04-23 22:00:00', '2020-04-23 23:00:00', '5e8bcb69e7d6b930501088', 39, NULL, NULL, NULL, NULL),
(512, '2020-04-22 22:00:00', '2020-04-22 23:00:00', '5e8bcb69e7d4d650818895', 39, NULL, NULL, NULL, NULL),
(513, '2020-04-14 22:00:00', '2020-04-14 23:00:00', '5e8bcb69e7cba779043011', 39, NULL, NULL, NULL, NULL),
(514, '2020-04-20 22:00:00', '2020-04-20 23:00:00', '5e8bcb69e7d11033425156', 39, NULL, NULL, NULL, NULL),
(515, '2020-04-16 22:00:00', '2020-04-16 23:00:00', '5e8bcb69e7cf4957359287', 39, NULL, NULL, NULL, NULL),
(516, '2020-04-15 22:00:00', '2020-04-15 23:00:00', '5e8bcb69e7cd7314939228', 39, NULL, NULL, NULL, NULL),
(517, '2020-04-13 22:00:00', '2020-04-13 23:00:00', '5e8bcb69e7c9d329920054', 39, NULL, NULL, NULL, NULL),
(518, '2020-04-09 22:00:00', '2020-04-09 23:00:00', '5e8bcb69e7c80651940518', 39, NULL, NULL, NULL, NULL),
(519, '2020-04-08 22:00:00', '2020-04-08 23:00:00', '5e8bcb69e7c3f227808882', 39, NULL, NULL, NULL, NULL),
(520, '2020-04-07 22:00:00', '2020-04-07 23:00:00', '5e8bcb69e7c1d113196765', 39, NULL, NULL, NULL, NULL),
(521, '2020-04-30 22:00:00', '2020-04-30 23:00:00', '5e8bcb69e7dec448796538', 39, NULL, NULL, NULL, NULL),
(522, '2020-04-06 13:00:00', '2020-04-06 14:00:00', '5e8bcc52dfe98297718325', 46, NULL, NULL, NULL, '0.00'),
(523, '2020-04-07 13:00:00', '2020-04-07 14:00:00', '5e8bcc52e0260668708792', 46, NULL, NULL, NULL, NULL),
(524, '2020-04-08 13:00:00', '2020-04-08 14:00:00', '5e8bcc52e0265624618905', 46, NULL, NULL, NULL, NULL),
(525, '2020-04-09 13:00:00', '2020-04-09 14:00:00', '5e8bcc52e0269346828624', 46, NULL, NULL, NULL, NULL),
(526, '2020-04-13 13:00:00', '2020-04-13 14:00:00', '5e8bcc52e026c437977787', 46, NULL, NULL, NULL, NULL),
(527, '2020-04-14 13:00:00', '2020-04-14 14:00:00', '5e8bcc52e026f386190967', 46, NULL, NULL, NULL, NULL),
(528, '2020-04-15 13:00:00', '2020-04-15 14:00:00', '5e8bcc52e0272656156399', 46, NULL, NULL, NULL, NULL),
(529, '2020-04-16 13:00:00', '2020-04-16 14:00:00', '5e8bcc52e0276885061201', 46, NULL, NULL, NULL, NULL),
(530, '2020-04-20 13:00:00', '2020-04-20 14:00:00', '5e8bcc52e0279982840606', 46, NULL, NULL, NULL, NULL),
(531, '2020-04-21 13:00:00', '2020-04-21 14:00:00', '5e8bcc52e027c273655522', 46, NULL, NULL, NULL, NULL),
(532, '2020-04-22 13:00:00', '2020-04-22 14:00:00', '5e8bcc52e027f905963293', 46, NULL, NULL, NULL, NULL),
(533, '2020-04-23 13:00:00', '2020-04-23 14:00:00', '5e8bcc52e0282320957188', 46, NULL, NULL, NULL, NULL),
(534, '2020-04-27 13:00:00', '2020-04-27 14:00:00', '5e8bcc52e0285002720730', 46, NULL, NULL, NULL, NULL),
(535, '2020-04-28 13:00:00', '2020-04-28 14:00:00', '5e8bcc52e0289355348673', 46, NULL, NULL, NULL, NULL),
(536, '2020-04-29 13:00:00', '2020-04-29 14:00:00', '5e8bcc52e028c361590901', 46, NULL, NULL, NULL, NULL),
(537, '2020-04-30 13:00:00', '2020-04-30 14:00:00', '5e8bcc52e028f631976794', 46, NULL, NULL, NULL, NULL),
(538, '2020-04-06 15:00:00', '2020-04-06 16:00:00', '5e8bcc9659a2d750917426', 47, NULL, NULL, NULL, '0.00'),
(539, '2020-04-07 15:00:00', '2020-04-07 16:00:00', '5e8bcc965a1aa161525744', 47, NULL, NULL, NULL, NULL),
(540, '2020-04-08 15:00:00', '2020-04-08 16:00:00', '5e8bcc965a1b4937644381', 47, NULL, NULL, NULL, NULL),
(541, '2020-04-09 15:00:00', '2020-04-09 16:00:00', '5e8bcc965a1b7388259233', 47, NULL, NULL, NULL, NULL),
(542, '2020-04-13 15:00:00', '2020-04-13 16:00:00', '5e8bcc965a1b9323162228', 47, NULL, NULL, NULL, NULL),
(543, '2020-04-14 15:00:00', '2020-04-14 16:00:00', '5e8bcc965a1cb942587096', 47, NULL, NULL, NULL, NULL),
(544, '2020-04-15 15:00:00', '2020-04-15 16:00:00', '5e8bcc965a1cd107375945', 47, NULL, NULL, NULL, NULL),
(545, '2020-04-16 15:00:00', '2020-04-16 16:00:00', '5e8bcc965a1cf032506586', 47, NULL, NULL, NULL, NULL),
(546, '2020-04-20 15:00:00', '2020-04-20 16:00:00', '5e8bcc965a1d2511067494', 47, NULL, NULL, NULL, NULL),
(547, '2020-04-21 15:00:00', '2020-04-21 16:00:00', '5e8bcc965a1d4118544097', 47, NULL, NULL, NULL, NULL),
(548, '2020-04-22 15:00:00', '2020-04-22 16:00:00', '5e8bcc965a1d6749844165', 47, NULL, NULL, NULL, NULL),
(549, '2020-04-23 15:00:00', '2020-04-23 16:00:00', '5e8bcc965a1d8772923192', 47, NULL, NULL, NULL, NULL),
(550, '2020-04-27 15:00:00', '2020-04-27 16:00:00', '5e8bcc965a1da764049553', 47, NULL, NULL, NULL, NULL),
(551, '2020-04-28 15:00:00', '2020-04-28 16:00:00', '5e8bcc965a1dc963750370', 47, NULL, NULL, NULL, NULL),
(552, '2020-04-29 15:00:00', '2020-04-29 16:00:00', '5e8bcc965a1de234825088', 47, NULL, NULL, NULL, NULL),
(553, '2020-04-30 15:00:00', '2020-04-30 16:00:00', '5e8bcc965a1e0246688689', 47, NULL, NULL, NULL, NULL),
(554, '2020-04-06 17:00:00', '2020-04-06 18:00:00', '5e8bccb7620bd361376400', 48, NULL, NULL, NULL, '0.00'),
(555, '2020-04-07 17:00:00', '2020-04-07 18:00:00', '5e8bccb762ab5998699512', 48, NULL, NULL, NULL, NULL),
(556, '2020-04-08 17:00:00', '2020-04-08 18:00:00', '5e8bccb762ada363627037', 48, NULL, NULL, NULL, NULL),
(557, '2020-04-09 17:00:00', '2020-04-09 18:00:00', '5e8bccb762adf388487972', 48, NULL, NULL, NULL, NULL),
(558, '2020-04-13 17:00:00', '2020-04-13 18:00:00', '5e8bccb762ae5964989387', 48, NULL, NULL, NULL, NULL);
INSERT INTO `reservation_instances` (`reservation_instance_id`, `start_date`, `end_date`, `reference_number`, `series_id`, `checkin_date`, `checkout_date`, `previous_end_date`, `credit_count`) VALUES
(559, '2020-04-14 17:00:00', '2020-04-14 18:00:00', '5e8bccb762aec586754907', 48, NULL, NULL, NULL, NULL),
(560, '2020-04-15 17:00:00', '2020-04-15 18:00:00', '5e8bccb762af0612286293', 48, NULL, NULL, NULL, NULL),
(561, '2020-04-16 17:00:00', '2020-04-16 18:00:00', '5e8bccb762af7802645502', 48, NULL, NULL, NULL, NULL),
(562, '2020-04-20 17:00:00', '2020-04-20 18:00:00', '5e8bccb762afa746281486', 48, NULL, NULL, NULL, NULL),
(563, '2020-04-21 17:00:00', '2020-04-21 18:00:00', '5e8bccb762b00961768142', 48, NULL, NULL, NULL, NULL),
(564, '2020-04-22 17:00:00', '2020-04-22 18:00:00', '5e8bccb762b05954907512', 48, NULL, NULL, NULL, NULL),
(565, '2020-04-23 17:00:00', '2020-04-23 18:00:00', '5e8bccb762b0a842957658', 48, NULL, NULL, NULL, NULL),
(566, '2020-04-27 17:00:00', '2020-04-27 18:00:00', '5e8bccb762b0e797066029', 48, NULL, NULL, NULL, NULL),
(567, '2020-04-28 17:00:00', '2020-04-28 18:00:00', '5e8bccb762b15716816291', 48, NULL, NULL, NULL, NULL),
(568, '2020-04-29 17:00:00', '2020-04-29 18:00:00', '5e8bccb762b1a450250453', 48, NULL, NULL, NULL, NULL),
(569, '2020-04-30 17:00:00', '2020-04-30 18:00:00', '5e8bccb762b20998586139', 48, NULL, NULL, NULL, NULL),
(570, '2020-04-06 21:00:00', '2020-04-06 22:00:00', '5e8bcd0010f28998316691', 49, NULL, NULL, NULL, '0.00'),
(571, '2020-04-07 21:00:00', '2020-04-07 22:00:00', '5e8bcd00111f9550572253', 49, NULL, NULL, NULL, NULL),
(572, '2020-04-08 21:00:00', '2020-04-08 22:00:00', '5e8bcd001121c060631290', 49, NULL, NULL, NULL, NULL),
(573, '2020-04-09 21:00:00', '2020-04-09 22:00:00', '5e8bcd0011221094479315', 49, NULL, NULL, NULL, NULL),
(574, '2020-04-13 21:00:00', '2020-04-13 22:00:00', '5e8bcd001123a816460139', 49, NULL, NULL, NULL, NULL),
(575, '2020-04-14 21:00:00', '2020-04-14 22:00:00', '5e8bcd0ad7b6b455390116', 49, NULL, NULL, NULL, NULL),
(576, '2020-04-15 21:00:00', '2020-04-15 22:00:00', '5e8bcd0ad7bea777352960', 49, NULL, NULL, NULL, NULL),
(577, '2020-04-16 21:00:00', '2020-04-16 22:00:00', '5e8bcd0ad7c84068539577', 49, NULL, NULL, NULL, NULL),
(578, '2020-04-20 21:00:00', '2020-04-20 22:00:00', '5e8bcd0ad7cf9941192049', 49, NULL, NULL, NULL, NULL),
(579, '2020-04-21 21:00:00', '2020-04-21 22:00:00', '5e8bcd0ad7d6d700214150', 49, NULL, NULL, NULL, NULL),
(580, '2020-04-22 21:00:00', '2020-04-22 22:00:00', '5e8bcd0ad7de2719122430', 49, NULL, NULL, NULL, NULL),
(581, '2020-04-23 21:00:00', '2020-04-23 22:00:00', '5e8bcd0ad7e57729529460', 49, NULL, NULL, NULL, NULL),
(582, '2020-04-27 21:00:00', '2020-04-27 22:00:00', '5e8bcd0ad7ecd776114683', 49, NULL, NULL, NULL, NULL),
(583, '2020-04-28 21:00:00', '2020-04-28 22:00:00', '5e8bcd0ad7f43921372958', 49, NULL, NULL, NULL, NULL),
(584, '2020-04-29 21:00:00', '2020-04-29 22:00:00', '5e8bcd0ad7fba898770513', 49, NULL, NULL, NULL, NULL),
(585, '2020-04-30 21:00:00', '2020-04-30 22:00:00', '5e8bcd0ad8071777085061', 49, NULL, NULL, NULL, NULL),
(586, '2020-04-07 00:00:00', '2020-04-07 01:00:00', '5e8bcd4e7f3cf659543416', 50, NULL, NULL, NULL, NULL),
(587, '2020-04-08 00:00:00', '2020-04-08 01:00:00', '5e8bcd4e7f73e520183446', 50, NULL, NULL, NULL, NULL),
(588, '2020-04-09 00:00:00', '2020-04-09 01:00:00', '5e8bcd4e7f742543885536', 50, NULL, NULL, NULL, NULL),
(589, '2020-04-10 00:00:00', '2020-04-10 01:00:00', '5e8bcd4e7f745804439368', 50, NULL, NULL, NULL, NULL),
(590, '2020-04-14 00:00:00', '2020-04-14 01:00:00', '5e8bcd4e7f747116926353', 50, NULL, NULL, NULL, NULL),
(591, '2020-04-15 00:00:00', '2020-04-15 01:00:00', '5e8bcd4e7f749712740930', 50, NULL, NULL, NULL, NULL),
(592, '2020-04-16 00:00:00', '2020-04-16 01:00:00', '5e8bcd4e7f74b972767610', 50, NULL, NULL, NULL, NULL),
(593, '2020-04-17 00:00:00', '2020-04-17 01:00:00', '5e8bcd4e7f74d902679569', 50, NULL, NULL, NULL, NULL),
(594, '2020-04-21 00:00:00', '2020-04-21 01:00:00', '5e8bcd4e7f74f785203326', 50, NULL, NULL, NULL, NULL),
(595, '2020-04-22 00:00:00', '2020-04-22 01:00:00', '5e8bcd4e7f751745553986', 50, NULL, NULL, NULL, NULL),
(596, '2020-04-23 00:00:00', '2020-04-23 01:00:00', '5e8bcd4e7f753592855196', 50, NULL, NULL, NULL, NULL),
(597, '2020-04-24 00:00:00', '2020-04-24 01:00:00', '5e8bcd4e7f755275027111', 50, NULL, NULL, NULL, NULL),
(598, '2020-04-28 00:00:00', '2020-04-28 01:00:00', '5e8bcd4e7f757742949312', 50, NULL, NULL, NULL, NULL),
(599, '2020-04-29 00:00:00', '2020-04-29 01:00:00', '5e8bcd4e7f759799948361', 50, NULL, NULL, NULL, NULL),
(600, '2020-04-30 00:00:00', '2020-04-30 01:00:00', '5e8bcd4e7f75b028106560', 50, NULL, NULL, NULL, NULL),
(601, '2020-05-01 00:00:00', '2020-05-01 01:00:00', '5e8bcd4e7f75d728362344', 50, NULL, NULL, NULL, NULL),
(602, '2020-04-11 14:00:00', '2020-04-11 16:00:00', '5e8be4fbe68ee105129465', 51, NULL, NULL, NULL, NULL),
(603, '2020-04-18 14:00:00', '2020-04-18 16:00:00', '5e8be4fbe69cb144324412', 51, NULL, NULL, NULL, NULL),
(604, '2020-04-25 14:00:00', '2020-04-25 16:00:00', '5e8be4fbe69cf113350046', 51, NULL, NULL, NULL, NULL),
(605, '2020-04-11 16:00:00', '2020-04-11 18:00:00', '5e8be5370434c058038750', 52, NULL, NULL, NULL, NULL),
(606, '2020-04-18 16:00:00', '2020-04-18 18:00:00', '5e8be537044bf647111060', 52, NULL, NULL, NULL, NULL),
(607, '2020-04-25 16:00:00', '2020-04-25 18:00:00', '5e8be537044d6190627400', 52, NULL, NULL, NULL, NULL),
(608, '2020-04-11 19:00:00', '2020-04-11 21:00:00', '5e8be5802afca001345601', 53, NULL, NULL, NULL, NULL),
(609, '2020-04-18 19:00:00', '2020-04-18 21:00:00', '5e8be5802b097300124299', 53, NULL, NULL, NULL, NULL),
(610, '2020-04-25 19:00:00', '2020-04-25 21:00:00', '5e8be5802b09b237875647', 53, NULL, NULL, NULL, NULL),
(611, '2020-04-11 21:00:00', '2020-04-11 23:00:00', '5e8be5af8deb3764117893', 54, NULL, NULL, NULL, NULL),
(612, '2020-04-18 21:00:00', '2020-04-18 23:00:00', '5e8be5af8dfe9942065648', 54, NULL, NULL, NULL, NULL),
(613, '2020-04-25 21:00:00', '2020-04-25 23:00:00', '5e8be5af8dfed905768476', 54, NULL, NULL, NULL, NULL),
(614, '2020-04-11 23:00:00', '2020-04-12 03:00:00', '5e8be5f11d765629527111', 55, NULL, NULL, NULL, NULL),
(615, '2020-04-18 23:00:00', '2020-04-19 03:00:00', '5e8be5f11d8e7500012263', 55, NULL, NULL, NULL, NULL),
(616, '2020-04-25 23:00:00', '2020-04-26 03:00:00', '5e8be5fc3d1de491837731', 55, NULL, NULL, NULL, NULL),
(617, '2020-04-11 13:00:00', '2020-04-11 18:00:00', '5e8be6d9e4671732766807', 56, NULL, NULL, NULL, NULL),
(618, '2020-04-18 13:00:00', '2020-04-18 18:00:00', '5e8be6d9e475e507446823', 56, NULL, NULL, NULL, NULL),
(619, '2020-04-25 13:00:00', '2020-04-25 18:00:00', '5e8be6d9e4762161206340', 56, NULL, NULL, NULL, NULL),
(620, '2020-04-06 21:00:00', '2020-04-06 22:00:00', '5e8be73bc2a35523218545', 57, NULL, NULL, NULL, '0.00'),
(621, '2020-04-07 21:00:00', '2020-04-07 22:00:00', '5e8be73bc325a933599167', 57, NULL, NULL, NULL, NULL),
(622, '2020-04-08 21:00:00', '2020-04-08 22:00:00', '5e8be73bc3265482232114', 57, NULL, NULL, NULL, NULL),
(623, '2020-04-09 21:00:00', '2020-04-09 22:00:00', '5e8be73bc3267031654395', 57, NULL, NULL, NULL, NULL),
(624, '2020-04-13 21:00:00', '2020-04-13 22:00:00', '5e8be73bc3269296835073', 57, NULL, NULL, NULL, NULL),
(625, '2020-04-14 21:00:00', '2020-04-14 22:00:00', '5e8be73bc326b705219955', 57, NULL, NULL, NULL, NULL),
(626, '2020-04-15 21:00:00', '2020-04-15 22:00:00', '5e8be73bc326d546821736', 57, NULL, NULL, NULL, NULL),
(627, '2020-04-16 21:00:00', '2020-04-16 22:00:00', '5e8be73bc326f382161668', 57, NULL, NULL, NULL, NULL),
(628, '2020-04-20 21:00:00', '2020-04-20 22:00:00', '5e8be73bc3271009692625', 57, NULL, NULL, NULL, NULL),
(629, '2020-04-21 21:00:00', '2020-04-21 22:00:00', '5e8be73bc3274234543961', 57, NULL, NULL, NULL, NULL),
(630, '2020-04-22 21:00:00', '2020-04-22 22:00:00', '5e8be73bc3276706786609', 57, NULL, NULL, NULL, NULL),
(631, '2020-04-23 21:00:00', '2020-04-23 22:00:00', '5e8be73bc3278664625037', 57, NULL, NULL, NULL, NULL),
(632, '2020-04-27 21:00:00', '2020-04-27 22:00:00', '5e8be73bc327a352590462', 57, NULL, NULL, NULL, NULL),
(633, '2020-04-28 21:00:00', '2020-04-28 22:00:00', '5e8be73bc327c874728193', 57, NULL, NULL, NULL, NULL),
(634, '2020-04-29 21:00:00', '2020-04-29 22:00:00', '5e8be73bc327e054250117', 57, NULL, NULL, NULL, NULL),
(635, '2020-04-30 21:00:00', '2020-04-30 22:00:00', '5e8be73bc3280326017868', 57, NULL, NULL, NULL, NULL),
(636, '2020-04-06 22:00:00', '2020-04-06 23:00:00', '5e8be773c786e821301309', 58, NULL, NULL, NULL, '0.00'),
(637, '2020-04-07 22:00:00', '2020-04-07 23:00:00', '5e8be773c7ce3147159939', 58, NULL, NULL, NULL, NULL),
(638, '2020-04-08 22:00:00', '2020-04-08 23:00:00', '5e8be773c7cea498388049', 58, NULL, NULL, NULL, NULL),
(639, '2020-04-09 22:00:00', '2020-04-09 23:00:00', '5e8be773c7ced712359673', 58, NULL, NULL, NULL, NULL),
(640, '2020-04-13 22:00:00', '2020-04-13 23:00:00', '5e8be773c7cef825185707', 58, NULL, NULL, NULL, NULL),
(641, '2020-04-14 22:00:00', '2020-04-14 23:00:00', '5e8be773c7cf1473411227', 58, NULL, NULL, NULL, NULL),
(642, '2020-04-15 22:00:00', '2020-04-15 23:00:00', '5e8be773c7cf4124287401', 58, NULL, NULL, NULL, NULL),
(643, '2020-04-16 22:00:00', '2020-04-16 23:00:00', '5e8be773c7d04523478001', 58, NULL, NULL, NULL, NULL),
(644, '2020-04-20 22:00:00', '2020-04-20 23:00:00', '5e8be773c7d06502034621', 58, NULL, NULL, NULL, NULL),
(645, '2020-04-21 22:00:00', '2020-04-21 23:00:00', '5e8be773c7d08629326752', 58, NULL, NULL, NULL, NULL),
(646, '2020-04-22 22:00:00', '2020-04-22 23:00:00', '5e8be773c7d0a101607701', 58, NULL, NULL, NULL, NULL),
(647, '2020-04-23 22:00:00', '2020-04-23 23:00:00', '5e8be773c7d0c426306140', 58, NULL, NULL, NULL, NULL),
(648, '2020-04-27 22:00:00', '2020-04-27 23:00:00', '5e8be773c7d0e254857825', 58, NULL, NULL, NULL, NULL),
(649, '2020-04-28 22:00:00', '2020-04-28 23:00:00', '5e8be773c7d10356106935', 58, NULL, NULL, NULL, NULL),
(650, '2020-04-29 22:00:00', '2020-04-29 23:00:00', '5e8be773c7d12368821620', 58, NULL, NULL, NULL, NULL),
(651, '2020-04-30 22:00:00', '2020-04-30 23:00:00', '5e8be773c7d15527899822', 58, NULL, NULL, NULL, NULL),
(652, '2020-04-06 23:00:00', '2020-04-07 00:00:00', '5e8be86d5d727778639021', 59, NULL, NULL, NULL, '0.00'),
(653, '2020-04-07 23:00:00', '2020-04-08 00:00:00', '5e8be86d5da77592659726', 59, NULL, NULL, NULL, NULL),
(654, '2020-04-08 23:00:00', '2020-04-09 00:00:00', '5e8be86d5da7b908170555', 59, NULL, NULL, NULL, NULL),
(655, '2020-04-09 23:00:00', '2020-04-10 00:00:00', '5e8be86d5da7d498185675', 59, NULL, NULL, NULL, NULL),
(656, '2020-04-13 23:00:00', '2020-04-14 00:00:00', '5e8be86d5da7f262775312', 59, NULL, NULL, NULL, NULL),
(657, '2020-04-14 23:00:00', '2020-04-15 00:00:00', '5e8be86d5da82708205056', 59, NULL, NULL, NULL, NULL),
(658, '2020-04-15 23:00:00', '2020-04-16 00:00:00', '5e8be86d5da83222799433', 59, NULL, NULL, NULL, NULL),
(659, '2020-04-16 23:00:00', '2020-04-17 00:00:00', '5e8be86d5da86508202042', 59, NULL, NULL, NULL, NULL),
(660, '2020-04-20 23:00:00', '2020-04-21 00:00:00', '5e8be86d5da88141064802', 59, NULL, NULL, NULL, NULL),
(661, '2020-04-21 23:00:00', '2020-04-22 00:00:00', '5e8be86d5da8a301966016', 59, NULL, NULL, NULL, NULL),
(662, '2020-04-22 23:00:00', '2020-04-23 00:00:00', '5e8be86d5da8c842378955', 59, NULL, NULL, NULL, NULL),
(663, '2020-04-23 23:00:00', '2020-04-24 00:00:00', '5e8be86d5da8d849850831', 59, NULL, NULL, NULL, NULL),
(664, '2020-04-27 23:00:00', '2020-04-28 00:00:00', '5e8be86d5da8f904456539', 59, NULL, NULL, NULL, NULL),
(665, '2020-04-28 23:00:00', '2020-04-29 00:00:00', '5e8be86d5da91852247836', 59, NULL, NULL, NULL, NULL),
(666, '2020-04-29 23:00:00', '2020-04-30 00:00:00', '5e8be86d5da93236586389', 59, NULL, NULL, NULL, NULL),
(667, '2020-04-30 23:00:00', '2020-05-01 00:00:00', '5e8be86d5da95501685858', 59, NULL, NULL, NULL, NULL),
(668, '2020-04-07 00:00:00', '2020-04-07 01:00:00', '5e8be8b677655111744249', 60, NULL, NULL, NULL, '0.00'),
(669, '2020-04-08 00:00:00', '2020-04-08 01:00:00', '5e8be8b677b9a614858879', 60, NULL, NULL, NULL, NULL),
(670, '2020-04-09 00:00:00', '2020-04-09 01:00:00', '5e8be8b677ba0837764866', 60, NULL, NULL, NULL, NULL),
(671, '2020-04-10 00:00:00', '2020-04-10 01:00:00', '5e8be8b677ba3004060259', 60, NULL, NULL, NULL, NULL),
(672, '2020-04-14 00:00:00', '2020-04-14 01:00:00', '5e8be8b677ba7096156922', 60, NULL, NULL, NULL, NULL),
(673, '2020-04-15 00:00:00', '2020-04-15 01:00:00', '5e8be8b677baa444213791', 60, NULL, NULL, NULL, NULL),
(674, '2020-04-16 00:00:00', '2020-04-16 01:00:00', '5e8be8b677bad984319909', 60, NULL, NULL, NULL, NULL),
(675, '2020-04-17 00:00:00', '2020-04-17 01:00:00', '5e8be8b677bb1683661217', 60, NULL, NULL, NULL, NULL),
(676, '2020-04-21 00:00:00', '2020-04-21 01:00:00', '5e8be8b677bb4077710838', 60, NULL, NULL, NULL, NULL),
(677, '2020-04-22 00:00:00', '2020-04-22 01:00:00', '5e8be8b677bb7951183543', 60, NULL, NULL, NULL, NULL),
(678, '2020-04-23 00:00:00', '2020-04-23 01:00:00', '5e8be8b677bba803393905', 60, NULL, NULL, NULL, NULL),
(679, '2020-04-24 00:00:00', '2020-04-24 01:00:00', '5e8be8b677bbe682584033', 60, NULL, NULL, NULL, NULL),
(680, '2020-04-28 00:00:00', '2020-04-28 01:00:00', '5e8be8b677bc1038008404', 60, NULL, NULL, NULL, NULL),
(681, '2020-04-29 00:00:00', '2020-04-29 01:00:00', '5e8be8b677bc4753248591', 60, NULL, NULL, NULL, NULL),
(682, '2020-04-30 00:00:00', '2020-04-30 01:00:00', '5e8be8b677bc7428266133', 60, NULL, NULL, NULL, NULL),
(683, '2020-05-01 00:00:00', '2020-05-01 01:00:00', '5e8be8b677bca580059604', 60, NULL, NULL, NULL, NULL),
(684, '2020-04-10 13:00:00', '2020-04-10 14:00:00', '5e8be91c1cb95828868899', 61, NULL, NULL, NULL, NULL),
(685, '2020-04-17 13:00:00', '2020-04-17 14:00:00', '5e8be91c1cc9c908664173', 61, NULL, NULL, NULL, NULL),
(686, '2020-04-24 13:00:00', '2020-04-24 14:00:00', '5e8be91c1cca0409087454', 61, NULL, NULL, NULL, NULL),
(687, '2020-05-01 13:00:00', '2020-05-01 14:00:00', '5e8be91c1cca3889914108', 61, NULL, NULL, NULL, NULL),
(688, '2020-04-10 14:00:00', '2020-04-10 15:00:00', '5e8be97933017012685048', 62, NULL, NULL, NULL, NULL),
(689, '2020-04-17 14:00:00', '2020-04-17 15:00:00', '5e8be97933155360340072', 62, NULL, NULL, NULL, NULL),
(690, '2020-04-24 14:00:00', '2020-04-24 15:00:00', '5e8be9793315a711299993', 62, NULL, NULL, NULL, NULL),
(691, '2020-05-01 14:00:00', '2020-05-01 15:00:00', '5e8be9793315d352803327', 62, NULL, NULL, NULL, NULL),
(692, '2020-04-10 15:00:00', '2020-04-10 16:00:00', '5e8be9aa09c63208328083', 63, NULL, NULL, NULL, NULL),
(693, '2020-04-17 15:00:00', '2020-04-17 16:00:00', '5e8be9aa09d5a198856481', 63, NULL, NULL, NULL, NULL),
(694, '2020-04-24 15:00:00', '2020-04-24 16:00:00', '5e8be9aa09d5e030709071', 63, NULL, NULL, NULL, NULL),
(695, '2020-05-01 15:00:00', '2020-05-01 16:00:00', '5e8be9aa09d60803301993', 63, NULL, NULL, NULL, NULL),
(696, '2020-04-10 16:00:00', '2020-04-10 17:00:00', '5e8be9da39457800179064', 64, NULL, NULL, NULL, NULL),
(697, '2020-04-10 17:00:00', '2020-04-10 18:00:00', '5e8bea081e3b1968783303', 65, NULL, NULL, NULL, NULL),
(698, '2020-04-17 17:00:00', '2020-04-17 18:00:00', '5e8bea081e4ab766700266', 65, NULL, NULL, NULL, NULL),
(699, '2020-04-24 17:00:00', '2020-04-24 18:00:00', '5e8bea081e4af155601271', 65, NULL, NULL, NULL, NULL),
(700, '2020-05-01 17:00:00', '2020-05-01 18:00:00', '5e8bea081e4b2017081390', 65, NULL, NULL, NULL, NULL),
(701, '2020-04-17 16:00:00', '2020-04-17 17:00:00', '5e8bea1a2436a503212423', 64, NULL, NULL, NULL, NULL),
(702, '2020-04-24 16:00:00', '2020-04-24 17:00:00', '5e8bea1a2438f793848135', 64, NULL, NULL, NULL, NULL),
(703, '2020-05-01 16:00:00', '2020-05-01 17:00:00', '5e8bea1a243ad787042744', 64, NULL, NULL, NULL, NULL),
(704, '2020-04-11 14:00:00', '2020-04-11 18:00:00', '5e8bea7cabb6b685168447', 66, NULL, NULL, NULL, NULL),
(705, '2020-04-18 14:00:00', '2020-04-18 18:00:00', '5e8bea7cabc78392215154', 66, NULL, NULL, NULL, NULL),
(706, '2020-04-25 14:00:00', '2020-04-25 18:00:00', '5e8bea7cabc7b608329944', 66, NULL, NULL, NULL, NULL),
(707, '2020-04-10 16:00:00', '2020-04-10 18:00:00', '5e8beadbbf37f257081296', 67, NULL, NULL, NULL, NULL),
(708, '2020-04-17 16:00:00', '2020-04-17 18:00:00', '5e8beadbbf4c3778979074', 67, NULL, NULL, NULL, NULL),
(709, '2020-04-24 16:00:00', '2020-04-24 18:00:00', '5e8beadbbf4e6412880227', 67, NULL, NULL, NULL, NULL),
(710, '2020-05-01 16:00:00', '2020-05-01 18:00:00', '5e8beadbbf4ea270473500', 67, NULL, NULL, NULL, NULL),
(711, '2020-04-10 19:00:00', '2020-04-10 23:00:00', '5e8beb1b00da5942390390', 68, NULL, NULL, NULL, NULL),
(712, '2020-04-17 19:00:00', '2020-04-17 23:00:00', '5e8beb1b00ea1314275372', 68, NULL, NULL, NULL, NULL),
(713, '2020-04-24 19:00:00', '2020-04-24 23:00:00', '5e8beb1b00ea5019706927', 68, NULL, NULL, NULL, NULL),
(714, '2020-05-01 19:00:00', '2020-05-01 23:00:00', '5e8beb1b00ea8812474148', 68, NULL, NULL, NULL, NULL),
(715, '2020-04-06 15:00:00', '2020-04-06 16:00:00', '5e8beb63a919d578849386', 69, NULL, NULL, NULL, '0.00'),
(716, '2020-04-07 15:00:00', '2020-04-07 16:00:00', '5e8beb63a950c096961363', 69, NULL, NULL, NULL, NULL),
(717, '2020-04-08 15:00:00', '2020-04-08 16:00:00', '5e8beb63a9510194195809', 69, NULL, NULL, NULL, NULL),
(718, '2020-04-09 15:00:00', '2020-04-09 16:00:00', '5e8beb63a9513361362940', 69, NULL, NULL, NULL, NULL),
(719, '2020-04-13 15:00:00', '2020-04-13 16:00:00', '5e8beb63a9515658006336', 69, NULL, NULL, NULL, NULL),
(720, '2020-04-14 15:00:00', '2020-04-14 16:00:00', '5e8beb63a9517619126347', 69, NULL, NULL, NULL, NULL),
(721, '2020-04-15 15:00:00', '2020-04-15 16:00:00', '5e8beb63a9519528297627', 69, NULL, NULL, NULL, NULL),
(722, '2020-04-16 15:00:00', '2020-04-16 16:00:00', '5e8beb63a951c538040076', 69, NULL, NULL, NULL, NULL),
(723, '2020-04-20 15:00:00', '2020-04-20 16:00:00', '5e8beb63a951e824886516', 69, NULL, NULL, NULL, NULL),
(724, '2020-04-21 15:00:00', '2020-04-21 16:00:00', '5e8beb63a9520720648835', 69, NULL, NULL, NULL, NULL),
(725, '2020-04-22 15:00:00', '2020-04-22 16:00:00', '5e8beb63a9522590477095', 69, NULL, NULL, NULL, NULL),
(726, '2020-04-23 15:00:00', '2020-04-23 16:00:00', '5e8beb63a9524994232134', 69, NULL, NULL, NULL, NULL),
(727, '2020-04-27 15:00:00', '2020-04-27 16:00:00', '5e8beb63a9525050626684', 69, NULL, NULL, NULL, NULL),
(728, '2020-04-28 15:00:00', '2020-04-28 16:00:00', '5e8beb63a9528191054239', 69, NULL, NULL, NULL, NULL),
(729, '2020-04-29 15:00:00', '2020-04-29 16:00:00', '5e8beb63a952a626934951', 69, NULL, NULL, NULL, NULL),
(730, '2020-04-30 15:00:00', '2020-04-30 16:00:00', '5e8beb63a952c705919018', 69, NULL, NULL, NULL, NULL),
(731, '2020-04-06 16:00:00', '2020-04-06 17:00:00', '5e8beb8d59edf649497931', 70, NULL, NULL, NULL, '0.00'),
(732, '2020-04-07 16:00:00', '2020-04-07 17:00:00', '5e8beb8d5a293465474847', 70, NULL, NULL, NULL, NULL),
(733, '2020-04-08 16:00:00', '2020-04-08 17:00:00', '5e8beb8d5a299064188871', 70, NULL, NULL, NULL, NULL),
(734, '2020-04-09 16:00:00', '2020-04-09 17:00:00', '5e8beb8d5a29d396468854', 70, NULL, NULL, NULL, NULL),
(735, '2020-04-13 16:00:00', '2020-04-13 17:00:00', '5e8beb8d5a2a0980628277', 70, NULL, NULL, NULL, NULL),
(736, '2020-04-14 16:00:00', '2020-04-14 17:00:00', '5e8beb8d5a2a4018233469', 70, NULL, NULL, NULL, NULL),
(737, '2020-04-15 16:00:00', '2020-04-15 17:00:00', '5e8beb8d5a2a7481585146', 70, NULL, NULL, NULL, NULL),
(738, '2020-04-16 16:00:00', '2020-04-16 17:00:00', '5e8beb8d5a2aa953216419', 70, NULL, NULL, NULL, NULL),
(739, '2020-04-20 16:00:00', '2020-04-20 17:00:00', '5e8beb8d5a2bb621812851', 70, NULL, NULL, NULL, NULL),
(740, '2020-04-21 16:00:00', '2020-04-21 17:00:00', '5e8beb8d5a2be811049876', 70, NULL, NULL, NULL, NULL),
(741, '2020-04-22 16:00:00', '2020-04-22 17:00:00', '5e8beb8d5a2c1690592565', 70, NULL, NULL, NULL, NULL),
(742, '2020-04-23 16:00:00', '2020-04-23 17:00:00', '5e8beb8d5a2c4570119037', 70, NULL, NULL, NULL, NULL),
(743, '2020-04-27 16:00:00', '2020-04-27 17:00:00', '5e8beb8d5a2c7808293771', 70, NULL, NULL, NULL, NULL),
(744, '2020-04-28 16:00:00', '2020-04-28 17:00:00', '5e8beb8d5a2ca005612930', 70, NULL, NULL, NULL, NULL),
(745, '2020-04-29 16:00:00', '2020-04-29 17:00:00', '5e8beb8d5a2ce925683809', 70, NULL, NULL, NULL, NULL),
(746, '2020-04-30 16:00:00', '2020-04-30 17:00:00', '5e8beb8d5a2d1821297115', 70, NULL, NULL, NULL, NULL),
(747, '2020-04-06 17:00:00', '2020-04-06 18:00:00', '5e8bebac4dc70320663953', 71, NULL, NULL, NULL, '0.00'),
(759, '2020-04-21 17:00:00', '2020-04-21 18:00:00', '5e8bebba959e3076149010', 71, NULL, NULL, NULL, NULL),
(760, '2020-04-29 17:00:00', '2020-04-29 18:00:00', '5e8bebba95a80057446699', 71, NULL, NULL, NULL, NULL),
(761, '2020-04-28 17:00:00', '2020-04-28 18:00:00', '5e8bebba95a60812361991', 71, NULL, NULL, NULL, NULL),
(762, '2020-04-27 17:00:00', '2020-04-27 18:00:00', '5e8bebba95a40575447819', 71, NULL, NULL, NULL, NULL),
(763, '2020-04-23 17:00:00', '2020-04-23 18:00:00', '5e8bebba95a21511999574', 71, NULL, NULL, NULL, NULL),
(764, '2020-04-22 17:00:00', '2020-04-22 18:00:00', '5e8bebba95a02920422931', 71, NULL, NULL, NULL, NULL),
(765, '2020-04-09 17:00:00', '2020-04-09 18:00:00', '5e8bebba95934305669241', 71, NULL, NULL, NULL, NULL),
(766, '2020-04-20 17:00:00', '2020-04-20 18:00:00', '5e8bebba959c5699325132', 71, NULL, NULL, NULL, NULL),
(767, '2020-04-16 17:00:00', '2020-04-16 18:00:00', '5e8bebba959a7669682113', 71, NULL, NULL, NULL, NULL),
(768, '2020-04-15 17:00:00', '2020-04-15 18:00:00', '5e8bebba9598a181635870', 71, NULL, NULL, NULL, NULL),
(769, '2020-04-14 17:00:00', '2020-04-14 18:00:00', '5e8bebba9596d650246106', 71, NULL, NULL, NULL, NULL),
(770, '2020-04-13 17:00:00', '2020-04-13 18:00:00', '5e8bebba95950901446055', 71, NULL, NULL, NULL, NULL),
(771, '2020-04-08 17:00:00', '2020-04-08 18:00:00', '5e8bebba95916946529463', 71, NULL, NULL, NULL, NULL),
(772, '2020-04-07 17:00:00', '2020-04-07 18:00:00', '5e8bebba958f4639973217', 71, NULL, NULL, NULL, NULL),
(773, '2020-04-30 17:00:00', '2020-04-30 18:00:00', '5e8bebba95aa1421700956', 71, NULL, NULL, NULL, NULL),
(774, '2020-04-06 18:00:00', '2020-04-06 19:00:00', '5e8bebec8f496191635943', 72, NULL, NULL, NULL, '0.00'),
(775, '2020-04-07 18:00:00', '2020-04-07 19:00:00', '5e8bebec8f82f126306522', 72, NULL, NULL, NULL, NULL),
(776, '2020-04-08 18:00:00', '2020-04-08 19:00:00', '5e8bebec8f833572145656', 72, NULL, NULL, NULL, NULL),
(777, '2020-04-09 18:00:00', '2020-04-09 19:00:00', '5e8bebec8f835366903069', 72, NULL, NULL, NULL, NULL),
(778, '2020-04-13 18:00:00', '2020-04-13 19:00:00', '5e8bebec8f837571950325', 72, NULL, NULL, NULL, NULL),
(779, '2020-04-14 18:00:00', '2020-04-14 19:00:00', '5e8bebec8f83a515280058', 72, NULL, NULL, NULL, NULL),
(780, '2020-04-15 18:00:00', '2020-04-15 19:00:00', '5e8bebec8f83c816765716', 72, NULL, NULL, NULL, NULL),
(781, '2020-04-16 18:00:00', '2020-04-16 19:00:00', '5e8bebec8f83e375210871', 72, NULL, NULL, NULL, NULL),
(782, '2020-04-20 18:00:00', '2020-04-20 19:00:00', '5e8bebec8f840642083673', 72, NULL, NULL, NULL, NULL),
(783, '2020-04-21 18:00:00', '2020-04-21 19:00:00', '5e8bebec8f842509611389', 72, NULL, NULL, NULL, NULL),
(784, '2020-04-22 18:00:00', '2020-04-22 19:00:00', '5e8bebec8f844607476142', 72, NULL, NULL, NULL, NULL),
(785, '2020-04-23 18:00:00', '2020-04-23 19:00:00', '5e8bebec8f846819340797', 72, NULL, NULL, NULL, NULL),
(786, '2020-04-27 18:00:00', '2020-04-27 19:00:00', '5e8bebec8f848869928054', 72, NULL, NULL, NULL, NULL),
(787, '2020-04-28 18:00:00', '2020-04-28 19:00:00', '5e8bebec8f84a820685318', 72, NULL, NULL, NULL, NULL),
(788, '2020-04-29 18:00:00', '2020-04-29 19:00:00', '5e8bebec8f84c373365052', 72, NULL, NULL, NULL, NULL),
(789, '2020-04-30 18:00:00', '2020-04-30 19:00:00', '5e8bebec8f84e030321263', 72, NULL, NULL, NULL, NULL),
(790, '2020-04-06 19:00:00', '2020-04-06 20:00:00', '5e8bec25ec0fa146902323', 73, NULL, NULL, NULL, '0.00'),
(791, '2020-04-07 19:00:00', '2020-04-07 20:00:00', '5e8bec25ec68c436828528', 73, NULL, NULL, NULL, NULL),
(792, '2020-04-08 19:00:00', '2020-04-08 20:00:00', '5e8bec25ec693684895655', 73, NULL, NULL, NULL, NULL),
(793, '2020-04-09 19:00:00', '2020-04-09 20:00:00', '5e8bec25ec695004649456', 73, NULL, NULL, NULL, NULL),
(794, '2020-04-13 19:00:00', '2020-04-13 20:00:00', '5e8bec25ec698078198696', 73, NULL, NULL, NULL, NULL),
(795, '2020-04-14 19:00:00', '2020-04-14 20:00:00', '5e8bec25ec69a759947988', 73, NULL, NULL, NULL, NULL),
(796, '2020-04-15 19:00:00', '2020-04-15 20:00:00', '5e8bec25ec69c865011234', 73, NULL, NULL, NULL, NULL),
(797, '2020-04-16 19:00:00', '2020-04-16 20:00:00', '5e8bec25ec69e276315434', 73, NULL, NULL, NULL, NULL),
(798, '2020-04-20 19:00:00', '2020-04-20 20:00:00', '5e8bec25ec6a0027353609', 73, NULL, NULL, NULL, NULL),
(799, '2020-04-21 19:00:00', '2020-04-21 20:00:00', '5e8bec25ec6a3045302087', 73, NULL, NULL, NULL, NULL),
(800, '2020-04-22 19:00:00', '2020-04-22 20:00:00', '5e8bec25ec6a4462812318', 73, NULL, NULL, NULL, NULL),
(801, '2020-04-23 19:00:00', '2020-04-23 20:00:00', '5e8bec25ec6a6021109708', 73, NULL, NULL, NULL, NULL),
(802, '2020-04-27 19:00:00', '2020-04-27 20:00:00', '5e8bec25ec6a8733329939', 73, NULL, NULL, NULL, NULL),
(803, '2020-04-28 19:00:00', '2020-04-28 20:00:00', '5e8bec25ec6aa439534603', 73, NULL, NULL, NULL, NULL),
(804, '2020-04-29 19:00:00', '2020-04-29 20:00:00', '5e8bec25ec6ac374519955', 73, NULL, NULL, NULL, NULL),
(805, '2020-04-30 19:00:00', '2020-04-30 20:00:00', '5e8bec25ec6af099941531', 73, NULL, NULL, NULL, NULL),
(806, '2020-04-06 20:00:00', '2020-04-06 21:00:00', '5e8bec61be5dd049858581', 74, NULL, NULL, NULL, '0.00'),
(807, '2020-04-07 20:00:00', '2020-04-07 21:00:00', '5e8bec61be9bd969380282', 74, NULL, NULL, NULL, NULL),
(808, '2020-04-08 20:00:00', '2020-04-08 21:00:00', '5e8bec61be9c2413513491', 74, NULL, NULL, NULL, NULL),
(809, '2020-04-09 20:00:00', '2020-04-09 21:00:00', '5e8bec61be9c4873074981', 74, NULL, NULL, NULL, NULL),
(810, '2020-04-13 20:00:00', '2020-04-13 21:00:00', '5e8bec61be9c6807505501', 74, NULL, NULL, NULL, NULL),
(811, '2020-04-14 20:00:00', '2020-04-14 21:00:00', '5e8bec61be9c8331954911', 74, NULL, NULL, NULL, NULL),
(812, '2020-04-15 20:00:00', '2020-04-15 21:00:00', '5e8bec61be9ca471430113', 74, NULL, NULL, NULL, NULL),
(813, '2020-04-16 20:00:00', '2020-04-16 21:00:00', '5e8bec61be9cc392641632', 74, NULL, NULL, NULL, NULL),
(814, '2020-04-20 20:00:00', '2020-04-20 21:00:00', '5e8bec61be9ce700360637', 74, NULL, NULL, NULL, NULL),
(815, '2020-04-21 20:00:00', '2020-04-21 21:00:00', '5e8bec61be9d0196316127', 74, NULL, NULL, NULL, NULL),
(816, '2020-04-22 20:00:00', '2020-04-22 21:00:00', '5e8bec61be9d2647751519', 74, NULL, NULL, NULL, NULL),
(817, '2020-04-23 20:00:00', '2020-04-23 21:00:00', '5e8bec61be9d4037614781', 74, NULL, NULL, NULL, NULL),
(818, '2020-04-27 20:00:00', '2020-04-27 21:00:00', '5e8bec61be9d6200039902', 74, NULL, NULL, NULL, NULL),
(819, '2020-04-28 20:00:00', '2020-04-28 21:00:00', '5e8bec61be9d8896358725', 74, NULL, NULL, NULL, NULL),
(820, '2020-04-29 20:00:00', '2020-04-29 21:00:00', '5e8bec61be9da957416824', 74, NULL, NULL, NULL, NULL),
(821, '2020-04-30 20:00:00', '2020-04-30 21:00:00', '5e8bec61be9dc698998287', 74, NULL, NULL, NULL, NULL),
(822, '2020-04-07 00:00:00', '2020-04-07 01:00:00', '5e8bec96e1992310916799', 75, NULL, NULL, NULL, '0.00'),
(823, '2020-04-08 00:00:00', '2020-04-08 01:00:00', '5e8bec96e1d25258970966', 75, NULL, NULL, NULL, NULL),
(824, '2020-04-09 00:00:00', '2020-04-09 01:00:00', '5e8bec96e1d2a212386189', 75, NULL, NULL, NULL, NULL),
(825, '2020-04-10 00:00:00', '2020-04-10 01:00:00', '5e8bec96e1d2c013813159', 75, NULL, NULL, NULL, NULL),
(826, '2020-04-14 00:00:00', '2020-04-14 01:00:00', '5e8bec96e1d2e644133621', 75, NULL, NULL, NULL, NULL),
(827, '2020-04-15 00:00:00', '2020-04-15 01:00:00', '5e8bec96e1d30032468690', 75, NULL, NULL, NULL, NULL),
(828, '2020-04-16 00:00:00', '2020-04-16 01:00:00', '5e8bec96e1d32901300201', 75, NULL, NULL, NULL, NULL),
(829, '2020-04-17 00:00:00', '2020-04-17 01:00:00', '5e8bec96e1d35775698499', 75, NULL, NULL, NULL, NULL),
(830, '2020-04-21 00:00:00', '2020-04-21 01:00:00', '5e8bec96e1d37486653882', 75, NULL, NULL, NULL, NULL),
(831, '2020-04-22 00:00:00', '2020-04-22 01:00:00', '5e8bec96e1d39029096021', 75, NULL, NULL, NULL, NULL),
(832, '2020-04-23 00:00:00', '2020-04-23 01:00:00', '5e8bec96e1d3b078443612', 75, NULL, NULL, NULL, NULL),
(833, '2020-04-24 00:00:00', '2020-04-24 01:00:00', '5e8bec96e1d3c991682183', 75, NULL, NULL, NULL, NULL),
(834, '2020-04-28 00:00:00', '2020-04-28 01:00:00', '5e8bec96e1d3e146001866', 75, NULL, NULL, NULL, NULL),
(835, '2020-04-29 00:00:00', '2020-04-29 01:00:00', '5e8bec96e1d40078245781', 75, NULL, NULL, NULL, NULL),
(836, '2020-04-30 00:00:00', '2020-04-30 01:00:00', '5e8bec96e1d42127455187', 75, NULL, NULL, NULL, NULL),
(837, '2020-05-01 00:00:00', '2020-05-01 01:00:00', '5e8bec96e1d45635132258', 75, NULL, NULL, NULL, NULL),
(838, '2020-04-07 02:00:00', '2020-04-07 03:00:00', '5e8becc8115c0701593252', 76, NULL, NULL, NULL, '0.00'),
(839, '2020-04-08 02:00:00', '2020-04-08 03:00:00', '5e8becc811d89102690361', 76, NULL, NULL, NULL, NULL),
(840, '2020-04-09 02:00:00', '2020-04-09 03:00:00', '5e8becc811d91190240488', 76, NULL, NULL, NULL, NULL),
(841, '2020-04-10 02:00:00', '2020-04-10 03:00:00', '5e8becc811d94604595189', 76, NULL, NULL, NULL, NULL),
(842, '2020-04-14 02:00:00', '2020-04-14 03:00:00', '5e8becc811d96025891125', 76, NULL, NULL, NULL, NULL),
(843, '2020-04-15 02:00:00', '2020-04-15 03:00:00', '5e8becc811d98231736976', 76, NULL, NULL, NULL, NULL),
(844, '2020-04-16 02:00:00', '2020-04-16 03:00:00', '5e8becc811d9a372035919', 76, NULL, NULL, NULL, NULL),
(845, '2020-04-17 02:00:00', '2020-04-17 03:00:00', '5e8becc811d9c568688025', 76, NULL, NULL, NULL, NULL),
(846, '2020-04-21 02:00:00', '2020-04-21 03:00:00', '5e8becc811d9e228791914', 76, NULL, NULL, NULL, NULL),
(847, '2020-04-22 02:00:00', '2020-04-22 03:00:00', '5e8becc811da0476517992', 76, NULL, NULL, NULL, NULL),
(848, '2020-04-23 02:00:00', '2020-04-23 03:00:00', '5e8becc811da2026965492', 76, NULL, NULL, NULL, NULL),
(849, '2020-04-24 02:00:00', '2020-04-24 03:00:00', '5e8becc811da4698825623', 76, NULL, NULL, NULL, NULL),
(850, '2020-04-28 02:00:00', '2020-04-28 03:00:00', '5e8becc811da6223150361', 76, NULL, NULL, NULL, NULL),
(851, '2020-04-29 02:00:00', '2020-04-29 03:00:00', '5e8becc811da8444779512', 76, NULL, NULL, NULL, NULL),
(852, '2020-04-30 02:00:00', '2020-04-30 03:00:00', '5e8becc811daa348033467', 76, NULL, NULL, NULL, NULL),
(853, '2020-05-01 02:00:00', '2020-05-01 03:00:00', '5e8becc811dac452485249', 76, NULL, NULL, NULL, NULL),
(854, '2020-04-11 14:00:00', '2020-04-11 19:00:00', '5e8bed5f8ff80923992389', 77, NULL, NULL, NULL, NULL),
(855, '2020-04-18 14:00:00', '2020-04-18 19:00:00', '5e8bed5f9004e354141923', 77, NULL, NULL, NULL, NULL),
(856, '2020-04-25 14:00:00', '2020-04-25 19:00:00', '5e8bed5f90052993340760', 77, NULL, NULL, NULL, NULL),
(857, '2020-04-11 19:00:00', '2020-04-11 23:00:00', '5e8beed0ab04b566800695', 78, NULL, NULL, NULL, NULL),
(858, '2020-04-18 19:00:00', '2020-04-18 23:00:00', '5e8beed0ab2df803889958', 78, NULL, NULL, NULL, NULL),
(859, '2020-04-25 19:00:00', '2020-04-25 23:00:00', '5e8beed0ab315539555681', 78, NULL, NULL, NULL, NULL),
(860, '2020-04-06 13:00:00', '2020-04-06 14:00:00', '5e8bef0e4ec7a347102808', 79, NULL, NULL, NULL, '0.00'),
(861, '2020-04-07 13:00:00', '2020-04-07 14:00:00', '5e8bef0e4f085082808577', 79, NULL, NULL, NULL, NULL),
(862, '2020-04-08 13:00:00', '2020-04-08 14:00:00', '5e8bef0e4f08b746774766', 79, NULL, NULL, NULL, NULL),
(863, '2020-04-09 13:00:00', '2020-04-09 14:00:00', '5e8bef0e4f08d693215193', 79, NULL, NULL, NULL, NULL),
(864, '2020-04-13 13:00:00', '2020-04-13 14:00:00', '5e8bef0e4f08f748353943', 79, NULL, NULL, NULL, NULL),
(865, '2020-04-14 13:00:00', '2020-04-14 14:00:00', '5e8bef0e4f091673841485', 79, NULL, NULL, NULL, NULL),
(866, '2020-04-15 13:00:00', '2020-04-15 14:00:00', '5e8bef0e4f094553885835', 79, NULL, NULL, NULL, NULL),
(867, '2020-04-16 13:00:00', '2020-04-16 14:00:00', '5e8bef0e4f096675637847', 79, NULL, NULL, NULL, NULL),
(868, '2020-04-20 13:00:00', '2020-04-20 14:00:00', '5e8bef0e4f098977048429', 79, NULL, NULL, NULL, NULL),
(869, '2020-04-21 13:00:00', '2020-04-21 14:00:00', '5e8bef0e4f09a513215494', 79, NULL, NULL, NULL, NULL),
(870, '2020-04-22 13:00:00', '2020-04-22 14:00:00', '5e8bef0e4f09c157227334', 79, NULL, NULL, NULL, NULL),
(871, '2020-04-23 13:00:00', '2020-04-23 14:00:00', '5e8bef0e4f09e120404606', 79, NULL, NULL, NULL, NULL),
(872, '2020-04-27 13:00:00', '2020-04-27 14:00:00', '5e8bef0e4f0a0469856635', 79, NULL, NULL, NULL, NULL),
(873, '2020-04-28 13:00:00', '2020-04-28 14:00:00', '5e8bef0e4f0a2950552527', 79, NULL, NULL, NULL, NULL),
(874, '2020-04-29 13:00:00', '2020-04-29 14:00:00', '5e8bef0e4f0a4094427586', 79, NULL, NULL, NULL, NULL),
(875, '2020-04-30 13:00:00', '2020-04-30 14:00:00', '5e8bef0e4f0a6857090631', 79, NULL, NULL, NULL, NULL),
(876, '2020-04-06 14:00:00', '2020-04-06 15:00:00', '5e8bef5002547539452188', 80, NULL, NULL, NULL, '0.00'),
(877, '2020-04-07 14:00:00', '2020-04-07 15:00:00', '5e8bef5002a23369860635', 80, NULL, NULL, NULL, NULL),
(878, '2020-04-08 14:00:00', '2020-04-08 15:00:00', '5e8bef5002a34211431254', 80, NULL, NULL, NULL, NULL),
(879, '2020-04-09 14:00:00', '2020-04-09 15:00:00', '5e8bef5002a36331552173', 80, NULL, NULL, NULL, NULL),
(880, '2020-04-10 14:00:00', '2020-04-10 15:00:00', '5e8bef5002a39801527501', 80, NULL, NULL, NULL, NULL),
(881, '2020-04-13 14:00:00', '2020-04-13 15:00:00', '5e8bef5002a48437150065', 80, NULL, NULL, NULL, NULL),
(882, '2020-04-14 14:00:00', '2020-04-14 15:00:00', '5e8bef5002a4a983412063', 80, NULL, NULL, NULL, NULL),
(883, '2020-04-15 14:00:00', '2020-04-15 15:00:00', '5e8bef5002a4d084351026', 80, NULL, NULL, NULL, NULL),
(884, '2020-04-16 14:00:00', '2020-04-16 15:00:00', '5e8bef5002a4f257092786', 80, NULL, NULL, NULL, NULL),
(885, '2020-04-17 14:00:00', '2020-04-17 15:00:00', '5e8bef5002a51941580693', 80, NULL, NULL, NULL, NULL),
(886, '2020-04-20 14:00:00', '2020-04-20 15:00:00', '5e8bef5002a53124363452', 80, NULL, NULL, NULL, NULL),
(887, '2020-04-21 14:00:00', '2020-04-21 15:00:00', '5e8bef5002a55320653142', 80, NULL, NULL, NULL, NULL),
(888, '2020-04-22 14:00:00', '2020-04-22 15:00:00', '5e8bef5002a57925148780', 80, NULL, NULL, NULL, NULL),
(889, '2020-04-23 14:00:00', '2020-04-23 15:00:00', '5e8bef5002a5a260058194', 80, NULL, NULL, NULL, NULL),
(890, '2020-04-24 14:00:00', '2020-04-24 15:00:00', '5e8bef5002a5c596967499', 80, NULL, NULL, NULL, NULL),
(891, '2020-04-27 14:00:00', '2020-04-27 15:00:00', '5e8bef5002a5e024259781', 80, NULL, NULL, NULL, NULL),
(892, '2020-04-28 14:00:00', '2020-04-28 15:00:00', '5e8bef5002a60536906950', 80, NULL, NULL, NULL, NULL),
(893, '2020-04-29 14:00:00', '2020-04-29 15:00:00', '5e8bef5002a62753448695', 80, NULL, NULL, NULL, NULL),
(894, '2020-04-30 14:00:00', '2020-04-30 15:00:00', '5e8bef5002a64305426265', 80, NULL, NULL, NULL, NULL),
(895, '2020-05-01 14:00:00', '2020-05-01 15:00:00', '5e8bef5002a66076200916', 80, NULL, NULL, NULL, NULL),
(896, '2020-04-06 17:00:00', '2020-04-06 18:00:00', '5e8bef851681b964998196', 81, NULL, NULL, NULL, '0.00'),
(897, '2020-04-07 17:00:00', '2020-04-07 18:00:00', '5e8bef851692e882949981', 81, NULL, NULL, NULL, NULL),
(898, '2020-04-08 17:00:00', '2020-04-08 18:00:00', '5e8bef8516933072263283', 81, NULL, NULL, NULL, NULL),
(899, '2020-04-09 17:00:00', '2020-04-09 18:00:00', '5e8bef8516935562926472', 81, NULL, NULL, NULL, NULL),
(900, '2020-04-13 17:00:00', '2020-04-13 18:00:00', '5e8bef90bae44855744025', 81, NULL, NULL, NULL, NULL),
(901, '2020-04-14 17:00:00', '2020-04-14 18:00:00', '5e8bef90baf95105216208', 81, NULL, NULL, NULL, NULL),
(902, '2020-04-15 17:00:00', '2020-04-15 18:00:00', '5e8bef90bb027349701928', 81, NULL, NULL, NULL, NULL),
(903, '2020-04-16 17:00:00', '2020-04-16 18:00:00', '5e8bef90bb107977365092', 81, NULL, NULL, NULL, NULL),
(904, '2020-04-20 17:00:00', '2020-04-20 18:00:00', '5e8bef90bb1c2099920449', 81, NULL, NULL, NULL, NULL),
(905, '2020-04-21 17:00:00', '2020-04-21 18:00:00', '5e8bef90bb237463341530', 81, NULL, NULL, NULL, NULL),
(906, '2020-04-22 17:00:00', '2020-04-22 18:00:00', '5e8bef90bb2a7062669092', 81, NULL, NULL, NULL, NULL),
(907, '2020-04-23 17:00:00', '2020-04-23 18:00:00', '5e8bef90bb318291687061', 81, NULL, NULL, NULL, NULL),
(908, '2020-04-27 17:00:00', '2020-04-27 18:00:00', '5e8bef90bb38c215047568', 81, NULL, NULL, NULL, NULL),
(909, '2020-04-28 17:00:00', '2020-04-28 18:00:00', '5e8bef90bb3ff456163481', 81, NULL, NULL, NULL, NULL),
(910, '2020-04-29 17:00:00', '2020-04-29 18:00:00', '5e8bef90bb474737996302', 81, NULL, NULL, NULL, NULL),
(911, '2020-04-30 17:00:00', '2020-04-30 18:00:00', '5e8bef90bb4ea389783990', 81, NULL, NULL, NULL, NULL),
(912, '2020-04-06 18:00:00', '2020-04-06 19:00:00', '5e8befd46423b300605354', 82, NULL, NULL, NULL, '0.00'),
(913, '2020-04-07 18:00:00', '2020-04-07 19:00:00', '5e8befd4645a7739020313', 82, NULL, NULL, NULL, NULL),
(914, '2020-04-08 18:00:00', '2020-04-08 19:00:00', '5e8befd4645ab669889301', 82, NULL, NULL, NULL, NULL),
(915, '2020-04-09 18:00:00', '2020-04-09 19:00:00', '5e8befd4645ae844444635', 82, NULL, NULL, NULL, NULL),
(916, '2020-04-13 18:00:00', '2020-04-13 19:00:00', '5e8befd4645b0960586557', 82, NULL, NULL, NULL, NULL),
(917, '2020-04-14 18:00:00', '2020-04-14 19:00:00', '5e8befd4645b2797175681', 82, NULL, NULL, NULL, NULL),
(918, '2020-04-15 18:00:00', '2020-04-15 19:00:00', '5e8befd4645b4390281440', 82, NULL, NULL, NULL, NULL),
(919, '2020-04-16 18:00:00', '2020-04-16 19:00:00', '5e8befd4645b6975329190', 82, NULL, NULL, NULL, NULL),
(920, '2020-04-20 18:00:00', '2020-04-20 19:00:00', '5e8befd4645b8395809352', 82, NULL, NULL, NULL, NULL),
(921, '2020-04-21 18:00:00', '2020-04-21 19:00:00', '5e8befd4645ba606506327', 82, NULL, NULL, NULL, NULL),
(922, '2020-04-22 18:00:00', '2020-04-22 19:00:00', '5e8befd4645bc665607554', 82, NULL, NULL, NULL, NULL),
(923, '2020-04-23 18:00:00', '2020-04-23 19:00:00', '5e8befd4645be155980987', 82, NULL, NULL, NULL, NULL),
(924, '2020-04-27 18:00:00', '2020-04-27 19:00:00', '5e8befd4645c0012667208', 82, NULL, NULL, NULL, NULL),
(925, '2020-04-28 18:00:00', '2020-04-28 19:00:00', '5e8befd4645c2750785838', 82, NULL, NULL, NULL, NULL),
(926, '2020-04-29 18:00:00', '2020-04-29 19:00:00', '5e8befd4645c4897749419', 82, NULL, NULL, NULL, NULL),
(927, '2020-04-30 18:00:00', '2020-04-30 19:00:00', '5e8befd4645c6935620414', 82, NULL, NULL, NULL, NULL),
(928, '2020-04-06 20:00:00', '2020-04-06 21:00:00', '5e8bf00dc042e571773858', 83, NULL, NULL, NULL, '0.00'),
(929, '2020-04-07 20:00:00', '2020-04-07 21:00:00', '5e8bf00dc06e2355184686', 83, NULL, NULL, NULL, NULL),
(930, '2020-04-08 20:00:00', '2020-04-08 21:00:00', '5e8bf00dc0706145631732', 83, NULL, NULL, NULL, NULL),
(931, '2020-04-09 20:00:00', '2020-04-09 21:00:00', '5e8bf00dc070e287965964', 83, NULL, NULL, NULL, NULL),
(932, '2020-04-13 20:00:00', '2020-04-13 21:00:00', '5e8bf00dc0714953873630', 83, NULL, NULL, NULL, NULL),
(933, '2020-04-14 20:00:00', '2020-04-14 21:00:00', '5e8bf0177b603863237164', 83, NULL, NULL, NULL, NULL),
(934, '2020-04-15 20:00:00', '2020-04-15 21:00:00', '5e8bf0177b6e0228310502', 83, NULL, NULL, NULL, NULL),
(935, '2020-04-16 20:00:00', '2020-04-16 21:00:00', '5e8bf0177b778474116964', 83, NULL, NULL, NULL, NULL),
(936, '2020-04-20 20:00:00', '2020-04-20 21:00:00', '5e8bf0177b800963712617', 83, NULL, NULL, NULL, NULL),
(937, '2020-04-21 20:00:00', '2020-04-21 21:00:00', '5e8bf0177b889455094533', 83, NULL, NULL, NULL, NULL),
(938, '2020-04-22 20:00:00', '2020-04-22 21:00:00', '5e8bf0177b911714611307', 83, NULL, NULL, NULL, NULL),
(939, '2020-04-23 20:00:00', '2020-04-23 21:00:00', '5e8bf0177b99a337781374', 83, NULL, NULL, NULL, NULL),
(940, '2020-04-27 20:00:00', '2020-04-27 21:00:00', '5e8bf0177ba3b163876969', 83, NULL, NULL, NULL, NULL),
(941, '2020-04-28 20:00:00', '2020-04-28 21:00:00', '5e8bf0177bab5124377485', 83, NULL, NULL, NULL, NULL),
(942, '2020-04-29 20:00:00', '2020-04-29 21:00:00', '5e8bf0177bb31611695572', 83, NULL, NULL, NULL, NULL),
(943, '2020-04-30 20:00:00', '2020-04-30 21:00:00', '5e8bf0177bbac392737613', 83, NULL, NULL, NULL, NULL),
(944, '2020-04-06 22:00:00', '2020-04-06 23:00:00', '5e8bf053d3f05867709903', 84, NULL, NULL, NULL, '0.00'),
(945, '2020-04-07 22:00:00', '2020-04-07 23:00:00', '5e8bf053d435b873028374', 84, NULL, NULL, NULL, NULL),
(946, '2020-04-08 22:00:00', '2020-04-08 23:00:00', '5e8bf053d435f695908171', 84, NULL, NULL, NULL, NULL),
(947, '2020-04-09 22:00:00', '2020-04-09 23:00:00', '5e8bf053d4362498870169', 84, NULL, NULL, NULL, NULL),
(948, '2020-04-10 22:00:00', '2020-04-10 23:00:00', '5e8bf053d4364961415635', 84, NULL, NULL, NULL, NULL),
(949, '2020-04-13 22:00:00', '2020-04-13 23:00:00', '5e8bf053d4366868846583', 84, NULL, NULL, NULL, NULL),
(950, '2020-04-14 22:00:00', '2020-04-14 23:00:00', '5e8bf053d4368988671223', 84, NULL, NULL, NULL, NULL),
(951, '2020-04-15 22:00:00', '2020-04-15 23:00:00', '5e8bf053d436a833918966', 84, NULL, NULL, NULL, NULL),
(952, '2020-04-16 22:00:00', '2020-04-16 23:00:00', '5e8bf053d436c079680090', 84, NULL, NULL, NULL, NULL),
(953, '2020-04-17 22:00:00', '2020-04-17 23:00:00', '5e8bf053d436e158171763', 84, NULL, NULL, NULL, NULL),
(954, '2020-04-20 22:00:00', '2020-04-20 23:00:00', '5e8bf053d4370478120465', 84, NULL, NULL, NULL, NULL),
(955, '2020-04-21 22:00:00', '2020-04-21 23:00:00', '5e8bf053d4372174341293', 84, NULL, NULL, NULL, NULL),
(956, '2020-04-22 22:00:00', '2020-04-22 23:00:00', '5e8bf053d4374786364784', 84, NULL, NULL, NULL, NULL),
(957, '2020-04-23 22:00:00', '2020-04-23 23:00:00', '5e8bf053d4376361579259', 84, NULL, NULL, NULL, NULL),
(958, '2020-04-24 22:00:00', '2020-04-24 23:00:00', '5e8bf053d4378732742742', 84, NULL, NULL, NULL, NULL),
(959, '2020-04-27 22:00:00', '2020-04-27 23:00:00', '5e8bf053d437a854024269', 84, NULL, NULL, NULL, NULL),
(960, '2020-04-28 22:00:00', '2020-04-28 23:00:00', '5e8bf053d437c602531649', 84, NULL, NULL, NULL, NULL),
(961, '2020-04-29 22:00:00', '2020-04-29 23:00:00', '5e8bf053d437e774543661', 84, NULL, NULL, NULL, NULL),
(962, '2020-04-30 22:00:00', '2020-04-30 23:00:00', '5e8bf053d4380861284620', 84, NULL, NULL, NULL, NULL),
(963, '2020-05-01 22:00:00', '2020-05-01 23:00:00', '5e8bf053d4382405484192', 84, NULL, NULL, NULL, NULL),
(964, '2020-04-06 23:00:00', '2020-04-07 00:00:00', '5e8bf08a515da676554371', 85, NULL, NULL, NULL, '0.00'),
(965, '2020-04-07 23:00:00', '2020-04-08 00:00:00', '5e8bf08a51ab4704708384', 85, NULL, NULL, NULL, NULL),
(966, '2020-04-08 23:00:00', '2020-04-09 00:00:00', '5e8bf08a51abc749838413', 85, NULL, NULL, NULL, NULL),
(967, '2020-04-09 23:00:00', '2020-04-10 00:00:00', '5e8bf08a51abf185651190', 85, NULL, NULL, NULL, NULL),
(968, '2020-04-13 23:00:00', '2020-04-14 00:00:00', '5e8bf08a51ac1514707811', 85, NULL, NULL, NULL, NULL),
(969, '2020-04-14 23:00:00', '2020-04-15 00:00:00', '5e8bf08a51ac3224297857', 85, NULL, NULL, NULL, NULL),
(970, '2020-04-15 23:00:00', '2020-04-16 00:00:00', '5e8bf08a51ac5018529245', 85, NULL, NULL, NULL, NULL),
(971, '2020-04-16 23:00:00', '2020-04-17 00:00:00', '5e8bf08a51ac7864829953', 85, NULL, NULL, NULL, NULL),
(972, '2020-04-20 23:00:00', '2020-04-21 00:00:00', '5e8bf08a51ad7679087716', 85, NULL, NULL, NULL, NULL),
(973, '2020-04-21 23:00:00', '2020-04-22 00:00:00', '5e8bf08a51ad9896840479', 85, NULL, NULL, NULL, NULL),
(974, '2020-04-22 23:00:00', '2020-04-23 00:00:00', '5e8bf08a51adb936599337', 85, NULL, NULL, NULL, NULL),
(975, '2020-04-23 23:00:00', '2020-04-24 00:00:00', '5e8bf08a51ade625001205', 85, NULL, NULL, NULL, NULL),
(976, '2020-04-27 23:00:00', '2020-04-28 00:00:00', '5e8bf08a51ae0054659582', 85, NULL, NULL, NULL, NULL),
(977, '2020-04-28 23:00:00', '2020-04-29 00:00:00', '5e8bf08a51ae2605474870', 85, NULL, NULL, NULL, NULL),
(978, '2020-04-29 23:00:00', '2020-04-30 00:00:00', '5e8bf08a51ae4262049446', 85, NULL, NULL, NULL, NULL),
(979, '2020-04-30 23:00:00', '2020-05-01 00:00:00', '5e8bf08a51ae6777969642', 85, NULL, NULL, NULL, NULL),
(980, '2020-04-07 00:00:00', '2020-04-07 01:00:00', '5e8bf0b241432428442374', 86, NULL, NULL, NULL, '0.00'),
(981, '2020-04-08 00:00:00', '2020-04-08 01:00:00', '5e8bf0b2417b8776023935', 86, NULL, NULL, NULL, NULL),
(982, '2020-04-09 00:00:00', '2020-04-09 01:00:00', '5e8bf0b2417bc047541297', 86, NULL, NULL, NULL, NULL),
(983, '2020-04-10 00:00:00', '2020-04-10 01:00:00', '5e8bf0b2417d4648365850', 86, NULL, NULL, NULL, NULL),
(984, '2020-04-14 00:00:00', '2020-04-14 01:00:00', '5e8bf0b2417d6542964219', 86, NULL, NULL, NULL, NULL),
(985, '2020-04-15 00:00:00', '2020-04-15 01:00:00', '5e8bf0b2417d8343603606', 86, NULL, NULL, NULL, NULL),
(986, '2020-04-16 00:00:00', '2020-04-16 01:00:00', '5e8bf0b2417da414799994', 86, NULL, NULL, NULL, NULL),
(987, '2020-04-17 00:00:00', '2020-04-17 01:00:00', '5e8bf0b2417ea368721012', 86, NULL, NULL, NULL, NULL),
(988, '2020-04-21 00:00:00', '2020-04-21 01:00:00', '5e8bf0b2417ec435326234', 86, NULL, NULL, NULL, NULL),
(989, '2020-04-22 00:00:00', '2020-04-22 01:00:00', '5e8bf0b2417ee188153147', 86, NULL, NULL, NULL, NULL),
(990, '2020-04-23 00:00:00', '2020-04-23 01:00:00', '5e8bf0b2417f0295808323', 86, NULL, NULL, NULL, NULL),
(991, '2020-04-24 00:00:00', '2020-04-24 01:00:00', '5e8bf0b2417f2399115089', 86, NULL, NULL, NULL, NULL),
(992, '2020-04-28 00:00:00', '2020-04-28 01:00:00', '5e8bf0b2417f4916493905', 86, NULL, NULL, NULL, NULL),
(993, '2020-04-29 00:00:00', '2020-04-29 01:00:00', '5e8bf0b2417f6746962631', 86, NULL, NULL, NULL, NULL),
(994, '2020-04-30 00:00:00', '2020-04-30 01:00:00', '5e8bf0b24180b758098509', 86, NULL, NULL, NULL, NULL),
(995, '2020-05-01 00:00:00', '2020-05-01 01:00:00', '5e8bf0b24180d358753483', 86, NULL, NULL, NULL, NULL),
(996, '2020-04-07 01:00:00', '2020-04-07 02:00:00', '5e8bf0da2b89b293433136', 87, NULL, NULL, NULL, '0.00'),
(997, '2020-04-08 01:00:00', '2020-04-08 02:00:00', '5e8bf0da2c027930232678', 87, NULL, NULL, NULL, NULL),
(998, '2020-04-09 01:00:00', '2020-04-09 02:00:00', '5e8bf0da2c033415124350', 87, NULL, NULL, NULL, NULL),
(999, '2020-04-10 01:00:00', '2020-04-10 02:00:00', '5e8bf0da2c035661612542', 87, NULL, NULL, NULL, NULL),
(1000, '2020-04-14 01:00:00', '2020-04-14 02:00:00', '5e8bf0da2c037083817517', 87, NULL, NULL, NULL, NULL),
(1001, '2020-04-15 01:00:00', '2020-04-15 02:00:00', '5e8bf0da2c03a950252622', 87, NULL, NULL, NULL, NULL),
(1002, '2020-04-16 01:00:00', '2020-04-16 02:00:00', '5e8bf0da2c03c237726362', 87, NULL, NULL, NULL, NULL),
(1003, '2020-04-17 01:00:00', '2020-04-17 02:00:00', '5e8bf0da2c03e901018620', 87, NULL, NULL, NULL, NULL),
(1004, '2020-04-21 01:00:00', '2020-04-21 02:00:00', '5e8bf0da2c040206677260', 87, NULL, NULL, NULL, NULL),
(1005, '2020-04-22 01:00:00', '2020-04-22 02:00:00', '5e8bf0da2c043994664732', 87, NULL, NULL, NULL, NULL),
(1006, '2020-04-23 01:00:00', '2020-04-23 02:00:00', '5e8bf0da2c045887598376', 87, NULL, NULL, NULL, NULL),
(1007, '2020-04-24 01:00:00', '2020-04-24 02:00:00', '5e8bf0da2c047251996430', 87, NULL, NULL, NULL, NULL),
(1008, '2020-04-28 01:00:00', '2020-04-28 02:00:00', '5e8bf0da2c049028683307', 87, NULL, NULL, NULL, NULL),
(1009, '2020-04-29 01:00:00', '2020-04-29 02:00:00', '5e8bf0da2c04b715918144', 87, NULL, NULL, NULL, NULL),
(1010, '2020-04-30 01:00:00', '2020-04-30 02:00:00', '5e8bf0da2c04d447826384', 87, NULL, NULL, NULL, NULL),
(1011, '2020-05-01 01:00:00', '2020-05-01 02:00:00', '5e8bf0da2c04f884730697', 87, NULL, NULL, NULL, NULL),
(1012, '2020-04-07 02:00:00', '2020-04-07 03:00:00', '5e8bf10795179621468933', 88, NULL, NULL, NULL, '0.00'),
(1013, '2020-04-08 02:00:00', '2020-04-08 03:00:00', '5e8bf107954ec818509973', 88, NULL, NULL, NULL, NULL),
(1014, '2020-04-09 02:00:00', '2020-04-09 03:00:00', '5e8bf107954f0507134016', 88, NULL, NULL, NULL, NULL),
(1015, '2020-04-10 02:00:00', '2020-04-10 03:00:00', '5e8bf107954f3055534410', 88, NULL, NULL, NULL, NULL),
(1016, '2020-04-14 02:00:00', '2020-04-14 03:00:00', '5e8bf107954f5188837832', 88, NULL, NULL, NULL, NULL),
(1017, '2020-04-15 02:00:00', '2020-04-15 03:00:00', '5e8bf107954f7338682376', 88, NULL, NULL, NULL, NULL),
(1018, '2020-04-16 02:00:00', '2020-04-16 03:00:00', '5e8bf107954f9169566487', 88, NULL, NULL, NULL, NULL),
(1019, '2020-04-17 02:00:00', '2020-04-17 03:00:00', '5e8bf107954fb670608424', 88, NULL, NULL, NULL, NULL),
(1020, '2020-04-21 02:00:00', '2020-04-21 03:00:00', '5e8bf107954fd681425424', 88, NULL, NULL, NULL, NULL),
(1021, '2020-04-22 02:00:00', '2020-04-22 03:00:00', '5e8bf107954ff948800477', 88, NULL, NULL, NULL, NULL),
(1022, '2020-04-23 02:00:00', '2020-04-23 03:00:00', '5e8bf10795501614200738', 88, NULL, NULL, NULL, NULL),
(1023, '2020-04-24 02:00:00', '2020-04-24 03:00:00', '5e8bf10795503958201179', 88, NULL, NULL, NULL, NULL),
(1024, '2020-04-28 02:00:00', '2020-04-28 03:00:00', '5e8bf10795505999649813', 88, NULL, NULL, NULL, NULL),
(1025, '2020-04-29 02:00:00', '2020-04-29 03:00:00', '5e8bf10795507261999329', 88, NULL, NULL, NULL, NULL),
(1026, '2020-04-30 02:00:00', '2020-04-30 03:00:00', '5e8bf10795509293032168', 88, NULL, NULL, NULL, NULL),
(1027, '2020-05-01 02:00:00', '2020-05-01 03:00:00', '5e8bf1079550b586524616', 88, NULL, NULL, NULL, NULL),
(1028, '2020-04-08 15:00:00', '2020-04-08 16:00:00', '5e8d5e2c2cb0b793605698', 89, NULL, NULL, NULL, NULL),
(1029, '2020-04-09 15:00:00', '2020-04-09 16:00:00', '5e8d5e2c2ce64757115663', 89, NULL, NULL, NULL, NULL),
(1030, '2020-04-13 15:00:00', '2020-04-13 16:00:00', '5e8d5e2c2ce69864407982', 89, NULL, NULL, NULL, NULL),
(1031, '2020-04-14 15:00:00', '2020-04-14 16:00:00', '5e8d5e2c2ce6b302502916', 89, NULL, NULL, NULL, NULL),
(1032, '2020-04-15 15:00:00', '2020-04-15 16:00:00', '5e8d5e2c2ce6d851797735', 89, NULL, NULL, NULL, NULL),
(1033, '2020-04-16 15:00:00', '2020-04-16 16:00:00', '5e8d5e2c2ce6f393122121', 89, NULL, NULL, NULL, NULL),
(1034, '2020-04-20 15:00:00', '2020-04-20 16:00:00', '5e8d5e2c2ce71743109543', 89, NULL, NULL, NULL, NULL),
(1035, '2020-04-21 15:00:00', '2020-04-21 16:00:00', '5e8d5e2c2ce73322910166', 89, NULL, NULL, NULL, NULL),
(1036, '2020-04-22 15:00:00', '2020-04-22 16:00:00', '5e8d5e2c2ce75729773540', 89, NULL, NULL, NULL, NULL),
(1037, '2020-04-23 15:00:00', '2020-04-23 16:00:00', '5e8d5e2c2ce78785531489', 89, NULL, NULL, NULL, NULL),
(1038, '2020-04-27 15:00:00', '2020-04-27 16:00:00', '5e8d5e2c2ce7a832657431', 89, NULL, NULL, NULL, NULL),
(1039, '2020-04-28 15:00:00', '2020-04-28 16:00:00', '5e8d5e2c2ce7c579208250', 89, NULL, NULL, NULL, NULL),
(1040, '2020-04-29 15:00:00', '2020-04-29 16:00:00', '5e8d5e2c2ce7e820981253', 89, NULL, NULL, NULL, NULL),
(1041, '2020-04-30 15:00:00', '2020-04-30 16:00:00', '5e8d5e2c2ce80618736002', 89, NULL, NULL, NULL, NULL),
(1042, '2020-04-08 15:00:00', '2020-04-08 16:00:00', '5e8d610a08e29897521980', 90, NULL, NULL, NULL, NULL);
INSERT INTO `reservation_instances` (`reservation_instance_id`, `start_date`, `end_date`, `reference_number`, `series_id`, `checkin_date`, `checkout_date`, `previous_end_date`, `credit_count`) VALUES
(1043, '2020-04-09 15:00:00', '2020-04-09 16:00:00', '5e8d610a091b8255923919', 90, NULL, NULL, NULL, NULL),
(1044, '2020-04-13 15:00:00', '2020-04-13 16:00:00', '5e8d610a091bd677961798', 90, NULL, NULL, NULL, NULL),
(1045, '2020-04-14 15:00:00', '2020-04-14 16:00:00', '5e8d610a091c0632443682', 90, NULL, NULL, NULL, NULL),
(1046, '2020-04-15 15:00:00', '2020-04-15 16:00:00', '5e8d610a091c3491349604', 90, NULL, NULL, NULL, NULL),
(1047, '2020-04-16 15:00:00', '2020-04-16 16:00:00', '5e8d610a091c6529605117', 90, NULL, NULL, NULL, NULL),
(1048, '2020-04-20 15:00:00', '2020-04-20 16:00:00', '5e8d610a091c9652555663', 90, NULL, NULL, NULL, NULL),
(1049, '2020-04-21 15:00:00', '2020-04-21 16:00:00', '5e8d610a091cc161304456', 90, NULL, NULL, NULL, NULL),
(1050, '2020-04-22 15:00:00', '2020-04-22 16:00:00', '5e8d610a091cf814671652', 90, NULL, NULL, NULL, NULL),
(1051, '2020-04-23 15:00:00', '2020-04-23 16:00:00', '5e8d610a091d2332571491', 90, NULL, NULL, NULL, NULL),
(1052, '2020-04-27 15:00:00', '2020-04-27 16:00:00', '5e8d610a091d5136727070', 90, NULL, NULL, NULL, NULL),
(1053, '2020-04-28 15:00:00', '2020-04-28 16:00:00', '5e8d610a091d8254386067', 90, NULL, NULL, NULL, NULL),
(1054, '2020-04-29 15:00:00', '2020-04-29 16:00:00', '5e8d610a091db525027226', 90, NULL, NULL, NULL, NULL),
(1055, '2020-04-30 15:00:00', '2020-04-30 16:00:00', '5e8d610a091de452804111', 90, NULL, NULL, NULL, NULL),
(1056, '2020-04-08 15:00:00', '2020-04-08 16:00:00', '5e8d6556209dc806216040', 91, NULL, NULL, NULL, NULL),
(1057, '2020-04-09 15:00:00', '2020-04-09 16:00:00', '5e8d655620d02983646751', 91, NULL, NULL, NULL, NULL),
(1058, '2020-04-13 15:00:00', '2020-04-13 16:00:00', '5e8d655620d06107898825', 91, NULL, NULL, NULL, NULL),
(1059, '2020-04-14 15:00:00', '2020-04-14 16:00:00', '5e8d655620d09154290389', 91, NULL, NULL, NULL, NULL),
(1060, '2020-04-15 15:00:00', '2020-04-15 16:00:00', '5e8d655620d0b139969385', 91, NULL, NULL, NULL, NULL),
(1061, '2020-04-16 15:00:00', '2020-04-16 16:00:00', '5e8d655620d0d400105876', 91, NULL, NULL, NULL, NULL),
(1062, '2020-04-20 15:00:00', '2020-04-20 16:00:00', '5e8d655620d0f474489096', 91, NULL, NULL, NULL, NULL),
(1063, '2020-04-21 15:00:00', '2020-04-21 16:00:00', '5e8d655620d11998431187', 91, NULL, NULL, NULL, NULL),
(1064, '2020-04-22 15:00:00', '2020-04-22 16:00:00', '5e8d655620d13552581813', 91, NULL, NULL, NULL, NULL),
(1065, '2020-04-23 15:00:00', '2020-04-23 16:00:00', '5e8d655620d15078471960', 91, NULL, NULL, NULL, NULL),
(1066, '2020-04-27 15:00:00', '2020-04-27 16:00:00', '5e8d655620d17305748846', 91, NULL, NULL, NULL, NULL),
(1067, '2020-04-28 15:00:00', '2020-04-28 16:00:00', '5e8d655620d19439389500', 91, NULL, NULL, NULL, NULL),
(1068, '2020-04-29 15:00:00', '2020-04-29 16:00:00', '5e8d655620d1b884455026', 91, NULL, NULL, NULL, NULL),
(1069, '2020-04-30 15:00:00', '2020-04-30 16:00:00', '5e8d655620d1d564701867', 91, NULL, NULL, NULL, NULL),
(1070, '2020-04-08 15:00:00', '2020-04-08 16:00:00', '5e8d6d2759f4f108404545', 92, NULL, NULL, NULL, NULL),
(1071, '2020-04-13 15:00:00', '2020-04-13 16:00:00', '5e8d6d275a130944447230', 92, NULL, NULL, NULL, NULL),
(1072, '2020-04-20 15:00:00', '2020-04-20 16:00:00', '5e8d6d275a143153398856', 92, NULL, NULL, NULL, NULL),
(1073, '2020-04-27 15:00:00', '2020-04-27 16:00:00', '5e8d6d275a145184464560', 92, NULL, NULL, NULL, NULL),
(1074, '2020-05-04 15:00:00', '2020-05-04 16:00:00', '5e8d6d275a148756109805', 92, NULL, NULL, NULL, NULL),
(1075, '2020-05-11 15:00:00', '2020-05-11 16:00:00', '5e8d6d275a14a182538352', 92, NULL, NULL, NULL, NULL),
(1076, '2020-05-18 15:00:00', '2020-05-18 16:00:00', '5e8d6d275a14c493559383', 92, NULL, NULL, NULL, NULL),
(1077, '2020-05-25 15:00:00', '2020-05-25 16:00:00', '5e8d6d275a14e377860041', 92, NULL, NULL, NULL, NULL),
(1078, '2020-06-01 15:00:00', '2020-06-01 16:00:00', '5e8d6d275a150295876017', 92, NULL, NULL, NULL, NULL),
(1079, '2020-04-08 16:00:00', '2020-04-08 17:00:00', '5e8d6e69e327b576826344', 93, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation_reminders`
--

CREATE TABLE `reservation_reminders` (
  `reminder_id` int(11) UNSIGNED NOT NULL,
  `series_id` int(10) UNSIGNED NOT NULL,
  `minutes_prior` int(10) UNSIGNED NOT NULL,
  `reminder_type` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation_resources`
--

CREATE TABLE `reservation_resources` (
  `series_id` int(10) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `resource_level_id` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reservation_resources`
--

INSERT INTO `reservation_resources` (`series_id`, `resource_id`, `resource_level_id`) VALUES
(13, 1, 1),
(14, 1, 1),
(15, 1, 1),
(16, 1, 1),
(17, 1, 1),
(18, 1, 1),
(19, 1, 1),
(20, 1, 1),
(21, 1, 1),
(22, 1, 1),
(23, 1, 1),
(24, 1, 1),
(25, 1, 1),
(26, 13, 1),
(27, 13, 1),
(28, 13, 1),
(29, 13, 1),
(30, 14, 1),
(31, 14, 1),
(32, 14, 1),
(33, 14, 1),
(34, 14, 1),
(35, 14, 1),
(36, 14, 1),
(37, 14, 1),
(38, 14, 1),
(39, 14, 1),
(40, 14, 1),
(41, 14, 1),
(42, 14, 1),
(43, 14, 1),
(44, 18, 1),
(45, 18, 1),
(46, 15, 1),
(47, 15, 1),
(48, 15, 1),
(49, 15, 1),
(50, 15, 1),
(51, 15, 1),
(52, 15, 1),
(53, 15, 1),
(54, 15, 1),
(55, 15, 1),
(56, 2, 1),
(57, 2, 1),
(58, 2, 1),
(59, 10, 1),
(60, 10, 1),
(61, 8, 1),
(62, 8, 1),
(63, 8, 1),
(64, 8, 1),
(65, 8, 1),
(66, 16, 1),
(67, 16, 1),
(68, 16, 1),
(69, 16, 1),
(70, 16, 1),
(71, 16, 1),
(72, 16, 1),
(73, 16, 1),
(74, 16, 1),
(75, 16, 1),
(76, 16, 1),
(77, 17, 1),
(78, 17, 1),
(79, 17, 1),
(80, 17, 1),
(81, 17, 1),
(82, 17, 1),
(83, 17, 1),
(84, 17, 1),
(85, 17, 1),
(86, 17, 1),
(87, 17, 1),
(88, 17, 1),
(89, 1, 1),
(90, 1, 1),
(91, 1, 1),
(92, 13, 1),
(93, 13, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation_series`
--

CREATE TABLE `reservation_series` (
  `series_id` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `allow_participation` tinyint(1) UNSIGNED NOT NULL,
  `allow_anon_participation` tinyint(1) UNSIGNED NOT NULL,
  `type_id` tinyint(2) UNSIGNED NOT NULL,
  `status_id` tinyint(2) UNSIGNED NOT NULL,
  `repeat_type` varchar(10) DEFAULT NULL,
  `repeat_options` varchar(255) DEFAULT NULL,
  `owner_id` mediumint(8) UNSIGNED NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `last_action_by` mediumint(8) UNSIGNED DEFAULT NULL,
  `terms_date_accepted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reservation_series`
--

INSERT INTO `reservation_series` (`series_id`, `date_created`, `last_modified`, `title`, `description`, `allow_participation`, `allow_anon_participation`, `type_id`, `status_id`, `repeat_type`, `repeat_options`, `owner_id`, `legacyid`, `last_action_by`, `terms_date_accepted`) VALUES
(13, '2020-04-06 23:33:47', '2020-04-07 03:23:18', 'Base de Datos I', 'Base de Datos I - IF322 - Sección: 0701', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(14, '2020-04-06 23:39:52', '2020-04-07 03:23:56', 'Programacion Estructurada I', 'Programacion Estructurada I - IF214 - Sección: 0801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(15, '2020-04-06 23:45:19', '2020-04-06 23:49:36', 'Sistemas Inteligentes para Negocios', 'Sistemas Inteligentes para Negocios - IF211 - Sección : 0801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=6', 2, NULL, 2, NULL),
(16, '2020-04-06 23:47:16', '2020-04-07 03:24:04', 'Programación en Entornos de Desarrollo V', 'Programación en Entornos de Desarrollo V - IF325 - Sección: 1001', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(17, '2020-04-06 23:48:15', '2020-04-06 23:49:25', 'Diseño Grafico', 'Diseño Grafico - IF394 -  Sección: 1101', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(18, '2020-04-06 23:51:06', NULL, 'Análisis y Diseño de Sistemas', 'Análisis y Diseño de Sistemas - IF212 - Sección: 1301', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(19, '2020-04-06 23:52:49', NULL, 'Programación Científica II', 'Programación Científica II  - IF208 - Sección: 1501', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(20, '2020-04-06 23:53:31', '2020-04-06 23:53:48', 'Programación Científica I', 'Programación Científica I - IF106 - Sección: 1601', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(21, '2020-04-06 23:55:27', NULL, 'Seminario de Administración', 'Seminario de Administración -  AD504 - Sección: 1701', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=5', 2, NULL, 2, NULL),
(22, '2020-04-06 23:56:31', NULL, 'Base de Datos II', 'Base de Datos II - IF327 - Sección: 1701', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(23, '2020-04-06 23:57:44', '2020-04-06 23:58:01', 'Bases de Datos Multidimensional', 'Bases de Datos Multidimensional - IF342 - Sección: 1801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(24, '2020-04-06 23:59:06', NULL, 'Sistemas Automatizados', 'Sistemas Automatizados - IF329 - Sección: 1901', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(25, '2020-04-07 00:00:27', NULL, 'Administración de Centros de Computo', 'Administración de Centros de Computo - IF310 - Sección: 2001', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(26, '2020-04-07 00:02:57', NULL, 'Desarrollo de Software', 'Desarrollo de Software - IF314 - Sección: 0801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=6', 2, NULL, 2, NULL),
(27, '2020-04-07 00:11:29', NULL, 'Diseño de Proyectos en Computadora', 'Diseño de Proyectos en Computadora - IG304 - Sección: 0801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=5', 2, NULL, 2, NULL),
(28, '2020-04-07 00:12:26', NULL, 'Informática', 'Informática - IF101 - Sección: 1102', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(29, '2020-04-07 00:13:41', '2020-04-07 00:14:06', 'Administración de Sistemas de Software', 'Administración de Sistemas de Software - IF313 - Sección: 1801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(30, '2020-04-07 00:16:16', NULL, 'Informática I', 'Informática I - IF101 - Sección: 0701', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(31, '2020-04-07 00:17:05', NULL, 'Informática I', 'Informática I - IF101 - Sección: 0801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-04-13 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(32, '2020-04-07 00:18:37', '2020-04-07 03:24:19', 'Programación Estructurada II', 'Programación Estructurada II - IF303 - Sección: 1101', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(33, '2020-04-07 00:19:41', NULL, 'Informática I', 'Informática I - IF101 - Sección: 0901', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(34, '2020-04-07 00:20:20', NULL, 'Informática I', 'Informática I - IF101 - Sección: 1001', 0, 0, 1, 1, 'none', '', 2, NULL, 2, NULL),
(35, '2020-04-07 00:21:09', '2020-04-07 00:24:28', 'Informática I', 'Informática I - IF101 - Sección: 1201', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(36, '2020-04-07 00:21:48', '2020-04-07 00:24:42', 'Informática I', 'Informática I - IF101 - Sección: 1401', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(37, '2020-04-07 00:22:42', NULL, 'Informática I', 'Informática I - IF101 - Sección: 1301', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(38, '2020-04-07 00:23:44', '2020-04-07 03:25:02', 'Herramientas Tecnológicas', 'Herramientas Tecnológicas - IF108 - Sección: 0801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=6', 2, NULL, 2, NULL),
(39, '2020-04-07 00:27:09', '2020-04-07 00:38:02', 'Prueba, Documentación e Implementación de Software', 'Prueba, Documentación e Implementación de Software - IF410 - Sección: 1601', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(40, '2020-04-07 00:28:35', '2020-04-07 00:30:31', 'Auditoria de Sistemas de Información', 'Auditoria de Sistemas de Información - IF109 - Sección: 1701', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(41, '2020-04-07 00:29:54', '2020-04-07 00:30:20', 'Redes I', 'Redes I - IF323 - Sección: 1801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(42, '2020-04-07 00:31:50', NULL, 'Seminarios de Hardware y Software', 'Seminarios de Hardware y Software - IF517 - Sección: 1901', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(43, '2020-04-07 00:32:55', '2020-04-07 00:33:05', 'Gestión de Proyectos Informáticos', 'Gestión de Proyectos Informáticos - IF110 - Sección: 2001', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(44, '2020-04-07 00:35:23', NULL, 'Dibujo aplicado a la Arquitectura', 'Dibujo aplicado a la Arquitectura - AQ313 - Sección: 1001', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=2,4', 2, NULL, 2, NULL),
(45, '2020-04-07 00:36:19', NULL, 'Informática II', 'Informática II - IF201 - Sección: 1801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(46, '2020-04-07 00:41:55', NULL, 'Introducción a la Ciencias de la Computación', 'Introducción a la Ciencias de la Computación - IF112 - Sección: 0701', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(47, '2020-04-07 00:43:02', NULL, 'Informática II', 'Informática II - IF201 - Sección: 0901', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(48, '2020-04-07 00:43:35', NULL, 'Informática II', 'Informática II - IF201 - Sección: 0901', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(49, '2020-04-07 00:44:48', '2020-04-07 00:44:59', 'Administración Estratégica de Instituciones', 'Administración Estratégica de Instituciones - AD310 - Sección: 1501', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(50, '2020-04-07 00:46:06', NULL, 'Programación Orientada a Objetos', 'Programación Orientada a Objetos - IF315 - Sección: 1801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(51, '2020-04-07 02:27:08', NULL, 'Taller Revit I', 'Taller Revit I - IGTR1 - Sección: 0801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=6', 2, NULL, 2, NULL),
(52, '2020-04-07 02:28:07', NULL, 'Taller Revit I', 'Taller Revit I - IGTR1 - Sección: 1001', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=6', 2, NULL, 2, NULL),
(53, '2020-04-07 02:29:20', NULL, 'Laboratorio Autocad I', 'Laboratorio Autocad I - IGLAC1 - Sección: 1301', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=6', 2, NULL, 2, NULL),
(54, '2020-04-07 02:30:07', NULL, 'Laboratorio Autocad I', 'Laboratorio Autocad I - IGLAC1 - Sección: 1501', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=6', 2, NULL, 2, NULL),
(55, '2020-04-07 02:31:13', '2020-04-07 02:31:24', 'Inteligencia Artificial', 'Inteligencia Artificial  - IF411 - Sección: 1701', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=6', 2, NULL, 2, NULL),
(56, '2020-04-07 02:35:06', NULL, 'Investigación de Operaciones I', 'Investigación de Operaciones I - IN215 - Sección: 0701', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=6', 2, NULL, 2, NULL),
(57, '2020-04-07 02:36:44', NULL, 'Instalaciones Eléctricas', 'Instalaciones Eléctricas - PR411 - Sección: 1501', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(58, '2020-04-07 02:37:40', NULL, 'Formulación y Evaluación de Proyectos', 'Formulación y Evaluación de Proyectos - AD401 - Sección: 1601', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(59, '2020-04-07 02:41:49', NULL, 'Técnicas y Estrategias de Negociación', 'Técnicas y Estrategias de Negociación  - AD534 - Sección: 1701', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(60, '2020-04-07 02:43:02', NULL, 'Diseño y Desatollo de Proyectos de PSIC', 'Diseño y Desatollo de Proyectos de PSIC - PS398 -  Seccion: 1801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(61, '2020-04-07 02:44:44', NULL, 'Defensa Personal I', 'Defensa Personal I - DPDP1 - Sección: 0701', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=5', 2, NULL, 2, NULL),
(62, '2020-04-07 02:46:17', NULL, 'Aeróbicos I', 'Aeróbicos I - DPAR1 - Sección: 0801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=5', 2, NULL, 2, NULL),
(63, '2020-04-07 02:47:06', NULL, 'Danza Moderna I', 'Danza Moderna I -CTDM1 - Sección: 0901', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=5', 2, NULL, 2, NULL),
(64, '2020-04-07 02:47:54', '2020-04-07 02:48:58', 'Aeróbicos I', 'Aeróbicos I - DPAR1 - Sección: 1001', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=5', 2, NULL, 2, NULL),
(65, '2020-04-07 02:48:40', NULL, 'Danza Moderna I', 'Danza Moderna I - CTDM1 - Sección: 1101', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=5', 2, NULL, 2, NULL),
(66, '2020-04-07 02:50:36', NULL, 'Sistemas Operativos II', 'Sistemas Operativos II - IF209 - Sección: 0801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=6', 2, NULL, 2, NULL),
(67, '2020-04-07 02:52:11', NULL, 'Laboratorio Herramientas de  Diseños y Maquinas', 'Laboratorio Herramientas de  Diseños y Maquinas - IGLHD1 - Sección: 1001', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=5', 2, NULL, 2, NULL),
(68, '2020-04-07 02:53:15', NULL, 'Diseño de Proyectos en Computadora', 'Diseño de Proyectos en Computadora - IG304 - Sección: 1301', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=5', 2, NULL, 2, NULL),
(69, '2020-04-07 02:54:28', NULL, 'Informática I', 'Informática I - IF101 - Sección: 0902', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(70, '2020-04-07 02:55:09', NULL, 'Informática I', 'Informática I - IF101 - Sección: 1002', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(71, '2020-04-07 02:55:40', '2020-04-07 02:55:55', 'Informática I', 'Informática I - IF101 - Sección: 1103', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(72, '2020-04-07 02:56:45', NULL, 'Administración Financiera II', 'Administración Financiera II  - FZ401 - Sección: 1201', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(73, '2020-04-07 02:57:42', NULL, 'Estrategia Fiscal', 'Estrategia Fiscal - FZ403 - Sección: 1301', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(74, '2020-04-07 02:58:42', NULL, 'Fideicomiso', 'Fideicomiso - BF403 - Sección: 1401', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(75, '2020-04-07 02:59:35', NULL, 'Sistemas Operativos I', 'Sistemas Operativos I  - IF107 - Sección: 1801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(76, '2020-04-07 03:00:24', NULL, 'Sistemas Operativos II', 'Sistemas Operativos II - IF209 - Sección: 2001', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(77, '2020-04-07 03:02:55', NULL, 'Desarrollo de Software', 'Desarrollo de Software - IF314 - Sección: 0801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=6', 2, NULL, 2, NULL),
(78, '2020-04-07 03:09:04', NULL, 'Programación de Negocios', 'Programación de Negocios - IF409 - Sección: 1301', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=6', 2, NULL, 2, NULL),
(79, '2020-04-07 03:10:06', NULL, 'Introducción a las Ciencias de la Computación', 'Introducción a las Ciencias de la Computación - IF112 - Sección: 0701', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(80, '2020-04-07 03:11:12', NULL, 'Fundamentos y Lógica de Programación', 'Fundamentos y Lógica de Programación  - IF200 - Sección: 0801', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4,5', 2, NULL, 2, NULL),
(81, '2020-04-07 03:12:05', '2020-04-07 03:12:17', 'Informática I', 'Informática I - IF101 - Sección: 1101', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(82, '2020-04-07 03:13:24', NULL, 'Tecnologías de la Información en las Relaciones Publicas', 'Tecnologías de la Información en las Relaciones Publicas - RI300 - Sección: 1201', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(83, '2020-04-07 03:14:21', '2020-04-07 03:14:31', 'Simulación de Procesos', 'Simulación de Procesos - PR509 - Sección: 1401', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(84, '2020-04-07 03:15:32', NULL, 'Redes II', 'Redes II - IF328 - Sección: 1601', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4,5', 2, NULL, 2, NULL),
(85, '2020-04-07 03:16:26', NULL, 'Programación Multiplataforma', 'Programación Multiplataforma - IF340 - Sección: 1701', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(86, '2020-04-07 03:17:06', NULL, 'Seminario de Software', 'Seminario de Software - IF505', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(87, '2020-04-07 03:17:46', NULL, 'Negocios Web', 'Negocios Web - IF412 - Sección: 1901', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(88, '2020-04-07 03:18:32', NULL, 'Desarrollo de Portales Web', 'Desarrollo de Portales Web - IF316 - Sección : 2001', 0, 0, 1, 1, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 2, NULL, 2, NULL),
(89, '2020-04-08 05:16:29', '2020-04-08 05:25:01', 'Base de Datos II', 'Base de Datos II - IF201 - Sección: 0903', 0, 0, 1, 2, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 5, NULL, 2, NULL),
(90, '2020-04-08 05:28:42', '2020-04-08 05:43:25', 'Base de Datos II', 'Base de Datos II - IF201 - Sección: 0903', 0, 0, 1, 2, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 5, NULL, 2, NULL),
(91, '2020-04-08 05:47:02', '2020-04-08 06:54:54', 'Base De Datos II', 'Base de Datos II - IF201 - Sección: 0903', 0, 0, 1, 2, 'weekly', 'interval=1|termination=2020-05-01 06:00:00|days=1,2,3,4', 5, NULL, 2, NULL),
(92, '2020-04-08 06:20:24', '2020-04-08 06:55:08', 'Algoritmos y Programacion', 'Algoritmos y Programacion', 0, 0, 1, 2, 'weekly', 'interval=1|termination=2020-06-01 06:00:00|days=1', 5, NULL, 2, NULL),
(93, '2020-04-08 06:25:46', '2020-04-08 06:55:14', 'Prueba de Reserva', 'Prueba de Reserva', 0, 0, 1, 2, 'none', '', 3, NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation_statuses`
--

CREATE TABLE `reservation_statuses` (
  `status_id` tinyint(2) UNSIGNED NOT NULL,
  `label` varchar(85) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reservation_statuses`
--

INSERT INTO `reservation_statuses` (`status_id`, `label`) VALUES
(1, 'Created'),
(2, 'Deleted'),
(3, 'Pending');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation_types`
--

CREATE TABLE `reservation_types` (
  `type_id` tinyint(2) UNSIGNED NOT NULL,
  `label` varchar(85) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reservation_types`
--

INSERT INTO `reservation_types` (`type_id`, `label`) VALUES
(1, 'Reservation'),
(2, 'Blackout');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation_users`
--

CREATE TABLE `reservation_users` (
  `reservation_instance_id` int(10) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `reservation_user_level` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reservation_users`
--

INSERT INTO `reservation_users` (`reservation_instance_id`, `user_id`, `reservation_user_level`) VALUES
(71, 2, 1),
(72, 2, 1),
(73, 2, 1),
(74, 2, 1),
(75, 2, 1),
(76, 2, 1),
(77, 2, 1),
(78, 2, 1),
(79, 2, 1),
(80, 2, 1),
(81, 2, 1),
(82, 2, 1),
(83, 2, 1),
(84, 2, 1),
(85, 2, 1),
(86, 2, 1),
(87, 2, 1),
(88, 2, 1),
(89, 2, 1),
(90, 2, 1),
(91, 2, 1),
(92, 2, 1),
(93, 2, 1),
(94, 2, 1),
(95, 2, 1),
(96, 2, 1),
(97, 2, 1),
(98, 2, 1),
(99, 2, 1),
(100, 2, 1),
(101, 2, 1),
(102, 2, 1),
(103, 2, 1),
(104, 2, 1),
(105, 2, 1),
(106, 2, 1),
(107, 2, 1),
(108, 2, 1),
(109, 2, 1),
(110, 2, 1),
(111, 2, 1),
(112, 2, 1),
(113, 2, 1),
(114, 2, 1),
(115, 2, 1),
(116, 2, 1),
(117, 2, 1),
(118, 2, 1),
(119, 2, 1),
(120, 2, 1),
(121, 2, 1),
(122, 2, 1),
(123, 2, 1),
(124, 2, 1),
(125, 2, 1),
(126, 2, 1),
(127, 2, 1),
(128, 2, 1),
(129, 2, 1),
(130, 2, 1),
(131, 2, 1),
(132, 2, 1),
(133, 2, 1),
(134, 2, 1),
(135, 2, 1),
(136, 2, 1),
(137, 2, 1),
(138, 2, 1),
(139, 2, 1),
(140, 2, 1),
(141, 2, 1),
(142, 2, 1),
(143, 2, 1),
(144, 2, 1),
(145, 2, 1),
(146, 2, 1),
(147, 2, 1),
(148, 2, 1),
(149, 2, 1),
(150, 2, 1),
(151, 2, 1),
(152, 2, 1),
(153, 2, 1),
(154, 2, 1),
(155, 2, 1),
(156, 2, 1),
(157, 2, 1),
(158, 2, 1),
(159, 2, 1),
(160, 2, 1),
(161, 2, 1),
(162, 2, 1),
(163, 2, 1),
(164, 2, 1),
(165, 2, 1),
(166, 2, 1),
(167, 2, 1),
(168, 2, 1),
(169, 2, 1),
(170, 2, 1),
(171, 2, 1),
(172, 2, 1),
(173, 2, 1),
(174, 2, 1),
(175, 2, 1),
(176, 2, 1),
(177, 2, 1),
(178, 2, 1),
(179, 2, 1),
(180, 2, 1),
(181, 2, 1),
(182, 2, 1),
(183, 2, 1),
(184, 2, 1),
(185, 2, 1),
(186, 2, 1),
(187, 2, 1),
(188, 2, 1),
(189, 2, 1),
(190, 2, 1),
(191, 2, 1),
(192, 2, 1),
(193, 2, 1),
(194, 2, 1),
(195, 2, 1),
(196, 2, 1),
(197, 2, 1),
(198, 2, 1),
(199, 2, 1),
(200, 2, 1),
(201, 2, 1),
(202, 2, 1),
(203, 2, 1),
(204, 2, 1),
(205, 2, 1),
(206, 2, 1),
(207, 2, 1),
(208, 2, 1),
(209, 2, 1),
(210, 2, 1),
(211, 2, 1),
(212, 2, 1),
(213, 2, 1),
(214, 2, 1),
(215, 2, 1),
(216, 2, 1),
(217, 2, 1),
(218, 2, 1),
(219, 2, 1),
(220, 2, 1),
(221, 2, 1),
(222, 2, 1),
(223, 2, 1),
(224, 2, 1),
(225, 2, 1),
(226, 2, 1),
(227, 2, 1),
(228, 2, 1),
(229, 2, 1),
(230, 2, 1),
(231, 2, 1),
(232, 2, 1),
(233, 2, 1),
(234, 2, 1),
(235, 2, 1),
(236, 2, 1),
(237, 2, 1),
(238, 2, 1),
(239, 2, 1),
(240, 2, 1),
(241, 2, 1),
(242, 2, 1),
(243, 2, 1),
(244, 2, 1),
(245, 2, 1),
(246, 2, 1),
(247, 2, 1),
(248, 2, 1),
(249, 2, 1),
(250, 2, 1),
(251, 2, 1),
(252, 2, 1),
(253, 2, 1),
(254, 2, 1),
(255, 2, 1),
(256, 2, 1),
(257, 2, 1),
(258, 2, 1),
(259, 2, 1),
(260, 2, 1),
(261, 2, 1),
(262, 2, 1),
(263, 2, 1),
(264, 2, 1),
(265, 2, 1),
(266, 2, 1),
(267, 2, 1),
(268, 2, 1),
(269, 2, 1),
(270, 2, 1),
(271, 2, 1),
(272, 2, 1),
(273, 2, 1),
(274, 2, 1),
(275, 2, 1),
(276, 2, 1),
(277, 2, 1),
(278, 2, 1),
(279, 2, 1),
(280, 2, 1),
(281, 2, 1),
(282, 2, 1),
(283, 2, 1),
(284, 2, 1),
(285, 2, 1),
(286, 2, 1),
(287, 2, 1),
(288, 2, 1),
(289, 2, 1),
(290, 2, 1),
(291, 2, 1),
(292, 2, 1),
(293, 2, 1),
(294, 2, 1),
(295, 2, 1),
(296, 2, 1),
(297, 2, 1),
(298, 2, 1),
(299, 2, 1),
(300, 2, 1),
(301, 2, 1),
(302, 2, 1),
(303, 2, 1),
(304, 2, 1),
(305, 2, 1),
(306, 2, 1),
(307, 2, 1),
(308, 2, 1),
(309, 2, 1),
(310, 2, 1),
(311, 2, 1),
(312, 2, 1),
(313, 2, 1),
(314, 2, 1),
(315, 2, 1),
(316, 2, 1),
(317, 2, 1),
(318, 2, 1),
(319, 2, 1),
(320, 2, 1),
(321, 2, 1),
(322, 2, 1),
(323, 2, 1),
(324, 2, 1),
(325, 2, 1),
(326, 2, 1),
(327, 2, 1),
(328, 2, 1),
(329, 2, 1),
(330, 2, 1),
(331, 2, 1),
(332, 2, 1),
(333, 2, 1),
(334, 2, 1),
(335, 2, 1),
(336, 2, 1),
(337, 2, 1),
(338, 2, 1),
(339, 2, 1),
(340, 2, 1),
(341, 2, 1),
(342, 2, 1),
(343, 2, 1),
(344, 2, 1),
(345, 2, 1),
(346, 2, 1),
(347, 2, 1),
(348, 2, 1),
(349, 2, 1),
(350, 2, 1),
(351, 2, 1),
(352, 2, 1),
(353, 2, 1),
(354, 2, 1),
(355, 2, 1),
(356, 2, 1),
(357, 2, 1),
(358, 2, 1),
(359, 2, 1),
(360, 2, 1),
(361, 2, 1),
(362, 2, 1),
(363, 2, 1),
(364, 2, 1),
(365, 2, 1),
(366, 2, 1),
(367, 2, 1),
(368, 2, 1),
(369, 2, 1),
(370, 2, 1),
(371, 2, 1),
(372, 2, 1),
(373, 2, 1),
(374, 2, 1),
(375, 2, 1),
(376, 2, 1),
(377, 2, 1),
(378, 2, 1),
(379, 2, 1),
(380, 2, 1),
(381, 2, 1),
(382, 2, 1),
(383, 2, 1),
(384, 2, 1),
(385, 2, 1),
(386, 2, 1),
(387, 2, 1),
(388, 2, 1),
(389, 2, 1),
(390, 2, 1),
(391, 2, 1),
(392, 2, 1),
(393, 2, 1),
(394, 2, 1),
(395, 2, 1),
(396, 2, 1),
(397, 2, 1),
(398, 2, 1),
(413, 2, 1),
(414, 2, 1),
(415, 2, 1),
(416, 2, 1),
(417, 2, 1),
(418, 2, 1),
(419, 2, 1),
(420, 2, 1),
(421, 2, 1),
(422, 2, 1),
(423, 2, 1),
(424, 2, 1),
(425, 2, 1),
(426, 2, 1),
(427, 2, 1),
(428, 2, 1),
(429, 2, 1),
(430, 2, 1),
(431, 2, 1),
(432, 2, 1),
(433, 2, 1),
(434, 2, 1),
(435, 2, 1),
(436, 2, 1),
(437, 2, 1),
(438, 2, 1),
(439, 2, 1),
(440, 2, 1),
(441, 2, 1),
(442, 2, 1),
(443, 2, 1),
(444, 2, 1),
(445, 2, 1),
(446, 2, 1),
(447, 2, 1),
(448, 2, 1),
(449, 2, 1),
(450, 2, 1),
(451, 2, 1),
(452, 2, 1),
(453, 2, 1),
(454, 2, 1),
(455, 2, 1),
(456, 2, 1),
(457, 2, 1),
(458, 2, 1),
(459, 2, 1),
(460, 2, 1),
(461, 2, 1),
(462, 2, 1),
(463, 2, 1),
(464, 2, 1),
(465, 2, 1),
(466, 2, 1),
(467, 2, 1),
(468, 2, 1),
(469, 2, 1),
(470, 2, 1),
(471, 2, 1),
(472, 2, 1),
(473, 2, 1),
(474, 2, 1),
(475, 2, 1),
(476, 2, 1),
(477, 2, 1),
(478, 2, 1),
(479, 2, 1),
(480, 2, 1),
(481, 2, 1),
(482, 2, 1),
(483, 2, 1),
(484, 2, 1),
(485, 2, 1),
(486, 2, 1),
(487, 2, 1),
(488, 2, 1),
(489, 2, 1),
(490, 2, 1),
(491, 2, 1),
(492, 2, 1),
(493, 2, 1),
(494, 2, 1),
(495, 2, 1),
(496, 2, 1),
(497, 2, 1),
(498, 2, 1),
(499, 2, 1),
(500, 2, 1),
(507, 2, 1),
(508, 2, 1),
(509, 2, 1),
(510, 2, 1),
(511, 2, 1),
(512, 2, 1),
(513, 2, 1),
(514, 2, 1),
(515, 2, 1),
(516, 2, 1),
(517, 2, 1),
(518, 2, 1),
(519, 2, 1),
(520, 2, 1),
(521, 2, 1),
(522, 2, 1),
(523, 2, 1),
(524, 2, 1),
(525, 2, 1),
(526, 2, 1),
(527, 2, 1),
(528, 2, 1),
(529, 2, 1),
(530, 2, 1),
(531, 2, 1),
(532, 2, 1),
(533, 2, 1),
(534, 2, 1),
(535, 2, 1),
(536, 2, 1),
(537, 2, 1),
(538, 2, 1),
(539, 2, 1),
(540, 2, 1),
(541, 2, 1),
(542, 2, 1),
(543, 2, 1),
(544, 2, 1),
(545, 2, 1),
(546, 2, 1),
(547, 2, 1),
(548, 2, 1),
(549, 2, 1),
(550, 2, 1),
(551, 2, 1),
(552, 2, 1),
(553, 2, 1),
(554, 2, 1),
(555, 2, 1),
(556, 2, 1),
(557, 2, 1),
(558, 2, 1),
(559, 2, 1),
(560, 2, 1),
(561, 2, 1),
(562, 2, 1),
(563, 2, 1),
(564, 2, 1),
(565, 2, 1),
(566, 2, 1),
(567, 2, 1),
(568, 2, 1),
(569, 2, 1),
(570, 2, 1),
(571, 2, 1),
(572, 2, 1),
(573, 2, 1),
(574, 2, 1),
(575, 2, 1),
(576, 2, 1),
(577, 2, 1),
(578, 2, 1),
(579, 2, 1),
(580, 2, 1),
(581, 2, 1),
(582, 2, 1),
(583, 2, 1),
(584, 2, 1),
(585, 2, 1),
(586, 2, 1),
(587, 2, 1),
(588, 2, 1),
(589, 2, 1),
(590, 2, 1),
(591, 2, 1),
(592, 2, 1),
(593, 2, 1),
(594, 2, 1),
(595, 2, 1),
(596, 2, 1),
(597, 2, 1),
(598, 2, 1),
(599, 2, 1),
(600, 2, 1),
(601, 2, 1),
(602, 2, 1),
(603, 2, 1),
(604, 2, 1),
(605, 2, 1),
(606, 2, 1),
(607, 2, 1),
(608, 2, 1),
(609, 2, 1),
(610, 2, 1),
(611, 2, 1),
(612, 2, 1),
(613, 2, 1),
(614, 2, 1),
(615, 2, 1),
(616, 2, 1),
(617, 2, 1),
(618, 2, 1),
(619, 2, 1),
(620, 2, 1),
(621, 2, 1),
(622, 2, 1),
(623, 2, 1),
(624, 2, 1),
(625, 2, 1),
(626, 2, 1),
(627, 2, 1),
(628, 2, 1),
(629, 2, 1),
(630, 2, 1),
(631, 2, 1),
(632, 2, 1),
(633, 2, 1),
(634, 2, 1),
(635, 2, 1),
(636, 2, 1),
(637, 2, 1),
(638, 2, 1),
(639, 2, 1),
(640, 2, 1),
(641, 2, 1),
(642, 2, 1),
(643, 2, 1),
(644, 2, 1),
(645, 2, 1),
(646, 2, 1),
(647, 2, 1),
(648, 2, 1),
(649, 2, 1),
(650, 2, 1),
(651, 2, 1),
(652, 2, 1),
(653, 2, 1),
(654, 2, 1),
(655, 2, 1),
(656, 2, 1),
(657, 2, 1),
(658, 2, 1),
(659, 2, 1),
(660, 2, 1),
(661, 2, 1),
(662, 2, 1),
(663, 2, 1),
(664, 2, 1),
(665, 2, 1),
(666, 2, 1),
(667, 2, 1),
(668, 2, 1),
(669, 2, 1),
(670, 2, 1),
(671, 2, 1),
(672, 2, 1),
(673, 2, 1),
(674, 2, 1),
(675, 2, 1),
(676, 2, 1),
(677, 2, 1),
(678, 2, 1),
(679, 2, 1),
(680, 2, 1),
(681, 2, 1),
(682, 2, 1),
(683, 2, 1),
(684, 2, 1),
(685, 2, 1),
(686, 2, 1),
(687, 2, 1),
(688, 2, 1),
(689, 2, 1),
(690, 2, 1),
(691, 2, 1),
(692, 2, 1),
(693, 2, 1),
(694, 2, 1),
(695, 2, 1),
(696, 2, 1),
(697, 2, 1),
(698, 2, 1),
(699, 2, 1),
(700, 2, 1),
(701, 2, 1),
(702, 2, 1),
(703, 2, 1),
(704, 2, 1),
(705, 2, 1),
(706, 2, 1),
(707, 2, 1),
(708, 2, 1),
(709, 2, 1),
(710, 2, 1),
(711, 2, 1),
(712, 2, 1),
(713, 2, 1),
(714, 2, 1),
(715, 2, 1),
(716, 2, 1),
(717, 2, 1),
(718, 2, 1),
(719, 2, 1),
(720, 2, 1),
(721, 2, 1),
(722, 2, 1),
(723, 2, 1),
(724, 2, 1),
(725, 2, 1),
(726, 2, 1),
(727, 2, 1),
(728, 2, 1),
(729, 2, 1),
(730, 2, 1),
(731, 2, 1),
(732, 2, 1),
(733, 2, 1),
(734, 2, 1),
(735, 2, 1),
(736, 2, 1),
(737, 2, 1),
(738, 2, 1),
(739, 2, 1),
(740, 2, 1),
(741, 2, 1),
(742, 2, 1),
(743, 2, 1),
(744, 2, 1),
(745, 2, 1),
(746, 2, 1),
(747, 2, 1),
(759, 2, 1),
(760, 2, 1),
(761, 2, 1),
(762, 2, 1),
(763, 2, 1),
(764, 2, 1),
(765, 2, 1),
(766, 2, 1),
(767, 2, 1),
(768, 2, 1),
(769, 2, 1),
(770, 2, 1),
(771, 2, 1),
(772, 2, 1),
(773, 2, 1),
(774, 2, 1),
(775, 2, 1),
(776, 2, 1),
(777, 2, 1),
(778, 2, 1),
(779, 2, 1),
(780, 2, 1),
(781, 2, 1),
(782, 2, 1),
(783, 2, 1),
(784, 2, 1),
(785, 2, 1),
(786, 2, 1),
(787, 2, 1),
(788, 2, 1),
(789, 2, 1),
(790, 2, 1),
(791, 2, 1),
(792, 2, 1),
(793, 2, 1),
(794, 2, 1),
(795, 2, 1),
(796, 2, 1),
(797, 2, 1),
(798, 2, 1),
(799, 2, 1),
(800, 2, 1),
(801, 2, 1),
(802, 2, 1),
(803, 2, 1),
(804, 2, 1),
(805, 2, 1),
(806, 2, 1),
(807, 2, 1),
(808, 2, 1),
(809, 2, 1),
(810, 2, 1),
(811, 2, 1),
(812, 2, 1),
(813, 2, 1),
(814, 2, 1),
(815, 2, 1),
(816, 2, 1),
(817, 2, 1),
(818, 2, 1),
(819, 2, 1),
(820, 2, 1),
(821, 2, 1),
(822, 2, 1),
(823, 2, 1),
(824, 2, 1),
(825, 2, 1),
(826, 2, 1),
(827, 2, 1),
(828, 2, 1),
(829, 2, 1),
(830, 2, 1),
(831, 2, 1),
(832, 2, 1),
(833, 2, 1),
(834, 2, 1),
(835, 2, 1),
(836, 2, 1),
(837, 2, 1),
(838, 2, 1),
(839, 2, 1),
(840, 2, 1),
(841, 2, 1),
(842, 2, 1),
(843, 2, 1),
(844, 2, 1),
(845, 2, 1),
(846, 2, 1),
(847, 2, 1),
(848, 2, 1),
(849, 2, 1),
(850, 2, 1),
(851, 2, 1),
(852, 2, 1),
(853, 2, 1),
(854, 2, 1),
(855, 2, 1),
(856, 2, 1),
(857, 2, 1),
(858, 2, 1),
(859, 2, 1),
(860, 2, 1),
(861, 2, 1),
(862, 2, 1),
(863, 2, 1),
(864, 2, 1),
(865, 2, 1),
(866, 2, 1),
(867, 2, 1),
(868, 2, 1),
(869, 2, 1),
(870, 2, 1),
(871, 2, 1),
(872, 2, 1),
(873, 2, 1),
(874, 2, 1),
(875, 2, 1),
(876, 2, 1),
(877, 2, 1),
(878, 2, 1),
(879, 2, 1),
(880, 2, 1),
(881, 2, 1),
(882, 2, 1),
(883, 2, 1),
(884, 2, 1),
(885, 2, 1),
(886, 2, 1),
(887, 2, 1),
(888, 2, 1),
(889, 2, 1),
(890, 2, 1),
(891, 2, 1),
(892, 2, 1),
(893, 2, 1),
(894, 2, 1),
(895, 2, 1),
(896, 2, 1),
(897, 2, 1),
(898, 2, 1),
(899, 2, 1),
(900, 2, 1),
(901, 2, 1),
(902, 2, 1),
(903, 2, 1),
(904, 2, 1),
(905, 2, 1),
(906, 2, 1),
(907, 2, 1),
(908, 2, 1),
(909, 2, 1),
(910, 2, 1),
(911, 2, 1),
(912, 2, 1),
(913, 2, 1),
(914, 2, 1),
(915, 2, 1),
(916, 2, 1),
(917, 2, 1),
(918, 2, 1),
(919, 2, 1),
(920, 2, 1),
(921, 2, 1),
(922, 2, 1),
(923, 2, 1),
(924, 2, 1),
(925, 2, 1),
(926, 2, 1),
(927, 2, 1),
(928, 2, 1),
(929, 2, 1),
(930, 2, 1),
(931, 2, 1),
(932, 2, 1),
(933, 2, 1),
(934, 2, 1),
(935, 2, 1),
(936, 2, 1),
(937, 2, 1),
(938, 2, 1),
(939, 2, 1),
(940, 2, 1),
(941, 2, 1),
(942, 2, 1),
(943, 2, 1),
(944, 2, 1),
(945, 2, 1),
(946, 2, 1),
(947, 2, 1),
(948, 2, 1),
(949, 2, 1),
(950, 2, 1),
(951, 2, 1),
(952, 2, 1),
(953, 2, 1),
(954, 2, 1),
(955, 2, 1),
(956, 2, 1),
(957, 2, 1),
(958, 2, 1),
(959, 2, 1),
(960, 2, 1),
(961, 2, 1),
(962, 2, 1),
(963, 2, 1),
(964, 2, 1),
(965, 2, 1),
(966, 2, 1),
(967, 2, 1),
(968, 2, 1),
(969, 2, 1),
(970, 2, 1),
(971, 2, 1),
(972, 2, 1),
(973, 2, 1),
(974, 2, 1),
(975, 2, 1),
(976, 2, 1),
(977, 2, 1),
(978, 2, 1),
(979, 2, 1),
(980, 2, 1),
(981, 2, 1),
(982, 2, 1),
(983, 2, 1),
(984, 2, 1),
(985, 2, 1),
(986, 2, 1),
(987, 2, 1),
(988, 2, 1),
(989, 2, 1),
(990, 2, 1),
(991, 2, 1),
(992, 2, 1),
(993, 2, 1),
(994, 2, 1),
(995, 2, 1),
(996, 2, 1),
(997, 2, 1),
(998, 2, 1),
(999, 2, 1),
(1000, 2, 1),
(1001, 2, 1),
(1002, 2, 1),
(1003, 2, 1),
(1004, 2, 1),
(1005, 2, 1),
(1006, 2, 1),
(1007, 2, 1),
(1008, 2, 1),
(1009, 2, 1),
(1010, 2, 1),
(1011, 2, 1),
(1012, 2, 1),
(1013, 2, 1),
(1014, 2, 1),
(1015, 2, 1),
(1016, 2, 1),
(1017, 2, 1),
(1018, 2, 1),
(1019, 2, 1),
(1020, 2, 1),
(1021, 2, 1),
(1022, 2, 1),
(1023, 2, 1),
(1024, 2, 1),
(1025, 2, 1),
(1026, 2, 1),
(1027, 2, 1),
(1028, 5, 1),
(1029, 5, 1),
(1030, 5, 1),
(1031, 5, 1),
(1032, 5, 1),
(1033, 5, 1),
(1034, 5, 1),
(1035, 5, 1),
(1036, 5, 1),
(1037, 5, 1),
(1038, 5, 1),
(1039, 5, 1),
(1040, 5, 1),
(1041, 5, 1),
(1042, 5, 1),
(1043, 5, 1),
(1044, 5, 1),
(1045, 5, 1),
(1046, 5, 1),
(1047, 5, 1),
(1048, 5, 1),
(1049, 5, 1),
(1050, 5, 1),
(1051, 5, 1),
(1052, 5, 1),
(1053, 5, 1),
(1054, 5, 1),
(1055, 5, 1),
(1056, 5, 1),
(1057, 5, 1),
(1058, 5, 1),
(1059, 5, 1),
(1060, 5, 1),
(1061, 5, 1),
(1062, 5, 1),
(1063, 5, 1),
(1064, 5, 1),
(1065, 5, 1),
(1066, 5, 1),
(1067, 5, 1),
(1068, 5, 1),
(1069, 5, 1),
(1070, 5, 1),
(1071, 5, 1),
(1072, 5, 1),
(1073, 5, 1),
(1074, 5, 1),
(1075, 5, 1),
(1076, 5, 1),
(1077, 5, 1),
(1078, 5, 1),
(1079, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation_waitlist_requests`
--

CREATE TABLE `reservation_waitlist_requests` (
  `reservation_waitlist_request_id` mediumint(8) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resources`
--

CREATE TABLE `resources` (
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(85) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `min_duration` int(11) DEFAULT NULL,
  `min_increment` int(11) DEFAULT NULL,
  `max_duration` int(11) DEFAULT NULL,
  `unit_cost` decimal(7,2) DEFAULT NULL,
  `autoassign` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `requires_approval` tinyint(1) UNSIGNED NOT NULL,
  `allow_multiday_reservations` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `max_participants` mediumint(8) UNSIGNED DEFAULT NULL,
  `min_notice_time_add` int(11) DEFAULT NULL,
  `max_notice_time` int(11) DEFAULT NULL,
  `image_name` varchar(50) DEFAULT NULL,
  `schedule_id` smallint(5) UNSIGNED NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `admin_group_id` smallint(5) UNSIGNED DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` smallint(5) UNSIGNED DEFAULT NULL,
  `resource_type_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `status_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `resource_status_reason_id` smallint(5) UNSIGNED DEFAULT NULL,
  `buffer_time` int(10) UNSIGNED DEFAULT NULL,
  `enable_check_in` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `auto_release_minutes` smallint(5) UNSIGNED DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `allow_display` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `credit_count` decimal(7,2) UNSIGNED DEFAULT NULL,
  `peak_credit_count` decimal(7,2) UNSIGNED DEFAULT NULL,
  `min_notice_time_update` int(11) DEFAULT NULL,
  `min_notice_time_delete` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `resources`
--

INSERT INTO `resources` (`resource_id`, `name`, `location`, `contact_info`, `description`, `notes`, `min_duration`, `min_increment`, `max_duration`, `unit_cost`, `autoassign`, `requires_approval`, `allow_multiday_reservations`, `max_participants`, `min_notice_time_add`, `max_notice_time`, `image_name`, `schedule_id`, `legacyid`, `admin_group_id`, `public_id`, `allow_calendar_subscription`, `sort_order`, `resource_type_id`, `status_id`, `resource_status_reason_id`, `buffer_time`, `enable_check_in`, `auto_release_minutes`, `color`, `allow_display`, `credit_count`, `peak_credit_count`, `min_notice_time_update`, `min_notice_time_delete`, `date_created`, `last_modified`) VALUES
(1, 'Laboratorio 02', 'UNICAH, SCJ, Edificio F', 'Administrador de Laboratorios (2222-2222) ext 222', 'Laboratorios de la Facultad de Ciencias de la computación donde se llevan todo tipo de clases principalmente, cualquier petición en especifico será¡ manejada por Don Elin en el Laboratorio 03.', 'Equipo especial se solicita a Don Elin en el cubículo trasero del Laboratorio 03.', 3600, NULL, 14400, NULL, 1, 1, 0, 40, NULL, NULL, 'resource11584318421.jpg', 1, NULL, 3, NULL, 0, 0, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, NULL, '2020-04-08 06:26:52'),
(2, 'Audiovisual 1A', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource21584313792.jpg', 2, NULL, 1, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, NULL, '2020-04-07 00:04:10'),
(3, 'Salón Maya', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Salones administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Conferencias, Torneos, Ferias etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, NULL, NULL, 1, 1, 1, 250, NULL, NULL, 'resource31584313913.jpg', 3, NULL, 1, NULL, 0, 0, 3, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 08:32:43', '2020-03-16 00:31:55'),
(5, 'Aula Magna', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Salones administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Conferencias, Torneos, Ferias etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, NULL, NULL, 1, 1, 1, 500, NULL, NULL, 'resource51584313882.jpg', 3, NULL, 1, NULL, 0, 0, 3, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:01:01', '2020-03-15 23:19:42'),
(6, 'Audiovisual 1B', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource61584313815.jpg', 2, NULL, 1, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:01:33', '2020-03-15 23:19:36'),
(7, 'Audiovisual 2', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource71584313826.jpg', 2, NULL, 1, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:01:41', '2020-03-15 23:19:37'),
(8, 'Audiovisual 4', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource81584313865.jpg', 2, NULL, 1, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:01:46', '2020-03-15 23:19:41'),
(9, 'Audiovisual 3A', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource91584313837.jpg', 2, NULL, 1, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:01:52', '2020-03-15 23:19:38'),
(10, 'Audiovisual 3B', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource101584313846.jpg', 2, NULL, 1, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:01:57', '2020-03-15 23:19:40'),
(11, 'Externo 1', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource111584313893.jpg', 2, NULL, NULL, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:02:25', '2020-03-15 23:19:44'),
(12, 'Externo 2', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource121584313900.jpg', 2, NULL, NULL, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:02:32', '2020-03-15 23:19:47'),
(13, 'Laboratorio 03', 'UNICAH, SCJ, Edificio F', 'Administrador de Laboratorios (2222-2222) ext 222', 'Laboratorios de la Facultad de Ciencias de la computación donde se llevan todo tipo de clases principalmente, cualquier petición en especifico será¡ manejada por Don Elin en el Laboratorio 03.', 'Equipo especial se solicita a Don Elin en el cubículo trasero del Laboratorio 03.', 3600, NULL, 14400, NULL, 1, 1, 0, 40, NULL, NULL, 'resource131584318464.jpg', 1, NULL, 3, NULL, 0, 0, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:48:29', '2020-04-07 00:06:58'),
(14, 'Laboratorio 04', 'UNICAH, SCJ, Edificio F', 'Administrador de Laboratorios (2222-2222) ext 222', 'Laboratorios de la Facultad de Ciencias de la computación donde se llevan todo tipo de clases principalmente, cualquier petición en especifico será¡ manejada por Don Elin en el Laboratorio 03.', 'Equipo especial se solicita a Don Elin en el cubículo trasero del Laboratorio 03.', 3600, NULL, 14400, NULL, 1, 1, 0, 40, NULL, NULL, 'resource141584318475.jpg', 1, NULL, 3, NULL, 0, 0, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:48:38', '2020-04-07 00:07:24'),
(15, 'Laboratorio 05', 'UNICAH, SCJ, Edificio F', 'Administrador de Laboratorios (2222-2222) ext 222', 'Laboratorios de la Facultad de Ciencias de la computación \n donde se llevan todo tipo de clases principalmente, cualquier petición en especifico será¡ manejada por Don Elin en el Laboratorio 03.', 'Equipo especial se solicita a Don Elin en el cubículo trasero del Laboratorio 03.', 3600, NULL, 14400, NULL, 1, 1, 0, 40, NULL, NULL, 'resource151584318643.jpg', 1, NULL, 3, NULL, 0, 0, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:48:43', '2020-04-07 00:07:53'),
(16, 'Laboratorio 06', 'UNICAH, SCJ, Edificio F', 'Administrador de Laboratorios (2222-2222) ext 222', 'Laboratorios de la Facultad de Ciencias de la computación donde se llevan todo tipo de clases principalmente, cualquier petición en especifico será¡ manejada por Don Elin en el Laboratorio 03.', 'Equipo especial se solicita a Don Elin en el cubículo trasero del Laboratorio 03', 3600, NULL, 14400, NULL, 1, 1, 0, 40, NULL, NULL, 'resource161584318664.jpg', 1, NULL, 3, NULL, 0, 0, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:48:46', '2020-04-07 00:09:08'),
(17, 'Laboratorio 07', 'UNICAH, SCJ, Edificio F', 'Administrador de Laboratorios (2222-2222) ext 222', 'Laboratorios de la Facultad de Ciencias de la computación donde se llevan todo tipo de clases principalmente, cualquier petición en especifico será¡ manejada por Don Elin en el Laboratorio 03', 'Equipo especial se solicita a Don Elin en el cubículo trasero del Laboratorio 03', 3600, NULL, 14400, NULL, 1, 1, 0, 40, NULL, NULL, 'resource171584318678.jpg', 1, NULL, 3, NULL, 0, 0, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:48:50', '2020-04-07 00:09:04'),
(18, 'Laboratorio MAC', 'UNICAH, SCJ, Edificio F', 'Administrador de Laboratorios (2222-2222) ext 222', 'Laboratorios de la Facultad de Ciencias de la computación donde se llevan todo tipo de clases principalmente, cualquier petición en especifico será¡ manejada por Don Elin en el Laboratorio 03', 'Equipo especial se solicita a Don Elin en el cubículo trasero del Laboratorio 03.', 3600, NULL, 14400, NULL, 1, 1, 0, 40, NULL, NULL, 'resource181584318691.jpg', 1, NULL, 3, NULL, 0, 0, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:48:56', '2020-04-07 00:08:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resource_accessories`
--

CREATE TABLE `resource_accessories` (
  `resource_accessory_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `accessory_id` smallint(5) UNSIGNED NOT NULL,
  `minimum_quantity` smallint(6) DEFAULT NULL,
  `maximum_quantity` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `resource_accessories`
--

INSERT INTO `resource_accessories` (`resource_accessory_id`, `resource_id`, `accessory_id`, `minimum_quantity`, `maximum_quantity`) VALUES
(10, 1, 5, NULL, NULL),
(11, 13, 5, NULL, NULL),
(12, 14, 5, NULL, NULL),
(13, 15, 5, NULL, NULL),
(14, 16, 5, NULL, NULL),
(15, 17, 5, NULL, NULL),
(16, 18, 5, NULL, NULL),
(17, 1, 1, NULL, NULL),
(18, 13, 1, NULL, NULL),
(19, 14, 1, NULL, NULL),
(20, 15, 1, NULL, NULL),
(21, 16, 1, NULL, NULL),
(22, 17, 1, NULL, NULL),
(23, 18, 1, NULL, NULL),
(24, 1, 4, NULL, NULL),
(25, 13, 4, NULL, NULL),
(26, 14, 4, NULL, NULL),
(27, 15, 4, NULL, NULL),
(28, 16, 4, NULL, NULL),
(29, 17, 4, NULL, NULL),
(30, 18, 4, NULL, NULL),
(31, 1, 3, NULL, NULL),
(32, 13, 3, NULL, NULL),
(33, 14, 3, NULL, NULL),
(34, 15, 3, NULL, NULL),
(35, 16, 3, NULL, NULL),
(36, 17, 3, NULL, NULL),
(37, 18, 3, NULL, NULL),
(46, 2, 6, NULL, NULL),
(47, 6, 6, NULL, NULL),
(48, 7, 6, NULL, NULL),
(49, 9, 6, NULL, NULL),
(50, 10, 6, NULL, NULL),
(51, 8, 6, NULL, NULL),
(52, 5, 6, NULL, NULL),
(53, 11, 6, NULL, NULL),
(54, 12, 6, NULL, NULL),
(55, 3, 6, NULL, NULL),
(56, 2, 11, NULL, NULL),
(57, 6, 11, NULL, NULL),
(58, 7, 11, NULL, NULL),
(59, 9, 11, NULL, NULL),
(60, 10, 11, NULL, NULL),
(61, 8, 11, NULL, NULL),
(62, 5, 11, NULL, NULL),
(63, 11, 11, NULL, NULL),
(64, 12, 11, NULL, NULL),
(65, 3, 11, NULL, NULL),
(66, 2, 8, NULL, NULL),
(67, 6, 8, NULL, NULL),
(68, 7, 8, NULL, NULL),
(69, 9, 8, NULL, NULL),
(70, 10, 8, NULL, NULL),
(71, 8, 8, NULL, NULL),
(72, 5, 8, NULL, NULL),
(73, 11, 8, NULL, NULL),
(74, 12, 8, NULL, NULL),
(75, 3, 8, NULL, NULL),
(76, 2, 14, NULL, NULL),
(77, 6, 14, NULL, NULL),
(78, 7, 14, NULL, NULL),
(79, 9, 14, NULL, NULL),
(80, 10, 14, NULL, NULL),
(81, 8, 14, NULL, NULL),
(82, 5, 14, NULL, NULL),
(83, 11, 14, NULL, NULL),
(84, 12, 14, NULL, NULL),
(85, 3, 14, NULL, NULL),
(86, 2, 7, NULL, NULL),
(87, 6, 7, NULL, NULL),
(88, 7, 7, NULL, NULL),
(89, 9, 7, NULL, NULL),
(90, 10, 7, NULL, NULL),
(91, 8, 7, NULL, NULL),
(92, 5, 7, NULL, NULL),
(93, 11, 7, NULL, NULL),
(94, 12, 7, NULL, NULL),
(95, 3, 7, NULL, NULL),
(96, 2, 12, NULL, NULL),
(97, 6, 12, NULL, NULL),
(98, 7, 12, NULL, NULL),
(99, 9, 12, NULL, NULL),
(100, 10, 12, NULL, NULL),
(101, 8, 12, NULL, NULL),
(102, 5, 12, NULL, NULL),
(103, 11, 12, NULL, NULL),
(104, 12, 12, NULL, NULL),
(105, 3, 12, NULL, NULL),
(106, 2, 13, NULL, NULL),
(107, 6, 13, NULL, NULL),
(108, 7, 13, NULL, NULL),
(109, 9, 13, NULL, NULL),
(110, 10, 13, NULL, NULL),
(111, 8, 13, NULL, NULL),
(112, 5, 13, NULL, NULL),
(113, 11, 13, NULL, NULL),
(114, 12, 13, NULL, NULL),
(115, 3, 13, NULL, NULL),
(116, 2, 9, NULL, NULL),
(117, 6, 9, NULL, NULL),
(118, 7, 9, NULL, NULL),
(119, 9, 9, NULL, NULL),
(120, 10, 9, NULL, NULL),
(121, 8, 9, NULL, NULL),
(122, 5, 9, NULL, NULL),
(123, 11, 9, NULL, NULL),
(124, 12, 9, NULL, NULL),
(125, 3, 9, NULL, NULL),
(126, 2, 10, NULL, NULL),
(127, 6, 10, NULL, NULL),
(128, 7, 10, NULL, NULL),
(129, 9, 10, NULL, NULL),
(130, 10, 10, NULL, NULL),
(131, 8, 10, NULL, NULL),
(132, 5, 10, NULL, NULL),
(133, 11, 10, NULL, NULL),
(134, 12, 10, NULL, NULL),
(135, 3, 10, NULL, NULL),
(143, 1, 2, NULL, NULL),
(144, 13, 2, NULL, NULL),
(145, 14, 2, NULL, NULL),
(146, 15, 2, NULL, NULL),
(147, 16, 2, NULL, NULL),
(148, 17, 2, NULL, NULL),
(149, 18, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resource_groups`
--

CREATE TABLE `resource_groups` (
  `resource_group_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_group_name` varchar(75) DEFAULT NULL,
  `parent_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resource_group_assignment`
--

CREATE TABLE `resource_group_assignment` (
  `resource_group_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resource_images`
--

CREATE TABLE `resource_images` (
  `resource_image_id` smallint(5) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `image_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `resource_images`
--

INSERT INTO `resource_images` (`resource_image_id`, `resource_id`, `image_name`) VALUES
(14, 10, 'resource101584313849.jpg'),
(15, 8, 'resource81584313870.jpg'),
(28, 2, 'resource21584313798.jpg'),
(32, 14, 'resource141584318478.jpg'),
(34, 15, 'resource151584318648.jpg'),
(37, 17, 'resource171584318681.jpg'),
(38, 16, 'resource161584318668.jpg'),
(39, 1, 'resource11584318424.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resource_status_reasons`
--

CREATE TABLE `resource_status_reasons` (
  `resource_status_reason_id` smallint(5) UNSIGNED NOT NULL,
  `status_id` tinyint(3) UNSIGNED NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resource_types`
--

CREATE TABLE `resource_types` (
  `resource_type_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_type_name` varchar(75) DEFAULT NULL,
  `resource_type_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `resource_types`
--

INSERT INTO `resource_types` (`resource_type_id`, `resource_type_name`, `resource_type_description`) VALUES
(1, 'Audiovisuales', 'Aulas Audiovisuales de la Biblioteca'),
(2, 'Laboratorios', 'Laboratorios ICC'),
(3, 'Salones', 'Salones para conferencias de la Biblioteca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resource_type_assignment`
--

CREATE TABLE `resource_type_assignment` (
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `resource_type_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `role_id` tinyint(2) UNSIGNED NOT NULL,
  `name` varchar(85) DEFAULT NULL,
  `role_level` tinyint(2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`role_id`, `name`, `role_level`) VALUES
(1, 'Group Admin', 1),
(2, 'Application Admin', 2),
(3, 'Resource Admin', 3),
(4, 'Schedule Admin', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saved_reports`
--

CREATE TABLE `saved_reports` (
  `saved_report_id` mediumint(8) UNSIGNED NOT NULL,
  `report_name` varchar(50) DEFAULT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `report_details` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedules`
--

CREATE TABLE `schedules` (
  `schedule_id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(85) NOT NULL,
  `isdefault` tinyint(1) UNSIGNED NOT NULL,
  `weekdaystart` tinyint(2) UNSIGNED NOT NULL,
  `daysvisible` tinyint(2) UNSIGNED NOT NULL DEFAULT 7,
  `layout_id` mediumint(8) UNSIGNED NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT 0,
  `admin_group_id` smallint(5) UNSIGNED DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `allow_concurrent_bookings` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `default_layout` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `schedules`
--

INSERT INTO `schedules` (`schedule_id`, `name`, `isdefault`, `weekdaystart`, `daysvisible`, `layout_id`, `legacyid`, `public_id`, `allow_calendar_subscription`, `admin_group_id`, `start_date`, `end_date`, `allow_concurrent_bookings`, `default_layout`) VALUES
(1, 'Laboratorios ICC', 1, 100, 1, 3, NULL, NULL, 0, 3, NULL, NULL, 0, 0),
(2, 'Audivisuales Biblioteca', 0, 100, 1, 2, NULL, NULL, 0, 1, NULL, NULL, 0, 0),
(3, 'Salones Biblioteca', 0, 100, 1, 4, NULL, NULL, 0, 1, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `terms_of_service`
--

CREATE TABLE `terms_of_service` (
  `terms_of_service_id` int(10) UNSIGNED NOT NULL,
  `terms_text` text DEFAULT NULL,
  `terms_url` varchar(255) DEFAULT NULL,
  `terms_file` varchar(50) DEFAULT NULL,
  `applicability` varchar(50) DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `time_blocks`
--

CREATE TABLE `time_blocks` (
  `block_id` mediumint(8) UNSIGNED NOT NULL,
  `label` varchar(85) DEFAULT NULL,
  `end_label` varchar(85) DEFAULT NULL,
  `availability_code` tinyint(2) UNSIGNED NOT NULL,
  `layout_id` mediumint(8) UNSIGNED NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `day_of_week` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `time_blocks`
--

INSERT INTO `time_blocks` (`block_id`, `label`, `end_label`, `availability_code`, `layout_id`, `start_time`, `end_time`, `day_of_week`) VALUES
(1, NULL, NULL, 2, 1, '00:00:00', '08:00:00', NULL),
(2, NULL, NULL, 1, 1, '08:00:00', '08:30:00', NULL),
(3, NULL, NULL, 1, 1, '08:30:00', '09:00:00', NULL),
(4, NULL, NULL, 1, 1, '09:00:00', '09:30:00', NULL),
(5, NULL, NULL, 1, 1, '09:30:00', '10:00:00', NULL),
(6, NULL, NULL, 1, 1, '10:00:00', '10:30:00', NULL),
(7, NULL, NULL, 1, 1, '10:30:00', '11:00:00', NULL),
(8, NULL, NULL, 1, 1, '11:00:00', '11:30:00', NULL),
(9, NULL, NULL, 1, 1, '11:30:00', '12:00:00', NULL),
(10, NULL, NULL, 1, 1, '12:00:00', '12:30:00', NULL),
(11, NULL, NULL, 1, 1, '12:30:00', '13:00:00', NULL),
(12, NULL, NULL, 1, 1, '13:00:00', '13:30:00', NULL),
(13, NULL, NULL, 1, 1, '13:30:00', '14:00:00', NULL),
(14, NULL, NULL, 1, 1, '14:00:00', '14:30:00', NULL),
(15, NULL, NULL, 1, 1, '14:30:00', '15:00:00', NULL),
(16, NULL, NULL, 1, 1, '15:00:00', '15:30:00', NULL),
(17, NULL, NULL, 1, 1, '15:30:00', '16:00:00', NULL),
(18, NULL, NULL, 1, 1, '16:00:00', '16:30:00', NULL),
(19, NULL, NULL, 1, 1, '16:30:00', '17:00:00', NULL),
(20, NULL, NULL, 1, 1, '17:00:00', '17:30:00', NULL),
(21, NULL, NULL, 1, 1, '17:30:00', '18:00:00', NULL),
(22, NULL, NULL, 2, 1, '18:00:00', '00:00:00', NULL),
(23, NULL, NULL, 2, 2, '00:00:00', '07:00:00', NULL),
(24, NULL, NULL, 1, 2, '07:00:00', '08:00:00', NULL),
(25, NULL, NULL, 1, 2, '08:00:00', '09:00:00', NULL),
(26, NULL, NULL, 1, 2, '09:00:00', '10:00:00', NULL),
(27, NULL, NULL, 1, 2, '10:00:00', '11:00:00', NULL),
(28, NULL, NULL, 1, 2, '11:00:00', '12:00:00', NULL),
(29, NULL, NULL, 1, 2, '12:00:00', '13:00:00', NULL),
(30, NULL, NULL, 1, 2, '13:00:00', '14:00:00', NULL),
(31, NULL, NULL, 1, 2, '14:00:00', '15:00:00', NULL),
(32, NULL, NULL, 1, 2, '15:00:00', '16:00:00', NULL),
(33, NULL, NULL, 1, 2, '16:00:00', '17:00:00', NULL),
(34, NULL, NULL, 1, 2, '17:00:00', '18:00:00', NULL),
(35, NULL, NULL, 1, 2, '18:00:00', '19:00:00', NULL),
(36, NULL, NULL, 1, 2, '19:00:00', '20:00:00', NULL),
(37, NULL, NULL, 1, 2, '20:00:00', '21:00:00', NULL),
(38, NULL, NULL, 2, 2, '21:00:00', '00:00:00', NULL),
(39, NULL, NULL, 2, 3, '00:00:00', '07:00:00', NULL),
(40, NULL, NULL, 1, 3, '07:00:00', '08:00:00', NULL),
(41, NULL, NULL, 1, 3, '08:00:00', '09:00:00', NULL),
(42, NULL, NULL, 1, 3, '09:00:00', '10:00:00', NULL),
(43, NULL, NULL, 1, 3, '10:00:00', '11:00:00', NULL),
(44, NULL, NULL, 1, 3, '11:00:00', '12:00:00', NULL),
(45, NULL, NULL, 1, 3, '12:00:00', '13:00:00', NULL),
(46, NULL, NULL, 1, 3, '13:00:00', '14:00:00', NULL),
(47, NULL, NULL, 1, 3, '14:00:00', '15:00:00', NULL),
(48, NULL, NULL, 1, 3, '15:00:00', '16:00:00', NULL),
(49, NULL, NULL, 1, 3, '16:00:00', '17:00:00', NULL),
(50, NULL, NULL, 1, 3, '17:00:00', '18:00:00', NULL),
(51, NULL, NULL, 1, 3, '18:00:00', '19:00:00', NULL),
(52, NULL, NULL, 1, 3, '19:00:00', '20:00:00', NULL),
(53, NULL, NULL, 1, 3, '20:00:00', '21:00:00', NULL),
(54, NULL, NULL, 2, 3, '21:00:00', '00:00:00', NULL),
(55, NULL, NULL, 2, 4, '00:00:00', '07:00:00', NULL),
(56, NULL, NULL, 1, 4, '07:00:00', '08:00:00', NULL),
(57, NULL, NULL, 1, 4, '08:00:00', '09:00:00', NULL),
(58, NULL, NULL, 1, 4, '09:00:00', '10:00:00', NULL),
(59, NULL, NULL, 1, 4, '10:00:00', '11:00:00', NULL),
(60, NULL, NULL, 1, 4, '11:00:00', '12:00:00', NULL),
(61, NULL, NULL, 1, 4, '12:00:00', '13:00:00', NULL),
(62, NULL, NULL, 1, 4, '13:00:00', '14:00:00', NULL),
(63, NULL, NULL, 1, 4, '14:00:00', '15:00:00', NULL),
(64, NULL, NULL, 1, 4, '15:00:00', '16:00:00', NULL),
(65, NULL, NULL, 1, 4, '16:00:00', '17:00:00', NULL),
(66, NULL, NULL, 1, 4, '17:00:00', '18:00:00', NULL),
(67, NULL, NULL, 1, 4, '18:00:00', '19:00:00', NULL),
(68, NULL, NULL, 1, 4, '19:00:00', '20:00:00', NULL),
(69, NULL, NULL, 1, 4, '20:00:00', '21:00:00', NULL),
(70, NULL, NULL, 2, 4, '21:00:00', '00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `fname` varchar(85) DEFAULT NULL,
  `lname` varchar(85) DEFAULT NULL,
  `username` varchar(85) DEFAULT NULL,
  `email` varchar(85) NOT NULL,
  `password` varchar(85) NOT NULL,
  `salt` varchar(85) NOT NULL,
  `organization` varchar(85) DEFAULT NULL,
  `position` varchar(85) DEFAULT NULL,
  `phone` varchar(85) DEFAULT NULL,
  `timezone` varchar(85) NOT NULL,
  `language` varchar(10) NOT NULL,
  `homepageid` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `lastlogin` datetime DEFAULT NULL,
  `status_id` tinyint(2) UNSIGNED NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `legacypassword` varchar(32) DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT 0,
  `default_schedule_id` smallint(5) UNSIGNED DEFAULT NULL,
  `credit_count` decimal(7,2) DEFAULT 0.00,
  `terms_date_accepted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `fname`, `lname`, `username`, `email`, `password`, `salt`, `organization`, `position`, `phone`, `timezone`, `language`, `homepageid`, `date_created`, `last_modified`, `lastlogin`, `status_id`, `legacyid`, `legacypassword`, `public_id`, `allow_calendar_subscription`, `default_schedule_id`, `credit_count`, `terms_date_accepted`) VALUES
(2, 'Administrador', 'de la Plataforma', 'Administrador', 'admin@unicah.edu', '70f3e748c6801656e4aae9dca6ee98ab137d952c', '4a04db87', 'UNICAH, Sagrado CorazÃ³n de JesÃºs', 'Administrador', '', 'America/Tegucigalpa', 'es', 1, '2020-03-15 02:14:37', '2020-04-08 12:47:16', '2020-04-08 06:47:16', 1, NULL, NULL, '04ac259fe50ae509f153', 0, 1, '0.00', NULL),
(3, 'Administrador', 'de los Laboratorios', 'Laboratorios', 'labadmin@unicah.edu', 'f79eb2165bb5d1b9791da16c61a1a66e0ab88d80', '418858e9', 'UNICAH, Sagrado CorazÃ³n de JesÃºs', 'Administrador', '', 'America/Tegucigalpa', 'es', 2, '2020-03-15 21:11:19', '2020-04-08 12:26:19', '2020-04-08 06:23:42', 1, NULL, NULL, 'b03ca00928428e270bac', 0, 1, '0.00', NULL),
(4, 'Administrador', 'de la Biblioteca', 'Biblioteca', 'biblioadmin@unicah.edu', 'c76c10da4579b1142e1d45b30b12de8c9459d410', '1a36a8bd', 'UNICAH, Sagrado CorazÃ³n de JesÃºs', 'Administrador', '', 'America/Tegucigalpa', 'es', 2, '2020-03-15 21:12:36', '2020-04-08 12:50:40', '2020-03-24 02:48:48', 1, NULL, NULL, '7518c467cd92babfcad3', 0, 2, '0.00', NULL),
(5, 'Docente', 'UNICAH', 'Docentes', 'docente@unicah.edu', '213dabbeb3ef6a562464be9f89fade7be285ad7d', '30f84c72', 'UNICAH, Sagrado CorazÃ³n de JesÃºs', 'Docente', '', 'America/Tegucigalpa', 'es', 2, '2020-03-15 21:13:30', '2020-04-08 12:19:00', '2020-04-08 06:19:00', 1, NULL, NULL, '9cf902a4b87f131f6178', 0, NULL, '0.00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_email_preferences`
--

CREATE TABLE `user_email_preferences` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `event_category` varchar(45) NOT NULL,
  `event_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_groups`
--

CREATE TABLE `user_groups` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `group_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_groups`
--

INSERT INTO `user_groups` (`user_id`, `group_id`) VALUES
(4, 1),
(2, 2),
(3, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_preferences`
--

CREATE TABLE `user_preferences` (
  `user_preferences_id` int(10) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_preferences`
--

INSERT INTO `user_preferences` (`user_preferences_id`, `user_id`, `name`, `value`) VALUES
(146, 5, 'CalendarFilter', '1|1|'),
(147, 3, 'CalendarFilter', '||'),
(148, 2, 'CalendarFilter', '||'),
(149, 2, 'FilterStartDateDelta', '-8'),
(150, 2, 'FilterEndDateDelta', '6'),
(151, 2, 'FilterUserId', ''),
(152, 2, 'FilterUserName', ''),
(153, 2, 'FilterScheduleId', '0'),
(154, 2, 'FilterResourceId', '0'),
(155, 2, 'FilterReservationStatusId', '0'),
(156, 2, 'FilterReferenceNumber', NULL),
(157, 2, 'FilterResourceStatusId', ''),
(158, 2, 'FilterResourceReasonId', ''),
(159, 2, 'FilterCustomAttributes', 'a:2:{i:1;s:13:\"Jorge Salgado\";i:2;s:0:\"\";}'),
(160, 2, 'FilterTitle', ''),
(161, 2, 'FilterDescription', ''),
(162, 2, 'FilterMissedCheckin', '0'),
(163, 2, 'FilterMissedCheckout', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_resource_permissions`
--

CREATE TABLE `user_resource_permissions` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `permission_id` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `permission_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_resource_permissions`
--

INSERT INTO `user_resource_permissions` (`user_id`, `resource_id`, `permission_id`, `permission_type`) VALUES
(2, 1, 1, 0),
(2, 2, 1, 0),
(2, 3, 1, 0),
(2, 5, 1, 0),
(2, 6, 1, 0),
(2, 7, 1, 0),
(2, 8, 1, 0),
(2, 9, 1, 0),
(2, 10, 1, 0),
(2, 11, 1, 0),
(2, 12, 1, 0),
(2, 13, 1, 0),
(2, 14, 1, 0),
(2, 15, 1, 0),
(2, 16, 1, 0),
(2, 17, 1, 0),
(2, 18, 1, 0),
(3, 1, 1, 0),
(3, 13, 1, 0),
(3, 14, 1, 0),
(3, 15, 1, 0),
(3, 16, 1, 0),
(3, 17, 1, 0),
(3, 18, 1, 0),
(4, 2, 1, 0),
(4, 3, 1, 0),
(4, 5, 1, 0),
(4, 6, 1, 0),
(4, 7, 1, 0),
(4, 8, 1, 0),
(4, 9, 1, 0),
(4, 10, 1, 0),
(4, 11, 1, 0),
(4, 12, 1, 0),
(5, 1, 1, 0),
(5, 2, 1, 0),
(5, 3, 1, 0),
(5, 5, 1, 0),
(5, 6, 1, 0),
(5, 7, 1, 0),
(5, 8, 1, 0),
(5, 9, 1, 0),
(5, 10, 1, 0),
(5, 11, 1, 0),
(5, 12, 1, 0),
(5, 13, 1, 0),
(5, 14, 1, 0),
(5, 15, 1, 0),
(5, 16, 1, 0),
(5, 17, 1, 0),
(5, 18, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_session`
--

CREATE TABLE `user_session` (
  `user_session_id` mediumint(8) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `last_modified` datetime NOT NULL,
  `session_token` varchar(50) NOT NULL,
  `user_session_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_statuses`
--

CREATE TABLE `user_statuses` (
  `status_id` tinyint(2) UNSIGNED NOT NULL,
  `description` varchar(85) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_statuses`
--

INSERT INTO `user_statuses` (`status_id`, `description`) VALUES
(1, 'Active'),
(2, 'Awaiting'),
(3, 'Inactive');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`accessory_id`);

--
-- Indices de la tabla `account_activation`
--
ALTER TABLE `account_activation`
  ADD PRIMARY KEY (`account_activation_id`),
  ADD UNIQUE KEY `activation_code_2` (`activation_code`),
  ADD KEY `activation_code` (`activation_code`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcementid`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `display_page` (`display_page`);

--
-- Indices de la tabla `announcement_groups`
--
ALTER TABLE `announcement_groups`
  ADD PRIMARY KEY (`announcementid`,`group_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indices de la tabla `announcement_resources`
--
ALTER TABLE `announcement_resources`
  ADD PRIMARY KEY (`announcementid`,`resource_id`),
  ADD KEY `resource_id` (`resource_id`);

--
-- Indices de la tabla `blackout_instances`
--
ALTER TABLE `blackout_instances`
  ADD PRIMARY KEY (`blackout_instance_id`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `blackout_series_id` (`blackout_series_id`);

--
-- Indices de la tabla `blackout_series`
--
ALTER TABLE `blackout_series`
  ADD PRIMARY KEY (`blackout_series_id`);

--
-- Indices de la tabla `blackout_series_resources`
--
ALTER TABLE `blackout_series_resources`
  ADD PRIMARY KEY (`blackout_series_id`,`resource_id`),
  ADD KEY `resource_id` (`resource_id`);

--
-- Indices de la tabla `credit_log`
--
ALTER TABLE `credit_log`
  ADD PRIMARY KEY (`credit_log_id`);

--
-- Indices de la tabla `custom_attributes`
--
ALTER TABLE `custom_attributes`
  ADD PRIMARY KEY (`custom_attribute_id`),
  ADD KEY `attribute_category` (`attribute_category`),
  ADD KEY `display_label` (`display_label`);

--
-- Indices de la tabla `custom_attribute_entities`
--
ALTER TABLE `custom_attribute_entities`
  ADD PRIMARY KEY (`custom_attribute_id`,`entity_id`);

--
-- Indices de la tabla `custom_attribute_values`
--
ALTER TABLE `custom_attribute_values`
  ADD PRIMARY KEY (`custom_attribute_value_id`),
  ADD KEY `custom_attribute_id` (`custom_attribute_id`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `attribute_category` (`attribute_category`);

--
-- Indices de la tabla `custom_time_blocks`
--
ALTER TABLE `custom_time_blocks`
  ADD PRIMARY KEY (`custom_time_block_id`),
  ADD KEY `layout_id` (`layout_id`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `admin_group_id` (`admin_group_id`),
  ADD KEY `isdefault` (`isdefault`);

--
-- Indices de la tabla `group_resource_permissions`
--
ALTER TABLE `group_resource_permissions`
  ADD PRIMARY KEY (`group_id`,`resource_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `group_id_2` (`group_id`),
  ADD KEY `resource_id_2` (`resource_id`);

--
-- Indices de la tabla `group_roles`
--
ALTER TABLE `group_roles`
  ADD PRIMARY KEY (`group_id`,`role_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indices de la tabla `layouts`
--
ALTER TABLE `layouts`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indices de la tabla `payment_configuration`
--
ALTER TABLE `payment_configuration`
  ADD PRIMARY KEY (`payment_configuration_id`);

--
-- Indices de la tabla `payment_gateway_settings`
--
ALTER TABLE `payment_gateway_settings`
  ADD PRIMARY KEY (`gateway_type`,`setting_name`);

--
-- Indices de la tabla `payment_transaction_log`
--
ALTER TABLE `payment_transaction_log`
  ADD PRIMARY KEY (`payment_transaction_log_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `invoice_number` (`invoice_number`);

--
-- Indices de la tabla `peak_times`
--
ALTER TABLE `peak_times`
  ADD PRIMARY KEY (`peak_times_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indices de la tabla `quotas`
--
ALTER TABLE `quotas`
  ADD PRIMARY KEY (`quota_id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indices de la tabla `refund_transaction_log`
--
ALTER TABLE `refund_transaction_log`
  ADD PRIMARY KEY (`refund_transaction_log_id`),
  ADD KEY `payment_transaction_log_id` (`payment_transaction_log_id`);

--
-- Indices de la tabla `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`reminder_id`),
  ADD KEY `reminders_user_id` (`user_id`);

--
-- Indices de la tabla `reservation_accessories`
--
ALTER TABLE `reservation_accessories`
  ADD PRIMARY KEY (`series_id`,`accessory_id`),
  ADD KEY `accessory_id` (`accessory_id`),
  ADD KEY `series_id` (`series_id`);

--
-- Indices de la tabla `reservation_color_rules`
--
ALTER TABLE `reservation_color_rules`
  ADD PRIMARY KEY (`reservation_color_rule_id`),
  ADD KEY `custom_attribute_id` (`custom_attribute_id`);

--
-- Indices de la tabla `reservation_files`
--
ALTER TABLE `reservation_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `series_id` (`series_id`);

--
-- Indices de la tabla `reservation_guests`
--
ALTER TABLE `reservation_guests`
  ADD PRIMARY KEY (`reservation_instance_id`,`email`),
  ADD KEY `reservation_guests_reservation_instance_id` (`reservation_instance_id`),
  ADD KEY `reservation_guests_email_address` (`email`),
  ADD KEY `reservation_guests_reservation_user_level` (`reservation_user_level`);

--
-- Indices de la tabla `reservation_instances`
--
ALTER TABLE `reservation_instances`
  ADD PRIMARY KEY (`reservation_instance_id`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `reference_number` (`reference_number`),
  ADD KEY `series_id` (`series_id`),
  ADD KEY `checkin_date` (`checkin_date`);

--
-- Indices de la tabla `reservation_reminders`
--
ALTER TABLE `reservation_reminders`
  ADD PRIMARY KEY (`reminder_id`),
  ADD KEY `series_id` (`series_id`),
  ADD KEY `reminder_type` (`reminder_type`);

--
-- Indices de la tabla `reservation_resources`
--
ALTER TABLE `reservation_resources`
  ADD PRIMARY KEY (`series_id`,`resource_id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `series_id` (`series_id`);

--
-- Indices de la tabla `reservation_series`
--
ALTER TABLE `reservation_series`
  ADD PRIMARY KEY (`series_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `reservations_owner` (`owner_id`);

--
-- Indices de la tabla `reservation_statuses`
--
ALTER TABLE `reservation_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indices de la tabla `reservation_types`
--
ALTER TABLE `reservation_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indices de la tabla `reservation_users`
--
ALTER TABLE `reservation_users`
  ADD PRIMARY KEY (`reservation_instance_id`,`user_id`),
  ADD KEY `reservation_instance_id` (`reservation_instance_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `reservation_user_level` (`reservation_user_level`);

--
-- Indices de la tabla `reservation_waitlist_requests`
--
ALTER TABLE `reservation_waitlist_requests`
  ADD PRIMARY KEY (`reservation_waitlist_request_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `resource_id` (`resource_id`);

--
-- Indices de la tabla `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`resource_id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `admin_group_id` (`admin_group_id`),
  ADD KEY `resource_type_id` (`resource_type_id`),
  ADD KEY `resource_status_reason_id` (`resource_status_reason_id`),
  ADD KEY `auto_release_minutes` (`auto_release_minutes`);

--
-- Indices de la tabla `resource_accessories`
--
ALTER TABLE `resource_accessories`
  ADD PRIMARY KEY (`resource_accessory_id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `accessory_id` (`accessory_id`);

--
-- Indices de la tabla `resource_groups`
--
ALTER TABLE `resource_groups`
  ADD PRIMARY KEY (`resource_group_id`),
  ADD KEY `resource_groups_parent_id` (`parent_id`);

--
-- Indices de la tabla `resource_group_assignment`
--
ALTER TABLE `resource_group_assignment`
  ADD PRIMARY KEY (`resource_group_id`,`resource_id`),
  ADD KEY `resource_group_assignment_resource_id` (`resource_id`),
  ADD KEY `resource_group_assignment_resource_group_id` (`resource_group_id`);

--
-- Indices de la tabla `resource_images`
--
ALTER TABLE `resource_images`
  ADD PRIMARY KEY (`resource_image_id`),
  ADD KEY `resource_id` (`resource_id`);

--
-- Indices de la tabla `resource_status_reasons`
--
ALTER TABLE `resource_status_reasons`
  ADD PRIMARY KEY (`resource_status_reason_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indices de la tabla `resource_types`
--
ALTER TABLE `resource_types`
  ADD PRIMARY KEY (`resource_type_id`);

--
-- Indices de la tabla `resource_type_assignment`
--
ALTER TABLE `resource_type_assignment`
  ADD PRIMARY KEY (`resource_id`,`resource_type_id`),
  ADD KEY `resource_type_id` (`resource_type_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indices de la tabla `saved_reports`
--
ALTER TABLE `saved_reports`
  ADD PRIMARY KEY (`saved_report_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD KEY `layout_id` (`layout_id`),
  ADD KEY `schedules_groups_admin_group_id` (`admin_group_id`);

--
-- Indices de la tabla `terms_of_service`
--
ALTER TABLE `terms_of_service`
  ADD PRIMARY KEY (`terms_of_service_id`);

--
-- Indices de la tabla `time_blocks`
--
ALTER TABLE `time_blocks`
  ADD PRIMARY KEY (`block_id`),
  ADD KEY `layout_id` (`layout_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indices de la tabla `user_email_preferences`
--
ALTER TABLE `user_email_preferences`
  ADD PRIMARY KEY (`user_id`,`event_category`,`event_type`);

--
-- Indices de la tabla `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`group_id`,`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indices de la tabla `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`user_preferences_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `user_resource_permissions`
--
ALTER TABLE `user_resource_permissions`
  ADD PRIMARY KEY (`user_id`,`resource_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `user_id_2` (`user_id`),
  ADD KEY `resource_id_2` (`resource_id`);

--
-- Indices de la tabla `user_session`
--
ALTER TABLE `user_session`
  ADD PRIMARY KEY (`user_session_id`),
  ADD KEY `user_session_user_id` (`user_id`),
  ADD KEY `user_session_session_token` (`session_token`);

--
-- Indices de la tabla `user_statuses`
--
ALTER TABLE `user_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accessories`
--
ALTER TABLE `accessories`
  MODIFY `accessory_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `account_activation`
--
ALTER TABLE `account_activation`
  MODIFY `account_activation_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcementid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `blackout_instances`
--
ALTER TABLE `blackout_instances`
  MODIFY `blackout_instance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `blackout_series`
--
ALTER TABLE `blackout_series`
  MODIFY `blackout_series_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `credit_log`
--
ALTER TABLE `credit_log`
  MODIFY `credit_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `custom_attributes`
--
ALTER TABLE `custom_attributes`
  MODIFY `custom_attribute_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `custom_attribute_values`
--
ALTER TABLE `custom_attribute_values`
  MODIFY `custom_attribute_value_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT de la tabla `custom_time_blocks`
--
ALTER TABLE `custom_time_blocks`
  MODIFY `custom_time_block_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `layouts`
--
ALTER TABLE `layouts`
  MODIFY `layout_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `payment_configuration`
--
ALTER TABLE `payment_configuration`
  MODIFY `payment_configuration_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `payment_transaction_log`
--
ALTER TABLE `payment_transaction_log`
  MODIFY `payment_transaction_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `peak_times`
--
ALTER TABLE `peak_times`
  MODIFY `peak_times_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `quotas`
--
ALTER TABLE `quotas`
  MODIFY `quota_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `refund_transaction_log`
--
ALTER TABLE `refund_transaction_log`
  MODIFY `refund_transaction_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reminders`
--
ALTER TABLE `reminders`
  MODIFY `reminder_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservation_color_rules`
--
ALTER TABLE `reservation_color_rules`
  MODIFY `reservation_color_rule_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservation_files`
--
ALTER TABLE `reservation_files`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservation_instances`
--
ALTER TABLE `reservation_instances`
  MODIFY `reservation_instance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1080;

--
-- AUTO_INCREMENT de la tabla `reservation_reminders`
--
ALTER TABLE `reservation_reminders`
  MODIFY `reminder_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservation_series`
--
ALTER TABLE `reservation_series`
  MODIFY `series_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `reservation_waitlist_requests`
--
ALTER TABLE `reservation_waitlist_requests`
  MODIFY `reservation_waitlist_request_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resources`
--
ALTER TABLE `resources`
  MODIFY `resource_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `resource_accessories`
--
ALTER TABLE `resource_accessories`
  MODIFY `resource_accessory_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT de la tabla `resource_groups`
--
ALTER TABLE `resource_groups`
  MODIFY `resource_group_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resource_images`
--
ALTER TABLE `resource_images`
  MODIFY `resource_image_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `resource_status_reasons`
--
ALTER TABLE `resource_status_reasons`
  MODIFY `resource_status_reason_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resource_types`
--
ALTER TABLE `resource_types`
  MODIFY `resource_type_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `saved_reports`
--
ALTER TABLE `saved_reports`
  MODIFY `saved_report_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `terms_of_service`
--
ALTER TABLE `terms_of_service`
  MODIFY `terms_of_service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `time_blocks`
--
ALTER TABLE `time_blocks`
  MODIFY `block_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `user_preferences_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT de la tabla `user_session`
--
ALTER TABLE `user_session`
  MODIFY `user_session_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `account_activation`
--
ALTER TABLE `account_activation`
  ADD CONSTRAINT `account_activation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `announcement_groups`
--
ALTER TABLE `announcement_groups`
  ADD CONSTRAINT `announcement_groups_ibfk_1` FOREIGN KEY (`announcementid`) REFERENCES `announcements` (`announcementid`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcement_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `announcement_resources`
--
ALTER TABLE `announcement_resources`
  ADD CONSTRAINT `announcement_resources_ibfk_1` FOREIGN KEY (`announcementid`) REFERENCES `announcements` (`announcementid`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcement_resources_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `blackout_instances`
--
ALTER TABLE `blackout_instances`
  ADD CONSTRAINT `blackout_instances_ibfk_1` FOREIGN KEY (`blackout_series_id`) REFERENCES `blackout_series` (`blackout_series_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `blackout_series_resources`
--
ALTER TABLE `blackout_series_resources`
  ADD CONSTRAINT `blackout_series_resources_ibfk_1` FOREIGN KEY (`blackout_series_id`) REFERENCES `blackout_series` (`blackout_series_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blackout_series_resources_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `custom_attribute_entities`
--
ALTER TABLE `custom_attribute_entities`
  ADD CONSTRAINT `custom_attribute_entities_ibfk_1` FOREIGN KEY (`custom_attribute_id`) REFERENCES `custom_attributes` (`custom_attribute_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `custom_time_blocks`
--
ALTER TABLE `custom_time_blocks`
  ADD CONSTRAINT `custom_time_blocks_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`layout_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`);

--
-- Filtros para la tabla `group_resource_permissions`
--
ALTER TABLE `group_resource_permissions`
  ADD CONSTRAINT `group_resource_permissions_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `group_resource_permissions_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `group_roles`
--
ALTER TABLE `group_roles`
  ADD CONSTRAINT `group_roles_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `group_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `peak_times`
--
ALTER TABLE `peak_times`
  ADD CONSTRAINT `peak_times_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `quotas`
--
ALTER TABLE `quotas`
  ADD CONSTRAINT `quotas_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quotas_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quotas_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `refund_transaction_log`
--
ALTER TABLE `refund_transaction_log`
  ADD CONSTRAINT `refund_transaction_log_ibfk_1` FOREIGN KEY (`payment_transaction_log_id`) REFERENCES `payment_transaction_log` (`payment_transaction_log_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reminders`
--
ALTER TABLE `reminders`
  ADD CONSTRAINT `reminders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reservation_accessories`
--
ALTER TABLE `reservation_accessories`
  ADD CONSTRAINT `reservation_accessories_ibfk_1` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`accessory_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_accessories_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservation_color_rules`
--
ALTER TABLE `reservation_color_rules`
  ADD CONSTRAINT `reservation_color_rules_ibfk_1` FOREIGN KEY (`custom_attribute_id`) REFERENCES `custom_attributes` (`custom_attribute_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reservation_files`
--
ALTER TABLE `reservation_files`
  ADD CONSTRAINT `reservation_files_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reservation_guests`
--
ALTER TABLE `reservation_guests`
  ADD CONSTRAINT `reservation_guests_ibfk_1` FOREIGN KEY (`reservation_instance_id`) REFERENCES `reservation_instances` (`reservation_instance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservation_instances`
--
ALTER TABLE `reservation_instances`
  ADD CONSTRAINT `reservations_series` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reservation_reminders`
--
ALTER TABLE `reservation_reminders`
  ADD CONSTRAINT `reservation_reminders_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reservation_resources`
--
ALTER TABLE `reservation_resources`
  ADD CONSTRAINT `reservation_resources_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_resources_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservation_series`
--
ALTER TABLE `reservation_series`
  ADD CONSTRAINT `reservations_owner` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservations_status` FOREIGN KEY (`status_id`) REFERENCES `reservation_statuses` (`status_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_type` FOREIGN KEY (`type_id`) REFERENCES `reservation_types` (`type_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservation_users`
--
ALTER TABLE `reservation_users`
  ADD CONSTRAINT `reservation_users_ibfk_1` FOREIGN KEY (`reservation_instance_id`) REFERENCES `reservation_instances` (`reservation_instance_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservation_waitlist_requests`
--
ALTER TABLE `reservation_waitlist_requests`
  ADD CONSTRAINT `reservation_waitlist_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_waitlist_requests_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `resources`
--
ALTER TABLE `resources`
  ADD CONSTRAINT `admin_group_id` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resources_ibfk_2` FOREIGN KEY (`resource_type_id`) REFERENCES `resource_types` (`resource_type_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `resources_ibfk_3` FOREIGN KEY (`resource_status_reason_id`) REFERENCES `resource_status_reasons` (`resource_status_reason_id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `resource_accessories`
--
ALTER TABLE `resource_accessories`
  ADD CONSTRAINT `resource_accessories_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resource_accessories_ibfk_2` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`accessory_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `resource_groups`
--
ALTER TABLE `resource_groups`
  ADD CONSTRAINT `resource_groups_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `resource_groups` (`resource_group_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `resource_group_assignment`
--
ALTER TABLE `resource_group_assignment`
  ADD CONSTRAINT `resource_group_assignment_ibfk_1` FOREIGN KEY (`resource_group_id`) REFERENCES `resource_groups` (`resource_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resource_group_assignment_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `resource_images`
--
ALTER TABLE `resource_images`
  ADD CONSTRAINT `resource_images_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `resource_type_assignment`
--
ALTER TABLE `resource_type_assignment`
  ADD CONSTRAINT `resource_type_assignment_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resource_type_assignment_ibfk_2` FOREIGN KEY (`resource_type_id`) REFERENCES `resource_types` (`resource_type_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `saved_reports`
--
ALTER TABLE `saved_reports`
  ADD CONSTRAINT `saved_reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_groups_admin_group_id` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`layout_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `time_blocks`
--
ALTER TABLE `time_blocks`
  ADD CONSTRAINT `time_blocks_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`layout_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `user_statuses` (`status_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_email_preferences`
--
ALTER TABLE `user_email_preferences`
  ADD CONSTRAINT `user_email_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_groups`
--
ALTER TABLE `user_groups`
  ADD CONSTRAINT `user_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD CONSTRAINT `user_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_resource_permissions`
--
ALTER TABLE `user_resource_permissions`
  ADD CONSTRAINT `user_resource_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_resource_permissions_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_session`
--
ALTER TABLE `user_session`
  ADD CONSTRAINT `user_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
