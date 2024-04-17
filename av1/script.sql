-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Album` (
  `idAlbum` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `year` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAlbum`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Artist` (
  `idArtist` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `instagramUrl` VARCHAR(40) NULL,
  `facebookUrl` VARCHAR(40) NULL,
  `tweeterUrl` VARCHAR(40) NULL,
  PRIMARY KEY (`idArtist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Country` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `country_iso_code` VARCHAR(10) NULL,
  `country_name` VARCHAR(200) NULL,
  `moeda` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`country_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Music`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Music` (
  `idMusic` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `time` INT NOT NULL,
  `idAlbum` INT NULL,
  PRIMARY KEY (`idMusic`),
  INDEX `fk_Music_Album1_idx` (`idAlbum` ASC) VISIBLE,
  CONSTRAINT `fk_Music_Album1`
    FOREIGN KEY (`idAlbum`)
    REFERENCES `mydb`.`Album` (`idAlbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Genero` (
  `idGenero` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Playlist` (
  `idPlaylist` INT NOT NULL,
  `privada` TINYINT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idPlaylist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `country_id` INT NOT NULL,
  `idPlaylist` INT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_Usuario_Country1_idx` (`country_id` ASC) VISIBLE,
  INDEX `fk_Usuario_Playlist1_idx` (`idPlaylist` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `mydb`.`Country` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Playlist1`
    FOREIGN KEY (`idPlaylist`)
    REFERENCES `mydb`.`Playlist` (`idPlaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Playlist_has_Music`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Playlist_has_Music` (
  `idPlaylist` INT NOT NULL,
  `idMusic` INT NOT NULL,
  PRIMARY KEY (`idPlaylist`, `idMusic`),
  INDEX `fk_Playlist_has_Music_Music1_idx` (`idMusic` ASC) VISIBLE,
  INDEX `fk_Playlist_has_Music_Playlist1_idx` (`idPlaylist` ASC) VISIBLE,
  CONSTRAINT `fk_Playlist_has_Music_Playlist1`
    FOREIGN KEY (`idPlaylist`)
    REFERENCES `mydb`.`Playlist` (`idPlaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Playlist_has_Music_Music1`
    FOREIGN KEY (`idMusic`)
    REFERENCES `mydb`.`Music` (`idMusic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Plano`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Plano` (
  `idPlano` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `custo` DECIMAL(5,2) NOT NULL,
  `tempo` DATETIME NOT NULL,
  PRIMARY KEY (`idPlano`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Album_has_Artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Album_has_Artist` (
  `idAlbum` INT NOT NULL,
  `idArtist` INT NOT NULL,
  PRIMARY KEY (`idAlbum`, `idArtist`),
  INDEX `fk_Album_has_Artist_Artist1_idx` (`idArtist` ASC) VISIBLE,
  INDEX `fk_Album_has_Artist_Album1_idx` (`idAlbum` ASC) VISIBLE,
  CONSTRAINT `fk_Album_has_Artist_Album1`
    FOREIGN KEY (`idAlbum`)
    REFERENCES `mydb`.`Album` (`idAlbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Album_has_Artist_Artist1`
    FOREIGN KEY (`idArtist`)
    REFERENCES `mydb`.`Artist` (`idArtist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Music_has_Artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Music_has_Artist` (
  `idMusic` INT NOT NULL,
  `idArtist` INT NOT NULL,
  PRIMARY KEY (`idMusic`, `idArtist`),
  INDEX `fk_Music_has_Artist_Artist1_idx` (`idArtist` ASC) VISIBLE,
  INDEX `fk_Music_has_Artist_Music1_idx` (`idMusic` ASC) VISIBLE,
  CONSTRAINT `fk_Music_has_Artist_Music1`
    FOREIGN KEY (`idMusic`)
    REFERENCES `mydb`.`Music` (`idMusic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Music_has_Artist_Artist1`
    FOREIGN KEY (`idArtist`)
    REFERENCES `mydb`.`Artist` (`idArtist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Music_has_Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Music_has_Genero` (
  `idMusic` INT NOT NULL,
  `idGenero` INT NOT NULL,
  PRIMARY KEY (`idMusic`, `idGenero`),
  INDEX `fk_Music_has_Genero_Genero1_idx` (`idGenero` ASC) VISIBLE,
  INDEX `fk_Music_has_Genero_Music1_idx` (`idMusic` ASC) VISIBLE,
  CONSTRAINT `fk_Music_has_Genero_Music1`
    FOREIGN KEY (`idMusic`)
    REFERENCES `mydb`.`Music` (`idMusic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Music_has_Genero_Genero1`
    FOREIGN KEY (`idGenero`)
    REFERENCES `mydb`.`Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Genero_has_Artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Genero_has_Artist` (
  `idGenero` INT NOT NULL,
  `idArtist` INT NOT NULL,
  PRIMARY KEY (`idGenero`, `idArtist`),
  INDEX `fk_Genero_has_Artist_Artist1_idx` (`idArtist` ASC) VISIBLE,
  INDEX `fk_Genero_has_Artist_Genero1_idx` (`idGenero` ASC) VISIBLE,
  CONSTRAINT `fk_Genero_has_Artist_Genero1`
    FOREIGN KEY (`idGenero`)
    REFERENCES `mydb`.`Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Genero_has_Artist_Artist1`
    FOREIGN KEY (`idArtist`)
    REFERENCES `mydb`.`Artist` (`idArtist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Plano_has_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Plano_has_Usuario` (
  `idPlano` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idPlano`, `idUsuario`),
  INDEX `fk_Plano_has_Usuario_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_Plano_has_Usuario_Plano1_idx` (`idPlano` ASC) VISIBLE,
  CONSTRAINT `fk_Plano_has_Usuario_Plano1`
    FOREIGN KEY (`idPlano`)
    REFERENCES `mydb`.`Plano` (`idPlano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plano_has_Usuario_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
