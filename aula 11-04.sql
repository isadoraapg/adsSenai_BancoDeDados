/*Limit*/

SELECT * FROM corp.Municipio limit 100; /*limita as linhas a 100*/

SELECT * FROM corp.Municipio WHERE nomeMunicipio LIKE 'Flor%'; /*cidades que começam com Flor*/

SELECT * FROM corp.Pessoa WHERE nome LIKE '%silva'; /*pessoas que terminam com silva*/

SELECT * FROM corp.Pessoa WHERE nome LIKE '%silva%'; /*pessoas que contem silva*/

SELECT * FROM corp.Pessoa WHERE nome LIKE 'lui_@hotmail.com'; /*vai pegar os emails q iniciam com lui, pode ser luis, luiz, etc */

SELECT Nome, year(dataNasc) as AnoNascimento FROM corp.pessoa p WHERE p.Nome LIKE 'João%';