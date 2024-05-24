/*Selecione o nome e telefone da tabela Favorecido ordenado por Nome 
(resultado, 10 linhas).*/
SELECT nome, telefone FROM financeiro.favorecido ORDER BY nome;

/*Selecione o nome e telefone da tabela Favorecido onde a coluna Nome contém o texto “Brasil” 
(resultado, 2 linhas)*/
SELECT nome, telefone FROM financeiro.favorecido WHERE nome LIKE '%Brasil%';

/*Selecione todas as colunas da tabela de Obrigacao onde a data de vencimento é maior que 01/10/2015 
(resultado, 8 linhas).*/
SELECT * FROM financeiro.obrigacao WHERE DataVencimento > '2015-10-01';

/*Selecione todas as colunas da tabela de Obrigacao onde o favorecido é “CELESC SA” e a coluna estaPago é falso 
(resultado, 1 linha).*/
SELECT * FROM financeiro.obrigacao WHERE idFavorecido = 1 AND estaPago = false;

/*Inserir na tabela  Obrigacao um registro com Data de vencimento 25/09/2015, valor de 100,00, código de barras vazio, 
favorecido  “Embracon Seguranca e Vigilancia Ltda”, conta “BB Principal”, categoria “Serviços”.*/
/*embracon = 11 | bb principal = 1 | servicos = 2*/
INSERT INTO obrigacao VALUES (103, '2015-09-25', 100, null, 0, 11, 1, 2);

/*Atualiza na tabela Obrigacao, a coluna estaPago com TRUE para a linha com idObrigacao igual a 94 
(resultado, 1 linha).*/
UPDATE financeiro.obrigacao SET estaPago = true WHERE idObrigacao = 94;

/*Excluir da tabela Conta a linha com idConta igual a 3. (resultado, 1 linha).*/
DELETE FROM financeiro.conta WHERE idConta = 3;