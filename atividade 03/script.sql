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
-- Table `mydb`.`ContaCorrente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ContaCorrente` (
  `idContaCorrente` INT NOT NULL,
  `banco` VARCHAR(45) NOT NULL,
  `nomeConta` VARCHAR(45) NOT NULL,
  `agencia` VARCHAR(10) NOT NULL,
  `numeroConta` VARCHAR(10) NOT NULL,
  `saldoAtual` DECIMAL(12,2) NOT NULL,
  PRIMARY KEY (`idContaCorrente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `idCategoria` INT NOT NULL,
  `nomeCategoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Favorecido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Favorecido` (
  `Nome` INT NOT NULL,
  `CNPJ` VARCHAR(14) NOT NULL,
  `telefone` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`CNPJ`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Obrigacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Obrigacao` (
  `idContasPagar` INT NOT NULL,
  `vencimento` DATE NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `codBarras` VARCHAR(48) NULL,
  `idContaCorrente` INT NULL,
  `idCategoria` INT NOT NULL,
  `CNPJ` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idContasPagar`),
  INDEX `fk_ContasPagar_ContaCorrente1_idx` (`idContaCorrente` ASC) VISIBLE,
  INDEX `fk_Obrigacao_Categoria1_idx` (`idCategoria` ASC) VISIBLE,
  INDEX `fk_Obrigacao_Favorecido1_idx` (`CNPJ` ASC) VISIBLE,
  CONSTRAINT `fk_ContasPagar_ContaCorrente1`
    FOREIGN KEY (`idContaCorrente`)
    REFERENCES `mydb`.`ContaCorrente` (`idContaCorrente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Obrigacao_Categoria1`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `mydb`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Obrigacao_Favorecido1`
    FOREIGN KEY (`CNPJ`)
    REFERENCES `mydb`.`Favorecido` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pagamento` (
  `idPagamento` INT NOT NULL,
  `dataPagamento` DATETIME NOT NULL,
  `valorPago` DECIMAL(10,2) NOT NULL,
  `idContaCorrente` INT NOT NULL,
  `idContasPagar` INT NOT NULL,
  `multa` DECIMAL(10,2) NULL,
  `juros` DECIMAL(10,2) NULL,
  PRIMARY KEY (`idPagamento`),
  INDEX `fk_Pago_ContaCorrente1_idx` (`idContaCorrente` ASC) VISIBLE,
  INDEX `fk_Pago_Obrigacao1_idx` (`idContasPagar` ASC) VISIBLE,
  CONSTRAINT `fk_Pago_ContaCorrente1`
    FOREIGN KEY (`idContaCorrente`)
    REFERENCES `mydb`.`ContaCorrente` (`idContaCorrente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pago_Obrigacao1`
    FOREIGN KEY (`idContasPagar`)
    REFERENCES `mydb`.`Obrigacao` (`idContasPagar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
