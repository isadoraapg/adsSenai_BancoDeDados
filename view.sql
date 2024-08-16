/*VIEW*/
/*tabela corp - baixar*/

CREATE VIEW v_PessoaMunicipio
as
SELECT p.*, m.NomeMunicipio, m.siglaEstado
FROM Pessoa p
INNER JOIN Municipio m on m.codMunicipio = p.CodMunicipio;

SELECT * 
FROM v_PessoaMunicipio;


/*1- Crie uma view chamada v_pessoas_ingles que liste o código da pessoa, nome, o telefone, código do curso e o nível de conhecimento, 
de todas as pessoas que sabem idioma inglês;
2- Atualize o nome da pessoa na view v_pessoaMunicipio para ‘Marcelo Tonholi da Silva’ onde a coluna codPessoa é 708;
*/

CREATE VIEW v_pessoas_ingles AS 
SELECT p.codPessoa, nome, telefone, codCurso, pi.nivelConhecimento, pi.codIdioma
FROM pessoa p
INNER JOIN PessoaIdioma pi ON pi.codPessoa = p.codPessoa
WHERE codIdioma = 1;

SELECT * FROM corp.v_pessoas_ingles WHERE codCurso = 10;

UPDATE corp.v_pessoamunicipio set nome = 'Marcelo Tonholi da Silva' WHERE codPessoa = 708;

SELECT * FROM corp.pessoa WHERE codPessoa = 708;