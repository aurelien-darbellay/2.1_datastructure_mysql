-- MySQL Workbench Synchronization
-- Generated: 2025-02-12 13:55
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: strou

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `spotify` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `spotify`.`users` (
  `users_id` INT(11) NOT NULL AUTO_INCREMENT,
  `users_email` VARCHAR(45) NOT NULL,
  `users_username` VARCHAR(45) NOT NULL,
  `users_password` VARCHAR(45) NOT NULL,
  `users_dob` DATE NULL DEFAULT NULL,
  `users_sex` VARCHAR(1) NULL DEFAULT NULL,
  `users_country` VARCHAR(2) NULL DEFAULT NULL,
  `users_zipcode` INT(11) NULL DEFAULT NULL,
  `users_type` ENUM("Basic", "Premium") NOT NULL,
  `subscriptions_subscriptions_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`users_id`),
  INDEX `fk_users_subscriptions_idx` (`subscriptions_subscriptions_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_subscriptions`
    FOREIGN KEY (`subscriptions_subscriptions_id`)
    REFERENCES `spotify`.`subscriptions` (`subscriptions_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`subscriptions` (
  `subscriptions_id` INT(11) NOT NULL AUTO_INCREMENT,
  `subscriptions_start` DATETIME NOT NULL,
  `subscription_renovate` DATETIME NULL DEFAULT NULL,
  `subscription_payment_method` ENUM("Paypal", "Credit Card") NOT NULL,
  `subscriptions_status` ENUM("Active", "Inactive") NOT NULL,
  PRIMARY KEY (`subscriptions_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`credit_cards` (
  `credit_cards_id` INT(11) NOT NULL,
  `credit_cards_expiration` VARCHAR(7) NOT NULL,
  `credit_cards_security_code` INT(11) NOT NULL,
  PRIMARY KEY (`credit_cards_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`payments` (
  `payments_orderNumber` INT(11) NOT NULL,
  `payments_date` DATETIME NOT NULL,
  `payments_totalAmount` DECIMAL NOT NULL,
  `subscriptions_subscriptions_id` INT(11) NOT NULL,
  `credit_cards_credit_cards_id` INT(11) NULL DEFAULT NULL,
  `paypals_paypals_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`payments_orderNumber`),
  INDEX `fk_payments_subscriptions1_idx` (`subscriptions_subscriptions_id` ASC) VISIBLE,
  INDEX `fk_payments_credit_cards1_idx` (`credit_cards_credit_cards_id` ASC) VISIBLE,
  INDEX `fk_payments_paypals1_idx` (`paypals_paypals_id` ASC) VISIBLE,
  CONSTRAINT `fk_payments_subscriptions1`
    FOREIGN KEY (`subscriptions_subscriptions_id`)
    REFERENCES `spotify`.`subscriptions` (`subscriptions_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payments_credit_cards1`
    FOREIGN KEY (`credit_cards_credit_cards_id`)
    REFERENCES `spotify`.`credit_cards` (`credit_cards_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payments_paypals1`
    FOREIGN KEY (`paypals_paypals_id`)
    REFERENCES `spotify`.`paypals` (`paypals_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`playlists` (
  `playlists_id` INT(11) NOT NULL AUTO_INCREMENT,
  `playlists_name` VARCHAR(45) NOT NULL,
  `playlists_created_on` DATETIME NOT NULL,
  `users_users_id` INT(11) NOT NULL,
  `playlists_status` ENUM("Active", "Eliminated") NOT NULL,
  `playlists_eliminated_on` DATETIME NULL DEFAULT NULL,
  `playlists_type` ENUM("Collaborative", "Individual") NOT NULL,
  PRIMARY KEY (`playlists_id`),
  INDEX `fk_playlists_users1_idx` (`users_users_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlists_users1`
    FOREIGN KEY (`users_users_id`)
    REFERENCES `spotify`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`albums` (
  `albums_id` INT(11) NOT NULL AUTO_INCREMENT,
  `albums_name` VARCHAR(45) NOT NULL,
  `albums_year_release` INT(4) NULL DEFAULT NULL,
  `albums_cover` BLOB NULL DEFAULT NULL,
  `artists_artists_id` INT(11) NOT NULL,
  PRIMARY KEY (`albums_id`),
  INDEX `fk_albums_artists1_idx` (`artists_artists_id` ASC) VISIBLE,
  CONSTRAINT `fk_albums_artists1`
    FOREIGN KEY (`artists_artists_id`)
    REFERENCES `spotify`.`artists` (`artists_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`songs` (
  `songs_id` INT(11) NOT NULL AUTO_INCREMENT,
  `songs_name` VARCHAR(45) NOT NULL,
  `songs_length_s` INT(11) NOT NULL,
  `songs_#reproductions` INT(11) NOT NULL,
  `artists_artists_id` INT(11) NULL DEFAULT NULL,
  `albums_albums_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`songs_id`),
  INDEX `fk_songs_artists1_idx` (`artists_artists_id` ASC) VISIBLE,
  INDEX `fk_songs_albums1_idx` (`albums_albums_id` ASC) VISIBLE,
  CONSTRAINT `fk_songs_artists1`
    FOREIGN KEY (`artists_artists_id`)
    REFERENCES `spotify`.`artists` (`artists_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_songs_albums1`
    FOREIGN KEY (`albums_albums_id`)
    REFERENCES `spotify`.`albums` (`albums_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`artists` (
  `artists_id` INT(11) NOT NULL AUTO_INCREMENT,
  `artists_name` VARCHAR(45) NOT NULL,
  `artists_iimg` BLOB NULL DEFAULT NULL,
  PRIMARY KEY (`artists_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`paypals` (
  `paypals_id` INT(11) NOT NULL AUTO_INCREMENT,
  `paypals_username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`paypals_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`subscriptions_has_credit_cards` (
  `subscriptions_subscriptions_id` INT(11) NOT NULL,
  `credit_cards_credit_cards_id` INT(11) NOT NULL,
  PRIMARY KEY (`subscriptions_subscriptions_id`, `credit_cards_credit_cards_id`),
  INDEX `fk_subscriptions_has_credit_cards_credit_cards1_idx` (`credit_cards_credit_cards_id` ASC) VISIBLE,
  INDEX `fk_subscriptions_has_credit_cards_subscriptions1_idx` (`subscriptions_subscriptions_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscriptions_has_credit_cards_subscriptions1`
    FOREIGN KEY (`subscriptions_subscriptions_id`)
    REFERENCES `spotify`.`subscriptions` (`subscriptions_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_subscriptions_has_credit_cards_credit_cards1`
    FOREIGN KEY (`credit_cards_credit_cards_id`)
    REFERENCES `spotify`.`credit_cards` (`credit_cards_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`subscriptions_has_paypals` (
  `subscriptions_subscriptions_id` INT(11) NOT NULL,
  `paypals_paypals_id` INT(11) NOT NULL,
  PRIMARY KEY (`subscriptions_subscriptions_id`, `paypals_paypals_id`),
  INDEX `fk_subscriptions_has_paypals_paypals1_idx` (`paypals_paypals_id` ASC) VISIBLE,
  INDEX `fk_subscriptions_has_paypals_subscriptions1_idx` (`subscriptions_subscriptions_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscriptions_has_paypals_subscriptions1`
    FOREIGN KEY (`subscriptions_subscriptions_id`)
    REFERENCES `spotify`.`subscriptions` (`subscriptions_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_subscriptions_has_paypals_paypals1`
    FOREIGN KEY (`paypals_paypals_id`)
    REFERENCES `spotify`.`paypals` (`paypals_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`playlists_has_songs` (
  `playlists_playlists_id` INT(11) NOT NULL,
  `songs_songs_id` INT(11) NOT NULL,
  PRIMARY KEY (`playlists_playlists_id`, `songs_songs_id`),
  INDEX `fk_playlists_has_songs_songs1_idx` (`songs_songs_id` ASC) VISIBLE,
  INDEX `fk_playlists_has_songs_playlists1_idx` (`playlists_playlists_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlists_has_songs_playlists1`
    FOREIGN KEY (`playlists_playlists_id`)
    REFERENCES `spotify`.`playlists` (`playlists_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlists_has_songs_songs1`
    FOREIGN KEY (`songs_songs_id`)
    REFERENCES `spotify`.`songs` (`songs_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`song_added_to_by` (
  `songs_songs_id` INT(11) NOT NULL,
  `users_users_id` INT(11) NOT NULL,
  `playlists_playlists_id` INT(11) NOT NULL,
  `song_added_to_by_timestamp` DATETIME NOT NULL,
  PRIMARY KEY (`songs_songs_id`, `users_users_id`, `playlists_playlists_id`),
  INDEX `fk_song_added_to_by_users1_idx` (`users_users_id` ASC) VISIBLE,
  INDEX `fk_song_added_to_by_playlists1_idx` (`playlists_playlists_id` ASC) VISIBLE,
  CONSTRAINT `fk_song_added_to_by_songs1`
    FOREIGN KEY (`songs_songs_id`)
    REFERENCES `spotify`.`songs` (`songs_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_song_added_to_by_users1`
    FOREIGN KEY (`users_users_id`)
    REFERENCES `spotify`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_song_added_to_by_playlists1`
    FOREIGN KEY (`playlists_playlists_id`)
    REFERENCES `spotify`.`playlists` (`playlists_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`artists_is_similar_to_artists` (
  `artists_artists_id` INT(11) NOT NULL,
  `artists_artists_id1` INT(11) NOT NULL,
  PRIMARY KEY (`artists_artists_id`, `artists_artists_id1`),
  INDEX `fk_artists_has_artists_artists2_idx` (`artists_artists_id1` ASC) VISIBLE,
  INDEX `fk_artists_has_artists_artists1_idx` (`artists_artists_id` ASC) VISIBLE,
  CONSTRAINT `fk_artists_has_artists_artists1`
    FOREIGN KEY (`artists_artists_id`)
    REFERENCES `spotify`.`artists` (`artists_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_artists_has_artists_artists2`
    FOREIGN KEY (`artists_artists_id1`)
    REFERENCES `spotify`.`artists` (`artists_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`users_has_favourite_songs` (
  `users_users_id` INT(11) NOT NULL,
  `songs_songs_id` INT(11) NOT NULL,
  PRIMARY KEY (`users_users_id`, `songs_songs_id`),
  INDEX `fk_users_has_songs_songs1_idx` (`songs_songs_id` ASC) VISIBLE,
  INDEX `fk_users_has_songs_users1_idx` (`users_users_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_songs_users1`
    FOREIGN KEY (`users_users_id`)
    REFERENCES `spotify`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_songs_songs1`
    FOREIGN KEY (`songs_songs_id`)
    REFERENCES `spotify`.`songs` (`songs_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`users_has_favourite_albums` (
  `users_users_id` INT(11) NOT NULL,
  `albums_albums_id` INT(11) NOT NULL,
  PRIMARY KEY (`users_users_id`, `albums_albums_id`),
  INDEX `fk_users_has_albums_albums1_idx` (`albums_albums_id` ASC) VISIBLE,
  INDEX `fk_users_has_albums_users1_idx` (`users_users_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_albums_users1`
    FOREIGN KEY (`users_users_id`)
    REFERENCES `spotify`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_albums_albums1`
    FOREIGN KEY (`albums_albums_id`)
    REFERENCES `spotify`.`albums` (`albums_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
