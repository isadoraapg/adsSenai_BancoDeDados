/*SUBQUERY*/
/*Uma consulta dentro da outra*/

select codPessoa, nome, codMunicipio
from   Pessoa p
where  p.CodMunicipio not in (select m.codMunicipio from Municipio m where m.siglaEstado = 'PR');
   

SELECT CodPessoa, nome, rg, telefone, codCurso, (select nome from Curso c where c.codCurso = p.codCurso) as nomeCurso
FROM Pessoa p
where (bairro = 'centro' or bairro = 'batel') and ifnull(codCurso, 0) not in (1, 4, 6);

/*ou usa o inner join: */

SELECT CodPessoa, p.nome, rg, telefone, c.codCurso, c.nome as nomeCurso
FROM Pessoa p
left join curso c on c.codCurso = p.codCurso
where (bairro = 'centro' or bairro = 'batel') and ifnull(c.codCurso, 0) not in (1, 4, 6);

SELECT tabela.*
FROM  (SELECT p.*, m.NomeMunicipio, m.siglaEstado 
	FROM Pessoa p
   	INNER JOIN Municipio m ON m.codMunicipio = p.CodMunicipio) tabela
WHERE  tabela.codMunicipio = 25054;

/*1- Liste o código, nome, telefone da pessoa e o nome do munícipio das pessoas que sabem inglês com nivel de conhecimento Fluente e que residem em SC (procure usar uma subquery);*/
SELECT codPessoa, nome, telefone, (SELECT nomeMunicipio FROM Municipio m WHERE m.codMunicipio = p.codMunicipio) AS nomeMunicipio
FROM Pessoa p 
INNER JOIN municipio m ON m.CodMunicipio = p.CodMunicipio
WHERE m.siglaEstado = 'SC';

SELECT codPessoa, nome, telefone, nomeMunicipio
FROM Pessoa p
INNER JOIN municipio m ON m.CodMunicipio = p.CodMunicipio
WHERE codPessoa IN (SELECT pi.codPessoa FROM PessoaIdioma pi WHERE pi.nivelConhecimento = 'Fluente' AND pi.codIdioma =1)
AND siglaEstado = 'SC';

/*2- Acrescente a coluna codCurso e o nome do curso ao item anterior;*/
SELECT p.codPessoa, nome, telefone, nomeMunicipio, pi.nivelConhecimento, codCurso, (SELECT nome FROM curso c WHERE c.codCurso = p.codCurso) as nomeCurso
FROM pessoa p
INNER JOIN municipio m ON m.CodMunicipio = p.CodMunicipio
INNER JOIN pessoaIdioma pi ON pi.codPessoa = p.codPessoa
WHERE pi.nivelConhecimento = 'Fluente' AND pi.codIdioma = 1 AND siglaEstado = 'SC';

/*3- Liste os idiomas que não são conhecidos por qualquer pessoa;*/
SELECT * FROM corp.idioma WHERE codIdioma NOT IN (SELECT DISTINCT pi.codIdioma FROM pessoaidioma pi); /*lista todas as pessoas q o cod idioma nao esta na tabela pessoa idioma*/

select * from pessoaIdioma pi where codidioma=4;


/*Também é possível utilizar subqueries em comandos update, insert ou delete
Exemplo:*/

Delete from PessoaIdioma  
where  CodIdioma in 
      (select i.codIdioma from Idioma i
       where descricao like '%nês');
       

