
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TP_DER
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `TP_DER` ;

-- -----------------------------------------------------
-- Schema TP_DER
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TP_DER` DEFAULT CHARACTER SET utf8mb3 ;
USE `TP_DER` ;

-- -----------------------------------------------------
-- Table `TP_DER`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TP_DER`.`users` ;

CREATE TABLE IF NOT EXISTS `TP_DER`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP_DER`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TP_DER`.`categories` ;

CREATE TABLE IF NOT EXISTS `TP_DER`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP_DER`.`notes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TP_DER`.`notes` ;

CREATE TABLE IF NOT EXISTS `TP_DER`.`notes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_date` DATETIME NULL,
  `deleteable` TINYINT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_notes_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_notes`
    FOREIGN KEY (`user_id`)
    REFERENCES `TP_DER`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP_DER`.`notes_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TP_DER`.`notes_categories` ;

CREATE TABLE IF NOT EXISTS `TP_DER`.`notes_categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `notes_id` INT NULL,
  `categories_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_notescategories_idx` (`notes_id` ASC) VISIBLE,
  INDEX `fk_categories_notescategories_idx` (`categories_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes_notescategories`
    FOREIGN KEY (`notes_id`)
    REFERENCES `TP_DER`.`notes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categories_notescategories`
    FOREIGN KEY (`categories_id`)
    REFERENCES `TP_DER`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


/* INSERTS */


/*NAME*/

insert into TP_DER (id, name) values (1, 'Stanton Leishman');
insert into TP_DER (id, name) values (2, 'Hi Creigan');
insert into TP_DER (id, name) values (3, 'Alejandra Venneur');
insert into TP_DER (id, name) values (4, 'Rosmunda Cleaves');
insert into TP_DER (id, name) values (5, 'Joel Prando');
insert into TP_DER (id, name) values (6, 'Sheri Torald');
insert into TP_DER (id, name) values (7, 'Keenan Alban');
insert into TP_DER (id, name) values (8, 'Krissy Dubbin');
insert into TP_DER (id, name) values (9, 'Blondell Abbie');
insert into TP_DER (id, name) values (10, 'Anatole Tillard');

/* NOTES */

insert into TP_DER (id, title, description, created_date, updated_date, deleteable) values (1, 'When Darkness Falls (När mörkret faller)', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. ', '2021-12-07', '2022-06-16', false);
insert into TP_DER (id, title, description, created_date, updated_date, deleteable) values (2, 'Steam Experiment, The', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. ', '2022-06-25', '2022-01-10', false);
insert into TP_DER (id, title, description, created_date, updated_date, deleteable) values (3, 'Dracula 2000', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. ', '2022-02-02', '2022-10-29', false);
insert into TP_DER (id, title, description, created_date, updated_date, deleteable) values (4, 'Camp Nowhere', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. ', '2022-04-24', '2022-03-14', true);
insert into TP_DER (id, title, description, created_date, updated_date, deleteable) values (5, 'Night Listener, The', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', '2022-02-16', '2022-06-21', false);
insert into TP_DER (id, title, description, created_date, updated_date, deleteable) values (6, 'Real McCoy, The', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2022-07-06', '2022-08-02', true);
insert into TP_DER (id, title, description, created_date, updated_date, deleteable) values (7, 'Burglars, The (Le casse)', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', '2022-02-21', '2022-09-08', false);
insert into TP_DER (id, title, description, created_date, updated_date, deleteable) values (8, 'Splitting Heirs', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2021-11-30', '2021-12-08', true);
insert into TP_DER (id, title, description, created_date, updated_date, deleteable) values (9, 'Rich and Famous (Gong woo ching)', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2022-02-17', '2022-06-28', true);
insert into TP_DER (id, title, description, created_date, updated_date, deleteable) values (10, 'Bolero', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', '2022-08-06', '2022-02-03', false);

/* CATEGORIES */

insert into TP_DER (id, name) values (1, 'Fire Sprinkler System');
insert into TP_DER (id, name) values (2, 'Landscaping & Irrigation');
insert into TP_DER (id, name) values (3, 'Construction Clean and Final Clean');
insert into TP_DER (id, name) values (4, 'Painting & Vinyl Wall Covering');
insert into TP_DER (id, name) values (5, 'Epoxy Flooring');
insert into TP_DER (id, name) values (6, 'Drywall & Acoustical (MOB)');
insert into TP_DER (id, name) values (7, 'Doors, Frames & Hardware');
insert into TP_DER (id, name) values (8, 'Sitework & Site Utilities');
insert into TP_DER (id, name) values (9, 'Framing (Wood)');
insert into TP_DER (id, name) values (10, 'Curb & Gutter');

/* NOTES CATEGORIES */

INSERT INTO notes_categories(notes_id, categories_id) VALUES
(1, 10),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 10),
(9, 10),
(10, 10);