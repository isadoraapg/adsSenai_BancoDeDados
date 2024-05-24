/*1 - Selecione todas a colunas da tabela Funcionário, do funcionário admitido a mais tempo e que não esteja demitido (dataDemissao esteja vazia) (1 linha);*/
SELECT * FROM funcionario 
WHERE DataAdmissao = (SELECT min(DataAdmissao) FROM funcionario WHERE DataDemissao IS NULL);

/*2 - Selecione as colunas idFuncionario e nome da tabela Funcionario, dataInicio da tabela ParticipantesProjeto, idPapel e Descricao da tabela Papel dos funcionários que estão 
trabalhando no projeto 5 (considere a dataFim da tabela ParticipanteProjeto vazia) (5 linhas);*/
SELECT f.idFuncionario, f.nome, part.dataInicio, part.idPapel, p.descricao
FROM funcionario f
INNER JOIN participantesprojeto part ON f.idFuncionario = part.idFuncionario
INNER JOIN papel p ON part.idPapel = p.idPapel
WHERE part.idProjeto = 5 AND part.DataFim IS NULL;

/*3 - Selecione todas as colunas da tabela Funcionario, as colunas idPapel e descricao da tabela Papel dos Funcionários que já trabalharam em algum projeto cuja coluna Atividades
contenha o termo “testar”. Não apresentar linhas duplicadas (5 linhas);*/
SELECT DISTINCT f.*, p.idPapel, p.descricao
FROM funcionario f
INNER JOIN participantesprojeto part ON f.idFuncionario = part.idFuncionario
INNER JOIN projeto proj ON part.idProjeto = proj.idProjeto
INNER JOIN papel p ON part.idPapel = p.idPapel
WHERE p.atividades LIKE '%testar%';

/*4 - Selecione as colunas idProjeto, nomeProjeto, dataInicio e dataFim da tabela Projeto, a soma das horasEstimadas e a soma das horasRealizadas, (tabela ParticipanteProjeto) de 
todos os projetos onde a soma da horasRealizadas é maior que a soma das horasEstimadas (2 linha);*/
SELECT proj.idProjeto, proj.nomeProjeto, proj.dataInicio, proj.dataFim, 
SUM(part.horasEstimadas) AS somaHorasEstimadas,
SUM(part.horasRealizadas) AS somaHorasRealizadas
FROM projeto proj
INNER JOIN participantesprojeto part ON part.idProjeto = proj.idProjeto
GROUP BY proj.idProjeto HAVING SUM(part.HorasRealizadas) > SUM(part.HorasEstimadas);

/*5 - Selecione todas as colunas da tabela Funcionario onde o funcionário não esteja demitido (coluna DataDemissao vazia) e não participe de qualquer projeto (tabela ParticipanteProjeto)(2 linhas);*/
SELECT * FROM funcionario WHERE DataDemissao IS NULL AND idFuncionario NOT IN (SELECT idFuncionario FROM participantesprojeto);


/*6 - Dada tabela abaixo
create table Empregado (
idEmpregado int not null,
idProjeto  int not null,
nomeEmpregado varchar (50),
horasPrevistas smallint,
horasEstimadas smallint,
primary key (idEmpregado, idProjeto));

E sabendo que nesta tabela as dependências funcionais encontradas são
idEmpregado  -> nomeEmpregado
idEmpregado, idProjeto -> horasPrevistas
idEmpregado, idProjeto -> horasEstimadas

Analise se a mesma se encontra na terceira forma normal. Se entender que a tabela não está na terceira forma normal 
providencie as adequações. Caso contrário apenas responda “tabela Empregado está na 3FN”*/

/*Não está na terceira forma normal. Para 3FN o ideal seria separar uma table de empregado e outra de projeto,
onde idEmpregado seria chave estrangeira na tabela Projeto:
CREATE TABLE Empregado (
  `idempregado` INT NOT NULL,
  `nome` VARCHAR(50) NULL,
  PRIMARY KEY (`idempregado`)
  );

CREATE TABLE Projeto (
  `idprojeto` INT NOT NULL,
  `horasPrevistas` SMALLINT(10) NULL,
  `horasEstimadas` SMALLINT(10) NULL,
  `empregado_idempregado` INT NOT NULL,
  PRIMARY KEY (`idprojeto`),
  INDEX `fk_projeto_empregado1_idx` (`empregado_idempregado` ASC),
  CONSTRAINT `fk_projeto_empregado1`
    FOREIGN KEY (`empregado_idempregado`)
    REFERENCES `sakila`.`empregado` (`idempregado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
*/

/*7 - Dado o conjunto de dados abaixo, em JSON, que aborda uma lista de filmes, proponha um modelo de dados normalizado até a terceira forma normal 
para manter estes dados.

CREATE TABLE Movies (
    idMovie INT PRIMARY KEY,
    title VARCHAR(255),
    year INT,
    runtime INT,
    director VARCHAR(255),
    plot TEXT
);

CREATE TABLE Genres (
    idGenre INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE MovieGenre (
    idMovie INT,
    idGenre INT,
    PRIMARY KEY (idMovie, idGenre),
    FOREIGN KEY (idMovie) REFERENCES Filmes(idMovie),
    FOREIGN KEY (idGenre) REFERENCES Generos(idGenre)
);

*/

