SELECT nome, rg FROM corp.pessoa;

SELECT CodCurso FROM corp.pessoa;

SELECT distinct sexo FROM corp.pessoa;

SELECT * FROM corp.pessoa WHERE sexo = 'F';

SELECT * FROM corp.pessoa WHERE CodCurso = '1' AND bairro = 'batel';

SELECT * FROM corp.pessoa WHERE CodCurso = '1' OR bairro = 'batel';

SELECT * FROM corp.pessoa ORDER BY nome;

SELECT * FROM corp.pessoa ORDER BY DataNasc DESC;

INSERT INTO corp.curso VALUES ('Psicologia');

UPDATE Pessoa SET nome = 'Luis Inacio Belin' WHERE codPessoa = 755;

SELECT nome FROM corp.pessoa WHERE CodPessoa = 755;

DELETE from pessoa where codpessoa = 755; /*não é possivel apagar pq ele esta sendo referenciado como chave estrangeira em outra tabela*/

SELECT * FROM PessoaIdioma WHERE codPessoa = 755;

DELETE FROM PessoaIdioma WHERE codPessoa = 755;

DELETE FROM pessoa WHERE codPessoa = 755;

