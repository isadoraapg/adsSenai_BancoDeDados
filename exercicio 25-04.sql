/*1- Listar o campo chave da tabela “Obrigacao”, as colunas DataVencimento e ValorLiquido,  o campo chave da tabela “Favorecido” e a coluna Nome. 
Considerar todos os registros da tabela “Obrigacao” (resultado, 16 linhas).*/
SELECT o.idObrigacao, o.dataVencimento, o.valorLiquido, f.idFavorecido, f.nome FROM obrigacao o INNER JOIN favorecido f ON o.idFavorecido = f.idFavorecido;

/*2- Repita o exercício anterior usando a notação Natural Join*/
SELECT o.idObrigacao, o.dataVencimento, o.valorLiquido, f.idFavorecido, f.nome FROM obrigacao o NATURAL JOIN favorecido f; 

/*3- Listar o campo chave da tabela “Obrigacao”, as colunas DataVencimento e ValorLiquido,  e quando existir , o campo chave da tabela “Conta”, 
as colunas NomeConta e Banco da tabela “Conta”. Considerar todos os registros da tabela “Obrigacao” (resultado, 16 linhas);*/
SELECT o.idObrigacao, o.dataVencimento, o.valorLiquido, o.idConta, c.nomeConta, c.banco FROM obrigacao o LEFT JOIN conta c ON o.idConta = c.idConta;

/*4- Listar as colunas idObrigacao, DataVencimento e ValorLiquido da tabela “Obrigacao”, as colunas,  idFavorecido e Nome da tabela “Favorecido”, as colunas 
idCategoria e Descricao da tabela “Categoria”, e quando existir (USAR LEFT JOIN, pois lista tudo q tem pra pagar independente se tem conta associada), 
a coluna idConta, NomeConta e Banco da tabela “Conta”. Considerar todos os registros da tabela “Obrigacao”, ordenados pela coluna DataVencimento (resultado, 16 linhas);*/
SELECT o.idObrigacao, o.dataVencimento, o.valorLiquido, f.idFavorecido, f.nome, cat.idCategoria, cat.descricao, c.idConta, c.nomeConta, c.banco 
FROM obrigacao o
INNER JOIN favorecido f ON o.idFavorecido = f.idFavorecido
INNER JOIN categoria cat ON o.idCategoria = cat.idCategoria
LEFT JOIN conta c ON o.idConta = c.idConta
ORDER BY o.dataVencimento;

/*5- Listar as colunas dataVencimento, idObrigacao, valorLiquido da tabela Obrigacao, a coluna Nome da tabela Favorecido, a coluna nomeConta da tabela Conta, 
de todas as obrigacoes associadas ao banco 001 (resultado, 4 linhas).*/
SELECT o.idObrigacao, o.dataVencimento, o.valorLiquido, f.nome, c.nomeConta 
FROM obrigacao o
INNER JOIN favorecido f ON o.idFavorecido = f.idFavorecido
INNER JOIN conta c ON o.idConta = c.idConta
WHERE c.banco = 1;

/*6- Listar as colunas idFavorecido e Nome da tabela “Favorecido”, as colunas idPagamento,  DataPagamento,  ValorLiquido, ValorMulta e ValorJuros da tabela 
“Pagamento” de todos os registros da tabela “Pagamento”.Considerar todos os registros da tabela “Pagamento” com DataPagamento no mês de outubro de 2015 (resultado, 3 linhas).*/
SELECT f.idFavorecido, f.nome, p.idPagamento, p.dataPagamento, p.valorLiquido, p.multa, p.juros 
FROM favorecido f 
INNER JOIN obrigacao o ON o.idFavorecido = f.idFavorecido
INNER JOIN pagamento p ON p.idObrigacao = o.idObrigacao
WHERE dataPagamento between '2015-10-01' and '2015-10-31';

/*7- Listar as colunas idPagamento, DataPagamento, ValorLiquido, Multa, Juros, da tabela Pagamento, e as colunas DataVencimento e ValorLiquido da tabela Obrigacao. 
Para diferenciar o nome das colunas, chame a coluna ValorLiquido da tabela Obrigacao de valorOriginal. Se as colunas Multa e Juros forem nulas, listar zero (resultado, 9 linhas).*/
SELECT p.idPagamento, p.dataPagamento, p.valorLiquido, COALESCE(multa, 0) AS multa, /*ou ->*/ ifnull(p.juros, 0) AS juros, o.dataVencimento, o.valorLiquido AS valorOriginal
FROM pagamento p
INNER JOIN obrigacao o ON o.idObrigacao = p.idObrigacao;




