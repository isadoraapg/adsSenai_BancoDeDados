/*JOIN - CONSULTA EM MAIS DE 1 TABELA*/
SELECT codPessoa, nome, rg, pessoa.CodMunicipio, nomeMunicipio FROM corp.pessoa INNER JOIN corp.Municipio ON pessoa.CodMunicipio = municipio.CodMunicipio;
SELECT codPessoa, nome, rg, pessoa.CodMunicipio, nomeMunicipio FROM corp.pessoa JOIN corp.Municipio ON pessoa.CodMunicipio = municipio.CodMunicipio;


/*CONTA QUANTAS LINHAS TEM A TABELA*/
SELECT count(*) FROM corp.pessoa;
SELECT count(*) FROM corp.municipio;

/*INNER JOIN ou JOIN retorna as linhas onde há uma igualdade de valores entre as colunas das tabelas*/
/*alias = apelido q dou para tabela: FROM Pessoa p INNER JOIN Municipio m......*/

/*OUTRA FORMA DE FAZER A CONSULTA*/
SELECT codPessoa, nome, rg, p.CodMunicipio, nomeMunicipio FROM Pessoa p, Municipio m WHERE p.CodMunicipio = m.CodMunicipio;

/*EXERCÍCIO*/
/*1- Liste todos os nomes dos municipios e seu respectivo nome de estado e sigla, ordenado por nome do municipio*/
SELECT nomeMunicipio, siglaEstado, NomeOficial FROM corp.municipio INNER JOIN corp.unidadefederacao ON SiglaEstado = SiglaUF ORDER BY nomeMunicipio;

/*2- Liste o nome da pessoa, o código do curso, o nome do curso*/
SELECT pessoa.nome, pessoa.codCurso, curso.Nome FROM corp.pessoa INNER JOIN corp.curso ON pessoa.CodCurso = curso.CodCurso; 

/*3- Liste o nome da pessoa, o telefone, o idioma(código e descrição) que a pessa conhece e o nível de conhecimento no idioma ordenado por Nome*/
SELECT pessoa.nome, pessoa.telefone, idioma.CodIdioma, idioma.Descricao, pessoaidioma.NivelConhecimento FROM corp.pessoa INNER JOIN corp.pessoaidioma 
ON pessoa.CodPessoa = pessoaidioma.CodPessoa INNER JOIN corp.idioma ON pessoaidioma.CodIdioma = idioma.CodIdioma ORDER BY pessoa.Nome;

/*4- Liste o código, nome, telefone e o nível de conhecimento das pessoas que sabem inglês*/
SELECT pessoa.codpessoa, pessoa.nome, pessoa.telefone, idioma.CodIdioma, idioma.Descricao, pessoaidioma.NivelConhecimento FROM corp.pessoa INNER JOIN corp.pessoaidioma 
ON pessoa.CodPessoa = pessoaidioma.CodPessoa INNER JOIN corp.idioma ON pessoaidioma.CodIdioma = idioma.CodIdioma WHERE idioma.CodIdioma = 1 ORDER BY pessoa.Nome;

/*5- Liste o código, nome, telefone da pessoa e o nome do municipio das pessoas que sabem inglês com nível de conhecimento Fluente e que residem em SC*/
SELECT pessoa.codpessoa, pessoa.nome, pessoa.telefone, municipio.nomeMunicipio, idioma.CodIdioma, idioma.Descricao, pessoaidioma.NivelConhecimento 
FROM corp.pessoa 
INNER JOIN corp.municipio ON pessoa.CodMunicipio = municipio.CodMunicipio
INNER JOIN corp.pessoaidioma ON pessoa.CodPessoa = pessoaidioma.CodPessoa 
INNER JOIN corp.idioma ON pessoaidioma.CodIdioma = idioma.CodIdioma 
WHERE idioma.CodIdioma = 1 AND municipio.SiglaEstado = 'sc' AND pessoaidioma.NivelConhecimento = 'Fluente'
ORDER BY pessoa.Nome;

/*LEFT JOIN*/
/*Retorna todas as linhas da tabela a esquerda (table_name1) mesmo que não haja valor equivalente na tabela a direita (table_name2).*/
SELECT codpessoa, p.nome, p.codcurso, c.nome FROM pessoa p LEFT JOIN curso c on p.CodCurso = c.CodCurso;

/*RIGHT JOIN*/
/*Retorna todas as linhas da tabela a direita (table_name2 mesmo que não haja valor equivalente na tabela a direita (table_name1).*/
SELECT CodPessoa, p.Nome, p.codCurso, c.Nome FROM Pessoa p RIGHT JOIN Curso c on p.codCurso = c.CodCurso;

/*FULL JOIN */
/*Retorna todas as linhas da tabela a esquerda (table_name1) e todas da tabela a direita (table_name2). É uma “união” de left e right join.*/
SELECT CodPessoa, p.Nome, p.codCurso, c.Nome FROM Pessoa p LEFT JOIN Curso c on p.codCurso = c.CodCurso
UNION
SELECT CodPessoa, p.Nome, p.codCurso, c.Nome FROM Pessoa p RIGHT JOIN Curso c on p.codCurso = c.CodCurso;

/*NATURAL JOIN*/
/*Igual ao inner join mas sem a necessidade de explicitar a junção entre as tabelas. Esta junção é deduzida a partir dos nomes das colunas*/
SELECT CodPessoa, nome, rg, p.codMunicipio, nomeMunicipio FROM Pessoa p NATURAL JOIN Municipio m;

/*EXERCÍCIO*/
/*Liste siglaUF, nome das Unidades da Federação e seus respectivos municipios, quando existir, ordenados por SiglaUF*/
SELECT unidadefederacao.SiglaUF, unidadefederacao.NomeOficial, municipio.NomeMunicipio
FROM corp.unidadefederacao LEFT JOIN corp.municipio on siglaUf = siglaEstado
ORDER BY SiglaUF;