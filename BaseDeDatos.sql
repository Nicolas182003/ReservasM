/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `citasmedica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `citasmedica`;

CREATE TABLE IF NOT EXISTS `appointments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `scheduled_date` date NOT NULL,
  `scheduled_time` time NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` bigint unsigned NOT NULL,
  `patient_id` bigint unsigned NOT NULL,
  `specialty_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointments_doctor_id_foreign` (`doctor_id`),
  KEY `appointments_patient_id_foreign` (`patient_id`),
  KEY `appointments_specialty_id_foreign` (`specialty_id`),
  CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointments_specialty_id_foreign` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `horarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `day` smallint unsigned NOT NULL,
  `active` tinyint(1) NOT NULL,
  `morning_start` time NOT NULL,
  `morning_end` time NOT NULL,
  `afternoon_start` time NOT NULL,
  `afternoon_end` time NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `horarios_user_id_foreign` (`user_id`),
  CONSTRAINT `horarios_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `horarios` (`id`, `day`, `active`, `morning_start`, `morning_end`, `afternoon_start`, `afternoon_end`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 0, 0, '08:00:00', '08:00:00', '14:00:00', '14:00:00', 54, '2023-12-04 02:20:51', '2023-12-04 02:20:51'),
	(2, 1, 1, '08:00:00', '10:00:00', '14:00:00', '18:30:00', 54, '2023-12-04 02:20:51', '2023-12-04 02:20:51'),
	(3, 2, 0, '08:00:00', '08:00:00', '14:00:00', '14:00:00', 54, '2023-12-04 02:20:51', '2023-12-04 02:20:51'),
	(4, 3, 0, '08:00:00', '08:00:00', '14:00:00', '14:00:00', 54, '2023-12-04 02:20:51', '2023-12-04 02:20:51'),
	(5, 4, 0, '08:00:00', '08:00:00', '14:00:00', '14:00:00', 54, '2023-12-04 02:20:51', '2023-12-04 02:20:51'),
	(6, 5, 0, '08:00:00', '08:00:00', '14:00:00', '14:00:00', 54, '2023-12-04 02:20:51', '2023-12-04 02:20:51'),
	(7, 6, 0, '08:00:00', '08:00:00', '14:00:00', '14:00:00', 54, '2023-12-04 02:20:51', '2023-12-04 02:20:51'),
	(8, 0, 0, '08:00:00', '08:00:00', '14:00:00', '14:00:00', 3, '2023-12-04 02:21:41', '2023-12-04 02:21:41'),
	(9, 1, 1, '08:00:00', '10:30:00', '14:00:00', '23:30:00', 3, '2023-12-04 02:21:41', '2023-12-04 02:21:41'),
	(10, 2, 0, '08:00:00', '08:00:00', '14:00:00', '14:00:00', 3, '2023-12-04 02:21:41', '2023-12-04 02:21:41'),
	(11, 3, 0, '08:00:00', '08:00:00', '14:00:00', '14:00:00', 3, '2023-12-04 02:21:41', '2023-12-04 02:21:41'),
	(12, 4, 0, '08:00:00', '08:00:00', '14:00:00', '14:00:00', 3, '2023-12-04 02:21:41', '2023-12-04 02:21:41'),
	(13, 5, 0, '08:00:00', '08:00:00', '14:00:00', '14:00:00', 3, '2023-12-04 02:21:41', '2023-12-04 02:21:41'),
	(14, 6, 0, '08:00:00', '08:00:00', '14:00:00', '14:00:00', 3, '2023-12-04 02:21:41', '2023-12-04 02:21:41');

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(79, '2014_10_12_000000_create_users_table', 1),
	(80, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(81, '2014_10_12_100000_create_password_resets_table', 1),
	(82, '2019_08_19_000000_create_failed_jobs_table', 1),
	(83, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(84, '2023_11_08_182105_create_specialties_table', 1),
	(85, '2023_11_14_012342_create_horarios_table', 1),
	(86, '2023_11_18_235149_create_specialty_user_table', 1),
	(87, '2023_12_03_184403_create_appointments_table', 1);

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `specialties` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `specialties` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Neurologia', NULL, '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(2, 'Peiatria', NULL, '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(3, 'Psiquiatra', NULL, '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(4, 'Dermatologo', NULL, '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(5, 'Kinesiologo', NULL, '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(6, 'Cardiologia', NULL, '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(7, 'Dermatologia', NULL, '2023-12-04 02:18:58', '2023-12-04 02:18:58');

CREATE TABLE IF NOT EXISTS `specialty_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `specialty_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `specialty_user_user_id_foreign` (`user_id`),
  KEY `specialty_user_specialty_id_foreign` (`specialty_id`),
  CONSTRAINT `specialty_user_specialty_id_foreign` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`) ON DELETE CASCADE,
  CONSTRAINT `specialty_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `specialty_user` (`id`, `user_id`, `specialty_id`, `created_at`, `updated_at`) VALUES
	(1, 3, 1, '2023-12-04 02:20:00', '2023-12-04 02:20:00'),
	(2, 3, 5, '2023-12-04 02:20:00', '2023-12-04 02:20:00'),
	(3, 54, 2, '2023-12-04 02:20:29', '2023-12-04 02:20:29'),
	(4, 54, 7, '2023-12-04 02:20:29', '2023-12-04 02:20:29');

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `cedula`, `address`, `phone`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Nicolas', 'nikolira2003@gmail.com', '2023-12-04 02:18:57', '$2y$12$nQ0CPJ9oZH5Ac2446xXYIOcxoxXMXAt5nAi3K/NJeu3a13oqEmsX.', '21434405-k', 'Pasaje Int. Lo boza', '950319731', 'admin', NULL, '2023-12-04 02:18:57', '2023-12-04 02:18:57'),
	(2, 'NicolasPaciente', 'paciente1@gmail.com', '2023-12-04 02:18:57', '$2y$12$u3c7PJ8YcQZy3gce3AqQ1eETi6utoINv8.uPS/f4Yr7hK9wxfmoLy', NULL, NULL, NULL, 'paciente', NULL, '2023-12-04 02:18:57', '2023-12-04 02:18:57'),
	(3, 'Medico1', 'Nikolira6@gmail.com', '2023-12-04 02:18:57', '$2y$12$WpJOt0zoxiIKY0bjptCTC.o/86wQELaEHmCYp68UWHQQa/Psjs.Ka', '2134567897', 'Interior Lo Boza 7084', '950319731', 'doctor', NULL, '2023-12-04 02:18:57', '2023-12-04 02:20:00'),
	(4, 'Chauncey Carroll PhD', 'hahn.giuseppe@example.net', '2023-12-04 02:18:57', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '71202046', '5511 Hilpert Mission\nWest Lance, WY 18188-6052', '(800) 651-3894', 'paciente', 'hbOAMH5CDm', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(5, 'Philip Harvey', 'winnifred14@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '83387806', '53591 Marquise Stream\nPort Carloland, SC 27996', '888.576.5235', 'paciente', 'VGaMvbRYDl', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(6, 'Gavin Ferry I', 'yasmeen.kirlin@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '37692880', '1337 Nolan Green\nWalkerport, CO 12611', '1-888-928-2431', 'doctor', 'Fks8muPCea', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(7, 'Nedra O\'Kon DVM', 'farrell.shanie@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '34638116', '4475 Delpha Stream\nLake Erikmouth, ME 33903-4967', '866.625.6993', 'doctor', 'fySOYB4Dwg', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(8, 'Elmira Little', 'carlee26@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '46043659', '7386 Murazik Views\nWest Clementineland, WV 78778', '866.393.7266', 'doctor', 'RHYwAuUL7U', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(9, 'Dr. Owen Vandervort PhD', 'deckow.libbie@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '99212862', '90463 Fahey River Suite 183\nEwaldmouth, TX 37054-7385', '855-789-7374', 'doctor', 'uMVmhPBlNV', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(10, 'Julio Schroeder', 'haag.melvin@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '33012462', '6061 Fritsch Mews Apt. 416\nKuhlmanborough, PA 66086', '866-216-0568', 'paciente', 'fjaigx6bBg', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(11, 'Korey Wolff', 'howell77@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '88989647', '30507 Feest Walks\nSouth Victoriaview, OR 31485-0378', '1-888-502-3289', 'paciente', 'cihIx6tsfB', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(12, 'Fleta Prohaska', 'udickens@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '30983866', '8811 Watsica Viaduct\nPort Elvie, OK 84750', '1-844-310-9187', 'paciente', 'P0AO9YS7uj', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(13, 'Ferne Toy', 'cayla.mcglynn@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '21807584', '96389 Margret Pine Suite 647\nDickimouth, DC 39533-4493', '(800) 706-7584', 'paciente', 'zrpg1OQ4F5', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(14, 'Everette Jacobi', 'mason68@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '86474346', '1831 Rossie Pines\nEast Guido, WY 06350-2604', '800-718-3019', 'doctor', 'zrkKUi4oEb', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(15, 'Chandler Kling', 'emard.edwina@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '38653191', '850 Victor Forge\nNorth Juwan, WY 17522', '1-800-355-5396', 'paciente', 'mCHkEr0uC4', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(16, 'Isobel Balistreri', 'qreinger@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '63249374', '8509 Skyla Via\nLake Caleighstad, ME 97500-6136', '877.726.9705', 'doctor', 'HGqaGRWNDb', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(17, 'Vickie Ebert', 'tessie.leannon@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '72181584', '1968 Cordia Station\nSchadenside, KS 16044-5579', '1-866-891-8645', 'paciente', 'efhVDmwM08', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(18, 'Miss Kiera Beer Jr.', 'mariela.lynch@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '24252413', '95054 Conner Wall Suite 981\nLake Chanelleberg, AR 37293', '(855) 494-4255', 'paciente', 'zOhTj3j6iy', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(19, 'Berta Baumbach', 'buckridge.collin@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '52120072', '479 Trace Burgs Suite 460\nElizabethview, HI 97972', '(877) 696-2668', 'doctor', 'nMU5CZGEHC', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(20, 'Holden Douglas', 'owalsh@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '50342900', '3115 Gleichner Station\nHarveyland, VA 59335-0708', '(844) 945-9753', 'doctor', 'TRpS1mWNaK', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(21, 'Emerald Dickens', 'bnitzsche@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '31651323', '88902 Oma River\nAftonfurt, WA 55038', '877.807.2305', 'paciente', 'gB6EULjmiR', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(22, 'Anjali Hilpert', 'dorthy.runolfsdottir@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '82774108', '4353 Douglas Creek Suite 344\nWest Lennaton, PA 52270', '(877) 388-9686', 'paciente', 'PYy4OBYi27', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(23, 'Sedrick Kerluke', 'zokuneva@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '21968808', '747 Volkman Rest\nBashirianfurt, MT 17237', '800-493-5866', 'paciente', 'vhjsMxqzrv', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(24, 'Garnet Kutch', 'eveline.mitchell@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '27729181', '1417 Conroy Expressway\nJacobimouth, CA 21841', '866.267.6539', 'doctor', 'TFiwY0u1z0', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(25, 'Dr. Tyra DuBuque', 'mallory.leuschke@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '91019907', '511 Eda Mission Suite 117\nNorth Joseph, OR 81476-5261', '1-877-486-3904', 'doctor', 'cTKzWTxKn0', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(26, 'Madge Huels V', 'kgoldner@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '48720787', '663 Rath Square\nFeeneyton, WI 61721', '877-638-3129', 'paciente', 'LfUw3vs8wU', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(27, 'Jessyca Greenfelder', 'adrain.gaylord@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '93365855', '955 Verona Shores\nEllsworthmouth, TN 72256-1018', '1-888-343-2423', 'doctor', 'lvSPyaa5nA', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(28, 'Liam Blanda', 'chaya.swift@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '31508831', '48118 Senger Station\nManteside, MI 23033-7905', '844.464.6028', 'doctor', 'Z9XBkwT7aN', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(29, 'Alia Connelly', 'clint.terry@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '26281984', '326 Rosella Dale\nYvonnefort, ID 89394', '1-855-831-6106', 'doctor', '3HnCuNZsyJ', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(30, 'Jillian Abbott', 'sandrine47@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '18011532', '1059 Adrian Shores Suite 942\nNew Cedrickmouth, LA 68091-5759', '1-855-697-3789', 'doctor', 'Biv1olzdni', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(31, 'Waino Keeling', 'gussie.dach@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '30442335', '2743 Dax Valleys\nJoannieland, ME 22261-3156', '888-283-7608', 'paciente', 'cM1NjvO2yu', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(32, 'Prof. Merle Fritsch', 'tweissnat@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '72075997', '98281 Maggio Lock\nWisokyborough, MS 85065', '866-317-2571', 'doctor', 'VqW8GmVLUu', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(33, 'Elton Terry', 'schiller.ayla@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '79812292', '499 Feil Key Suite 009\nCortezland, IL 22891-0953', '1-844-270-2732', 'paciente', 'eZf1Eq0UCI', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(34, 'Ms. Dolly Skiles MD', 'kaelyn.olson@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '71920701', '8714 Norval Estate\nLake Annabell, NY 45642', '800.294.8773', 'paciente', 'z3aKPZiOe8', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(35, 'Cornell Kuhlman', 'quitzon.ezekiel@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '77186909', '5637 Matilda Locks\nNorth Cedrick, MT 69319', '888-285-9263', 'paciente', '15L2Z4Iqbx', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(36, 'Jesus McClure', 'roselyn.sanford@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '92380872', '86477 O\'Kon Court Apt. 535\nJastton, SC 99186-8839', '800.661.5203', 'paciente', 'yaemlCXLLU', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(37, 'Ettie Nolan IV', 'ekulas@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '18804510', '520 Kuphal Lake\nLarsonmouth, NC 88443', '1-855-527-6048', 'doctor', '84ttvIWgTE', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(38, 'Elza Hansen Jr.', 'gulgowski.cayla@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '61164446', '7558 Amelie Lake Suite 778\nThelmatown, MS 53075-6001', '(877) 796-2046', 'paciente', 'LuUOxix3bO', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(39, 'Felix Kulas DVM', 'constantin.legros@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '43483474', '2158 Fritsch Fords\nLake Wilfridshire, KY 08019-1275', '800-767-5505', 'paciente', 'BewNbz4xc6', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(40, 'Roberto Homenick MD', 'agerhold@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '70960070', '261 Waelchi Land Suite 326\nNorth Mohammadview, DE 20652-9820', '866.867.1271', 'doctor', 'A0AC9qJKMg', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(41, 'Prof. Angela Altenwerth', 'neha39@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '90940318', '3550 Grady Rue Apt. 534\nMannburgh, AL 83661-6861', '888-915-1223', 'doctor', 'nUCVI93DsM', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(42, 'Mr. Enrico Abbott', 'ayana90@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '69095591', '561 Brandt Shoal\nHildegardstad, MN 25569', '877-549-8451', 'paciente', 'qCA77QfCnm', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(43, 'Antone Nitzsche', 'lois.stracke@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '54246060', '8440 Feil Avenue\nLake Unaview, MA 55788-3034', '1-800-712-0689', 'paciente', 'Bge0d4no4O', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(44, 'Fausto Shanahan', 'mohr.ashley@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '35625290', '56630 Leannon Mission Suite 778\nLandenmouth, IL 59483', '800-586-2311', 'doctor', 'pEGyDv0v3E', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(45, 'Michale Dach', 'lucious08@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '96606587', '99462 Abelardo Ferry Apt. 833\nAlexandraville, KS 88818-2479', '888.444.5383', 'doctor', 'qxU6qln4MV', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(46, 'Flo Gottlieb', 'ebba.heller@example.net', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '63285552', '85613 Toy Trace Apt. 093\nWest Ima, MN 70301', '(877) 729-5761', 'doctor', 'itUYCd27pf', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(47, 'Jodie Anderson', 'terry.rylee@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '55510661', '24187 Pearline Brook Apt. 299\nPort Haileyberg, OH 10244', '855-615-7770', 'paciente', 'KDzqq0Mamu', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(48, 'Amir Kuvalis', 'feest.ramon@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '65588865', '251 Kertzmann Crossroad\nKanefort, NC 58667-9311', '866-660-1469', 'doctor', 'MNHIxWWN8J', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(49, 'Alessandro Kohler', 'schumm.geovany@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '56368220', '137 Geraldine Mountain Suite 996\nNew Emanuelville, OH 26605', '800-399-4602', 'paciente', 'eaLobt443R', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(50, 'Sarina Wilkinson', 'ajones@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '41368276', '51277 Giovani Inlet\nNorth Nicolas, MT 21178-6187', '1-888-546-9853', 'paciente', 'dHEFEb4k9o', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(51, 'Mrs. Aubree Emard', 'ssipes@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '79191643', '781 Ibrahim Summit Suite 428\nEast Clair, NH 66893-8138', '866.751.4146', 'paciente', 'jmUHAP2he5', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(52, 'Berniece Schulist', 'tony.bartell@example.org', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '87897154', '77596 Cummings Ridge Apt. 802\nPort Edwardo, TN 41144', '800-319-9311', 'doctor', '67JL1kFpsj', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(53, 'Ms. Neoma Marquardt Sr.', 'cesar.abernathy@example.com', '2023-12-04 02:18:58', '$2y$12$RQiNc0rgUvCH1TQPOfiVROxncA/vXJRS8Dv62jX6O4Rjq2VjwVDYC', '47574768', '883 Simonis Trafficway\nSouth Sylvesterstad, IA 86465', '(800) 583-8034', 'doctor', 'j2jkVUmRxR', '2023-12-04 02:18:58', '2023-12-04 02:18:58'),
	(54, 'Medico2', 'medico2@gmail.com', NULL, '$2y$12$9W6mwKSoIf6V06GtSxLyjuHm1.Iv.YtNj35GAb8s1hcsBhJyKQqXS', '1234567890', 'Interior Lo Boza 7084', '950319731', 'doctor', NULL, '2023-12-04 02:20:29', '2023-12-04 02:20:29');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
