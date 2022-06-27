-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema YouTube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema YouTube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `YouTube` DEFAULT CHARACTER SET utf8 ;
USE `YouTube` ;

-- -----------------------------------------------------
-- Table `YouTube`.`Channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTube`.`Channel` (
  `Channel_id` INT NOT NULL AUTO_INCREMENT,
  `ChannelName` VARCHAR(45) NOT NULL,
  `CreationDate` DATE NOT NULL,
  PRIMARY KEY (`Channel_id`),
  UNIQUE INDEX `Channel_id_UNIQUE` (`Channel_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTube`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTube`.`User` (
  `User_id` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(60) NOT NULL,
  `UserName` VARCHAR(45) NOT NULL,
  `DateOfBirth` DATE NOT NULL,
  `Gender` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `PostalCode` VARCHAR(10) NOT NULL,
  `Channel_Channel_id` INT NULL,
  PRIMARY KEY (`User_id`),
  UNIQUE INDEX `User_id_UNIQUE` (`User_id` ASC) VISIBLE,
  INDEX `fk_User_Channel1_idx` (`Channel_Channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_Channel1`
    FOREIGN KEY (`Channel_Channel_id`)
    REFERENCES `YouTube`.`Channel` (`Channel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTube`.`VideoStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTube`.`VideoStatus` (
  `VideoStatus_id` INT NOT NULL AUTO_INCREMENT,
  `StatusName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`VideoStatus_id`),
  UNIQUE INDEX `VideoStatus_id_UNIQUE` (`VideoStatus_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTube`.`Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTube`.`Video` (
  `Video_id` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(200) NOT NULL,
  `Size` VARCHAR(45) NOT NULL,
  `FileName` VARCHAR(100) NOT NULL,
  `DurationMinutes` INT NOT NULL,
  `Thumbnail` MEDIUMBLOB NULL,
  `NumberOfPlays` INT NOT NULL DEFAULT 0,
  `Likes` INT NOT NULL DEFAULT 0,
  `Dislikes` INT NOT NULL DEFAULT 0,
  `PublicationDateTime` DATETIME NOT NULL,
  `VideoStatus_VideoStatus_id` INT NOT NULL,
  `Channel_Channel_id` INT NOT NULL,
  PRIMARY KEY (`Video_id`),
  UNIQUE INDEX `Video_id_UNIQUE` (`Video_id` ASC) VISIBLE,
  INDEX `fk_Video_VideoStatus_idx` (`VideoStatus_VideoStatus_id` ASC) VISIBLE,
  INDEX `fk_Video_Channel1_idx` (`Channel_Channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_Video_VideoStatus`
    FOREIGN KEY (`VideoStatus_VideoStatus_id`)
    REFERENCES `YouTube`.`VideoStatus` (`VideoStatus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Video_Channel1`
    FOREIGN KEY (`Channel_Channel_id`)
    REFERENCES `YouTube`.`Channel` (`Channel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTube`.`Label`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTube`.`Label` (
  `Label_id` INT NOT NULL AUTO_INCREMENT,
  `LabelName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Label_id`),
  UNIQUE INDEX `Label_id_UNIQUE` (`Label_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTube`.`VideoLikesDislikes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTube`.`VideoLikesDislikes` (
  `User_User_id` INT NOT NULL,
  `Video_Video_id` INT NOT NULL,
  `Status` VARCHAR(10) NOT NULL,
  `LastModifiedDateTime` DATETIME NOT NULL,
  PRIMARY KEY (`User_User_id`, `Video_Video_id`),
  INDEX `fk_User_has_Video_Video1_idx` (`Video_Video_id` ASC) VISIBLE,
  INDEX `fk_User_has_Video_User1_idx` (`User_User_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Video_User1`
    FOREIGN KEY (`User_User_id`)
    REFERENCES `YouTube`.`User` (`User_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Video_Video1`
    FOREIGN KEY (`Video_Video_id`)
    REFERENCES `YouTube`.`Video` (`Video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTube`.`Suscriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTube`.`Suscriptions` (
  `User_User_id` INT NOT NULL,
  `Channel_Channel_id` INT NOT NULL,
  PRIMARY KEY (`User_User_id`, `Channel_Channel_id`),
  INDEX `fk_User_has_Channel_Channel1_idx` (`Channel_Channel_id` ASC) VISIBLE,
  INDEX `fk_User_has_Channel_User1_idx` (`User_User_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Channel_User1`
    FOREIGN KEY (`User_User_id`)
    REFERENCES `YouTube`.`User` (`User_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Channel_Channel1`
    FOREIGN KEY (`Channel_Channel_id`)
    REFERENCES `YouTube`.`Channel` (`Channel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTube`.`PlayList`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTube`.`PlayList` (
  `PlayList_id` INT NOT NULL AUTO_INCREMENT,
  `PlayListName` VARCHAR(60) NOT NULL,
  `CreationDate` DATE NOT NULL,
  `PrivateOrPublic` VARCHAR(10) NOT NULL,
  `User_User_id` INT NOT NULL,
  PRIMARY KEY (`PlayList_id`),
  UNIQUE INDEX `PlayList_id_UNIQUE` (`PlayList_id` ASC) VISIBLE,
  INDEX `fk_PlayList_User1_idx` (`User_User_id` ASC) VISIBLE,
  CONSTRAINT `fk_PlayList_User1`
    FOREIGN KEY (`User_User_id`)
    REFERENCES `YouTube`.`User` (`User_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTube`.`PlayListVideo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTube`.`PlayListVideo` (
  `PlayList_PlayList_id` INT NOT NULL,
  `Video_Video_id` INT NOT NULL,
  PRIMARY KEY (`PlayList_PlayList_id`, `Video_Video_id`),
  INDEX `fk_PlayList_has_Video_Video1_idx` (`Video_Video_id` ASC) VISIBLE,
  INDEX `fk_PlayList_has_Video_PlayList1_idx` (`PlayList_PlayList_id` ASC) VISIBLE,
  CONSTRAINT `fk_PlayList_has_Video_PlayList1`
    FOREIGN KEY (`PlayList_PlayList_id`)
    REFERENCES `YouTube`.`PlayList` (`PlayList_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayList_has_Video_Video1`
    FOREIGN KEY (`Video_Video_id`)
    REFERENCES `YouTube`.`Video` (`Video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTube`.`Comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTube`.`Comments` (
  `Comments_id` INT NOT NULL AUTO_INCREMENT,
  `Text` VARCHAR(200) NOT NULL,
  `PublicationDate` DATETIME NOT NULL,
  `User_User_id` INT NOT NULL,
  `Video_Video_id` INT NOT NULL,
  PRIMARY KEY (`Comments_id`),
  UNIQUE INDEX `Comments_id_UNIQUE` (`Comments_id` ASC) VISIBLE,
  INDEX `fk_Comments_User1_idx` (`User_User_id` ASC) VISIBLE,
  INDEX `fk_Comments_Video1_idx` (`Video_Video_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comments_User1`
    FOREIGN KEY (`User_User_id`)
    REFERENCES `YouTube`.`User` (`User_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comments_Video1`
    FOREIGN KEY (`Video_Video_id`)
    REFERENCES `YouTube`.`Video` (`Video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTube`.`CommentsLikesDisLikes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTube`.`CommentsLikesDisLikes` (
  `User_User_id` INT NOT NULL,
  `Comments_Comments_id` INT NOT NULL,
  `Status` NVARCHAR(10) NOT NULL,
  `LastModifiedDateTime` DATETIME NOT NULL,
  PRIMARY KEY (`User_User_id`, `Comments_Comments_id`),
  INDEX `fk_CommentsLikesDisLikes_Comments1_idx` (`Comments_Comments_id` ASC) VISIBLE,
  CONSTRAINT `fk_CommentsLikesDisLikes_User1`
    FOREIGN KEY (`User_User_id`)
    REFERENCES `YouTube`.`User` (`User_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CommentsLikesDisLikes_Comments1`
    FOREIGN KEY (`Comments_Comments_id`)
    REFERENCES `YouTube`.`Comments` (`Comments_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTube`.`LabelVideo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTube`.`LabelVideo` (
  `Label_Label_id` INT NOT NULL,
  `Video_Video_id` INT NOT NULL,
  PRIMARY KEY (`Label_Label_id`, `Video_Video_id`),
  INDEX `fk_Label_has_Video_Video1_idx` (`Video_Video_id` ASC) VISIBLE,
  INDEX `fk_Label_has_Video_Label1_idx` (`Label_Label_id` ASC) VISIBLE,
  CONSTRAINT `fk_Label_has_Video_Label1`
    FOREIGN KEY (`Label_Label_id`)
    REFERENCES `YouTube`.`Label` (`Label_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Label_has_Video_Video1`
    FOREIGN KEY (`Video_Video_id`)
    REFERENCES `YouTube`.`Video` (`Video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
