-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2022 a las 21:17:47
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jared_erp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `branch_name` varchar(45) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `card`
--

CREATE TABLE `card` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category_costs`
--

CREATE TABLE `category_costs` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `country_name` varchar(50) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono1` varchar(45) DEFAULT NULL,
  `telefono2` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `dui` varchar(45) DEFAULT NULL,
  `nit` varchar(45) DEFAULT NULL,
  `nrc` varchar(45) DEFAULT NULL,
  `exento` tinyint(4) DEFAULT NULL,
  `ultima_compra` datetime DEFAULT NULL,
  `limite_credito` decimal(11,4) DEFAULT NULL,
  `subsidiary_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `department`
--

CREATE TABLE `department` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_dpto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `may_dpto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cod_dpto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `department`
--

INSERT INTO `department` (`id`, `department_name`, `min_dpto`, `may_dpto`, `cod_dpto`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Ahuachapán', 'Ahuachapan', 'AHUACHAPAN', '01', NULL, NULL, NULL),
(2, 'Santa Ana', 'Santa Ana', 'SANTA ANA', '02', NULL, NULL, NULL),
(3, 'Sonsonate', 'Sonsonate', 'SONSONATE', '03', NULL, NULL, NULL),
(4, 'Chalatenango', 'Chalatenango', 'CHALATENANGO', '04', NULL, NULL, NULL),
(5, 'La Libertad', 'La Libertad', 'LA LIBERTAD', '05', NULL, NULL, NULL),
(6, 'San Salvador', 'San Salvador', 'SAN SALVADOR', '06', NULL, NULL, NULL),
(7, 'Cuscatlán', 'Cuscatlan', 'CUSCATLAN', '07', NULL, NULL, NULL),
(8, 'La Paz', 'La Paz', 'LA PAZ', '08', NULL, NULL, NULL),
(9, 'Cabañas', 'Cabañas', 'CABAÑAS', '09', NULL, NULL, NULL),
(10, 'San Vicente', 'San Vicente', 'SAN VICENTE', '10', NULL, NULL, NULL),
(11, 'Usulután', 'Usulutan', 'USULUTAN', '11', NULL, NULL, NULL),
(12, 'San Miguel', 'San Miguel', 'SAN MIGUEL', '12', NULL, NULL, NULL),
(13, 'Morazán', 'Morazan', 'MORAZAN', '13', NULL, NULL, NULL),
(14, 'La Unión', 'La Union', 'LA UNION', '14', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `details_costs_estimated`
--

CREATE TABLE `details_costs_estimated` (
  `id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `month` datetime DEFAULT NULL,
  `value` double DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `estimated_costs_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `details_costs_real`
--

CREATE TABLE `details_costs_real` (
  `id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `month` datetime DEFAULT NULL,
  `value` double DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `real_costs_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `details_products_tickets`
--

CREATE TABLE `details_products_tickets` (
  `id` int(11) NOT NULL,
  `ticket_customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `details_purchase`
--

CREATE TABLE `details_purchase` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `iva` double DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `names` varchar(45) DEFAULT NULL,
  `last_names` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `direction` varchar(100) DEFAULT NULL,
  `dui` varchar(45) DEFAULT NULL,
  `nit` varchar(45) DEFAULT NULL,
  `civil_status` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `subsidiary_id` int(11) NOT NULL,
  `municipalities_id` bigint(20) UNSIGNED NOT NULL,
  `commission` float DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `labor_departments_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estimate`
--

CREATE TABLE `estimate` (
  `id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estimated_costs`
--

CREATE TABLE `estimated_costs` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `estimate_id` int(11) NOT NULL,
  `category_costs_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipo_comprobante` varchar(45) DEFAULT NULL,
  `numero_comprobante` varchar(45) DEFAULT NULL,
  `operacion` varchar(45) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `entrada` tinyint(4) DEFAULT NULL,
  `salida` tinyint(4) DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `details_purchase_id` int(11) DEFAULT NULL,
  `sale_details_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `labor_departments`
--

CREATE TABLE `labor_departments` (
  `id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_01_19_162001_create_permission_tables', 1),
(6, '2022_01_19_182351_create_jobs_table', 1),
(7, '2022_01_19_201232_create_departments_table', 1),
(8, '2022_01_20_000823_create_municipalities_table', 1),
(9, '2022_03_22_140126_create_logs_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipalities`
--

CREATE TABLE `municipalities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `municipality_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mun_min` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mun_may` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dm_cod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cod_mun` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `municipalities`
--

INSERT INTO `municipalities` (`id`, `municipality_name`, `mun_min`, `mun_may`, `dm_cod`, `cod_mun`, `department_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Ahuachapán', 'Ahuachapan', 'AHUACHAPAN', '0101', '01', 1, NULL, NULL, NULL),
(2, 'Tepecoyo', 'Tepecoyo', 'TEPECOYO', '0521', '21', 5, NULL, NULL, NULL),
(3, 'San Lorenzo', 'San Lorenzo', 'SAN LORENZO', '0109', '09', 1, NULL, NULL, NULL),
(4, 'San Salvador', 'San Salvador', 'SAN SALVADOR', '0614', '14', 6, NULL, NULL, NULL),
(5, 'San Francisco Menéndez', 'San Francisco Menendez', 'SAN FRANCISCO MENENDEZ', '0108', '08', 1, NULL, NULL, NULL),
(6, 'Panchimalco', 'Panchimalco', 'PANCHIMALCO', '0610', '10', 6, NULL, NULL, NULL),
(7, 'Soyapango', 'Soyapango', 'SOYAPANGO', '0617', '17', 6, NULL, NULL, NULL),
(8, 'Citalá', 'Citala', 'CITALA', '0404', '04', 4, NULL, NULL, NULL),
(9, 'San Marcos', 'San Marcos', 'SAN MARCOS', '0612', '12', 6, NULL, NULL, NULL),
(10, 'San Pedro Puxtla', 'San Pedro Puxtla', 'SAN PEDRO PUXTLA', '0110', '10', 1, NULL, NULL, NULL),
(11, 'Apaneca', 'Apaneca', 'APANECA', '0102', '02', 1, NULL, NULL, NULL),
(12, 'San Martín', 'San Martin', 'SAN MARTIN', '0613', '13', 6, NULL, NULL, NULL),
(13, 'Concepción de Ataco', 'Concepcion de Ataco', 'CONCEPCION DE ATACO', '0104', '04', 1, NULL, NULL, NULL),
(14, 'Tacuba', 'Tacuba', 'TACUBA', '0111', '11', 1, NULL, NULL, NULL),
(15, 'La Reina', 'La Reina', 'LA REINA', '0413', '13', 4, NULL, NULL, NULL),
(16, 'Cojutepeque', 'Cojutepeque', 'COJUTEPEQUE', '0702', '02', 7, NULL, NULL, NULL),
(17, 'Talnique', 'Talnique', 'TALNIQUE', '0519', '19', 5, NULL, NULL, NULL),
(18, 'Tamanique', 'Tamanique', 'TAMANIQUE', '0518', '18', 5, NULL, NULL, NULL),
(19, 'Cuisnahuat', 'Cuisnahuat', 'CUISNAHUAT', '0304', '04', 3, NULL, NULL, NULL),
(20, 'Santa Isabel Ishuatán', 'Santa Isabel Ishuatan', 'SANTA ISABEL ISHUATAN', '0305', '05', 3, NULL, NULL, NULL),
(21, 'Santiago Texacuangos', 'Santiago Texacuangos', 'SANTIAGO TEXACUANGOS', '0615', '15', 6, NULL, NULL, NULL),
(22, 'Ciudad Delgado', 'Ciudad Delgado', 'CIUDAD DELGADO', '0619', '19', 6, NULL, NULL, NULL),
(23, 'Guaymango', 'Guaymango', 'GUAYMANGO', '0106', '06', 1, NULL, NULL, NULL),
(24, 'Apopa', 'Apopa', 'APOPA', '0602', '02', 6, NULL, NULL, NULL),
(25, 'Santo Tomás', 'Santo Tomas', 'SANTO TOMAS', '0616', '16', 6, NULL, NULL, NULL),
(26, 'Atiquizaya', 'Atiquizaya', 'ATIQUIZAYA', '0103', '03', 1, NULL, NULL, NULL),
(27, 'Rosario de Mora', 'Rosario de Mora', 'ROSARIO DE MORA', '0611', '11', 6, NULL, NULL, NULL),
(28, 'El Refugio', 'El Refugio', 'EL REFUGIO', '0105', '05', 1, NULL, NULL, NULL),
(29, 'Ilopango', 'Ilopango', 'ILOPANGO', '0607', '07', 6, NULL, NULL, NULL),
(30, 'Mejicanos', 'Mejicanos', 'MEJICANOS', '0608', '08', 6, NULL, NULL, NULL),
(31, 'San José Guayabal', 'San Jose Guayabal', 'SAN JOSE GUAYABAL', '0709', '09', 7, NULL, NULL, NULL),
(32, 'El Carmen', 'El Carmen', 'EL CARMEN', '0703', '03', 7, NULL, NULL, NULL),
(33, 'Tenancingo', 'Tenancingo', 'TENANCINGO', '0716', '16', 7, NULL, NULL, NULL),
(34, 'Monte San Juan', 'Monte San Juan', 'MONTE SAN JUAN', '0705', '05', 7, NULL, NULL, NULL),
(35, 'Sonsonate', 'Sonsonate', 'SONSONATE', '0315', '15', 3, NULL, NULL, NULL),
(36, 'Chalchuapa', 'Chalchuapa', 'CHALCHUAPA', '0203', '03', 2, NULL, NULL, NULL),
(37, 'Jujutla', 'Jujutla', 'JUJUTLA', '0107', '07', 1, NULL, NULL, NULL),
(38, 'San Sebastián Salitrillo', 'San Sebastian Salitrillo', 'SAN SEBASTIAN SALITRILLO', '0209', '09', 2, NULL, NULL, NULL),
(39, 'San Bartolomé Perulapía', 'San Bartolome Perulapia', 'SAN BARTOLOME PERULAPIA', '0707', '07', 7, NULL, NULL, NULL),
(40, 'Nueva Trinidad', 'Nueva Trinidad', 'NUEVA TRINIDAD', '0417', '17', 4, NULL, NULL, NULL),
(41, 'San Francisco Lempa', 'San Francisco Lempa', 'SAN FRANCISCO LEMPA', '0423', '23', 4, NULL, NULL, NULL),
(42, 'Arcatao', 'Arcatao', 'ARCATAO', '0402', '02', 4, NULL, NULL, NULL),
(43, 'Colón', 'Colon', 'COLON', '0503', '03', 5, NULL, NULL, NULL),
(44, 'San Isidro', 'San Isidro', 'SAN ISIDRO', '0905', '05', 9, NULL, NULL, NULL),
(45, 'Berlín', 'Berlin', 'BERLIN', '1102', '02', 11, NULL, NULL, NULL),
(46, 'Cuscatancingo', 'Cuscatancingo', 'CUSCATANCINGO', '0604', '04', 6, NULL, NULL, NULL),
(47, 'Tapalhuaca', 'Tapalhuaca', 'TAPALHUACA', '0820', '20', 8, NULL, NULL, NULL),
(48, 'Ayutuxtepeque', 'Ayutuxtepeque', 'AYUTUXTEPEQUE', '0603', '03', 6, NULL, NULL, NULL),
(49, 'San Antonio Pajonal', 'San Antonio Pajonal', 'SAN ANTONIO PAJONAL', '0208', '08', 2, NULL, NULL, NULL),
(50, 'El Paraíso', 'El Paraiso', 'EL PARAISO', '0410', '10', 4, NULL, NULL, NULL),
(51, 'Candelaria', 'Candelaria', 'CANDELARIA', '0701', '01', 7, NULL, NULL, NULL),
(52, 'Guazapa', 'Guazapa', 'GUAZAPA', '0606', '06', 6, NULL, NULL, NULL),
(53, 'Dulce Nombre de María', 'Dulce Nombre de Maria', 'DULCE NOMBRE DE MARIA', '0408', '08', 4, NULL, NULL, NULL),
(54, 'Armenia', 'Armenia', 'ARMENIA', '0302', '02', 3, NULL, NULL, NULL),
(55, 'Ereguayquín', 'Ereguayquin', 'EREGUAYQUIN', '1106', '06', 11, NULL, NULL, NULL),
(56, 'San Agustín', 'San Agustin', 'SAN AGUSTIN', '1115', '15', 11, NULL, NULL, NULL),
(57, 'Concepción Batres', 'Concepcion Batres', 'CONCEPCION BATRES', '1104', '04', 11, NULL, NULL, NULL),
(58, 'La Unión', 'La Union', 'LA UNION', '1408', '08', 14, NULL, NULL, NULL),
(59, 'Santiago de María', 'Santiago de Maria', 'SANTIAGO DE MARIA', '1121', '21', 11, NULL, NULL, NULL),
(60, 'San Buena Ventura', 'San Buena Ventura', 'SAN BUENA VENTURA', '1116', '16', 11, NULL, NULL, NULL),
(61, 'Coatepeque', 'Coatepeque', 'COATEPEQUE', '0202', '02', 2, NULL, NULL, NULL),
(62, 'San Isidro Labrador', 'San Isidro Labrador', 'SAN ISIDRO LABRADOR', '0426', '26', 4, NULL, NULL, NULL),
(63, 'Turín', 'Turin', 'TURIN', '0112', '12', 1, NULL, NULL, NULL),
(64, 'Candelaria de la Frontera', 'Candelaria de la Frontera', 'CANDELARIA DE LA FRONTERA', '0201', '01', 2, NULL, NULL, NULL),
(65, 'Potonico', 'Potonico', 'POTONICO', '0419', '19', 4, NULL, NULL, NULL),
(66, 'Nejapa', 'Nejapa', 'NEJAPA', '0609', '09', 6, NULL, NULL, NULL),
(67, 'Tonacatepeque', 'Tonacatepeque', 'TONACATEPEQUE', '0618', '18', 6, NULL, NULL, NULL),
(68, 'El Porvenir', 'El Porvenir', 'EL PORVENIR', '0205', '05', 2, NULL, NULL, NULL),
(69, 'El Paisnal', 'El Paisnal', 'EL PAISNAL', '0605', '05', 6, NULL, NULL, NULL),
(70, 'Masahuat', 'Masahuat', 'MASAHUAT', '0206', '06', 2, NULL, NULL, NULL),
(71, 'San Cristóbal', 'San Cristobal', 'SAN CRISTOBAL', '0708', '08', 7, NULL, NULL, NULL),
(72, 'San Ramón', 'San Ramon', 'SAN RAMON', '0712', '12', 7, NULL, NULL, NULL),
(73, 'La Libertad', 'La Libertad', 'LA LIBERTAD', '0509', '09', 5, NULL, NULL, NULL),
(74, 'Oratorio de Concepción', 'Oratorio de Concepcion', 'ORATORIO DE CONCEPCION', '0706', '06', 7, NULL, NULL, NULL),
(75, 'El Congo', 'El Congo', 'EL CONGO', '0204', '04', 2, NULL, NULL, NULL),
(76, 'Santa María Ostuma', 'Santa Maria Ostuma', 'SANTA MARIA OSTUMA', '0818', '18', 8, NULL, NULL, NULL),
(77, 'Chalatenango', 'Chalatenango', 'CHALATENANGO', '0407', '07', 4, NULL, NULL, NULL),
(78, 'Tepetitán', 'Tepetitan', 'TEPETITAN', '1012', '12', 10, NULL, NULL, NULL),
(79, 'Nahuizalco', 'Nahuizalco', 'NAHUIZALCO', '0308', '08', 3, NULL, NULL, NULL),
(80, 'El Rosario', 'El Rosario', 'EL ROSARIO', '0704', '04', 7, NULL, NULL, NULL),
(81, 'Santa Cruz Analquito', 'Santa Cruz Analquito', 'SANTA CRUZ ANALQUITO', '0713', '13', 7, NULL, NULL, NULL),
(82, 'Santa Cruz Michapa', 'Santa Cruz Michapa', 'SANTA CRUZ MICHAPA', '0714', '14', 7, NULL, NULL, NULL),
(83, 'Metapán', 'Metapan', 'METAPAN', '0207', '07', 2, NULL, NULL, NULL),
(84, 'San Rafael Cedros', 'San Rafael Cedros', 'SAN RAFAEL CEDROS', '0711', '11', 7, NULL, NULL, NULL),
(85, 'Zaragoza', 'Zaragoza', 'ZARAGOZA', '0522', '22', 5, NULL, NULL, NULL),
(86, 'Cacaopera', 'Cacaopera', 'CACAOPERA', '1302', '02', 13, NULL, NULL, NULL),
(87, 'San Rafael', 'San Rafael', 'SAN RAFAEL', '0431', '31', 4, NULL, NULL, NULL),
(88, 'Santa Rosa Guachipilín', 'Santa Rosa Guachipilin', 'SANTA ROSA GUACHIPILIN', '0211', '11', 2, NULL, NULL, NULL),
(89, 'Santiago de la Frontera', 'Santiago de la Frontera', 'SANTIAGO DE LA FRONTERA', '0212', '12', 2, NULL, NULL, NULL),
(90, 'Texistepeque', 'Texistepeque', 'TEXISTEPEQUE', '0213', '13', 2, NULL, NULL, NULL),
(91, 'Santa Ana', 'Santa Ana', 'SANTA ANA', '0210', '10', 2, NULL, NULL, NULL),
(92, 'Acajutla', 'Acajutla', 'ACAJUTLA', '0301', '01', 3, NULL, NULL, NULL),
(93, 'Caluco', 'Caluco', 'CALUCO', '0303', '03', 3, NULL, NULL, NULL),
(94, 'La Laguna', 'La Laguna', 'LA LAGUNA', '0411', '11', 4, NULL, NULL, NULL),
(95, 'Chiltiupán', 'Chiltiupan', 'CHILTIUPAN', '0505', '05', 5, NULL, NULL, NULL),
(96, 'Nuevo Cuscatlán', 'Nuevo Cuscatlan', 'NUEVO CUSCATLAN', '0510', '10', 5, NULL, NULL, NULL),
(97, 'Izalco', 'Izalco', 'IZALCO', '0306', '06', 3, NULL, NULL, NULL),
(98, 'Juayúa', 'Juayua', 'JUAYUA', '0307', '07', 3, NULL, NULL, NULL),
(99, 'Jayaque', 'Jayaque', 'JAYAQUE', '0507', '07', 5, NULL, NULL, NULL),
(100, 'Tejutla', 'Tejutla', 'TEJUTLA', '0433', '33', 4, NULL, NULL, NULL),
(101, 'Azacualpa', 'Azacualpa', 'AZACUALPA', '0403', '03', 4, NULL, NULL, NULL),
(102, 'El Carrizal', 'El Carrizal', 'EL CARRIZAL', '0409', '09', 4, NULL, NULL, NULL),
(103, 'San Juan Opico', 'San Juan Opico', 'SAN JUAN OPICO', '0515', '15', 5, NULL, NULL, NULL),
(104, 'Santa Tecla', 'Santa Tecla', 'SANTA TECLA', '0511', '11', 5, NULL, NULL, NULL),
(105, 'Comasagua', 'Comasagua', 'COMASAGUA', '0504', '04', 5, NULL, NULL, NULL),
(106, 'El Rosario', 'El Rosario', 'EL ROSARIO', '0802', '02', 8, NULL, NULL, NULL),
(107, 'Sonzacate', 'Sonzacate', 'SONZACATE', '0316', '16', 3, NULL, NULL, NULL),
(108, 'San José', 'San Jose', 'SAN JOSE', '1415', '15', 14, NULL, NULL, NULL),
(109, 'Meanguera del Golfo', 'Meanguera del Golfo', 'MEANGUERA DEL GOLFO', '1410', '10', 14, NULL, NULL, NULL),
(110, 'El Sauce', 'El Sauce', 'EL SAUCE', '1406', '06', 14, NULL, NULL, NULL),
(111, 'Antiguo Cuscatlán', 'Antiguo Cuscatlan', 'ANTIGUO CUSCATLAN', '0501', '01', 5, NULL, NULL, NULL),
(112, 'San Antonio', 'San Antonio', 'SAN ANTONIO', '1213', '13', 12, NULL, NULL, NULL),
(113, 'Nombre de Jesús', 'Nombre de Jesus', 'NOMBRE DE JESUS', '0415', '15', 4, NULL, NULL, NULL),
(114, 'Sacacoyo', 'Sacacoyo', 'SACACOYO', '0513', '13', 5, NULL, NULL, NULL),
(115, 'San Antonio Masahuat', 'San Antonio Masahuat', 'SAN ANTONIO MASAHUAT', '0807', '07', 8, NULL, NULL, NULL),
(116, 'San Emigdio', 'San Emigdio', 'SAN EMIGDIO', '0808', '08', 8, NULL, NULL, NULL),
(117, 'Nueva Concepción', 'Nueva Concepcion', 'NUEVA CONCEPCION', '0416', '16', 4, NULL, NULL, NULL),
(118, 'Las Flores', 'Las Flores', 'LAS FLORES', '0428', '28', 4, NULL, NULL, NULL),
(119, 'San Francisco Morazán', 'San Francisco Morazan', 'SAN FRANCISCO MORAZAN', '0424', '24', 4, NULL, NULL, NULL),
(120, 'La Palma', 'La Palma', 'LA PALMA', '0412', '12', 4, NULL, NULL, NULL),
(121, 'Agua Caliente', 'Agua Caliente', 'AGUA CALIENTE', '0401', '01', 4, NULL, NULL, NULL),
(122, 'Concepción Quezaltepeque', 'Concepcion Quezaltepeque', 'CONCEPCION QUEZALTEPEQUE', '0406', '06', 4, NULL, NULL, NULL),
(123, 'San Fernando', 'San Fernando', 'SAN FERNANDO', '0422', '22', 4, NULL, NULL, NULL),
(124, 'Cancasque', 'Cancasque', 'CANCASQUE', '0427', '27', 4, NULL, NULL, NULL),
(125, 'San Miguel de Mercedes', 'San Miguel de Mercedes', 'SAN MIGUEL DE MERCEDES', '0430', '30', 4, NULL, NULL, NULL),
(126, 'San Francisco Chinameca', 'San Francisco Chinameca', 'SAN FRANCISCO CHINAMECA', '0809', '09', 8, NULL, NULL, NULL),
(127, 'Comalapa', 'Comalapa', 'COMALAPA', '0405', '05', 4, NULL, NULL, NULL),
(128, 'Bolívar', 'Bolivar', 'BOLIVAR', '1402', '02', 14, NULL, NULL, NULL),
(129, 'San Luis del Carmen', 'San Luis del Carmen', 'SAN LUIS DEL CARMEN', '0429', '29', 4, NULL, NULL, NULL),
(130, 'Ciudad Arce', 'Ciudad Arce', 'CIUDAD ARCE', '0502', '02', 5, NULL, NULL, NULL),
(131, 'Zacatecoluca', 'Zacatecoluca', 'ZACATECOLUCA', '0821', '21', 8, NULL, NULL, NULL),
(132, 'San Luis La Herradura', 'San Luis la Herradura', 'SAN LUIS LA HERRADURA', '0822', '22', 8, NULL, NULL, NULL),
(133, 'San Rafael Obrajuelo', 'San Rafael Obrajuelo', 'SAN RAFAEL OBRAJUELO', '0817', '17', 8, NULL, NULL, NULL),
(134, 'San Ildefonso', 'San Ildefonso', 'SAN ILDEFONSO', '1007', '07', 10, NULL, NULL, NULL),
(135, 'San Juan Nonualco', 'San Juan Nonualco', 'SAN JUAN NONUALCO', '0810', '10', 8, NULL, NULL, NULL),
(136, 'Yayantique', 'Yayantique', 'YAYANTIQUE', '1417', '17', 14, NULL, NULL, NULL),
(137, 'Teotepeque', 'Teotepeque', 'TEOTEPEQUE', '0520', '20', 5, NULL, NULL, NULL),
(138, 'San Cayetano Istepeque', 'San Cayetano Istepeque', 'SAN CAYETANO ISTEPEQUE', '1003', '03', 10, NULL, NULL, NULL),
(139, 'Quezaltepeque', 'Quezaltepeque', 'QUEZALTEPEQUE', '0512', '12', 5, NULL, NULL, NULL),
(140, 'San Matías', 'San Matias', 'SAN MATIAS', '0516', '16', 5, NULL, NULL, NULL),
(141, 'Santa Clara', 'Santa Clara', 'SANTA CLARA', '1004', '04', 10, NULL, NULL, NULL),
(142, 'San Pablo Tacachico', 'San Pablo Tacachico', 'SAN PABLO TACACHICO', '0517', '17', 5, NULL, NULL, NULL),
(143, 'San Luis Talpa', 'San Luis Talpa', 'SAN LUIS TALPA', '0813', '13', 8, NULL, NULL, NULL),
(144, 'Santiago Nonualco', 'Santiago Nonualco', 'SANTIAGO NONUALCO', '0819', '19', 8, NULL, NULL, NULL),
(145, 'Paraíso de Osorio', 'Paraiso de Osorio', 'PARAISO DE OSORIO', '0806', '06', 8, NULL, NULL, NULL),
(146, 'San Sebastián', 'San Sebastian', 'SAN SEBASTIAN', '1009', '09', 10, NULL, NULL, NULL),
(147, 'Olocuilta', 'Olocuilta', 'OLOCUILTA', '0805', '05', 8, NULL, NULL, NULL),
(148, 'Usulután', 'Usulutan', 'USULUTAN', '1123', '23', 11, NULL, NULL, NULL),
(149, 'Jucuarán', 'Jucuaran', 'JUCUARAN', '1110', '10', 11, NULL, NULL, NULL),
(150, 'San Juan Talpa', 'San Juan Talpa', 'SAN JUAN TALPA', '0811', '11', 8, NULL, NULL, NULL),
(151, 'San Pedro Masahuat', 'San Pedro Masahuat', 'SAN PEDRO MASAHUAT', '0815', '15', 8, NULL, NULL, NULL),
(152, 'San Miguel Tepezontes', 'San Miguel Tepezontes', 'SAN MIGUEL TEPEZONTES', '0814', '14', 8, NULL, NULL, NULL),
(153, 'Mercedes La Ceiba', 'Mercedes la Ceiba', 'MERCEDES LA CEIBA', '0804', '04', 8, NULL, NULL, NULL),
(154, 'Cuyultitán', 'Cuyultitan', 'CUYULTITAN', '0801', '01', 8, NULL, NULL, NULL),
(155, 'Tejutepeque', 'Tejutepeque', 'TEJUTEPEQUE', '0907', '07', 9, NULL, NULL, NULL),
(156, 'San Jorge', 'San Jorge', 'SAN JORGE', '1215', '15', 12, NULL, NULL, NULL),
(157, 'Ilobasco', 'Ilobasco', 'ILOBASCO', '0903', '03', 9, NULL, NULL, NULL),
(158, 'Cinquera', 'Cinquera', 'CINQUERA', '0901', '01', 9, NULL, NULL, NULL),
(159, 'Victoria', 'Victoria', 'VICTORIA', '0908', '08', 9, NULL, NULL, NULL),
(160, 'Chapeltique', 'Chapeltique', 'CHAPELTIQUE', '1204', '04', 12, NULL, NULL, NULL),
(161, 'Dolores', 'Dolores', 'DOLORES', '0909', '09', 9, NULL, NULL, NULL),
(162, 'Santa Elena', 'Santa Elena', 'SANTA ELENA', '1118', '18', 11, NULL, NULL, NULL),
(163, 'Santa María', 'Santa Maria', 'SANTA MARIA', '1120', '20', 11, NULL, NULL, NULL),
(164, 'Apastepeque', 'Apastepeque', 'APASTEPEQUE', '1001', '01', 10, NULL, NULL, NULL),
(165, 'San Vicente', 'San Vicente', 'SAN VICENTE', '1010', '10', 10, NULL, NULL, NULL),
(166, 'Tecoluca', 'Tecoluca', 'TECOLUCA', '1011', '11', 10, NULL, NULL, NULL),
(167, 'Guadalupe', 'Guadalupe', 'GUADALUPE', '1002', '02', 10, NULL, NULL, NULL),
(168, 'Santo Domingo', 'Santo Domingo', 'SANTO DOMINGO', '1005', '05', 10, NULL, NULL, NULL),
(169, 'San Lorenzo', 'San Lorenzo', 'SAN LORENZO', '1008', '08', 10, NULL, NULL, NULL),
(170, 'Jiquilisco', 'Jiquilisco', 'JIQUILISCO', '1108', '08', 11, NULL, NULL, NULL),
(171, 'Puerto El Triunfo', 'Puerto el Triunfo', 'PUERTO EL TRIUNFO', '1114', '14', 11, NULL, NULL, NULL),
(172, 'Ozatlán', 'Ozatlan', 'OZATLAN', '1113', '13', 11, NULL, NULL, NULL),
(173, 'San Francisco Javier', 'San Francisco Javier', 'SAN FRANCISCO JAVIER', '1119', '19', 11, NULL, NULL, NULL),
(174, 'San Gerardo', 'San Gerardo', 'SAN GERARDO', '1214', '14', 12, NULL, NULL, NULL),
(175, 'Comacarán', 'Comacaran', 'COMACARAN', '1203', '03', 12, NULL, NULL, NULL),
(176, 'Uluazapa', 'Uluazapa', 'ULUAZAPA', '1220', '20', 12, NULL, NULL, NULL),
(177, 'Sensembra', 'Sensembra', 'SENSEMBRA', '1322', '22', 13, NULL, NULL, NULL),
(178, 'Tecapán', 'Tecapan', 'TECAPAN', '1122', '22', 11, NULL, NULL, NULL),
(179, 'Yoloaiquín', 'Yoloaiquin', 'YOLOAIQUIN', '1326', '26', 13, NULL, NULL, NULL),
(180, 'Alegría', 'Alegria', 'ALEGRIA', '1101', '01', 11, NULL, NULL, NULL),
(181, 'Quelepa', 'Quelepa', 'QUELEPA', '1212', '12', 12, NULL, NULL, NULL),
(182, 'Nuevo Edén de San Juan', 'Nuevo Eden de San Juan', 'NUEVO EDEN DE SAN JUAN', '1211', '11', 12, NULL, NULL, NULL),
(183, 'San Luis de la Reina', 'San Luis de la Reina', 'SAN LUIS DE LA REINA', '1216', '16', 12, NULL, NULL, NULL),
(184, 'Carolina', 'Carolina', 'CAROLINA', '1201', '01', 12, NULL, NULL, NULL),
(185, 'Lolotique', 'Lolotique', 'LOLOTIQUE', '1208', '08', 12, NULL, NULL, NULL),
(186, 'Chilanga', 'Chilanga', 'CHILANGA', '1304', '04', 13, NULL, NULL, NULL),
(187, 'Sociedad', 'Sociedad', 'SOCIEDAD', '1323', '23', 13, NULL, NULL, NULL),
(188, 'Corinto', 'Corinto', 'CORINTO', '1303', '03', 13, NULL, NULL, NULL),
(189, 'San Rafael Oriente', 'San Rafael Oriente', 'SAN RAFAEL ORIENTE', '1218', '18', 12, NULL, NULL, NULL),
(190, 'Ciudad Barrios', 'Ciudad Barrios', 'CIUDAD BARRIOS', '1202', '02', 12, NULL, NULL, NULL),
(191, 'Moncagua', 'Moncagua', 'MONCAGUA', '1209', '09', 12, NULL, NULL, NULL),
(192, 'Torola', 'Torola', 'TOROLA', '1324', '24', 13, NULL, NULL, NULL),
(193, 'Chinameca', 'Chinameca', 'CHINAMECA', '1205', '05', 12, NULL, NULL, NULL),
(194, 'Nueva Guadalupe', 'Nueva Guadalupe', 'NUEVA GUADALUPE', '1210', '10', 12, NULL, NULL, NULL),
(195, 'Perquín', 'Perquin', 'PERQUIN', '1316', '16', 13, NULL, NULL, NULL),
(196, 'Lolotiquillo', 'Lolotiquillo', 'LOLOTIQUILLO', '1313', '13', 13, NULL, NULL, NULL),
(197, 'San Simón', 'San Simon', 'SAN SIMON', '1321', '21', 13, NULL, NULL, NULL),
(198, 'San Isidro', 'San Isidro', 'SAN ISIDRO', '1320', '20', 13, NULL, NULL, NULL),
(199, 'San Carlos', 'San Carlos', 'SAN CARLOS', '1317', '17', 13, NULL, NULL, NULL),
(200, 'El Divisadero', 'El Divisadero', 'EL DIVISADERO', '1306', '06', 13, NULL, NULL, NULL),
(201, 'Osicala', 'Osicala', 'OSICALA', '1315', '15', 13, NULL, NULL, NULL),
(202, 'Delicias de Concepción', 'Delicias de Concepcion', 'DELICIAS DE CONCEPCION', '1305', '05', 13, NULL, NULL, NULL),
(203, 'Intipucá', 'Intipuca', 'INTIPUCA', '1407', '07', 14, NULL, NULL, NULL),
(204, 'Pasaquina', 'Pasaquina', 'PASAQUINA', '1412', '12', 14, NULL, NULL, NULL),
(205, 'San Alejo', 'San Alejo', 'SAN ALEJO', '1414', '14', 14, NULL, NULL, NULL),
(206, 'Santa Rosa de Lima', 'Santa Rosa de Lima', 'SANTA ROSA DE LIMA', '1416', '16', 14, NULL, NULL, NULL),
(207, 'Yucuaiquín', 'Yucuaiquin', 'YUCUAIQUIN', '1418', '18', 14, NULL, NULL, NULL),
(208, 'Anamorós', 'Anamoros', 'ANAMOROS', '1401', '01', 14, NULL, NULL, NULL),
(209, 'Concepción de Oriente', 'Concepcion de Oriente', 'CONCEPCION DE ORIENTE', '1403', '03', 14, NULL, NULL, NULL),
(210, 'Nueva Esparta', 'Nueva Esparta', 'NUEVA ESPARTA', '1411', '11', 14, NULL, NULL, NULL),
(211, 'Lislique', 'Lislique', 'LISLIQUE', '1409', '09', 14, NULL, NULL, NULL),
(212, 'Polorós', 'Poloros', 'POLOROS', '1413', '13', 14, NULL, NULL, NULL),
(213, 'Aguilares', 'Aguilares', 'AGUILARES', '0601', '01', 6, NULL, NULL, NULL),
(214, 'Jicalapa', 'Jicalapa', 'JICALAPA', '0508', '08', 5, NULL, NULL, NULL),
(215, 'Huizúcar', 'Huizucar', 'HUIZUCAR', '0506', '06', 5, NULL, NULL, NULL),
(216, 'San Pedro Nonualco', 'San Pedro Nonualco', 'SAN PEDRO NONUALCO', '0816', '16', 8, NULL, NULL, NULL),
(217, 'San Ignacio', 'San Ignacio', 'SAN IGNACIO', '0425', '25', 4, NULL, NULL, NULL),
(218, 'San Pedro Perulapán', 'San Pedro Perulapan', 'SAN PEDRO PERULAPAN', '0710', '10', 7, NULL, NULL, NULL),
(219, 'Suchitoto', 'Suchitoto', 'SUCHITOTO', '0715', '15', 7, NULL, NULL, NULL),
(220, 'Nahulingo', 'Nahulingo', 'NAHULINGO', '0309', '09', 3, NULL, NULL, NULL),
(221, 'Salcoatitán', 'Salcoatitan', 'SALCOATITAN', '0310', '10', 3, NULL, NULL, NULL),
(222, 'San Antonio del Monte', 'San Antonio del Monte', 'SAN ANTONIO DEL MONTE', '0311', '11', 3, NULL, NULL, NULL),
(223, 'San Julián', 'San Julian', 'SAN JULIAN', '0312', '12', 3, NULL, NULL, NULL),
(224, 'Santa Catarina Masahuat', 'Santa Catarina Masahuat', 'SANTA CATARINA MASAHUAT', '0313', '13', 3, NULL, NULL, NULL),
(225, '#N/D', 'Santo Domingo de Guzman', 'SANTO DOMINGO DE GUZMAN', '0314', '14', 3, NULL, NULL, NULL),
(226, 'San Juan Tepezontes', 'San Juan Tepezontes', 'SAN JUAN TEPEZONTES', '0812', '12', 8, NULL, NULL, NULL),
(227, 'San José Villanueva', 'San Jose Villanueva', 'SAN JOSE VILLANUEVA', '0514', '14', 5, NULL, NULL, NULL),
(228, 'San Dionisio', 'San Dionisio', 'SAN DIONISIO', '1117', '17', 11, NULL, NULL, NULL),
(229, 'Santa Rita', 'Santa Rita', 'SANTA RITA', '0432', '32', 4, NULL, NULL, NULL),
(230, 'San Antonio Los Ranchos', 'San Antonio los Ranchos', 'SAN ANTONIO LOS RANCHOS', '0421', '21', 4, NULL, NULL, NULL),
(231, 'Las Vueltas', 'Las Vueltas', 'LAS VUELTAS', '0414', '14', 4, NULL, NULL, NULL),
(232, 'San Antonio de la Cruz', 'San Antonio de la Cruz', 'SAN ANTONIO DE LA CRUZ', '0420', '20', 4, NULL, NULL, NULL),
(233, 'Ojos de Agua', 'Ojos de Agua', 'OJOS DE AGUA', '0418', '18', 4, NULL, NULL, NULL),
(234, 'Verapaz', 'Verapaz', 'VERAPAZ', '1013', '13', 10, NULL, NULL, NULL),
(235, 'Joateca', 'Joateca', 'JOATECA', '1310', '10', 13, NULL, NULL, NULL),
(236, 'Jerusalén', 'Jerusalen', 'JERUSALEN', '0803', '03', 8, NULL, NULL, NULL),
(237, 'San Esteban Catarina', 'San Esteban Catarina', 'SAN ESTEBAN CATARINA', '1006', '06', 10, NULL, NULL, NULL),
(238, 'El Carmen', 'El Carmen', 'EL CARMEN', '1405', '05', 14, NULL, NULL, NULL),
(239, 'Guacotecti', 'Guacotecti', 'GUACOTECTI', '0902', '02', 9, NULL, NULL, NULL),
(240, 'Jutiapa', 'Jutiapa', 'JUTIAPA', '0904', '04', 9, NULL, NULL, NULL),
(241, 'El Triunfo', 'El Triunfo', 'EL TRIUNFO', '1105', '05', 11, NULL, NULL, NULL),
(242, 'California', 'California', 'CALIFORNIA', '1103', '03', 11, NULL, NULL, NULL),
(243, 'Gualococti', 'Gualococti', 'GUALOCOCTI', '1308', '08', 13, NULL, NULL, NULL),
(244, 'Conchagua', 'Conchagua', 'CONCHAGUA', '1404', '04', 14, NULL, NULL, NULL),
(245, 'Yamabal', 'Yamabal', 'YAMABAL', '1325', '25', 13, NULL, NULL, NULL),
(246, 'Jucuapa', 'Jucuapa', 'JUCUAPA', '1109', '09', 11, NULL, NULL, NULL),
(247, 'Nueva Granada', 'Nueva Granada', 'NUEVA GRANADA', '1112', '12', 11, NULL, NULL, NULL),
(248, 'Mercedes Umaña', 'Mercedes Umaña', 'MERCEDES UMAÑA', '1111', '11', 11, NULL, NULL, NULL),
(249, 'Estanzuelas', 'Estanzuelas', 'ESTANZUELAS', '1107', '07', 11, NULL, NULL, NULL),
(250, 'Guatajiagua', 'Guatajiagua', 'GUATAJIAGUA', '1309', '09', 13, NULL, NULL, NULL),
(251, 'Chirilagua', 'Chirilagua', 'CHIRILAGUA', '1206', '06', 12, NULL, NULL, NULL),
(252, 'El Tránsito', 'El Transito', 'EL TRANSITO', '1207', '07', 12, NULL, NULL, NULL),
(253, 'Sesori', 'Sesori', 'SESORI', '1219', '19', 12, NULL, NULL, NULL),
(254, 'San Miguel', 'San Miguel', 'SAN MIGUEL', '1217', '17', 12, NULL, NULL, NULL),
(255, 'San Francisco Gotera', 'San Francisco Gotera', 'SAN FRANCISCO GOTERA', '1319', '19', 13, NULL, NULL, NULL),
(256, 'El Rosario', 'El Rosario', 'EL ROSARIO', '1307', '07', 13, NULL, NULL, NULL),
(257, 'Arambala', 'Arambala', 'ARAMBALA', '1301', '01', 13, NULL, NULL, NULL),
(258, 'Jocoaitique', 'Jocoaitique', 'JOCOAITIQUE', '1311', '11', 13, NULL, NULL, NULL),
(259, 'Jocoro', 'Jocoro', 'JOCORO', '1312', '12', 13, NULL, NULL, NULL),
(260, 'Meanguera', 'Meanguera', 'MEANGUERA', '1314', '14', 13, NULL, NULL, NULL),
(261, 'San Fernando', 'San Fernando', 'SAN FERNANDO', '1318', '18', 13, NULL, NULL, NULL),
(262, 'Sensuntepeque', 'Sensuntepeque', 'SENSUNTEPEQUE', '0906', '06', 9, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `position_name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentation`
--

CREATE TABLE `presentation` (
  `id` int(11) NOT NULL,
  `presentation_name` varchar(50) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `price_quotation`
--

CREATE TABLE `price_quotation` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `saludo_inicial` text DEFAULT NULL,
  `validez` text DEFAULT NULL,
  `credito` text DEFAULT NULL,
  `saludo_final` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `price_quotation_details`
--

CREATE TABLE `price_quotation_details` (
  `id` int(11) NOT NULL,
  `price_quotation_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `bar_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `presentation_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `unit_per_presentation` int(11) DEFAULT NULL,
  `iva` tinyint(4) DEFAULT NULL,
  `cesc` tinyint(4) DEFAULT NULL,
  `service` tinyint(4) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `serie` tinyint(4) DEFAULT NULL,
  `excento` tinyint(4) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_details_transfer`
--

CREATE TABLE `product_details_transfer` (
  `id` int(11) NOT NULL,
  `product_transfer_id` int(11) NOT NULL,
  `stocktaking_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `sub_total_detalle` double DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_transfer`
--

CREATE TABLE `product_transfer` (
  `id` int(11) NOT NULL,
  `subsidiary_id_origen` int(11) NOT NULL,
  `subsidiary_id_destino` int(11) NOT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `fecha_recepcion` datetime DEFAULT NULL,
  `employee_id_envia` int(11) NOT NULL,
  `employee_id_recibe` int(11) NOT NULL,
  `orden_number` varchar(10) DEFAULT NULL,
  `state_transfer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `total` float DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `transaction_number` varchar(45) DEFAULT NULL,
  `credit_days` int(11) DEFAULT NULL,
  `pagado` tinyint(4) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `subsidiary_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `real_costs`
--

CREATE TABLE `real_costs` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `estimate_id` int(11) NOT NULL,
  `category_costs_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'web', '2022-05-12 02:11:42', '2022-05-12 02:11:42'),
(2, 'Usuario', 'web', '2022-05-12 02:11:42', '2022-05-12 02:11:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale`
--

CREATE TABLE `sale` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `tipo_comprobante` varchar(45) DEFAULT NULL,
  `numero_comprobante` varchar(45) DEFAULT NULL,
  `fecha_venta` datetime DEFAULT NULL,
  `iva` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `subsidiary_id` int(11) NOT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `dias_credito` int(11) DEFAULT NULL,
  `pagado` tinyint(4) DEFAULT NULL,
  `retencion` double DEFAULT NULL,
  `price_quotation_id` int(11) DEFAULT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale_details`
--

CREATE TABLE `sale_details` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `stocktaking_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_venta` double DEFAULT NULL,
  `iva` double DEFAULT NULL,
  `cesc` double DEFAULT NULL,
  `exento` double DEFAULT NULL,
  `total_detalle` double DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `costo_compra` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state_ticket`
--

CREATE TABLE `state_ticket` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state_transfer`
--

CREATE TABLE `state_transfer` (
  `id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL COMMENT 'Campo donde se maneja el estado del envio, En proceso, Orden recibida, etc.',
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stocktaking`
--

CREATE TABLE `stocktaking` (
  `id` int(11) NOT NULL,
  `details_purchase_id` int(11) NOT NULL,
  `costo_compra` double DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `precio_publico` double DEFAULT NULL,
  `precio_mayoreo` double DEFAULT NULL,
  `precio_costo` double DEFAULT NULL,
  `fecha_registro` double DEFAULT NULL,
  `precio_ultimo` double DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subsidiary`
--

CREATE TABLE `subsidiary` (
  `id` int(11) NOT NULL,
  `municipalities_id` bigint(20) UNSIGNED NOT NULL,
  `subsidiary_name` varchar(50) DEFAULT NULL,
  `nrc` varchar(45) DEFAULT NULL,
  `nit` varchar(45) DEFAULT NULL,
  `direction` varchar(100) DEFAULT NULL,
  `giro` varchar(45) DEFAULT NULL,
  `number_phone` varchar(45) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `nit` varchar(45) DEFAULT NULL,
  `nrc` varchar(45) DEFAULT NULL,
  `supplier_name` varchar(100) DEFAULT NULL,
  `supplier_phone` varchar(45) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `salesman_name` varchar(45) DEFAULT NULL,
  `salesman_phone_number` varchar(45) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_customer`
--

CREATE TABLE `ticket_customer` (
  `id` int(11) NOT NULL,
  `date_register` datetime DEFAULT NULL,
  `state_ticket_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `resolution_date` datetime DEFAULT NULL,
  `employee_id_resolution_case` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL COMMENT 'Contado o Credito.',
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dui` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `dui`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Leonel', 'Lopez', '12345678-1', 'leonellopez647@gmail.com', '2022-05-12 02:11:42', '$2y$10$UL.rM416bctJqHcKlC5qSO9qNy4Ca60Og/ZYb0w1fw3GdfhkjaFoy', NULL, '2022-05-12 02:11:42', '2022-05-12 02:11:42'),
(2, 'Leonel', 'Lopez', '12345678-2', 'lopezleonel191@gmail.com', '2022-05-12 02:11:42', '$2y$10$JaT/pUjSZADonvbxPblAX.7ivk0Ep/IBiXVwjgblV3m7AzGsuv0gu', NULL, '2022-05-12 02:11:42', '2022-05-12 02:11:42'),
(3, 'William', 'admin', '02475605-7', 'admin@gmail.com', '2022-05-12 02:11:42', '$2y$10$3y4ObyOxUYkN3yjUaZkIcuBvlfKO2B.2yuGD7e7ZQceSJ39a4dcRu', NULL, '2022-05-12 02:11:42', '2022-05-12 02:11:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `year`
--

CREATE TABLE `year` (
  `id` int(11) NOT NULL,
  `value` varchar(10) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `category_costs`
--
ALTER TABLE `category_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_subsidiary1_idx` (`subsidiary_id`);

--
-- Indices de la tabla `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `details_costs_estimated`
--
ALTER TABLE `details_costs_estimated`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_details_costs_estimated_estimated_costs1_idx` (`estimated_costs_id`);

--
-- Indices de la tabla `details_costs_real`
--
ALTER TABLE `details_costs_real`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_details_costs_real_real_costs1_idx` (`real_costs_id`);

--
-- Indices de la tabla `details_products_tickets`
--
ALTER TABLE `details_products_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_details_products_tickets_ticket_customer1_idx` (`ticket_customer_id`),
  ADD KEY `fk_details_products_tickets_product1_idx` (`product_id`);

--
-- Indices de la tabla `details_purchase`
--
ALTER TABLE `details_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_purchase_purchase1_idx` (`purchase_id`),
  ADD KEY `fk_details_purchase_product1_idx` (`product_id`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_employee_position1_idx` (`position_id`),
  ADD KEY `fk_employee_subsidiary1_idx` (`subsidiary_id`),
  ADD KEY `fk_employee_municipalities1_idx` (`municipalities_id`),
  ADD KEY `fk_employee_labor_departments1_idx` (`labor_departments_id`);

--
-- Indices de la tabla `estimate`
--
ALTER TABLE `estimate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estimate_year1_idx` (`year_id`);

--
-- Indices de la tabla `estimated_costs`
--
ALTER TABLE `estimated_costs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estimated_costs_estimate1_idx` (`estimate_id`),
  ADD KEY `fk_estimated_costs_category_costs1_idx` (`category_costs_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kardex_details_purchase1_idx` (`details_purchase_id`),
  ADD KEY `fk_kardex_sale_details1_idx` (`sale_details_id`);

--
-- Indices de la tabla `labor_departments`
--
ALTER TABLE `labor_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `municipalities`
--
ALTER TABLE `municipalities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `municipalities_department_id_foreign` (`department_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `presentation`
--
ALTER TABLE `presentation`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `price_quotation`
--
ALTER TABLE `price_quotation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_price_quotation_customer1_idx` (`customer_id`);

--
-- Indices de la tabla `price_quotation_details`
--
ALTER TABLE `price_quotation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_price_quotation_details_price_quotation1_idx` (`price_quotation_id`),
  ADD KEY `fk_price_quotation_details_product1_idx` (`product_id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_supplier1_idx` (`supplier_id`),
  ADD KEY `fk_product_category1_idx` (`category_id`),
  ADD KEY `fk_product_presentation1_idx` (`presentation_id`),
  ADD KEY `fk_product_branch1_idx` (`branch_id`);

--
-- Indices de la tabla `product_details_transfer`
--
ALTER TABLE `product_details_transfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_details_transfer_product_transfer1_idx` (`product_transfer_id`),
  ADD KEY `fk_product_details_transfer_stocktaking1_idx` (`stocktaking_id`);

--
-- Indices de la tabla `product_transfer`
--
ALTER TABLE `product_transfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_transfer_subsidiary1_idx` (`subsidiary_id_origen`),
  ADD KEY `fk_product_transfer_subsidiary2_idx` (`subsidiary_id_destino`),
  ADD KEY `fk_product_transfer_employee1_idx` (`employee_id_envia`),
  ADD KEY `fk_product_transfer_employee2_idx` (`employee_id_recibe`),
  ADD KEY `fk_product_transfer_state_transfer1_idx` (`state_transfer_id`);

--
-- Indices de la tabla `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_purchase_supplier1_idx` (`supplier_id`),
  ADD KEY `fk_purchase_employee1_idx` (`employee_id`),
  ADD KEY `fk_purchase_subsidiary1_idx` (`subsidiary_id`),
  ADD KEY `fk_purchase_type1_idx` (`type_id`);

--
-- Indices de la tabla `real_costs`
--
ALTER TABLE `real_costs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_real_costs_estimate1_idx` (`estimate_id`),
  ADD KEY `fk_real_costs_category_costs1_idx` (`category_costs_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sale_customer1_idx` (`customer_id`),
  ADD KEY `fk_sale_employee1_idx` (`employee_id`),
  ADD KEY `fk_sale_subsidiary1_idx` (`subsidiary_id`),
  ADD KEY `fk_sale_price_quotation1_idx` (`price_quotation_id`),
  ADD KEY `fk_sale_type1_idx` (`type_id`);

--
-- Indices de la tabla `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sale_details_sale1_idx` (`sale_id`),
  ADD KEY `fk_sale_details_stocktaking1_idx` (`stocktaking_id`);

--
-- Indices de la tabla `state_ticket`
--
ALTER TABLE `state_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `state_transfer`
--
ALTER TABLE `state_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `stocktaking`
--
ALTER TABLE `stocktaking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stocktaking_details_purchase1_idx` (`details_purchase_id`);

--
-- Indices de la tabla `subsidiary`
--
ALTER TABLE `subsidiary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_subsidiary_municipalities1_idx` (`municipalities_id`);

--
-- Indices de la tabla `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ticket_customer`
--
ALTER TABLE `ticket_customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ticket_customer_state_ticket1_idx` (`state_ticket_id`),
  ADD KEY `fk_ticket_customer_customer1_idx` (`customer_id`),
  ADD KEY `fk_ticket_customer_employee1_idx` (`employee_id_resolution_case`);

--
-- Indices de la tabla `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_dui_unique` (`dui`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `year`
--
ALTER TABLE `year`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `card`
--
ALTER TABLE `card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `category_costs`
--
ALTER TABLE `category_costs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `department`
--
ALTER TABLE `department`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `details_costs_estimated`
--
ALTER TABLE `details_costs_estimated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `details_costs_real`
--
ALTER TABLE `details_costs_real`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `details_products_tickets`
--
ALTER TABLE `details_products_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `details_purchase`
--
ALTER TABLE `details_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estimate`
--
ALTER TABLE `estimate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estimated_costs`
--
ALTER TABLE `estimated_costs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `labor_departments`
--
ALTER TABLE `labor_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `municipalities`
--
ALTER TABLE `municipalities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presentation`
--
ALTER TABLE `presentation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `price_quotation`
--
ALTER TABLE `price_quotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `price_quotation_details`
--
ALTER TABLE `price_quotation_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_details_transfer`
--
ALTER TABLE `product_details_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_transfer`
--
ALTER TABLE `product_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `real_costs`
--
ALTER TABLE `real_costs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `state_ticket`
--
ALTER TABLE `state_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `state_transfer`
--
ALTER TABLE `state_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `stocktaking`
--
ALTER TABLE `stocktaking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subsidiary`
--
ALTER TABLE `subsidiary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ticket_customer`
--
ALTER TABLE `ticket_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `year`
--
ALTER TABLE `year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer_subsidiary1` FOREIGN KEY (`subsidiary_id`) REFERENCES `subsidiary` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `details_costs_estimated`
--
ALTER TABLE `details_costs_estimated`
  ADD CONSTRAINT `fk_details_costs_estimated_estimated_costs1` FOREIGN KEY (`estimated_costs_id`) REFERENCES `estimated_costs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `details_costs_real`
--
ALTER TABLE `details_costs_real`
  ADD CONSTRAINT `fk_details_costs_real_real_costs1` FOREIGN KEY (`real_costs_id`) REFERENCES `real_costs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `details_products_tickets`
--
ALTER TABLE `details_products_tickets`
  ADD CONSTRAINT `fk_details_products_tickets_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_details_products_tickets_ticket_customer1` FOREIGN KEY (`ticket_customer_id`) REFERENCES `ticket_customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `details_purchase`
--
ALTER TABLE `details_purchase`
  ADD CONSTRAINT `fk_details_purchase_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_purchase_purchase1` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employee_labor_departments1` FOREIGN KEY (`labor_departments_id`) REFERENCES `labor_departments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employee_municipalities1` FOREIGN KEY (`municipalities_id`) REFERENCES `municipalities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employee_position1` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employee_subsidiary1` FOREIGN KEY (`subsidiary_id`) REFERENCES `subsidiary` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estimate`
--
ALTER TABLE `estimate`
  ADD CONSTRAINT `fk_estimate_year1` FOREIGN KEY (`year_id`) REFERENCES `year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estimated_costs`
--
ALTER TABLE `estimated_costs`
  ADD CONSTRAINT `fk_estimated_costs_category_costs1` FOREIGN KEY (`category_costs_id`) REFERENCES `category_costs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estimated_costs_estimate1` FOREIGN KEY (`estimate_id`) REFERENCES `estimate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `fk_kardex_details_purchase1` FOREIGN KEY (`details_purchase_id`) REFERENCES `details_purchase` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kardex_sale_details1` FOREIGN KEY (`sale_details_id`) REFERENCES `sale_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `municipalities`
--
ALTER TABLE `municipalities`
  ADD CONSTRAINT `municipalities_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);

--
-- Filtros para la tabla `price_quotation`
--
ALTER TABLE `price_quotation`
  ADD CONSTRAINT `fk_price_quotation_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `price_quotation_details`
--
ALTER TABLE `price_quotation_details`
  ADD CONSTRAINT `fk_price_quotation_details_price_quotation1` FOREIGN KEY (`price_quotation_id`) REFERENCES `price_quotation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_price_quotation_details_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_branch1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_presentation1` FOREIGN KEY (`presentation_id`) REFERENCES `presentation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `product_details_transfer`
--
ALTER TABLE `product_details_transfer`
  ADD CONSTRAINT `fk_product_details_transfer_product_transfer1` FOREIGN KEY (`product_transfer_id`) REFERENCES `product_transfer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_details_transfer_stocktaking1` FOREIGN KEY (`stocktaking_id`) REFERENCES `stocktaking` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `product_transfer`
--
ALTER TABLE `product_transfer`
  ADD CONSTRAINT `fk_product_transfer_employee1` FOREIGN KEY (`employee_id_envia`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_transfer_employee2` FOREIGN KEY (`employee_id_recibe`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_transfer_state_transfer1` FOREIGN KEY (`state_transfer_id`) REFERENCES `state_transfer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_transfer_subsidiary1` FOREIGN KEY (`subsidiary_id_origen`) REFERENCES `subsidiary` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_transfer_subsidiary2` FOREIGN KEY (`subsidiary_id_destino`) REFERENCES `subsidiary` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `fk_purchase_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_purchase_subsidiary1` FOREIGN KEY (`subsidiary_id`) REFERENCES `subsidiary` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_purchase_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_purchase_type1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `real_costs`
--
ALTER TABLE `real_costs`
  ADD CONSTRAINT `fk_real_costs_category_costs1` FOREIGN KEY (`category_costs_id`) REFERENCES `category_costs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_real_costs_estimate1` FOREIGN KEY (`estimate_id`) REFERENCES `estimate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `fk_sale_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sale_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sale_price_quotation1` FOREIGN KEY (`price_quotation_id`) REFERENCES `price_quotation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sale_subsidiary1` FOREIGN KEY (`subsidiary_id`) REFERENCES `subsidiary` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sale_type1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sale_details`
--
ALTER TABLE `sale_details`
  ADD CONSTRAINT `fk_sale_details_sale1` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sale_details_stocktaking1` FOREIGN KEY (`stocktaking_id`) REFERENCES `stocktaking` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `stocktaking`
--
ALTER TABLE `stocktaking`
  ADD CONSTRAINT `fk_stocktaking_details_purchase1` FOREIGN KEY (`details_purchase_id`) REFERENCES `details_purchase` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `subsidiary`
--
ALTER TABLE `subsidiary`
  ADD CONSTRAINT `fk_subsidiary_municipalities1` FOREIGN KEY (`municipalities_id`) REFERENCES `municipalities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ticket_customer`
--
ALTER TABLE `ticket_customer`
  ADD CONSTRAINT `fk_ticket_customer_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_customer_employee1` FOREIGN KEY (`employee_id_resolution_case`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_customer_state_ticket1` FOREIGN KEY (`state_ticket_id`) REFERENCES `state_ticket` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
