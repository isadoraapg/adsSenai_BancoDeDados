SELECT * FROM corp.municipio WHERE siglaEstado = 'SC' ORDER BY nomeMunicipio;

SELECT nome, telefone, dataNasc FROM corp.pessoa WHERE DataNasc between "1980-01-01" and "1980-12-31";

/*OU:
SELECT nome, telefone, dataNasc FROM corp.pessoa WHERE YEAR(dataNasc) = 1980;
*/

SELECT nome, bairro, complemento, cep, email FROM corp.pessoa WHERE CodMunicipio <> 19070;

SELECT codPessoa, nome, rg FROM corp.pessoa WHERE sexo = 'M' AND codCurso = 22 order by nome;

/*OU:
SELECT pessoa.CodPessoa, pessoa.Nome, pessoa.RG FROM pessoa JOIN curso ON pessoa.CodCurso = curso.CodCurso WHERE pessoa.Sexo = 'M' 
AND curso.Nome = 'Bacharelado em Análise de Sistemas' ORDER BY pessoa.Nome;
*/

SELECT * FROM corp.pessoa WHERE (bairro = 'batel' OR 'centro') AND (CodCurso NOT IN (1, 4, 6));

SELECT * FROM corp.idioma ORDER BY CodIdioma;

DELETE FROM municipio WHERE siglaEstado = 'RS';
DELETE FROM unidadeFederacao WHERE siglaUf = 'RS';

INSERT INTO corp.municipio VALUES (5292, 'SALVADOR', 'SALVADOR', 'BA');

 INSERT INTO `corp`.`curso` (`Nome`, `CargaHoraria`) VALUES ('FARMÁCIA', 3600);

UPDATE corp.pessoa SET nome = 'João da Silva', datanasc = '1980-09-23', codMunicipio = 25054, bairro = 'Centro' WHERE codPessoa = 710;

DELETE FROM corp.pessoaidioma WHERE CodIdioma = 4;