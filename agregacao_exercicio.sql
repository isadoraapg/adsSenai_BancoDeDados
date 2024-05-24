/*ATIVIDADE*/
/*Dado o script de criação de um banco de dados mysql que se encontra ao final do documento, defina os comandos SQL para:*/

/*1- Liste a soma do valor líquido de todas as obrigações com vencimento no mês de setembro. (resultado, 1 linha).*/
SELECT SUM(valorLiquido) FROM obrigacao o WHERE dataVencimento between '2015-09-01' and '2015-09-30';

/*2- Liste a soma do valor líquido de todas as obrigações com vencimento no mês de setembro, agrupado por data de vencimento. (resultado, 4 linhas).*/
SELECT dataVencimento, SUM(valorLiquido) 
FROM obrigacao o 
WHERE dataVencimento between '2015-09-01' and '2015-09-30'
GROUP BY dataVencimento;

/*3- Liste a soma do valor líquido de todas as obrigações com vencimento no mês de setembro, agrupado por categoria (resultado, 2 linhas).*/
SELECT c.idCategoria, SUM(valorLiquido)
FROM obrigacao o 
INNER JOIN categoria c ON o.idCategoria = c.idCategoria
WHERE dataVencimento between '2015-09-01' and '2015-09-30'
GROUP BY c.idCategoria;

/*4- Liste a soma do valor líquido de todas as obrigações com vencimento no mês de setembro, agrupado por categoria e descrição da categoria (resultado, 2 linhas).*/
SELECT c.idCategoria, c.descricao, SUM(valorLiquido)
FROM obrigacao o 
INNER JOIN categoria c ON o.idCategoria = c.idCategoria
WHERE dataVencimento between '2015-09-01' and '2015-09-30'
GROUP BY c.idCategoria, c.descricao;

/*5- O nome do favorecido, a soma do valor líquido e a quantidade das obrigações, cuja soma seja maior que 500 (resultado, 5 linhas).*/
SELECT f.nome, SUM(o.valorLiquido) AS somaValorLiquido, COUNT(*) AS qtdObrigacoes
FROM obrigacao o
INNER JOIN favorecido f ON o.idFavorecido = f.idFavorecido
WHERE o.idFavorecido IN (SELECT idFavorecido FROM obrigacao GROUP BY idFavorecido HAVING SUM(valorLiquido) > 500)
GROUP BY f.nome;

/*6- Liste a soma do total líquido, do total de juros, e do total de multa e a quantidade dos pagamentos agrupados por nome favorecido (resultado, 6 linhas).*/
SELECT f.nome, 
       SUM(p.valorLiquido) AS somaTotalLiquido, 
       SUM(p.juros) AS somaTotalJuros, 
       SUM(p.multa) AS somaTotalMulta, 
       COUNT(*) AS quantidadePagamentos
FROM pagamento p
INNER JOIN obrigacao o ON p.idObrigacao = o.idObrigacao
INNER JOIN favorecido f ON o.idFavorecido = f.idFavorecido
GROUP BY f.nome;

/*7- Listar o nome da conta, a soma do total líquido, o total de juros, o total de multa e a quantidade de registros de todos os pagamentos do mês 09/2015 agrupados por nome da Conta. (resultado, 2 linhas);*/
SELECT c.nomeConta, 
       SUM(p.valorLiquido) AS somaTotalLiquido, 
       SUM(p.juros) AS somaTotalJuros, 
       SUM(p.multa) AS somaTotalMulta, 
       COUNT(*) AS quantidadeRegistros
FROM pagamento p
INNER JOIN conta c ON p.idConta = c.idConta
WHERE MONTH(p.dataPagamento) = 9 AND YEAR(p.dataPagamento) = 2015
GROUP BY c.nomeConta;

/*8- Listar o valor líquido médio e a quantidade de obrigações a pagar por mês. (resultado, 4 linhas);*/
SELECT MONTH(dataVencimento) AS Mes, 
       YEAR(dataVencimento) AS Ano,
       AVG(valorLiquido) AS valorLiquidoMedio,
       COUNT(*) AS quantidadeObrigacoes
FROM obrigacao
GROUP BY Mes, Ano;
