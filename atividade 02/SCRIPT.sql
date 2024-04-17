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
-- Table `mydb`.`G1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`G1` (
  `idG1` INT NOT NULL,
  `G1col1` VARCHAR(45) NOT NULL,
  `G1col2` DATE NULL,
  PRIMARY KEY (`idG1`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AR` (
  `idAR` INT NOT NULL,
  `ARcol1` VARCHAR(45) NOT NULL,
  `ARcol2` DATETIME NOT NULL,
  PRIMARY KEY (`idAR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AB` (
  `idAB` INT NOT NULL,
  `ABcol1` INT NULL,
  `ABcol2` VARCHAR(50) NULL,
  `idG1` INT NULL,
  `idAR` INT NOT NULL,
  PRIMARY KEY (`idAB`),
  INDEX `fk_AB_G1_idx` (`idG1` ASC) VISIBLE,
  INDEX `fk_AB_AR1_idx` (`idAR` ASC) VISIBLE,
  CONSTRAINT `fk_AB_G1`
    FOREIGN KEY (`idG1`)
    REFERENCES `mydb`.`G1` (`idG1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AB_AR1`
    FOREIGN KEY (`idAR`)
    REFERENCES `mydb`.`AR` (`idAR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FX`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FX` (
  `idFX` INT NOT NULL,
  `idAB` INT NOT NULL,
  `FXcol1` VARCHAR(50) NULL,
  `FXcol2` INT NULL,
  PRIMARY KEY (`idFX`, `idAB`),
  INDEX `fk_FX_AB1_idx` (`idAB` ASC) VISIBLE,
  CONSTRAINT `fk_FX_AB1`
    FOREIGN KEY (`idAB`)
    REFERENCES `mydb`.`AB` (`idAB`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PS` (
  `idPS` INT NOT NULL,
  `PScol1` VARCHAR(45) NOT NULL,
  `PScol2` DECIMAL(15,0) NOT NULL,
  PRIMARY KEY (`idPS`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FXPS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FXPS` (
  `idFX` INT NOT NULL,
  `idAB` INT NOT NULL,
  `idPS` INT NOT NULL,
  PRIMARY KEY (`idFX`, `idAB`, `idPS`),
  INDEX `fk_FX_has_PS_PS1_idx` (`idPS` ASC) VISIBLE,
  INDEX `fk_FX_has_PS_FX1_idx` (`idFX` ASC, `idAB` ASC) VISIBLE,
  CONSTRAINT `fk_FX_has_PS_FX1`
    FOREIGN KEY (`idFX` , `idAB`)
    REFERENCES `mydb`.`FX` (`idFX` , `idAB`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FX_has_PS_PS1`
    FOREIGN KEY (`idPS`)
    REFERENCES `mydb`.`PS` (`idPS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`XYZ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`XYZ` (
  `XYZid1` INT NOT NULL,
  `XYZid2` DATE NOT NULL,
  `XYZcol2` VARCHAR(50) NOT NULL,
  `XYZcol3` BLOB NULL,
  `XYZcol4` DATETIME NOT NULL,
  PRIMARY KEY (`XYZid1`, `XYZid2`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ED1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ED1` (
  `XYZid1` INT NOT NULL,
  `XYZid2` DATE NOT NULL,
  `idG1` INT NOT NULL,
  `ED1col1` VARCHAR(200) NOT NULL,
  `ED1col2` TINYINT NOT NULL,
  PRIMARY KEY (`XYZid1`, `XYZid2`, `idG1`),
  INDEX `fk_XYZ_has_G1_G11_idx` (`idG1` ASC) VISIBLE,
  INDEX `fk_XYZ_has_G1_XYZ1_idx` (`XYZid1` ASC, `XYZid2` ASC) VISIBLE,
  CONSTRAINT `fk_XYZ_has_G1_XYZ1`
    FOREIGN KEY (`XYZid1` , `XYZid2`)
    REFERENCES `mydb`.`XYZ` (`XYZid1` , `XYZid2`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_XYZ_has_G1_G11`
    FOREIGN KEY (`idG1`)
    REFERENCES `mydb`.`G1` (`idG1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
