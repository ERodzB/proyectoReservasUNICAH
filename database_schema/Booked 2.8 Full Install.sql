-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-03-2020 a las 01:34:26
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
(2, 'Adapatador VGA a HDMI', 3, NULL),
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blackout_series_resources`
--

CREATE TABLE `blackout_series_resources` (
  `blackout_series_id` int(10) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'Responsable', 1, 1, '', 1, NULL, 0, 0, NULL, '', 0),
(2, 'Contacto', 1, 1, '', 0, NULL, 1, 0, NULL, '', 0);

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
(2.1, '2020-03-16 00:17:27'),
(2.2, '2020-03-16 00:17:27'),
(2.3, '2020-03-16 00:17:27'),
(2.4, '2020-03-16 00:17:27'),
(2.5, '2020-03-16 00:17:27'),
(2.6, '2020-03-16 00:17:27'),
(2.7, '2020-03-16 00:17:27');

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
(1, 'Laboratorio 02', 'UNICAH, SCJ, Edificio F', 'Administrador de Laboratorios (2222-2222) ext 222', 'Laboratorios de la Facultad de Ciencias de la computación donde se llevan todo tipo de clases principalmente, cualquier petición en especifico será manejada por Don Elin en el Laboratorio 03.', 'Equipo especial se solicita a Don Elin en el cubículo trasero del Laboratorio 03.', 3600, NULL, 14400, NULL, 1, 1, 0, 40, NULL, NULL, 'resource11584318421.jpg', 1, NULL, 3, NULL, 0, 0, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, NULL, '2020-03-16 00:27:04'),
(2, 'Audiovisual 1A', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource21584313792.jpg', 2, NULL, 1, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, NULL, '2020-03-15 23:19:34'),
(3, 'Salón Maya', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Salones administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Conferencias, Torneos, Ferias etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, NULL, NULL, 1, 1, 1, 250, NULL, NULL, 'resource31584313913.jpg', 3, NULL, 1, NULL, 0, 0, 3, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 08:32:43', '2020-03-16 00:31:55'),
(5, 'Aula Magna', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Salones administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Conferencias, Torneos, Ferias etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, NULL, NULL, 1, 1, 1, 500, NULL, NULL, 'resource51584313882.jpg', 3, NULL, 1, NULL, 0, 0, 3, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:01:01', '2020-03-15 23:19:42'),
(6, 'Audiovisual 1B', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource61584313815.jpg', 2, NULL, 1, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:01:33', '2020-03-15 23:19:36'),
(7, 'Audiovisual 2', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource71584313826.jpg', 2, NULL, 1, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:01:41', '2020-03-15 23:19:37'),
(8, 'Audiovisual 4', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource81584313865.jpg', 2, NULL, 1, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:01:46', '2020-03-15 23:19:41'),
(9, 'Audiovisual 3A', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource91584313837.jpg', 2, NULL, 1, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:01:52', '2020-03-15 23:19:38'),
(10, 'Audiovisual 3B', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource101584313846.jpg', 2, NULL, 1, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:01:57', '2020-03-15 23:19:40'),
(11, 'Externo 1', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource111584313893.jpg', 2, NULL, NULL, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:02:25', '2020-03-15 23:19:44'),
(12, 'Externo 2', 'UNICAH, SCJ, Biblioteca', 'Administradores de Biblioteca (3333-3333) ext 333', 'Audiovisuales administrados por la Biblioteca donde se pueden llevar acabo distintas actividades como por ejemple Debates, Presentaciones etc.', 'Se solicita por medio del formato de Registro de Calidad PS-H02.', 3600, NULL, 14400, NULL, 1, 1, 0, 100, NULL, NULL, 'resource121584313900.jpg', 2, NULL, NULL, NULL, 0, 0, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:02:32', '2020-03-15 23:19:47'),
(13, 'Laboratorio 03', 'UNICAH, SCJ, Edificio F', 'Administrador de Laboratorios (2222-2222) ext 222', 'Laboratorios de la Facultad de Ciencias de la computación donde se llevan todo tipo de clases principalmente, cualquier petición en especifico será manejada por Don Elin en el Laboratorio 03.', 'Equipo especial se solicita a Don Elin en el cubículo trasero del Laboratorio 03.', 3600, NULL, 14400, NULL, 1, 1, 0, 40, NULL, NULL, 'resource131584318464.jpg', 1, NULL, 3, NULL, 0, 0, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:48:29', '2020-03-16 00:27:46'),
(14, 'Laboratorio 04', 'UNICAH, SCJ, Edificio F', 'Administrador de Laboratorios (2222-2222) ext 222', 'Laboratorios de la Facultad de Ciencias de la computación donde se llevan todo tipo de clases principalmente, cualquier petición en especifico será manejada por Don Elin en el Laboratorio 03.', 'Equipo especial se solicita a Don Elin en el cubículo trasero del Laboratorio 03.', 3600, NULL, 14400, NULL, 1, 1, 0, 40, NULL, NULL, 'resource141584318475.jpg', 1, NULL, 3, NULL, 0, 0, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:48:38', '2020-03-16 00:27:58'),
(15, 'Laboratorio 05', 'UNICAH, SCJ, Edificio F', 'Administrador de Laboratorios (2222-2222) ext 222', 'Laboratorios de la Facultad de Ciencias de la computación donde se llevan todo tipo de clases principalmente, cualquier petición en especifico será manejada por Don Elin en el Laboratorio 03.', 'Equipo especial se solicita a Don Elin en el cubículo trasero del Laboratorio 03.', 3600, NULL, 14400, NULL, 1, 1, 0, 40, NULL, NULL, 'resource151584318643.jpg', 1, NULL, 3, NULL, 0, 0, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:48:43', '2020-03-16 00:30:49'),
(16, 'Laboratorio 06', 'UNICAH, SCJ, Edificio F', 'Administrador de Laboratorios (2222-2222) ext 222', 'Laboratorios de la Facultad de Ciencias de la computación donde se llevan todo tipo de clases principalmente, cualquier petición en especifico será manejada por Don Elin en el Laboratorio 03.', 'Equipo especial se solicita a Don Elin en el cubículo trasero del Laboratorio 03.', 3600, NULL, 14400, NULL, 1, 1, 0, 40, NULL, NULL, 'resource161584318664.jpg', 1, NULL, 3, NULL, 0, 0, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:48:46', '2020-03-16 00:31:08'),
(17, 'Laboratorio 07', 'UNICAH, SCJ, Edificio F', 'Administrador de Laboratorios (2222-2222) ext 222', 'Laboratorios de la Facultad de Ciencias de la computación donde se llevan todo tipo de clases principalmente, cualquier petición en especifico será manejada por Don Elin en el Laboratorio 03.', 'Equipo especial se solicita a Don Elin en el cubículo trasero del Laboratorio 03.', 3600, NULL, 14400, NULL, 1, 1, 0, 40, NULL, NULL, 'resource171584318678.jpg', 1, NULL, 3, NULL, 0, 0, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:48:50', '2020-03-16 00:31:21'),
(18, 'Laboratorio MAC', 'UNICAH, SCJ, Edificio F', 'Administrador de Laboratorios (2222-2222) ext 222', 'Laboratorios de la Facultad de Ciencias de la computación donde se llevan todo tipo de clases principalmente, cualquier petición en especifico será manejada por Don Elin en el Laboratorio 03.', 'Equipo especial se solicita a Don Elin en el cubículo trasero del Laboratorio 03.', 3600, NULL, 14400, NULL, 1, 1, 0, 40, NULL, NULL, 'resource181584318691.jpg', 1, NULL, 3, NULL, 0, 0, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-15 21:48:56', '2020-03-16 00:31:31');

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
(1, 1, 2, NULL, NULL),
(2, 13, 2, NULL, NULL),
(3, 14, 2, NULL, NULL),
(4, 15, 2, NULL, NULL),
(5, 16, 2, NULL, NULL),
(6, 17, 2, NULL, NULL),
(7, 18, 2, NULL, NULL),
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
(135, 3, 10, NULL, NULL);

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
(13, 2, 'resource21584313798.jpg'),
(14, 10, 'resource101584313849.jpg'),
(15, 8, 'resource81584313870.jpg'),
(21, 1, 'resource11584318424.jpg'),
(23, 14, 'resource141584318478.jpg'),
(24, 15, 'resource151584318648.jpg'),
(25, 16, 'resource161584318668.jpg'),
(26, 17, 'resource171584318681.jpg');

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
(2, 'Administrador', 'de la Plataforma', 'Administrador', 'admin@unicah.edu', '70f3e748c6801656e4aae9dca6ee98ab137d952c', '4a04db87', 'UNICAH, Sagrado CorazÃ³n de JesÃºs', 'Administrador', '', 'America/Tegucigalpa', 'es', 1, '2020-03-15 02:14:37', '2020-03-16 06:32:03', '2020-03-16 00:32:03', 1, NULL, NULL, '04ac259fe50ae509f153', 0, 1, '0.00', NULL),
(3, 'Administrador', 'de los Laboratorios', 'Laboratorios', 'labadmin@unicah.edu', 'f79eb2165bb5d1b9791da16c61a1a66e0ab88d80', '418858e9', 'UNICAH, Sagrado CorazÃ³n de JesÃºs', 'Administrador', '', 'America/Tegucigalpa', 'es', 2, '2020-03-15 21:11:19', '2020-03-16 06:32:41', '2020-03-16 00:32:41', 1, NULL, NULL, 'b03ca00928428e270bac', 0, 1, '0.00', NULL),
(4, 'Administrador', 'de la Biblioteca', 'Biblioteca', 'biblioadmin@unicah.edu', 'c76c10da4579b1142e1d45b30b12de8c9459d410', '1a36a8bd', 'UNICAH, Sagrado CorazÃ³n de JesÃºs', 'Administrador', '', 'America/Tegucigalpa', 'es', 2, '2020-03-15 21:12:36', '2020-03-16 06:32:29', '2020-03-16 00:32:29', 1, NULL, NULL, '7518c467cd92babfcad3', 0, 2, '0.00', NULL),
(5, 'Docente', 'UNICAH', 'Docentes', 'docente@unicah.edu', '213dabbeb3ef6a562464be9f89fade7be285ad7d', '30f84c72', 'UNICAH, Sagrado CorazÃ³n de JesÃºs', 'Docente', '', 'America/Tegucigalpa', 'es', 2, '2020-03-15 21:13:30', '2020-03-16 10:51:41', '2020-03-15 22:51:41', 1, NULL, NULL, '9cf902a4b87f131f6178', 0, NULL, '0.00', NULL);

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
  MODIFY `announcementid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `blackout_instances`
--
ALTER TABLE `blackout_instances`
  MODIFY `blackout_instance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `blackout_series`
--
ALTER TABLE `blackout_series`
  MODIFY `blackout_series_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `custom_attribute_value_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `reservation_instance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservation_reminders`
--
ALTER TABLE `reservation_reminders`
  MODIFY `reminder_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservation_series`
--
ALTER TABLE `reservation_series`
  MODIFY `series_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `resource_accessory_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de la tabla `resource_groups`
--
ALTER TABLE `resource_groups`
  MODIFY `resource_group_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resource_images`
--
ALTER TABLE `resource_images`
  MODIFY `resource_image_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `user_preferences_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
