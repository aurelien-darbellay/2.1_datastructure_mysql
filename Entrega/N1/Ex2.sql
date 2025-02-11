-- MySQL Workbench Synchronization
-- Generated: 2025-02-11 12:42
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: strou

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Pizzeria` DEFAULT CHARACTER SET utf8mb4 ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`costumers` (
  `costumers_id` INT(11) NOT NULL AUTO_INCREMENT,
  `costumers_name` VARCHAR(45) NOT NULL,
  `costumers_lastname` VARCHAR(45) NOT NULL,
  `costumers_address` VARCHAR(45) NULL DEFAULT NULL,
  `costumers_zipcode` INT(6) NULL DEFAULT NULL,
  `localities_localities_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`costumers_id`),
  INDEX `fk_costumers_localities1_idx` (`localities_localities_id` ASC),
  CONSTRAINT `fk_costumers_localities1`
    FOREIGN KEY (`localities_localities_id`)
    REFERENCES `Pizzeria`.`localities` (`localities_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`orders` (
  `orders_id` INT(11) NOT NULL AUTO_INCREMENT,
  `orders_timestamp` DATETIME NOT NULL,
  `orders_totalPrice` FLOAT(6) NOT NULL,
  `orders_type` ENUM("Delivery", "Pick up") NOT NULL,
  `employees_employees_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`orders_id`),
  INDEX `fk_orders_employees1_idx` (`employees_employees_id` ASC),
  CONSTRAINT `fk_orders_employees1`
    FOREIGN KEY (`employees_employees_id`)
    REFERENCES `Pizzeria`.`employees` (`employees_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`products` (
  `products_id` INT(11) NOT NULL AUTO_INCREMENT,
  `products_name` VARCHAR(45) NOT NULL,
  `products_type` ENUM("Pizza", "Burger", "Drink") NOT NULL,
  `products_price` FLOAT(5) NOT NULL,
  `products_img` BLOB NULL DEFAULT NULL,
  `pizza_categories_pizza_categories_id` INT(11) NULL DEFAULT NULL,
  `orders_orders_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`products_id`),
  INDEX `fk_products_pizza_categories1_idx` (`pizza_categories_pizza_categories_id` ASC),
  INDEX `fk_products_orders1_idx` (`orders_orders_id` ASC),
  CONSTRAINT `fk_products_pizza_categories1`
    FOREIGN KEY (`pizza_categories_pizza_categories_id`)
    REFERENCES `Pizzeria`.`pizza_categories` (`pizza_categories_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_products_orders1`
    FOREIGN KEY (`orders_orders_id`)
    REFERENCES `Pizzeria`.`orders` (`orders_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`pizza_categories` (
  `pizza_categories_id` INT(11) NOT NULL AUTO_INCREMENT,
  `pizza_categories_name` VARCHAR(45) NOT NULL,
  `pizza_categories_lastupdate` DATETIME NOT NULL,
  PRIMARY KEY (`pizza_categories_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`stores` (
  `stores_id` INT(11) NOT NULL AUTO_INCREMENT,
  `stores_address` VARCHAR(45) NULL DEFAULT NULL,
  `stores_zipcode` VARCHAR(45) NULL DEFAULT NULL,
  `localities_localities_id` INT(11) NOT NULL,
  PRIMARY KEY (`stores_id`),
  INDEX `fk_stores_localities1_idx` (`localities_localities_id` ASC),
  CONSTRAINT `fk_stores_localities1`
    FOREIGN KEY (`localities_localities_id`)
    REFERENCES `Pizzeria`.`localities` (`localities_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`employees` (
  `employees_id` INT(11) NOT NULL AUTO_INCREMENT,
  `employees_name` VARCHAR(45) NOT NULL,
  `employees_lastname` VARCHAR(45) NOT NULL,
  `employees_nif` VARCHAR(45) NOT NULL,
  `employees_tel` INT(12) NOT NULL,
  `employees_role` ENUM("Delivery", "Kitchen") NOT NULL,
  `stores_stores_id` INT(11) NOT NULL,
  PRIMARY KEY (`employees_id`),
  INDEX `fk_employees_stores1_idx` (`stores_stores_id` ASC),
  CONSTRAINT `fk_employees_stores1`
    FOREIGN KEY (`stores_stores_id`)
    REFERENCES `Pizzeria`.`stores` (`stores_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`localities` (
  `localities_id` INT(11) NOT NULL AUTO_INCREMENT,
  `localities_name` VARCHAR(45) NOT NULL,
  `provinces_provinces_id` INT(11) NOT NULL,
  PRIMARY KEY (`localities_id`),
  INDEX `fk_localities_provinces_idx` (`provinces_provinces_id` ASC),
  CONSTRAINT `fk_localities_provinces`
    FOREIGN KEY (`provinces_provinces_id`)
    REFERENCES `Pizzeria`.`provinces` (`provinces_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`provinces` (
  `provinces_id` INT(11) NOT NULL AUTO_INCREMENT,
  `provinces_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`provinces_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
