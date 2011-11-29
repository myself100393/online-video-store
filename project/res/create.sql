
-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'persons'
-- 
-- ---

DROP TABLE IF EXISTS `persons`;
		
CREATE TABLE `persons` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `username` VARCHAR(255) NULL DEFAULT NULL,
  `password` CHAR(40) NULL DEFAULT NULL,
  `date_registration` DATETIME NULL DEFAULT NULL,
  `last_login` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'movies'
-- 
-- ---

DROP TABLE IF EXISTS `movies`;
		
CREATE TABLE `movies` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `banner` VARCHAR(255) NULL DEFAULT NULL,
  `release_date` DATE NULL DEFAULT NULL,
  `rent_amount` DOUBLE NULL DEFAULT NULL,
  `nb_available` INTEGER NULL DEFAULT NULL,
  `category_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'rentals'
-- 
-- ---

DROP TABLE IF EXISTS `rentals`;
		
CREATE TABLE `rentals` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_persons` INTEGER NULL DEFAULT NULL,
  `id_movies` INTEGER NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `status` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'addresses'
-- 
-- ---

DROP TABLE IF EXISTS `addresses`;
		
CREATE TABLE `addresses` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `person_id` INTEGER NULL DEFAULT NULL,
  `street` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  `country` VARCHAR(255) NULL DEFAULT NULL,
  `zip` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'accounts'
-- 
-- ---

DROP TABLE IF EXISTS `accounts`;
		
CREATE TABLE `accounts` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `person_id` INTEGER NULL DEFAULT NULL,
  `ssn` CHAR(11) NULL DEFAULT NULL,
  `type` INTEGER NULL DEFAULT NULL,
  `balance` DOUBLE NULL DEFAULT NULL,
  `monthly_fee` DOUBLE NULL DEFAULT NULL,
  `outstanding_movies` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'categories'
-- 
-- ---

DROP TABLE IF EXISTS `categories`;
		
CREATE TABLE `categories` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `movies` ADD FOREIGN KEY (category_id) REFERENCES `categories` (`id`);
ALTER TABLE `rentals` ADD FOREIGN KEY (id_persons) REFERENCES `persons` (`id`);
ALTER TABLE `rentals` ADD FOREIGN KEY (id_movies) REFERENCES `movies` (`id`);
ALTER TABLE `addresses` ADD FOREIGN KEY (person_id) REFERENCES `persons` (`id`);
ALTER TABLE `accounts` ADD FOREIGN KEY (person_id) REFERENCES `persons` (`id`);

-- ---
-- Table Properties
-- ---

ALTER TABLE `persons` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `movies` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `rentals` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `addresses` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `accounts` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `categories` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

