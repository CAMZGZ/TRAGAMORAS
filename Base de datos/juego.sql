-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.0.3-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para juego
CREATE DATABASE IF NOT EXISTS `juego` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `juego`;

-- Volcando estructura para tabla juego.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla juego.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla juego.imagenes
CREATE TABLE IF NOT EXISTS `imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruta` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla juego.imagenes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla juego.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla juego.migrations: ~4 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- Volcando estructura para tabla juego.movimientos
CREATE TABLE IF NOT EXISTS `movimientos` (
  `id` uuid NOT NULL DEFAULT uuid(),
  `tarjeta_id` varchar(25) DEFAULT NULL,
  `monto` varchar(25) DEFAULT NULL,
  `tipo_movimiento_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_movimientos_tipo_movimientos` (`tipo_movimiento_id`),
  KEY `fk_movimiento_tarjeta` (`tarjeta_id`),
  CONSTRAINT `fk_movimientos_tipo_movimientos` FOREIGN KEY (`tipo_movimiento_id`) REFERENCES `tipo_movimientos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla juego.movimientos: ~0 rows (aproximadamente)
INSERT INTO `movimientos` (`id`, `tarjeta_id`, `monto`, `tipo_movimiento_id`, `created_at`) VALUES
	('ddb1cefa-8353-11ee-ab8f-98e7432a5ed6', '2', '1000', 1, '2023-11-15 01:10:53');

-- Volcando estructura para tabla juego.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla juego.password_reset_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla juego.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla juego.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla juego.rfids
CREATE TABLE IF NOT EXISTS `rfids` (
  `id` uuid DEFAULT uuid(),
  `nombre` varchar(50) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `creditos` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla juego.rfids: ~0 rows (aproximadamente)

-- Volcando estructura para tabla juego.tarjetas
CREATE TABLE IF NOT EXISTS `tarjetas` (
  `id` uuid NOT NULL DEFAULT uuid(),
  `nombre` varchar(50) DEFAULT NULL,
  `creditos` float DEFAULT 0,
  `numero` varchar(16) DEFAULT NULL,
  `estatus` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla juego.tarjetas: ~0 rows (aproximadamente)
INSERT INTO `tarjetas` (`id`, `nombre`, `creditos`, `numero`, `estatus`) VALUES
	('a81f7a87-8356-11ee-ab8f-98e7432a5ed6', 'CArlos', 1000, '1243657890325489', '1');

-- Volcando estructura para tabla juego.tarjets
CREATE TABLE IF NOT EXISTS `tarjets` (
  `id` uuid DEFAULT uuid(),
  `numero` varchar(17) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `creditos` varchar(50) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla juego.tarjets: ~0 rows (aproximadamente)
INSERT INTO `tarjets` (`id`, `numero`, `nombre`, `creditos`) VALUES
	('690a329a-8357-11ee-ab8f-98e7432a5ed6', '123454678', 'Carlos', '0');

-- Volcando estructura para tabla juego.tipo_movimientos
CREATE TABLE IF NOT EXISTS `tipo_movimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) DEFAULT NULL,
  `estatus` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla juego.tipo_movimientos: ~0 rows (aproximadamente)
INSERT INTO `tipo_movimientos` (`id`, `nombre`, `estatus`) VALUES
	(1, 'aumentar', 1);

-- Volcando estructura para tabla juego.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla juego.users: ~0 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Carlos Alberto Martínez Gómez', 'l19590343@sjuanrio.tecnm.mx', NULL, '$2y$12$DeTCPrTdGJXKL6ALl1vkUelny4YiBjSsjs2Xyc7Y98O0o3BkwMXwa', NULL, '2023-11-15 04:57:48', '2023-11-15 04:57:48');

-- Volcando estructura para tabla juego.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` varchar(25) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `creditos` float NOT NULL DEFAULT 0,
  `estatus` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla juego.usuario: ~0 rows (aproximadamente)
INSERT INTO `usuario` (`id`, `nombre`, `creditos`, `estatus`) VALUES
	('1', 'administrador', 0, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
