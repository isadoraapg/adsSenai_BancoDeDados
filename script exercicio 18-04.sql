DROP DATABASE IF EXISTS financeiro;
CREATE SCHEMA IF NOT EXISTS `financeiro` DEFAULT CHARACTER SET utf8 ;
USE `financeiro` ;

DROP view IF EXISTS `financeiro`.`v_Pagamentos` ;
DROP TABLE IF EXISTS `financeiro`.`Pagamento` ;
DROP TABLE IF EXISTS `financeiro`.`Obrigacao` ;
DROP TABLE IF EXISTS `financeiro`.`Favorecido` ;
DROP TABLE IF EXISTS `financeiro`.`Conta` ;
DROP TABLE IF EXISTS `financeiro`.`Categoria` ;
DROP TABLE IF EXISTS `financeiro`.`Cliente` ;

CREATE  TABLE IF NOT EXISTS `financeiro`.`Favorecido` (
  `idFavorecido` INT NOT NULL ,
  `Nome` VARCHAR(50) NOT NULL ,
  `CNPJ` VARCHAR(15) NULL ,
  `Telefone` VARCHAR(14) NOT NULL ,
  PRIMARY KEY (`idFavorecido`) )
ENGINE = InnoDB;

CREATE  TABLE IF NOT EXISTS `financeiro`.`Cliente` (
  `idCliente` INT NOT NULL ,
  `NomeCliente` VARCHAR(50) NOT NULL ,
  `CNPJ` VARCHAR(15) NULL ,
  `Telefone` VARCHAR(14) NOT NULL ,
  PRIMARY KEY (`idCliente`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `financeiro`.`Conta`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `financeiro`.`Conta` (
  `idConta` INT NOT NULL ,
  `NomeConta` VARCHAR(45) NOT NULL ,
  `Banco` SMALLINT NOT NULL ,
  `Agencia` SMALLINT NOT NULL ,
  `Conta` VARCHAR(10) NOT NULL ,
  `SaldoAtual` DECIMAL(10,2) NULL ,
  PRIMARY KEY (`idConta`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `financeiro`.`Categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `financeiro`.`Categoria` (
  `idCategoria` INT NOT NULL ,
  `Descricao` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idCategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `financeiro`.`Obrigacao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `financeiro`.`Obrigacao` (
  `idObrigacao` INT NOT NULL ,
  `DataVencimento` DATE NOT NULL ,
  `ValorLiquido` DECIMAL(10,2) NOT NULL ,
  `CodigoBarras` VARCHAR(44) NULL ,
  `estaPago` TINYINT(1) NOT NULL ,
  `idFavorecido` INT NOT NULL ,
  `idConta` INT NULL ,
  `idCategoria` INT NOT NULL ,
  PRIMARY KEY (`idObrigacao`) ,
  INDEX `fk_Obrigacoes_Favorecido1` (`idFavorecido` ASC) ,
  INDEX `fk_Obrigacoes_Conta1` (`idConta` ASC) ,
  INDEX `fk_Obrigacoes_Categoria1` (`idCategoria` ASC) ,
  CONSTRAINT `fk_Obrigacoes_Favorecido1`
    FOREIGN KEY (`idFavorecido` )
    REFERENCES `financeiro`.`Favorecido` (`idFavorecido` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Obrigacoes_Conta1`
    FOREIGN KEY (`idConta` )
    REFERENCES `financeiro`.`Conta` (`idConta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Obrigacoes_Categoria1`
    FOREIGN KEY (`idCategoria` )
    REFERENCES `financeiro`.`Categoria` (`idCategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `financeiro`.`Pagamento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `financeiro`.`Pagamento` (
  `idPagamento` INT NOT NULL AUTO_INCREMENT ,
  `DataPagamento` DATE NOT NULL ,
  `ValorLiquido` DECIMAL(10,2) NOT NULL ,
  `Multa` DECIMAL(10,2) NULL ,
  `Juros` DECIMAL(10,2) NULL ,
  `idObrigacao` INT NOT NULL ,
  `idConta` INT NOT NULL ,
  INDEX `fk_Pagamento_Obrigacao1` (`idObrigacao` ASC) ,
  PRIMARY KEY (`idPagamento`) ,
  INDEX `fk_Pagamento_Conta1` (`idConta` ASC) ,
  CONSTRAINT `fk_Pagamento_Obrigacao1`
    FOREIGN KEY (`idObrigacao` )
    REFERENCES `financeiro`.`Obrigacao` (`idObrigacao` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pagamento_Conta1`
    FOREIGN KEY (`idConta` )
    REFERENCES `financeiro`.`Conta` (`idConta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

create view v_pagamentos
as
select  p.idPagamento, p.DataPagamento, o.DataVencimento, p.ValorLiquido,
    	p.Multa, p.Juros, o.ValorLiquido as valorOriginal, o.idObrigacao
from    Pagamento p
inner join Obrigacao o on p.idObrigacao = o.idObrigacao;

insert into Categoria values (1, 'Bens de consumo');
insert into Categoria values (2, 'Servicos');

insert INTO Favorecido values (1, 'CELESC SA', '08336783000190', '0800480120');
insert INTO Favorecido values (2, 'Walmart', '93209765008525', '3201-5000');
insert INTO Favorecido values (3, 'Posto São João', '79009254000120', '3248-6901');
insert INTO Favorecido values (5, 'Brasil Telecom SA', '05423963000626', '1057');
insert INTO Favorecido values (7, 'Unimed Florianopolis', '77858611000108', '3250-5100');
insert INTO Favorecido values (8, 'ARCELORMITTAL BRASIL S/A', '27251974000102', '3225-4901');
insert INTO Favorecido values (9, 'BRASPRESS TRANSPORTES URGENTES LTDA', '04284081000150', '3429-3333');
insert INTO Favorecido values (10, 'WETZEL SA', '84683671000194', '3451-4033');
insert INTO Favorecido values (11, 'Embracon Seguranca e Vigilancia Ltda', '04452053000102', '30354000');
insert INTO Favorecido values (12, 'BREITKOPF VEICULOS LTDA','82637513000172', '4732611075');

insert INTO Cliente values (325, 'SUPERROSA LTDA', '02931088000190', '3201-4000');
insert INTO Cliente values (326, 'BISTEK SUPERMERCADOS LTDA', '83261420000142', '3227-1500');
insert INTO Cliente values (327, 'Posto São João', 79009254000120, '3380-5001');

insert into Conta values (1, 'BB Principal', 1, 1808, '15.369-x', 1000);
insert into Conta values (2, 'CEF', 104, 1074, '76580', 3598.5);
insert into Conta values (3, 'BB Credito rotativo', 1, 1808, '4.169-1', 2500);

insert into Obrigacao values (85, '2015-08-31', 199, null, 1, 10, 2, 1);
insert into Obrigacao values (87, '2015-09-16', 322, null, 1, 10, 2, 1);
insert into Obrigacao values (88, '2015-09-10', 251, null, 1, 7, 2, 2);
insert into Obrigacao values (89, '2015-09-16', 98, null, 1, 1, 2, 2);
insert into Obrigacao values (90, '2015-09-23', 136, null, 1, 5, 2, 2);
insert into Obrigacao values (92, '2015-09-30', 452, null, 0, 2, 1, 1);
insert into Obrigacao values (93, '2015-10-02', 453, null, 0, 2, 1, 1);
insert into Obrigacao values (94, '2015-09-30', 50, null, 0, 3, null, 1);
insert into Obrigacao values (95, '2015-09-30', 57, null, 1, 5, 2, 2);
insert into Obrigacao values (96, '2015-10-02', 300, null, 1, 8, 2, 1);
insert into Obrigacao values (97, '2015-11-02', 300, null, 1, 8, 2, 1);
insert into Obrigacao values (98, '2015-10-23', 300, null, 0, 5, 2, 1);
insert into Obrigacao values (99, '2015-10-13', 900, null, 0, 9, 1, 2);
insert into Obrigacao values (100, '2015-10-16', 132, null, 0, 1, 3, 1);
insert into Obrigacao values (101, '2015-10-17', 691, null, 1, 12, 2, 1);
insert into Obrigacao values (102, '2015-11-17', 691, null, 0, 12, 2, 1);

insert into Pagamento values (1, '2015-09-16', 254.5, 2.5, 1, 88, 2);
insert into Pagamento values (2, '2015-09-16', 98, null, null, 89, 1);
insert into Pagamento values (3, '2015-09-23', 136, null, null, 90, 2);
insert into Pagamento values (4, '2015-09-30', 57, null, null, 95, 2);
insert into Pagamento values (5, '2015-10-02', 322, null, null, 87, 1);
insert into Pagamento values (6, '2015-09-02', 200, 1, 0, 85, 1);
insert into Pagamento values (7, '2015-10-02', 300, null, null, 96, 2);
insert into Pagamento values (8, '2015-10-19', 693, 2, null, 101, 2);
insert into Pagamento values (9, '2015-11-01', 300, null, null, 97, 2);

use financeiro;
