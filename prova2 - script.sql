DROP SCHEMA IF EXISTS `projetos` ;
CREATE SCHEMA IF NOT EXISTS `projetos` DEFAULT CHARACTER SET utf8 ;
USE `projetos` ;

DROP TABLE IF EXISTS `projetos`.`Papel` ;

CREATE  TABLE IF NOT EXISTS `projetos`.`Papel` (
  `idPapel` INT NOT NULL ,
  `Descricao` VARCHAR(50) NOT NULL ,
  `Atividades` VARCHAR(500) NOT NULL ,
  PRIMARY KEY (`idPapel`) )
ENGINE = InnoDB;

DROP TABLE IF EXISTS `projetos`.`Funcionario` ;

CREATE  TABLE IF NOT EXISTS `projetos`.`Funcionario` (
  `idFuncionario` INT NOT NULL ,
  `Nome` VARCHAR(50) NOT NULL ,
  `Cpf` DECIMAL(11,0) NOT NULL ,
  `DataAdmissao` DATE NOT NULL ,
  `DataDemissao` DATE NULL ,
  PRIMARY KEY (`idFuncionario`) ,
  UNIQUE INDEX `cpf_UNIQUE` (`Cpf` ASC) )
ENGINE = InnoDB;

DROP TABLE IF EXISTS `projetos`.`Projeto` ;

CREATE  TABLE IF NOT EXISTS `projetos`.`Projeto` (
  `idProjeto` INT NOT NULL ,
  `NomeProjeto` VARCHAR(50) NOT NULL ,
  `DataInicio` DATE NOT NULL ,
  `DataFim` DATE NULL ,
  `FuncionarioLider` INT NULL ,
  PRIMARY KEY (`idProjeto`) ,
  INDEX `fk_Projeto_Funcionario1` (`FuncionarioLider` ASC) ,
  CONSTRAINT `fk_Projeto_Funcionario1`
    FOREIGN KEY (`FuncionarioLider` )
    REFERENCES `projetos`.`Funcionario` (`idFuncionario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `projetos`.`ParticipantesProjeto` ;

CREATE  TABLE IF NOT EXISTS `projetos`.`ParticipantesProjeto` (
  `idParticipantesProjeto` INT NOT NULL ,
  `idProjeto` INT NOT NULL ,
  `idFuncionario` INT NOT NULL ,
  `idPapel` INT NOT NULL ,
  `DataInicio` DATE NOT NULL ,
  `DataFim` DATE NULL ,
  `HorasEstimadas` smallint Unsigned  NULL,
  `HorasRealizadas` smallint Unsigned NULL,
  PRIMARY KEY (`idParticipantesProjeto`) ,
  INDEX `fk_ParticipantesProjeto_Projeto` (`idProjeto` ASC) ,
  INDEX `fk_ParticipantesProjeto_Funcionario1` (`idFuncionario` ASC) ,
  INDEX `fk_ParticipantesProjeto_PapelProjeto1` (`idPapel` ASC) ,
  UNIQUE INDEX `ProjPartPapel_UNIQUE` (`idProjeto` ASC, `idFuncionario` ASC, `idPapel` ASC) ,
  CONSTRAINT `fk_ParticipantesProjeto_Projeto`
    FOREIGN KEY (`idProjeto` )
    REFERENCES `projetos`.`Projeto` (`idProjeto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ParticipantesProjeto_Funcionario1`
    FOREIGN KEY (`idFuncionario` )
    REFERENCES `projetos`.`Funcionario` (`idFuncionario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ParticipantesProjeto_PapelProjeto1`
    FOREIGN KEY (`idPapel` )
    REFERENCES `projetos`.`Papel` (`idPapel` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

START TRANSACTION;

INSERT INTO `projetos`.`Papel` (`idPapel`, `Descricao`, `Atividades`) VALUES (1, 'Gerente de Projeto', 'O papel gerente de projeto aloca recursos, ajusta as prioridades, coordena interações com clientes e usuários e geralmente mantém a equipe do projeto concentrada na meta certa.');
INSERT INTO `projetos`.`Papel` (`idPapel`, `Descricao`, `Atividades`) VALUES (2, 'Analista de Sistemas', 'O papel analista de sistemas lidera e coordena a identificação de requisitos e a modelagem de casos de uso, delimitando o sistema e definindo sua funcionalidade; por exemplo, estabelecendo quais são os atores e casos de uso existentes e como eles interagem.');
INSERT INTO `projetos`.`Papel` (`idPapel`, `Descricao`, `Atividades`) VALUES (3, 'Implementador', 'O papel implementador é responsável por desenvolver e testar componentes de acordo com os padrões adotados para o projeto, para fins de integração com subsistemas maiores.');
INSERT INTO `projetos`.`Papel` (`idPapel`, `Descricao`, `Atividades`) VALUES (4, 'Analista de Teste', 'O papel Analista de Teste é responsável por inicialmente identificar e posteriormente definir os testes necessários, monitorar a abrangência dos testes e avaliar a qualidade geral obtida ao testar os Itens de Teste-alvo. ');
INSERT INTO `projetos`.`Papel` (`idPapel`, `Descricao`, `Atividades`) VALUES (5, 'Designer de Banco de Dados', 'O papel designer de banco de dados define tabelas, índices, visões, restrições, triggers, procedimentos armazenados, parâmetros de armazenamento ou tablespaces e outras construções específicas de um banco de dados necessárias para armazenar, recuperar e excluir objetos persistentes.');
INSERT INTO `projetos`.`Papel` (`idPapel`, `Descricao`, `Atividades`) VALUES (6, 'Arquiteto de Software', 'O papel arquiteto de software lidera e coordena as atividades e os artefatos técnicos no decorrer do projeto');

INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (1, 'Luis Carlos Silva', 9280073915, '2018-01-02', '2021-08-30');
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (2, 'LEVI LINUS LINDNER', 11025360834, '2018-01-16', NULL);
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (3, 'JOAO AIRTON LEAO DE SOUZA', 38984938904, '2018-05-02', NULL);
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (4, 'MAURO RECH', 37997998934, '2018-05-02', NULL);
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (6, 'CRISTINA KLOCK', 10402012968, '2018-10-01', NULL);
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (7, 'FELIPE JORGE SILVA', 28916255953, '2019-01-02', NULL);
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (8, 'MARCELO MARQUES', 10222960949, '2019-02-03', '2021-08-30');
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (9, 'PAULO ROBERTO BATISTA', 52118169949, '2019-02-03', NULL);
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (10, 'SORAIA CRISTINA BUENO', 61975907949, '2019-03-01', NULL);
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (11, 'ARTUR DOEGE', 29372518034, '2019-03-20', '2021-06-30');
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (12, 'FLAVIA ROSA RODRIGUES', 12222062934, '2019-03-01', NULL);
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (13, 'SILVIO CUSTODIO', 24932876904, '2019-07-13', NULL);
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (14, 'SERGIO JUNKES', 9603239968, '2019-11-03', NULL);
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (15, 'LUCIANO DE FAVERI', 18012094991, '2020-01-05', NULL);
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (16, 'MARCELO GOMES', 25125699080, '2021-01-02', '2021-04-01');
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (17, 'SERGIO ROBERTO MADEIRA', 84508075094, '2021-01-02', NULL);
INSERT INTO `projetos`.`Funcionario` (`idFuncionario`, `Nome`, `Cpf`, `DataAdmissao`, `DataDemissao`) VALUES (18, 'MARIZE ALCANTARA FREITAS', 00024171387, '2021-04-01', NULL);

INSERT INTO `projetos`.`Projeto` (`idProjeto`, `NomeProjeto`, `DataInicio`, `DataFim`, `FuncionarioLider`) VALUES (1, 'SICOP', '2020-03-01', NULL, 2);
INSERT INTO `projetos`.`Projeto` (`idProjeto`, `NomeProjeto`, `DataInicio`, `DataFim`, `FuncionarioLider`) VALUES (2, 'Monitoramento Ambiental', '2020-05-01', NULL, 12);
INSERT INTO `projetos`.`Projeto` (`idProjeto`, `NomeProjeto`, `DataInicio`, `DataFim`, `FuncionarioLider`) VALUES (3, 'Controle Financeiro', '2019-11-05', '2020-04-30', 3);
INSERT INTO `projetos`.`Projeto` (`idProjeto`, `NomeProjeto`, `DataInicio`, `DataFim`, `FuncionarioLider`) VALUES (4, 'Sistema Contabil', '2019-08-01', '2020-07-31', 3);
INSERT INTO `projetos`.`Projeto` (`idProjeto`, `NomeProjeto`, `DataInicio`, `DataFim`, `FuncionarioLider`) VALUES (5, 'SPED Fiscal', '2019-08-01', NULL, 9);
INSERT INTO `projetos`.`Projeto` (`idProjeto`, `NomeProjeto`, `DataInicio`, `DataFim`, `FuncionarioLider`) VALUES (6, 'SPED Contabil', '2019-08-01', NULL, 9);
INSERT INTO `projetos`.`Projeto` (`idProjeto`, `NomeProjeto`, `DataInicio`, `DataFim`, `FuncionarioLider`) VALUES (7, 'Publicação Eletrônica', '2022-05-02', NULL, NULL);
INSERT INTO `projetos`.`Projeto` (`idProjeto`, `NomeProjeto`, `DataInicio`, `DataFim`, `FuncionarioLider`) VALUES (8, 'Integração Meios de pagamento', '2022-06-10', NULL, 18);

INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (1, 1, 4, 2, '2020-04-01', NULL, 132, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (2, 1, 6, 3, '2020-05-01', NULL, 528, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (3, 1, 7, 3, '2020-05-01', NULL, 240, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (4, 1, 11, 5, '2020-05-01', '2020-08-31', 40, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (5, 2, 4, 2, '2020-06-01', null, 220, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (6, 2, 8, 3, '2020-08-01', '2021-08-30', 440, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (7, 2, 7, 3, '2021-07-01', NULL, 660, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (8, 2, 14, 4, '2021-01-01', NULL, 160, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (9, 2, 15, 2, '2021-01-01', NULL, 110, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (10, 3, 10, 2, '2020-01-02', '2020-04-30', 320, 362);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (11, 4, 7, 2, '2020-01-02', '2020-05-31', 400, 400);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (12, 5, 13, 2, '2020-01-02', NULL, 132, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (13, 5, 14, 6, '2020-03-01', NULL, 200, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (14, 5, 3, 2, '2020-03-01', NULL, 600, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (15, 5, 11, 5, '2020-04-01', '2020-12-30', 120, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (16, 5, 15, 4, '2020-07-01', NULL, 180, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (17, 5, 6, 3, '2020-05-01', NULL, 660, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (18, 5, 8, 3, '2020-05-01', '2021-08-30', 880, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (19, 5, 4, 2, '2020-03-01', '2020-05-01', 600, 0);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (20, 7, 9, 1, '2022-05-02', NULL, 320, 160);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (21, 7, 17, 2, '2022-05-02', NULL, 320, 320);
INSERT INTO `projetos`.`ParticipantesProjeto` (`idParticipantesProjeto`, `idProjeto`, `idFuncionario`, `idPapel`, `DataInicio`, `DataFim`, `HorasEstimadas`, `HorasRealizadas`) VALUES (22, 7, 18, 2, '2020-05-17', NULL, 220, 400);

COMMIT;
