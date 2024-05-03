/*UNION
Union permite combinar resultados de duas ou mais consultas.  */

SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

select codCurso, nome
from    Curso
union
select  codIdioma, descricao
from   idioma;

/*Perceba que cada SELECT dentro do UNION deve ter o mesmo número de colunas e os tipos devem ser compatíveis. */

/*FUNÇÕES DE AGREGAÇÃO:
São funções que retornam um único valor a partir de valores de uma coluna:
AVG() 
COUNT()
FIRST()
LAST()
MAX()
MIN()
SUM() */

select max(dataNasc) as maior, 
       min(datanasc) as menor
from   Pessoa;

select count(*) 
from   PessoaIdioma; /*qtas linhas tem a tabela idiomas*/

/*GROUP BY:
O “GROUP BY” é utilizado juntamente com as funções de agregação para efetuar agrupamento por uma ou mais colunas.

SELECT column_name, aggre_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name;
*/

select sexo, count(*)  as quantidade
from   Pessoa
where  codCurso = 1
group by sexo;

/*EXERCÍCIO:*/

/*1- Liste a quantidade de linhas tabela Pessoa agrupada por código de município;*/
SELECT codMunicipio, count(*) FROM pessoa GROUP BY codMunicipio;

SELECT m.codMunicipio, m.NomeMunicipio, count(*) FROM pessoa p 
INNER JOIN municipio m ON m.codMunicipio = p.codMunicipio 
GROUP BY m.codMunicipio, m.NomeMunicipio;

/*2- Liste a quantidade de pessoas tabela Pessoa agrupada por nome de município, do estado do Paraná, 
ordenado por nome do município;*/
SELECT count(*) FROM pessoa p 
INNER JOIN municipio m ON m.CodMunicipio = p.CodMunicipio
WHERE siglaEstado = 'PR'
GROUP BY nomeMunicipio
ORDER BY nomeMunicipio;

SELECT m.codMunicipio, m.NomeMunicipio, count(*) FROM pessoa p 
INNER JOIN municipio m ON m.codMunicipio = p.codMunicipio 
WHERE siglaEstado = 'PR'
GROUP BY m.codMunicipio, m.NomeMunicipio
ORDER BY nomeMunicipio;


/*HAVING:
O HAVING permite as consultas SQL declarar restrições sobre as funções de agregação, o que não pode ser feito na cláusula WHERE*/

/*Exemplo, selecione as pessoas que sabem mais de dois idiomas:*/

select p.codPessoa, nome, count(*)
from   Pessoa p
inner join pessoaidioma pi 
       on pi.codPessoa = p.codPessoa
group by p.codPessoa, nome
having count(*) > 2;

/*EXERCÍCIO:*/

/*1- Liste o nome do curso e quantidade de pessoas onde o número de pessoas do sexo feminino é maior que 4;*/
SELECT c.nome, count(*)
FROM pessoa p
INNER JOIN curso c ON p.CodCurso = c.CodCurso
WHERE p.sexo = 'F'
GROUP BY c.nome
HAVING count(*) > 4;

/*2- Liste os cursos cuja a idade média, em anos, das pessoas é maior que 45;*/
select p.nome, DataNasc, now(),
		timestampdiff(YEAR, dataNasc, CURDATE()) AS idade 
from pessoa p 
inner join curso c on c.CodCurso = p.codCurso;

/*correção: */
select c.nome,
		avg(timestampdiff(YEAR, dataNasc, CURDATE())) AS mediaIdade 
from pessoa p 
inner join curso c on c.CodCurso = p.codCurso
group by c.nome
having avg(timestampdiff(YEAR, dataNasc, CURDATE())) > 45;
