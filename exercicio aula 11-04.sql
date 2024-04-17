SELECT * FROM corp.Municipio WHERE siglaEstado = 'SC' ORDER BY nomeMunicipio limit 10;

SELECT * FROM corp.pessoa WHERE nome LIKE '%lopes%';

SELECT * FROM corp.pessoa WHERE nome LIKE '_arina%';

SELECT * FROM corp.pessoa WHERE codMunicipio in (25054, 25023, 25091) and bairro = 'centro';

SELECT * FROM corp.pessoa WHERE cep BETWEEN 81000000 and 82000000;

SELECT nome, day(dataNasc) AS dianascimento, month(dataNasc) AS mesNascimento, dataNasc FROM corp.pessoa;

SELECT * FROM (SELECT nome, DAY(dataNasc) AS dianascimento, MONTH(dataNasc) AS mesNascimento, dataNasc FROM corp.pessoa) x WHERE x.Mesnascimento = 4;

SELECT nome, RG, TELEFONE, SEXO, DataNasc, CodMunicipio FROM corp.pessoa WHERE (sexo = 'M') AND (month(dataNasc) between '01' and '06') AND (CodMunicipio <> '19070') ORDER BY nome;

