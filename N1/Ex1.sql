-- MySQL Workbench Synchronization
-- Generated: 2025-02-11 11:15
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: strou

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `culampolla`;

CREATE TABLE IF NOT EXISTS `culampolla`.`brands` (
  `brands_id` INT(11) NOT NULL AUTO_INCREMENT,
  `brands_name` VARCHAR(45) NOT NULL,
  `suppliers_suppliers_id` INT(11) NOT NULL,
  PRIMARY KEY (`brands_id`),
  INDEX `fk_brands_suppliers_idx` (`suppliers_suppliers_id` ASC),
  CONSTRAINT `fk_brands_suppliers`
    FOREIGN KEY (`suppliers_suppliers_id`)
    REFERENCES `culampolla`.`suppliers` (`suppliers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `culampolla`.`costumers` (
  `costumers_id` INT(11) NOT NULL AUTO_INCREMENT,
  `costumers_name` VARCHAR(45) NOT NULL,
  `costumers_post_adress` VARCHAR(45) NULL DEFAULT NULL,
  `costumers_email` VARCHAR(45) NOT NULL,
  `costumers_tel` INT(11) NOT NULL,
  `costumers_timestamp` DATETIME NOT NULL,
  `costumers_broughtby_costumers_id` INT(11) NULL default null,
  PRIMARY KEY (`costumers_id`),
  INDEX `fk_costumers_costumers1_idx` (`costumers_broughtby_costumers_id` ASC),
  CONSTRAINT `fk_costumers_costumers1`
    FOREIGN KEY (`costumers_broughtby_costumers_id`)
    REFERENCES `culampolla`.`costumers` (`costumers_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `culampolla`.`employees` (
  `employees_id` INT(11) NOT NULL AUTO_INCREMENT,
  `employees_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employees_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `culampolla`.`glasses` (
  `glasses_id` INT(11) NOT NULL AUTO_INCREMENT,
  `glasses_prescription_left` FLOAT(11) NOT NULL,
  `glasses_prescription_right` FLOAT(11) NOT NULL,
  `glasses_frame_type` VARCHAR(15) NOT NULL,
  `glasses_frame_color` VARCHAR(15) NOT NULL,
  `glasses_color_left` VARCHAR(15) NOT NULL,
  `glasses_color_right` VARCHAR(15) NOT NULL,
  `glasses_price` FLOAT(11) NOT NULL,
  `brands_idbrands` INT(11) NOT NULL,
  `sales_sales_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `fk_glasses_brands1_idx` (`brands_idbrands` ASC),
  INDEX `fk_glasses_sales1_idx` (`sales_sales_id` ASC),
  CONSTRAINT `fk_glasses_brands1`
    FOREIGN KEY (`brands_idbrands`)
    REFERENCES `culampolla`.`brands` (`brands_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glasses_sales1`
    FOREIGN KEY (`sales_sales_id`)
    REFERENCES `culampolla`.`sales` (`sales_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `culampolla`.`sales` (
  `sales_id` INT(11) NOT NULL AUTO_INCREMENT,
  `sales_timestamp` DATETIME NOT NULL,
  `costumers_costumers_id` INT(11) NULL DEFAULT NULL,
  `employees_employees_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sales_id`),
  INDEX `fk_sales_costumers1_idx` (`costumers_costumers_id` ASC),
  INDEX `fk_sales_employees1_idx` (`employees_employees_id` ASC),
  CONSTRAINT `fk_sales_costumers1`
    FOREIGN KEY (`costumers_costumers_id`)
    REFERENCES `culampolla`.`costumers` (`costumers_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sales_employees1`
    FOREIGN KEY (`employees_employees_id`)
    REFERENCES `culampolla`.`employees` (`employees_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `culampolla`.`suppliers` (
  `suppliers_id` INT(11) NOT NULL AUTO_INCREMENT,
  `suppliers_name` VARCHAR(45) NOT NULL,
  `suppliers_address` VARCHAR(45) NOT NULL,
  `suppliers_phone` INT(11) NOT NULL,
  `suppliers_fax` INT(11) NULL DEFAULT NULL,
  `NIF` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`suppliers_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
