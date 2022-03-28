-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.23 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for tassu
CREATE DATABASE IF NOT EXISTS `tassu` /*!40100 DEFAULT CHARACTER SET ucs2 COLLATE ucs2_slovak_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tassu`;

-- Dumping structure for table tassu.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id_country` int NOT NULL AUTO_INCREMENT,
  `country_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_is_0900_ai_ci NOT NULL,
  `country_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_is_0900_ai_ci NOT NULL,
  `population` int unsigned DEFAULT NULL,
  `area_sq_mi` int unsigned DEFAULT NULL,
  `pop_density_per_sq_mi` float unsigned DEFAULT NULL,
  `infant_mortality_per_1000_births` float unsigned DEFAULT NULL,
  `gdp_per_capita` int unsigned DEFAULT NULL,
  `literacy` float unsigned DEFAULT NULL,
  `phones_per_1000` float unsigned DEFAULT NULL,
  `birthrate` float unsigned DEFAULT NULL,
  `deathrate` float unsigned DEFAULT NULL,
  PRIMARY KEY (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_is_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tassu.demographics
CREATE TABLE IF NOT EXISTS `demographics` (
  `id_demografic` int NOT NULL AUTO_INCREMENT,
  `id_country` int NOT NULL,
  `age_group_0_14` float DEFAULT NULL,
  `age_group_15_24` float DEFAULT NULL,
  `age_group_25_49` float DEFAULT NULL,
  `age_group_50_64` float DEFAULT NULL,
  `age_group_65_79` float DEFAULT NULL,
  `age_group_80_` float DEFAULT NULL,
  PRIMARY KEY (`id_demografic`),
  KEY `FK_demographics_countries` (`id_country`),
  CONSTRAINT `FK_demographics_countries` FOREIGN KEY (`id_country`) REFERENCES `countries` (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=ucs2 COLLATE=ucs2_slovak_ci;

-- Data exporting was unselected.

-- Dumping structure for table tassu.hospitalizations
CREATE TABLE IF NOT EXISTS `hospitalizations` (
  `id_hospitalization` int NOT NULL AUTO_INCREMENT,
  `id_region` int NOT NULL,
  `hospitalized` int DEFAULT NULL,
  `recovered` int DEFAULT NULL,
  `deaths` int DEFAULT NULL,
  `gender` enum('F','M') CHARACTER SET ucs2 COLLATE ucs2_slovak_ci DEFAULT NULL,
  `age_group` text CHARACTER SET ucs2 COLLATE ucs2_slovak_ci,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_hospitalization`),
  KEY `FK_hospitalizations_regions` (`id_region`) USING BTREE,
  CONSTRAINT `FK_hospitalizations_regions` FOREIGN KEY (`id_region`) REFERENCES `regions` (`id_region`)
) ENGINE=InnoDB AUTO_INCREMENT=1573864 DEFAULT CHARSET=ucs2 COLLATE=ucs2_slovak_ci;

-- Data exporting was unselected.

-- Dumping structure for table tassu.hospitalizations_details
CREATE TABLE IF NOT EXISTS `hospitalizations_details` (
  `id_hospitalizations_details` int NOT NULL AUTO_INCREMENT,
  `id_hospitalization` int NOT NULL DEFAULT '0',
  `no_symptoms` int DEFAULT NULL,
  `state_easy` int DEFAULT NULL,
  `state_medium` int DEFAULT NULL,
  `state_heavy` int DEFAULT NULL,
  `intensive_care` int DEFAULT NULL,
  `oxygen` int DEFAULT NULL,
  `hfno` int DEFAULT NULL,
  `lung_ventilation` int DEFAULT NULL,
  `ecmo` int DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_hospitalizations_details`),
  KEY `FK_hospitalizations_details_hospitalizations` (`id_hospitalization`),
  CONSTRAINT `FK_hospitalizations_details_hospitalizations` FOREIGN KEY (`id_hospitalization`) REFERENCES `hospitalizations` (`id_hospitalization`)
) ENGINE=InnoDB AUTO_INCREMENT=786421 DEFAULT CHARSET=ucs2 COLLATE=ucs2_slovak_ci;

-- Data exporting was unselected.

-- Dumping structure for table tassu.regions
CREATE TABLE IF NOT EXISTS `regions` (
  `id_region` int NOT NULL AUTO_INCREMENT,
  `id_country` int NOT NULL DEFAULT '0',
  `region_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_is_0900_ai_ci NOT NULL,
  `region_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_is_0900_ai_ci,
  PRIMARY KEY (`id_region`),
  KEY `FK__countries` (`id_country`),
  CONSTRAINT `FK__countries` FOREIGN KEY (`id_country`) REFERENCES `countries` (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=41895 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_is_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tassu.temperatures
CREATE TABLE IF NOT EXISTS `temperatures` (
  `id_temperature` int NOT NULL AUTO_INCREMENT,
  `id_country` int DEFAULT NULL,
  `january` float DEFAULT NULL,
  `february` float DEFAULT NULL,
  `march` float DEFAULT NULL,
  `april` float DEFAULT NULL,
  `may` float DEFAULT NULL,
  `june` float DEFAULT NULL,
  `july` float DEFAULT NULL,
  `august` float DEFAULT NULL,
  `september` float DEFAULT NULL,
  `october` float DEFAULT NULL,
  `november` float DEFAULT NULL,
  `december` float DEFAULT NULL,
  PRIMARY KEY (`id_temperature`),
  KEY `FK_temperatures_countries` (`id_country`),
  CONSTRAINT `FK_temperatures_countries` FOREIGN KEY (`id_country`) REFERENCES `countries` (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=ucs2 COLLATE=ucs2_slovak_ci;

-- Data exporting was unselected.

-- Dumping structure for table tassu.testing
CREATE TABLE IF NOT EXISTS `testing` (
  `id_testing` int NOT NULL AUTO_INCREMENT,
  `id_region` int NOT NULL,
  `cases_per_day` int DEFAULT NULL,
  `cases_cumulative` int DEFAULT NULL,
  `tests_per_day` int DEFAULT NULL,
  `AG_total_per_day` int DEFAULT NULL,
  `PCR_total_per_day` int DEFAULT NULL,
  `PCR_positive_per_day` int DEFAULT NULL,
  `AG_positive_per_day` int DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_testing`),
  KEY `FK_testing_regions` (`id_region`),
  CONSTRAINT `FK_testing_regions` FOREIGN KEY (`id_region`) REFERENCES `regions` (`id_region`)
) ENGINE=InnoDB AUTO_INCREMENT=87159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_is_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tassu.tests_details
CREATE TABLE IF NOT EXISTS `tests_details` (
  `id_tests_details` int NOT NULL AUTO_INCREMENT,
  `id_testing` int NOT NULL DEFAULT '0',
  `ag_pos_sympt` int DEFAULT NULL,
  `ag_pos_asympt` int DEFAULT NULL,
  `pcr_pos_sympt` int DEFAULT NULL,
  `pcr_pos_asympt` int DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tests_details`),
  KEY `FK_tests_details_testing` (`id_testing`),
  CONSTRAINT `FK_tests_details_testing` FOREIGN KEY (`id_testing`) REFERENCES `testing` (`id_testing`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=ucs2 COLLATE=ucs2_slovak_ci;

-- Data exporting was unselected.

-- Dumping structure for table tassu.vaccinations
CREATE TABLE IF NOT EXISTS `vaccinations` (
  `id_vaccination` int NOT NULL AUTO_INCREMENT,
  `id_region` int NOT NULL,
  `id_vaccine` int DEFAULT NULL,
  `vaccinated_cumulative` int DEFAULT NULL,
  `fully_vaccinated_cumulative` int DEFAULT NULL,
  `new_vaccination` int DEFAULT NULL,
  `age_group` text COLLATE ucs2_slovak_ci,
  `first_dose` int DEFAULT NULL,
  `second_dose` int DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_vaccination`),
  KEY `FK_vaccinations_regions` (`id_region`),
  KEY `FK_vaccinations_vaccines` (`id_vaccine`),
  CONSTRAINT `FK_vaccinations_regions` FOREIGN KEY (`id_region`) REFERENCES `regions` (`id_region`),
  CONSTRAINT `FK_vaccinations_vaccines` FOREIGN KEY (`id_vaccine`) REFERENCES `vaccines` (`id_vaccine`)
) ENGINE=InnoDB AUTO_INCREMENT=239098 DEFAULT CHARSET=ucs2 COLLATE=ucs2_slovak_ci;

-- Data exporting was unselected.

-- Dumping structure for table tassu.vaccines
CREATE TABLE IF NOT EXISTS `vaccines` (
  `id_vaccine` int NOT NULL AUTO_INCREMENT,
  `company` text CHARACTER SET utf8mb4 COLLATE utf8mb4_is_0900_ai_ci NOT NULL,
  `vaccine_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_is_0900_ai_ci NOT NULL,
  `vaccine_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_is_0900_ai_ci,
  PRIMARY KEY (`id_vaccine`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=ucs2 COLLATE=ucs2_slovak_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
