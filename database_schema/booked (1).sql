-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2020 a las 17:55:15
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
(1, 'VGA to HDMI', 3, NULL),
(2, 'Parlantes USB', 2, NULL),
(3, 'HDMI to HDMI', NULL, NULL),
(4, 'VGA to VGA', NULL, NULL);

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
(1, 'Prueba de Anuncios en la Aplicacion en el Dashboard', 10, '2020-03-02 06:00:00', '2020-03-16 06:00:00', 1),
(2, 'Prueba de Anuncio en Login', 10, '2020-03-02 06:00:00', '2020-03-16 06:00:00', 5);

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

--
-- Volcado de datos para la tabla `blackout_instances`
--

INSERT INTO `blackout_instances` (`blackout_instance_id`, `start_date`, `end_date`, `blackout_series_id`) VALUES
(367, '2020-03-09 13:00:00', '2020-03-10 03:00:00', 2),
(368, '2020-03-10 13:00:00', '2020-03-11 03:00:00', 2),
(369, '2020-03-11 13:00:00', '2020-03-12 03:00:00', 2),
(370, '2020-03-12 13:00:00', '2020-03-13 03:00:00', 2),
(371, '2020-03-13 13:00:00', '2020-03-14 03:00:00', 2),
(372, '2020-03-14 13:00:00', '2020-03-15 03:00:00', 2),
(373, '2020-03-15 13:00:00', '2020-03-16 03:00:00', 2),
(374, '2020-03-16 13:00:00', '2020-03-17 03:00:00', 2),
(375, '2020-03-17 13:00:00', '2020-03-18 03:00:00', 2),
(376, '2020-03-18 13:00:00', '2020-03-19 03:00:00', 2),
(377, '2020-03-19 13:00:00', '2020-03-20 03:00:00', 2),
(378, '2020-03-20 13:00:00', '2020-03-21 03:00:00', 2),
(379, '2020-03-21 13:00:00', '2020-03-22 03:00:00', 2),
(380, '2020-03-22 13:00:00', '2020-03-23 03:00:00', 2),
(381, '2020-03-23 13:00:00', '2020-03-24 03:00:00', 2),
(382, '2020-03-24 13:00:00', '2020-03-25 03:00:00', 2),
(383, '2020-03-25 13:00:00', '2020-03-26 03:00:00', 2),
(384, '2020-03-26 13:00:00', '2020-03-27 03:00:00', 2),
(385, '2020-03-27 13:00:00', '2020-03-28 03:00:00', 2),
(386, '2020-03-28 13:00:00', '2020-03-29 03:00:00', 2),
(387, '2020-03-29 13:00:00', '2020-03-30 03:00:00', 2),
(388, '2020-03-30 13:00:00', '2020-03-31 03:00:00', 2),
(389, '2020-03-31 13:00:00', '2020-04-01 03:00:00', 2),
(390, '2020-04-01 13:00:00', '2020-04-02 03:00:00', 2),
(391, '2020-04-02 13:00:00', '2020-04-03 03:00:00', 2),
(392, '2020-04-03 13:00:00', '2020-04-04 03:00:00', 2),
(393, '2020-04-04 13:00:00', '2020-04-05 03:00:00', 2),
(394, '2020-04-05 13:00:00', '2020-04-06 03:00:00', 2),
(395, '2020-04-06 13:00:00', '2020-04-07 03:00:00', 2),
(396, '2020-04-07 13:00:00', '2020-04-08 03:00:00', 2),
(397, '2020-04-08 13:00:00', '2020-04-09 03:00:00', 2),
(398, '2020-04-09 13:00:00', '2020-04-10 03:00:00', 2),
(399, '2020-04-10 13:00:00', '2020-04-11 03:00:00', 2),
(400, '2020-04-11 13:00:00', '2020-04-12 03:00:00', 2),
(401, '2020-04-12 13:00:00', '2020-04-13 03:00:00', 2),
(402, '2020-04-13 13:00:00', '2020-04-14 03:00:00', 2),
(403, '2020-04-14 13:00:00', '2020-04-15 03:00:00', 2),
(404, '2020-04-15 13:00:00', '2020-04-16 03:00:00', 2),
(405, '2020-04-16 13:00:00', '2020-04-17 03:00:00', 2),
(406, '2020-04-17 13:00:00', '2020-04-18 03:00:00', 2),
(407, '2020-04-18 13:00:00', '2020-04-19 03:00:00', 2),
(408, '2020-04-19 13:00:00', '2020-04-20 03:00:00', 2),
(409, '2020-04-20 13:00:00', '2020-04-21 03:00:00', 2),
(410, '2020-04-21 13:00:00', '2020-04-22 03:00:00', 2),
(411, '2020-04-22 13:00:00', '2020-04-23 03:00:00', 2),
(412, '2020-04-23 13:00:00', '2020-04-24 03:00:00', 2),
(413, '2020-04-24 13:00:00', '2020-04-25 03:00:00', 2),
(414, '2020-04-25 13:00:00', '2020-04-26 03:00:00', 2),
(415, '2020-04-26 13:00:00', '2020-04-27 03:00:00', 2),
(416, '2020-04-27 13:00:00', '2020-04-28 03:00:00', 2),
(417, '2020-04-28 13:00:00', '2020-04-29 03:00:00', 2),
(418, '2020-04-29 13:00:00', '2020-04-30 03:00:00', 2),
(419, '2020-04-30 13:00:00', '2020-05-01 03:00:00', 2),
(420, '2020-05-01 13:00:00', '2020-05-02 03:00:00', 2),
(421, '2020-05-02 13:00:00', '2020-05-03 03:00:00', 2),
(422, '2020-05-03 13:00:00', '2020-05-04 03:00:00', 2),
(423, '2020-05-04 13:00:00', '2020-05-05 03:00:00', 2),
(424, '2020-05-05 13:00:00', '2020-05-06 03:00:00', 2),
(425, '2020-05-06 13:00:00', '2020-05-07 03:00:00', 2),
(426, '2020-05-07 13:00:00', '2020-05-08 03:00:00', 2),
(427, '2020-05-08 13:00:00', '2020-05-09 03:00:00', 2),
(428, '2020-05-09 13:00:00', '2020-05-10 03:00:00', 2),
(429, '2020-05-10 13:00:00', '2020-05-11 03:00:00', 2),
(430, '2020-05-11 13:00:00', '2020-05-12 03:00:00', 2),
(431, '2020-05-12 13:00:00', '2020-05-13 03:00:00', 2),
(432, '2020-05-13 13:00:00', '2020-05-14 03:00:00', 2),
(433, '2020-05-14 13:00:00', '2020-05-15 03:00:00', 2),
(434, '2020-05-15 13:00:00', '2020-05-16 03:00:00', 2),
(435, '2020-05-16 13:00:00', '2020-05-17 03:00:00', 2),
(436, '2020-05-17 13:00:00', '2020-05-18 03:00:00', 2),
(437, '2020-05-18 13:00:00', '2020-05-19 03:00:00', 2),
(438, '2020-05-19 13:00:00', '2020-05-20 03:00:00', 2),
(439, '2020-05-20 13:00:00', '2020-05-21 03:00:00', 2),
(440, '2020-05-21 13:00:00', '2020-05-22 03:00:00', 2),
(441, '2020-05-22 13:00:00', '2020-05-23 03:00:00', 2),
(442, '2020-05-23 13:00:00', '2020-05-24 03:00:00', 2),
(443, '2020-05-24 13:00:00', '2020-05-25 03:00:00', 2),
(444, '2020-05-25 13:00:00', '2020-05-26 03:00:00', 2),
(445, '2020-05-26 13:00:00', '2020-05-27 03:00:00', 2),
(446, '2020-05-27 13:00:00', '2020-05-28 03:00:00', 2),
(447, '2020-05-28 13:00:00', '2020-05-29 03:00:00', 2),
(448, '2020-05-29 13:00:00', '2020-05-30 03:00:00', 2),
(449, '2020-05-30 13:00:00', '2020-05-31 03:00:00', 2),
(450, '2020-05-31 13:00:00', '2020-06-01 03:00:00', 2),
(451, '2020-06-01 13:00:00', '2020-06-02 03:00:00', 2),
(452, '2020-06-02 13:00:00', '2020-06-03 03:00:00', 2),
(453, '2020-06-03 13:00:00', '2020-06-04 03:00:00', 2),
(454, '2020-06-04 13:00:00', '2020-06-05 03:00:00', 2),
(455, '2020-06-05 13:00:00', '2020-06-06 03:00:00', 2),
(456, '2020-06-06 13:00:00', '2020-06-07 03:00:00', 2),
(457, '2020-06-07 13:00:00', '2020-06-08 03:00:00', 2),
(458, '2020-06-08 13:00:00', '2020-06-09 03:00:00', 2),
(459, '2020-06-09 13:00:00', '2020-06-10 03:00:00', 2),
(460, '2020-06-10 13:00:00', '2020-06-11 03:00:00', 2),
(461, '2020-06-11 13:00:00', '2020-06-12 03:00:00', 2),
(462, '2020-06-12 13:00:00', '2020-06-13 03:00:00', 2),
(463, '2020-06-13 13:00:00', '2020-06-14 03:00:00', 2),
(464, '2020-06-14 13:00:00', '2020-06-15 03:00:00', 2),
(465, '2020-06-15 13:00:00', '2020-06-16 03:00:00', 2),
(466, '2020-06-16 13:00:00', '2020-06-17 03:00:00', 2),
(467, '2020-06-17 13:00:00', '2020-06-18 03:00:00', 2),
(468, '2020-06-18 13:00:00', '2020-06-19 03:00:00', 2),
(469, '2020-06-19 13:00:00', '2020-06-20 03:00:00', 2),
(470, '2020-06-20 13:00:00', '2020-06-21 03:00:00', 2),
(471, '2020-06-21 13:00:00', '2020-06-22 03:00:00', 2),
(472, '2020-06-22 13:00:00', '2020-06-23 03:00:00', 2),
(473, '2020-06-23 13:00:00', '2020-06-24 03:00:00', 2),
(474, '2020-06-24 13:00:00', '2020-06-25 03:00:00', 2),
(475, '2020-06-25 13:00:00', '2020-06-26 03:00:00', 2),
(476, '2020-06-26 13:00:00', '2020-06-27 03:00:00', 2),
(477, '2020-06-27 13:00:00', '2020-06-28 03:00:00', 2),
(478, '2020-06-28 13:00:00', '2020-06-29 03:00:00', 2),
(479, '2020-06-29 13:00:00', '2020-06-30 03:00:00', 2),
(480, '2020-06-30 13:00:00', '2020-07-01 03:00:00', 2),
(481, '2020-07-01 13:00:00', '2020-07-02 03:00:00', 2),
(482, '2020-07-02 13:00:00', '2020-07-03 03:00:00', 2),
(483, '2020-07-03 13:00:00', '2020-07-04 03:00:00', 2),
(484, '2020-07-04 13:00:00', '2020-07-05 03:00:00', 2),
(485, '2020-07-05 13:00:00', '2020-07-06 03:00:00', 2),
(486, '2020-07-06 13:00:00', '2020-07-07 03:00:00', 2),
(487, '2020-07-07 13:00:00', '2020-07-08 03:00:00', 2),
(488, '2020-07-08 13:00:00', '2020-07-09 03:00:00', 2),
(489, '2020-07-09 13:00:00', '2020-07-10 03:00:00', 2),
(490, '2020-07-10 13:00:00', '2020-07-11 03:00:00', 2),
(491, '2020-07-11 13:00:00', '2020-07-12 03:00:00', 2),
(492, '2020-07-12 13:00:00', '2020-07-13 03:00:00', 2),
(493, '2020-07-13 13:00:00', '2020-07-14 03:00:00', 2),
(494, '2020-07-14 13:00:00', '2020-07-15 03:00:00', 2),
(495, '2020-07-15 13:00:00', '2020-07-16 03:00:00', 2),
(496, '2020-07-16 13:00:00', '2020-07-17 03:00:00', 2),
(497, '2020-07-17 13:00:00', '2020-07-18 03:00:00', 2),
(498, '2020-07-18 13:00:00', '2020-07-19 03:00:00', 2),
(499, '2020-07-19 13:00:00', '2020-07-20 03:00:00', 2),
(500, '2020-07-20 13:00:00', '2020-07-21 03:00:00', 2),
(501, '2020-07-21 13:00:00', '2020-07-22 03:00:00', 2),
(502, '2020-07-22 13:00:00', '2020-07-23 03:00:00', 2),
(503, '2020-07-23 13:00:00', '2020-07-24 03:00:00', 2),
(504, '2020-07-24 13:00:00', '2020-07-25 03:00:00', 2),
(505, '2020-07-25 13:00:00', '2020-07-26 03:00:00', 2),
(506, '2020-07-26 13:00:00', '2020-07-27 03:00:00', 2),
(507, '2020-07-27 13:00:00', '2020-07-28 03:00:00', 2),
(508, '2020-07-28 13:00:00', '2020-07-29 03:00:00', 2),
(509, '2020-07-29 13:00:00', '2020-07-30 03:00:00', 2),
(510, '2020-07-30 13:00:00', '2020-07-31 03:00:00', 2),
(511, '2020-07-31 13:00:00', '2020-08-01 03:00:00', 2),
(512, '2020-08-01 13:00:00', '2020-08-02 03:00:00', 2),
(513, '2020-08-02 13:00:00', '2020-08-03 03:00:00', 2),
(514, '2020-08-03 13:00:00', '2020-08-04 03:00:00', 2),
(515, '2020-08-04 13:00:00', '2020-08-05 03:00:00', 2),
(516, '2020-08-05 13:00:00', '2020-08-06 03:00:00', 2),
(517, '2020-08-06 13:00:00', '2020-08-07 03:00:00', 2),
(518, '2020-08-07 13:00:00', '2020-08-08 03:00:00', 2),
(519, '2020-08-08 13:00:00', '2020-08-09 03:00:00', 2),
(520, '2020-08-09 13:00:00', '2020-08-10 03:00:00', 2),
(521, '2020-08-10 13:00:00', '2020-08-11 03:00:00', 2),
(522, '2020-08-11 13:00:00', '2020-08-12 03:00:00', 2),
(523, '2020-08-12 13:00:00', '2020-08-13 03:00:00', 2),
(524, '2020-08-13 13:00:00', '2020-08-14 03:00:00', 2),
(525, '2020-08-14 13:00:00', '2020-08-15 03:00:00', 2),
(526, '2020-08-15 13:00:00', '2020-08-16 03:00:00', 2),
(527, '2020-08-16 13:00:00', '2020-08-17 03:00:00', 2),
(528, '2020-08-17 13:00:00', '2020-08-18 03:00:00', 2),
(529, '2020-08-18 13:00:00', '2020-08-19 03:00:00', 2),
(530, '2020-08-19 13:00:00', '2020-08-20 03:00:00', 2),
(531, '2020-08-20 13:00:00', '2020-08-21 03:00:00', 2),
(532, '2020-08-21 13:00:00', '2020-08-22 03:00:00', 2),
(533, '2020-08-22 13:00:00', '2020-08-23 03:00:00', 2),
(534, '2020-08-23 13:00:00', '2020-08-24 03:00:00', 2),
(535, '2020-08-24 13:00:00', '2020-08-25 03:00:00', 2),
(536, '2020-08-25 13:00:00', '2020-08-26 03:00:00', 2),
(537, '2020-08-26 13:00:00', '2020-08-27 03:00:00', 2),
(538, '2020-08-27 13:00:00', '2020-08-28 03:00:00', 2),
(539, '2020-08-28 13:00:00', '2020-08-29 03:00:00', 2),
(540, '2020-08-29 13:00:00', '2020-08-30 03:00:00', 2),
(541, '2020-08-30 13:00:00', '2020-08-31 03:00:00', 2),
(542, '2020-08-31 13:00:00', '2020-09-01 03:00:00', 2),
(543, '2020-09-01 13:00:00', '2020-09-02 03:00:00', 2),
(544, '2020-09-02 13:00:00', '2020-09-03 03:00:00', 2),
(545, '2020-09-03 13:00:00', '2020-09-04 03:00:00', 2),
(546, '2020-09-04 13:00:00', '2020-09-05 03:00:00', 2),
(547, '2020-09-05 13:00:00', '2020-09-06 03:00:00', 2),
(548, '2020-09-06 13:00:00', '2020-09-07 03:00:00', 2),
(549, '2020-09-07 13:00:00', '2020-09-08 03:00:00', 2),
(550, '2020-09-08 13:00:00', '2020-09-09 03:00:00', 2),
(551, '2020-09-09 13:00:00', '2020-09-10 03:00:00', 2),
(552, '2020-09-10 13:00:00', '2020-09-11 03:00:00', 2),
(553, '2020-09-11 13:00:00', '2020-09-12 03:00:00', 2),
(554, '2020-09-12 13:00:00', '2020-09-13 03:00:00', 2),
(555, '2020-09-13 13:00:00', '2020-09-14 03:00:00', 2),
(556, '2020-09-14 13:00:00', '2020-09-15 03:00:00', 2),
(557, '2020-09-15 13:00:00', '2020-09-16 03:00:00', 2),
(558, '2020-09-16 13:00:00', '2020-09-17 03:00:00', 2),
(559, '2020-09-17 13:00:00', '2020-09-18 03:00:00', 2),
(560, '2020-09-18 13:00:00', '2020-09-19 03:00:00', 2),
(561, '2020-09-19 13:00:00', '2020-09-20 03:00:00', 2),
(562, '2020-09-20 13:00:00', '2020-09-21 03:00:00', 2),
(563, '2020-09-21 13:00:00', '2020-09-22 03:00:00', 2),
(564, '2020-09-22 13:00:00', '2020-09-23 03:00:00', 2),
(565, '2020-09-23 13:00:00', '2020-09-24 03:00:00', 2),
(566, '2020-09-24 13:00:00', '2020-09-25 03:00:00', 2),
(567, '2020-09-25 13:00:00', '2020-09-26 03:00:00', 2),
(568, '2020-09-26 13:00:00', '2020-09-27 03:00:00', 2),
(569, '2020-09-27 13:00:00', '2020-09-28 03:00:00', 2),
(570, '2020-09-28 13:00:00', '2020-09-29 03:00:00', 2),
(571, '2020-09-29 13:00:00', '2020-09-30 03:00:00', 2),
(572, '2020-09-30 13:00:00', '2020-10-01 03:00:00', 2),
(573, '2020-10-01 13:00:00', '2020-10-02 03:00:00', 2),
(574, '2020-10-02 13:00:00', '2020-10-03 03:00:00', 2),
(575, '2020-10-03 13:00:00', '2020-10-04 03:00:00', 2),
(576, '2020-10-04 13:00:00', '2020-10-05 03:00:00', 2),
(577, '2020-10-05 13:00:00', '2020-10-06 03:00:00', 2),
(578, '2020-10-06 13:00:00', '2020-10-07 03:00:00', 2),
(579, '2020-10-07 13:00:00', '2020-10-08 03:00:00', 2),
(580, '2020-10-08 13:00:00', '2020-10-09 03:00:00', 2),
(581, '2020-10-09 13:00:00', '2020-10-10 03:00:00', 2),
(582, '2020-10-10 13:00:00', '2020-10-11 03:00:00', 2),
(583, '2020-10-11 13:00:00', '2020-10-12 03:00:00', 2),
(584, '2020-10-12 13:00:00', '2020-10-13 03:00:00', 2),
(585, '2020-10-13 13:00:00', '2020-10-14 03:00:00', 2),
(586, '2020-10-14 13:00:00', '2020-10-15 03:00:00', 2),
(587, '2020-10-15 13:00:00', '2020-10-16 03:00:00', 2),
(588, '2020-10-16 13:00:00', '2020-10-17 03:00:00', 2),
(589, '2020-10-17 13:00:00', '2020-10-18 03:00:00', 2),
(590, '2020-10-18 13:00:00', '2020-10-19 03:00:00', 2),
(591, '2020-10-19 13:00:00', '2020-10-20 03:00:00', 2),
(592, '2020-10-20 13:00:00', '2020-10-21 03:00:00', 2),
(593, '2020-10-21 13:00:00', '2020-10-22 03:00:00', 2),
(594, '2020-10-22 13:00:00', '2020-10-23 03:00:00', 2),
(595, '2020-10-23 13:00:00', '2020-10-24 03:00:00', 2),
(596, '2020-10-24 13:00:00', '2020-10-25 03:00:00', 2),
(597, '2020-10-25 13:00:00', '2020-10-26 03:00:00', 2),
(598, '2020-10-26 13:00:00', '2020-10-27 03:00:00', 2),
(599, '2020-10-27 13:00:00', '2020-10-28 03:00:00', 2),
(600, '2020-10-28 13:00:00', '2020-10-29 03:00:00', 2),
(601, '2020-10-29 13:00:00', '2020-10-30 03:00:00', 2),
(602, '2020-10-30 13:00:00', '2020-10-31 03:00:00', 2),
(603, '2020-10-31 13:00:00', '2020-11-01 03:00:00', 2),
(604, '2020-11-01 13:00:00', '2020-11-02 03:00:00', 2),
(605, '2020-11-02 13:00:00', '2020-11-03 03:00:00', 2),
(606, '2020-11-03 13:00:00', '2020-11-04 03:00:00', 2),
(607, '2020-11-04 13:00:00', '2020-11-05 03:00:00', 2),
(608, '2020-11-05 13:00:00', '2020-11-06 03:00:00', 2),
(609, '2020-11-06 13:00:00', '2020-11-07 03:00:00', 2),
(610, '2020-11-07 13:00:00', '2020-11-08 03:00:00', 2),
(611, '2020-11-08 13:00:00', '2020-11-09 03:00:00', 2),
(612, '2020-11-09 13:00:00', '2020-11-10 03:00:00', 2),
(613, '2020-11-10 13:00:00', '2020-11-11 03:00:00', 2),
(614, '2020-11-11 13:00:00', '2020-11-12 03:00:00', 2),
(615, '2020-11-12 13:00:00', '2020-11-13 03:00:00', 2),
(616, '2020-11-13 13:00:00', '2020-11-14 03:00:00', 2),
(617, '2020-11-14 13:00:00', '2020-11-15 03:00:00', 2),
(618, '2020-11-15 13:00:00', '2020-11-16 03:00:00', 2),
(619, '2020-11-16 13:00:00', '2020-11-17 03:00:00', 2),
(620, '2020-11-17 13:00:00', '2020-11-18 03:00:00', 2),
(621, '2020-11-18 13:00:00', '2020-11-19 03:00:00', 2),
(622, '2020-11-19 13:00:00', '2020-11-20 03:00:00', 2),
(623, '2020-11-20 13:00:00', '2020-11-21 03:00:00', 2),
(624, '2020-11-21 13:00:00', '2020-11-22 03:00:00', 2),
(625, '2020-11-22 13:00:00', '2020-11-23 03:00:00', 2),
(626, '2020-11-23 13:00:00', '2020-11-24 03:00:00', 2),
(627, '2020-11-24 13:00:00', '2020-11-25 03:00:00', 2),
(628, '2020-11-25 13:00:00', '2020-11-26 03:00:00', 2),
(629, '2020-11-26 13:00:00', '2020-11-27 03:00:00', 2),
(630, '2020-11-27 13:00:00', '2020-11-28 03:00:00', 2),
(631, '2020-11-28 13:00:00', '2020-11-29 03:00:00', 2),
(632, '2020-11-29 13:00:00', '2020-11-30 03:00:00', 2),
(633, '2020-11-30 13:00:00', '2020-12-01 03:00:00', 2),
(634, '2020-12-01 13:00:00', '2020-12-02 03:00:00', 2),
(635, '2020-12-02 13:00:00', '2020-12-03 03:00:00', 2),
(636, '2020-12-03 13:00:00', '2020-12-04 03:00:00', 2),
(637, '2020-12-04 13:00:00', '2020-12-05 03:00:00', 2),
(638, '2020-12-05 13:00:00', '2020-12-06 03:00:00', 2),
(639, '2020-12-06 13:00:00', '2020-12-07 03:00:00', 2),
(640, '2020-12-07 13:00:00', '2020-12-08 03:00:00', 2),
(641, '2020-12-08 13:00:00', '2020-12-09 03:00:00', 2),
(642, '2020-12-09 13:00:00', '2020-12-10 03:00:00', 2),
(643, '2020-12-10 13:00:00', '2020-12-11 03:00:00', 2),
(644, '2020-12-11 13:00:00', '2020-12-12 03:00:00', 2),
(645, '2020-12-12 13:00:00', '2020-12-13 03:00:00', 2),
(646, '2020-12-13 13:00:00', '2020-12-14 03:00:00', 2),
(647, '2020-12-14 13:00:00', '2020-12-15 03:00:00', 2),
(648, '2020-12-15 13:00:00', '2020-12-16 03:00:00', 2),
(649, '2020-12-16 13:00:00', '2020-12-17 03:00:00', 2),
(650, '2020-12-17 13:00:00', '2020-12-18 03:00:00', 2),
(651, '2020-12-18 13:00:00', '2020-12-19 03:00:00', 2),
(652, '2020-12-19 13:00:00', '2020-12-20 03:00:00', 2),
(653, '2020-12-20 13:00:00', '2020-12-21 03:00:00', 2),
(654, '2020-12-21 13:00:00', '2020-12-22 03:00:00', 2),
(655, '2020-12-22 13:00:00', '2020-12-23 03:00:00', 2),
(656, '2020-12-23 13:00:00', '2020-12-24 03:00:00', 2),
(657, '2020-12-24 13:00:00', '2020-12-25 03:00:00', 2),
(658, '2020-12-25 13:00:00', '2020-12-26 03:00:00', 2),
(659, '2020-12-26 13:00:00', '2020-12-27 03:00:00', 2),
(660, '2020-12-27 13:00:00', '2020-12-28 03:00:00', 2),
(661, '2020-12-28 13:00:00', '2020-12-29 03:00:00', 2),
(662, '2020-12-29 13:00:00', '2020-12-30 03:00:00', 2),
(663, '2020-12-30 13:00:00', '2020-12-31 03:00:00', 2),
(664, '2020-12-31 13:00:00', '2021-01-01 03:00:00', 2),
(665, '2021-01-01 13:00:00', '2021-01-02 03:00:00', 2),
(666, '2021-01-02 13:00:00', '2021-01-03 03:00:00', 2),
(667, '2021-01-03 13:00:00', '2021-01-04 03:00:00', 2),
(668, '2021-01-04 13:00:00', '2021-01-05 03:00:00', 2),
(669, '2021-01-05 13:00:00', '2021-01-06 03:00:00', 2),
(670, '2021-01-06 13:00:00', '2021-01-07 03:00:00', 2),
(671, '2021-01-07 13:00:00', '2021-01-08 03:00:00', 2),
(672, '2021-01-08 13:00:00', '2021-01-09 03:00:00', 2),
(673, '2021-01-09 13:00:00', '2021-01-10 03:00:00', 2),
(674, '2021-01-10 13:00:00', '2021-01-11 03:00:00', 2),
(675, '2021-01-11 13:00:00', '2021-01-12 03:00:00', 2),
(676, '2021-01-12 13:00:00', '2021-01-13 03:00:00', 2),
(677, '2021-01-13 13:00:00', '2021-01-14 03:00:00', 2),
(678, '2021-01-14 13:00:00', '2021-01-15 03:00:00', 2),
(679, '2021-01-15 13:00:00', '2021-01-16 03:00:00', 2),
(680, '2021-01-16 13:00:00', '2021-01-17 03:00:00', 2),
(681, '2021-01-17 13:00:00', '2021-01-18 03:00:00', 2),
(682, '2021-01-18 13:00:00', '2021-01-19 03:00:00', 2),
(683, '2021-01-19 13:00:00', '2021-01-20 03:00:00', 2),
(684, '2021-01-20 13:00:00', '2021-01-21 03:00:00', 2),
(685, '2021-01-21 13:00:00', '2021-01-22 03:00:00', 2),
(686, '2021-01-22 13:00:00', '2021-01-23 03:00:00', 2),
(687, '2021-01-23 13:00:00', '2021-01-24 03:00:00', 2),
(688, '2021-01-24 13:00:00', '2021-01-25 03:00:00', 2),
(689, '2021-01-25 13:00:00', '2021-01-26 03:00:00', 2),
(690, '2021-01-26 13:00:00', '2021-01-27 03:00:00', 2),
(691, '2021-01-27 13:00:00', '2021-01-28 03:00:00', 2),
(692, '2021-01-28 13:00:00', '2021-01-29 03:00:00', 2),
(693, '2021-01-29 13:00:00', '2021-01-30 03:00:00', 2),
(694, '2021-01-30 13:00:00', '2021-01-31 03:00:00', 2),
(695, '2021-01-31 13:00:00', '2021-02-01 03:00:00', 2),
(696, '2021-02-01 13:00:00', '2021-02-02 03:00:00', 2),
(697, '2021-02-02 13:00:00', '2021-02-03 03:00:00', 2),
(698, '2021-02-03 13:00:00', '2021-02-04 03:00:00', 2),
(699, '2021-02-04 13:00:00', '2021-02-05 03:00:00', 2),
(700, '2021-02-05 13:00:00', '2021-02-06 03:00:00', 2),
(701, '2021-02-06 13:00:00', '2021-02-07 03:00:00', 2),
(702, '2021-02-07 13:00:00', '2021-02-08 03:00:00', 2),
(703, '2021-02-08 13:00:00', '2021-02-09 03:00:00', 2),
(704, '2021-02-09 13:00:00', '2021-02-10 03:00:00', 2),
(705, '2021-02-10 13:00:00', '2021-02-11 03:00:00', 2),
(706, '2021-02-11 13:00:00', '2021-02-12 03:00:00', 2),
(707, '2021-02-12 13:00:00', '2021-02-13 03:00:00', 2),
(708, '2021-02-13 13:00:00', '2021-02-14 03:00:00', 2),
(709, '2021-02-14 13:00:00', '2021-02-15 03:00:00', 2),
(710, '2021-02-15 13:00:00', '2021-02-16 03:00:00', 2),
(711, '2021-02-16 13:00:00', '2021-02-17 03:00:00', 2),
(712, '2021-02-17 13:00:00', '2021-02-18 03:00:00', 2),
(713, '2021-02-18 13:00:00', '2021-02-19 03:00:00', 2),
(714, '2021-02-19 13:00:00', '2021-02-20 03:00:00', 2),
(715, '2021-02-20 13:00:00', '2021-02-21 03:00:00', 2),
(716, '2021-02-21 13:00:00', '2021-02-22 03:00:00', 2),
(717, '2021-02-22 13:00:00', '2021-02-23 03:00:00', 2),
(718, '2021-02-23 13:00:00', '2021-02-24 03:00:00', 2),
(719, '2021-02-24 13:00:00', '2021-02-25 03:00:00', 2),
(720, '2021-02-25 13:00:00', '2021-02-26 03:00:00', 2),
(721, '2021-02-26 13:00:00', '2021-02-27 03:00:00', 2),
(722, '2021-02-27 13:00:00', '2021-02-28 03:00:00', 2),
(723, '2021-02-28 13:00:00', '2021-03-01 03:00:00', 2),
(724, '2021-03-01 13:00:00', '2021-03-02 03:00:00', 2),
(725, '2021-03-02 13:00:00', '2021-03-03 03:00:00', 2),
(726, '2021-03-03 13:00:00', '2021-03-04 03:00:00', 2),
(727, '2021-03-04 13:00:00', '2021-03-05 03:00:00', 2),
(728, '2021-03-05 13:00:00', '2021-03-06 03:00:00', 2),
(729, '2021-03-06 13:00:00', '2021-03-07 03:00:00', 2),
(730, '2021-03-07 13:00:00', '2021-03-08 03:00:00', 2),
(731, '2021-03-08 13:00:00', '2021-03-09 03:00:00', 2),
(732, '2021-03-09 13:00:00', '2021-03-10 03:00:00', 2);

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
(2, '2020-03-09 21:27:57', NULL, 'Centro de Datos de la Universidad', NULL, 1, NULL, 'daily', 'interval=1|termination=2021-03-09 06:00:00');

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
(2, 8);

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
(2.1, '2020-03-03 00:05:15'),
(2.1, '2020-03-03 00:05:15'),
(2.2, '2020-03-03 00:05:15'),
(2.3, '2020-03-03 00:05:15'),
(2.3, '2020-03-03 00:05:15'),
(2.4, '2020-03-03 00:05:15'),
(2.4, '2020-03-03 00:05:15'),
(2.5, '2020-03-03 00:05:16'),
(2.5, '2020-03-03 00:05:16'),
(2.6, '2020-03-03 00:05:16'),
(2.7, '2020-03-03 00:05:16'),
(2.7, '2020-03-03 00:05:16'),
(2.1, '2020-03-03 00:05:16'),
(2.2, '2020-03-03 00:05:16'),
(2.3, '2020-03-03 00:05:16'),
(2.4, '2020-03-03 00:05:16'),
(2.5, '2020-03-03 00:05:16'),
(2.6, '2020-03-03 00:05:16'),
(2.7, '2020-03-03 00:05:16');

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
(1, 'Adminstradores', 1, NULL, 0),
(2, 'Consultores', 1, NULL, 0),
(3, 'Biblioteca', 1, NULL, 0),
(4, 'Guests', 1, NULL, 1),
(5, 'Laboratorios', 1, NULL, 0);

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
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(1, 6, 0),
(1, 7, 0),
(1, 8, 0),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(2, 4, 1),
(2, 5, 1),
(2, 6, 1),
(2, 7, 1),
(2, 8, 1),
(4, 1, 1),
(4, 2, 1),
(4, 3, 1),
(4, 4, 1),
(4, 5, 1),
(4, 6, 1),
(4, 7, 1),
(4, 8, 1),
(5, 1, 0),
(5, 2, 0),
(5, 3, 0),
(5, 4, 0),
(5, 5, 0),
(5, 6, 0),
(5, 7, 0),
(5, 8, 0);

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
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(3, 3),
(3, 4),
(5, 3),
(5, 4);

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
(5, 'America/Tegucigalpa', 0),
(12, 'America/Tegucigalpa', 0),
(15, 'America/Tegucigalpa', 0);

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
(1, '0.00', 'USD'),
(2, '0.00', 'USD'),
(3, '0.00', 'USD');

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
(3, 1, 1);

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
(2, '2020-03-09 13:00:00', '2020-03-09 14:00:00', '5e66bcfb18fcc351582323', 2, NULL, NULL, NULL, '0.00'),
(3, '2020-03-10 02:00:00', '2020-03-10 03:00:00', '5e66bf5c45705004745318', 3, NULL, NULL, NULL, NULL),
(4, '2020-03-09 13:00:00', '2020-03-09 14:00:00', '5e66f665300dc477754280', 4, NULL, NULL, NULL, '0.00'),
(5, '2020-03-09 14:00:00', '2020-03-09 15:00:00', '5e66f67f94f56756176120', 5, NULL, NULL, NULL, '0.00'),
(6, '2020-03-09 15:00:00', '2020-03-09 16:00:00', '5e66f6953aa0d022376388', 6, NULL, NULL, NULL, '0.00'),
(7, '2020-03-09 16:00:00', '2020-03-09 20:00:00', '5e66f6aea8a3f179948996', 7, NULL, NULL, NULL, '0.00'),
(8, '2020-03-09 20:00:00', '2020-03-09 22:00:00', '5e66f6f841e5c345406474', 8, NULL, NULL, NULL, '0.00'),
(9, '2020-03-09 23:00:00', '2020-03-10 03:00:00', '5e66f70d7609c448526732', 9, NULL, NULL, NULL, NULL);

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
(2, 1, 1),
(3, 3, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1),
(8, 1, 1),
(9, 1, 1);

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
(2, '2020-03-09 22:02:35', '2020-03-09 22:10:51', '', '', 0, 0, 1, 2, 'none', '', 1, NULL, 1, NULL),
(3, '2020-03-09 22:12:44', NULL, 'Gestion Informatica de Proyecto', 'Catedrático: Ingeniero Oscar Cruz', 1, 0, 1, 1, 'daily', 'interval=1|termination=2020-03-09 06:00:00', 1, NULL, 1, NULL),
(4, '2020-03-10 02:07:33', NULL, 'Prueba 1', '', 0, 0, 1, 1, 'none', '', 1, NULL, 1, NULL),
(5, '2020-03-10 02:07:59', NULL, 'Prueba', '', 0, 0, 1, 1, 'none', '', 1, NULL, 1, NULL),
(6, '2020-03-10 02:08:21', NULL, 'Prueba', '', 0, 0, 1, 1, 'none', '', 1, NULL, 1, NULL),
(7, '2020-03-10 02:08:46', NULL, 'Prueba', '', 0, 0, 1, 1, 'none', '', 1, NULL, 1, NULL),
(8, '2020-03-10 02:10:00', NULL, 'Prubea', '', 0, 0, 1, 1, 'none', '', 1, NULL, 1, NULL),
(9, '2020-03-10 02:10:21', NULL, 'Prueba', '', 0, 0, 1, 1, 'none', '', 1, NULL, 1, NULL);

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
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1),
(8, 1, 1),
(9, 1, 1);

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
(1, 'Laboratorio #2', 'Ediificio F L.02', 'Don Elin', 'Laboratorio con las mejores computadoras, con la capacidad de llevar clases DTR', 'Laboratorio mas potente y mejor equipado.', 3600, NULL, 14400, NULL, 0, 1, 1, 32, NULL, NULL, NULL, 1, NULL, 5, '7e5397cb6d16ee98f845', 0, 1, 2, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-09 20:22:23', '2020-03-09 22:40:04'),
(2, 'Laboratorio #3', 'Ediificio F L.03', 'Don Elin', 'Laboratorio abierto al publico siempre y cuando no hayan clases.', 'Laboratorio abierto al publico.\nComputadoras con Deep Freeze activado.', 3600, NULL, 14400, NULL, 0, 1, 1, 32, NULL, NULL, NULL, 1, NULL, 5, NULL, 0, 2, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-09 21:01:35', '2020-03-09 21:13:11'),
(3, 'Laboratorio #4', 'Ediificio F L.04', 'Don Elin', 'Laboratorio de Clases', 'Laboratorio de Clases', 3600, NULL, 14400, NULL, 0, 1, 1, 32, NULL, NULL, NULL, 1, NULL, 5, NULL, 0, 3, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-09 21:13:30', '2020-03-09 21:14:30'),
(4, 'Laboratorio #5', 'Ediificio F L.05', 'Don Elin', 'Laboratorio de Clases', 'Laboratorio de Clases', 3600, NULL, 14400, NULL, 0, 1, 1, 32, NULL, NULL, NULL, 1, NULL, 5, NULL, 0, 4, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-09 21:16:33', '2020-03-09 21:16:41'),
(5, 'Laboratorio #6', 'Ediificio F L.06', 'Don Elin', 'Laboratorio de Clases', 'Laboratorio de Clases', 3600, NULL, 14400, NULL, 0, 1, 1, 32, NULL, NULL, NULL, 1, NULL, 5, NULL, 0, 5, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-09 21:19:08', '2020-03-09 21:20:14'),
(6, 'Laboratorio #7', 'Ediificio F L.07', 'Don Elin', 'Laboratorio de Clases', 'Laboratorio de Clases', 3600, NULL, 14400, NULL, 0, 1, 1, 32, NULL, NULL, NULL, 1, NULL, 5, NULL, 0, 6, 1, 1, NULL, NULL, 0, NULL, '', 0, '0.00', '0.00', NULL, NULL, '2020-03-09 21:19:23', '2020-03-09 21:20:19'),
(7, 'Laboratorio MAC', '', 'Don Elin', 'Laboratorio Equipado con Equipo MAC', 'Laboratorio de Clases', 3600, NULL, 14400, NULL, 0, 1, 1, 16, NULL, NULL, NULL, 1, NULL, 5, NULL, 0, 7, 1, 1, NULL, NULL, 0, NULL, '#c0c0c0', 0, '0.00', '0.00', NULL, NULL, '2020-03-09 21:19:56', '2020-03-09 21:30:26'),
(8, 'Data Center', '', 'Don Elin', 'Laboratorio Equipado con Equipo MAC', 'Laboratorio de Clases', 3600, NULL, 14400, NULL, 0, 1, 1, 16, NULL, NULL, NULL, 1, NULL, 5, NULL, 0, 8, 5, 2, NULL, NULL, 0, NULL, '#80ff80', 0, '0.00', '0.00', NULL, NULL, '2020-03-09 21:22:16', '2020-03-10 02:34:06');

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

--
-- Volcado de datos para la tabla `resource_groups`
--

INSERT INTO `resource_groups` (`resource_group_id`, `resource_group_name`, `parent_id`, `public_id`) VALUES
(1, 'Laboratorios', NULL, NULL),
(2, 'Audiovisuales', NULL, NULL),
(3, 'Data Center', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resource_group_assignment`
--

CREATE TABLE `resource_group_assignment` (
  `resource_group_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `resource_group_assignment`
--

INSERT INTO `resource_group_assignment` (`resource_group_id`, `resource_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(3, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resource_images`
--

CREATE TABLE `resource_images` (
  `resource_image_id` smallint(5) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `image_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resource_status_reasons`
--

CREATE TABLE `resource_status_reasons` (
  `resource_status_reason_id` smallint(5) UNSIGNED NOT NULL,
  `status_id` tinyint(3) UNSIGNED NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `resource_status_reasons`
--

INSERT INTO `resource_status_reasons` (`resource_status_reason_id`, `status_id`, `description`) VALUES
(1, 2, 'Centro de Datos de la Universidad, No se Reserva'),
(2, 1, 'Disponible para su reserva');

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
(1, 'Laboratorios de Clases', 'Laboratorios en los Cuales se imparten las clases'),
(2, 'Laboratorio con DTR', 'Laboratorio de Clases equipado para DTR'),
(3, 'Audiovisuales', 'Aulas Audiovisuales Manejadas por la Biblioteca'),
(4, 'Salones', 'Salones para Conferencia y Reuniones manejados por la Biblioteca'),
(5, 'Data Center', 'Centro de Datos de la Universidad');

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
(1, 'Horario Semana', 1, 1, 6, 5, NULL, '8d5f18a6034b79ccefb3', 0, 1, NULL, NULL, 0, 3);

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
(40, NULL, NULL, 2, 5, '00:00:00', '07:00:00', NULL),
(41, NULL, NULL, 1, 5, '07:00:00', '08:00:00', NULL),
(42, NULL, NULL, 1, 5, '08:00:00', '09:00:00', NULL),
(43, NULL, NULL, 1, 5, '09:00:00', '10:00:00', NULL),
(44, NULL, NULL, 1, 5, '10:00:00', '11:00:00', NULL),
(45, NULL, NULL, 1, 5, '11:00:00', '12:00:00', NULL),
(46, NULL, NULL, 1, 5, '12:00:00', '13:00:00', NULL),
(47, NULL, NULL, 1, 5, '13:00:00', '14:00:00', NULL),
(48, NULL, NULL, 1, 5, '14:00:00', '15:00:00', NULL),
(49, NULL, NULL, 1, 5, '15:00:00', '16:00:00', NULL),
(50, NULL, NULL, 1, 5, '16:00:00', '17:00:00', NULL),
(51, NULL, NULL, 1, 5, '17:00:00', '18:00:00', NULL),
(52, NULL, NULL, 1, 5, '18:00:00', '19:00:00', NULL),
(53, NULL, NULL, 1, 5, '19:00:00', '20:00:00', NULL),
(54, NULL, NULL, 1, 5, '20:00:00', '21:00:00', NULL),
(55, NULL, NULL, 2, 5, '21:00:00', '00:00:00', NULL),
(63, NULL, NULL, 2, 12, '00:00:00', '08:00:00', NULL),
(64, NULL, NULL, 1, 12, '08:00:00', '12:00:00', NULL),
(65, NULL, NULL, 2, 12, '12:00:00', '13:00:00', NULL),
(66, NULL, NULL, 1, 12, '13:00:00', '17:00:00', NULL),
(67, NULL, NULL, 2, 12, '17:00:00', '00:00:00', NULL),
(69, NULL, NULL, 2, 15, '00:00:00', '00:00:00', NULL);

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
(1, 'Jorge', 'Salgado', 'admin', 'admin@unicah.edu', '6e490a03354a5e21e327508d3c97baf510d4c1fe', '5d0fbe45', 'UNICAH', 'Manager', '33967131', 'America/Tegucigalpa', 'es', 1, '2020-03-03 00:05:57', '2020-03-10 08:31:29', '2020-03-10 02:30:07', 1, NULL, NULL, '0d44bbb2d705bb1652f6', 0, NULL, '0.00', NULL),
(2, 'Don', 'Elin', 'Don Elin', 'Elin@unicah.edu', 'b4c28ac445a7d987794706d88fc6ca86b794cd54', '4bbe5f2a', 'UNICAH', 'Gerente de Laboratorio', '', 'America/Tegucigalpa', 'es', 1, '2020-03-09 20:23:29', '2020-03-10 08:35:11', '2020-03-10 02:35:11', 1, NULL, NULL, 'c646fe491e7afa54f24c', 0, NULL, '0.00', NULL),
(3, 'Cuenta', 'Consultor', 'Consultores', 'consultor@unicah.edu', '0eab3e47687c8da3a0ee027ac2b2180ce2313f26', '1e34118e', 'UNICAH', 'Consultor', '', 'America/Tegucigalpa', 'es', 1, '2020-03-09 20:30:32', '2020-03-10 08:22:58', '2020-03-10 02:22:58', 1, NULL, NULL, '862aa3cda945037544f4', 0, NULL, '0.00', NULL),
(4, 'Administradores', 'Biblioteca', 'Administrador Biblioteca', 'adminbiblioteca@unicah.edu', 'b26b85d178bf4901cb28f284ee8e33e26ad86fca', '22c9670a', 'UNICAH', 'Administrador Biblioteca', '', 'America/Tegucigalpa', 'es', 1, '2020-03-09 20:32:47', '2020-03-10 08:23:29', '2020-03-10 02:23:29', 1, NULL, NULL, '49353fef3baf9e6835d8', 0, NULL, '0.00', NULL),
(5, 'Invitados', 'Alumnos', 'Invitados', 'guest@unicah.edu', '84123a1f883154a51335d692b3f22480b6611a2b', '07d33cd9', 'UNICAH', 'Guest', '', 'America/Tegucigalpa', 'es', 1, '2020-03-09 20:34:46', '2020-03-10 04:43:12', '2020-03-09 22:43:12', 1, NULL, NULL, 'db87ded9f60d01e1a763', 0, NULL, '0.00', NULL);

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
(1, 1),
(1, 2),
(3, 2),
(1, 3),
(4, 3),
(1, 4),
(5, 4),
(1, 5),
(2, 5);

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
(7, 5, 'CalendarFilter', '||'),
(33, 1, 'CalendarFilter', '||');

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
(1, 1, 1, 0),
(1, 2, 1, 0),
(1, 3, 1, 0),
(1, 4, 1, 0),
(1, 5, 1, 0),
(1, 6, 1, 0),
(1, 7, 1, 0),
(1, 8, 1, 0),
(2, 1, 1, 0),
(2, 2, 1, 0),
(2, 3, 1, 0),
(2, 4, 1, 0),
(2, 5, 1, 0),
(2, 6, 1, 0),
(2, 7, 1, 0),
(2, 8, 1, 0);

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
  ADD KEY `entity_category` (`entity_id`,`attribute_category`),
  ADD KEY `entity_attribute` (`entity_id`,`custom_attribute_id`);

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
  ADD KEY `series_id` (`series_id`);

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
  ADD KEY `resource_status_reason_id` (`resource_status_reason_id`),
  ADD KEY `auto_release_minutes` (`auto_release_minutes`),
  ADD KEY `resource_type_id` (`resource_type_id`);

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
  MODIFY `accessory_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `blackout_instance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=734;

--
-- AUTO_INCREMENT de la tabla `blackout_series`
--
ALTER TABLE `blackout_series`
  MODIFY `blackout_series_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `credit_log`
--
ALTER TABLE `credit_log`
  MODIFY `credit_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `custom_attributes`
--
ALTER TABLE `custom_attributes`
  MODIFY `custom_attribute_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `custom_attribute_values`
--
ALTER TABLE `custom_attribute_values`
  MODIFY `custom_attribute_value_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `custom_time_blocks`
--
ALTER TABLE `custom_time_blocks`
  MODIFY `custom_time_block_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `layouts`
--
ALTER TABLE `layouts`
  MODIFY `layout_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `payment_configuration`
--
ALTER TABLE `payment_configuration`
  MODIFY `payment_configuration_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `reservation_instance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `reservation_reminders`
--
ALTER TABLE `reservation_reminders`
  MODIFY `reminder_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservation_series`
--
ALTER TABLE `reservation_series`
  MODIFY `series_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `reservation_waitlist_requests`
--
ALTER TABLE `reservation_waitlist_requests`
  MODIFY `reservation_waitlist_request_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resources`
--
ALTER TABLE `resources`
  MODIFY `resource_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `resource_accessories`
--
ALTER TABLE `resource_accessories`
  MODIFY `resource_accessory_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resource_groups`
--
ALTER TABLE `resource_groups`
  MODIFY `resource_group_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `resource_images`
--
ALTER TABLE `resource_images`
  MODIFY `resource_image_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `resource_status_reasons`
--
ALTER TABLE `resource_status_reasons`
  MODIFY `resource_status_reason_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `resource_types`
--
ALTER TABLE `resource_types`
  MODIFY `resource_type_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `saved_reports`
--
ALTER TABLE `saved_reports`
  MODIFY `saved_report_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `terms_of_service`
--
ALTER TABLE `terms_of_service`
  MODIFY `terms_of_service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `time_blocks`
--
ALTER TABLE `time_blocks`
  MODIFY `block_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `user_preferences_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
  ADD CONSTRAINT `resources_ibfk_3` FOREIGN KEY (`resource_status_reason_id`) REFERENCES `resource_status_reasons` (`resource_status_reason_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `resources_ibfk_4` FOREIGN KEY (`resource_type_id`) REFERENCES `resource_types` (`resource_type_id`) ON DELETE SET NULL;

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
