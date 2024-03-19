/*** SUBCONSULTA EM SQL: É UMA CONSULTA EMBUTIDA DENTRO DE OUTRA, DE FORMA ANINHADA
 PASSANDO OS RESULTADOS DA CONSULTA MAIS INTERNA PARA A MAIS EXTERNA, POR MEIO DE
 UM WHERE OU UM HAVING. 
 PODEMOS USAR UMA SUBCONSULTA EM OPERAÇÕES DE SELECT, INSERT, UPDATE E DELETE.
 ***/
 
 -------- REGRAS PARA APLICAR UMA SUBCONSULTA ----------
/*** 1. A subconsulta pode ter apenas uma única coluna em sua cláusula SELECT, exceto quando
a consulta principal tiver múltiplas colunas ***/

/*** 2. Se retornar mais de uma linha de dados, 
se usa operadores de valores múltiplos como IN ***/

/*** 3. As subconsultas são escritas dentro de parênteses ***/

/*** 4. Não se usa order by em uma subconsulta - apenas na principal ***/

/*** 5. É possível usa rum group by dentro de uma subconsulta ***/

/*** 6. Não pode usar o between na consulta principal, apenas na subconsulta ***/

---- EX DE SUBCONSULTA ----
/*** A Sintaxe básica de uma subconsulta:
 SELECT coluna
 FROM tabela
 WHERE coluna operador (SELECT coluna 
 						FROM tabela WHERE condição);
***/

---- Minhas práticas
---- Nome e preço do Produto mais caro: 
SELECT idproduto, nome, descricao, venda
FROM Produto
WHERE venda = (SELECT MAX (venda) 
			   FROM Produto);
/*** Selecione o nome e o salário de todos os funcionários que têm um salário 
 maior do que a média dos salários.	***/		  
SELECT nome, salario
FROM Funcionario
WHERE salario = (SELECT AVG (salario)
				FROM Funcionario);
				
/*** Selecione o nome de todos os funcionários que trabalham em um setor
cujo chefe é do sexo masculino. ***/
SELECT f.nome
FROM Funcionario f
WHERE f.idsetor IN (
    SELECT s.idsetor
    FROM Setor s
    INNER JOIN Funcionario chefe ON s.idchefe = chefe.idfuncionario
    WHERE chefe.sexo = 'M'
);

/*** Liste o nome e o endereço de todos os clientes que residem na mesma cidade que o funcionário
de idfuncionario=1001. ***/
SELECT nome, endereco
FROM Cliente
WHERE endereco IN (SELECT endereco
				  FROM Funcionario
				  WHERE idfuncionario = 1001);

/*** Encontre o nome e o salário de todos os funcionários que têm um salário maior 
do que o salário mínimo dentro de sua função. ***/
SELECT nome, salario, idsetor, idfuncao
FROM Funcionario
WHERE salario = (SELECT MAX(salario)
			  	FROM Funcionario
);
			  
/*** Liste o nome, o endereço e o cargo de todos os funcionários 
que trabalham em um setor que tem um chefe. ***/
SELECT nome, endereco 
FROM Funcionario f
WHERE f.idsetor IN (
    SELECT s.idsetor
    FROM Setor s
    INNER JOIN Funcionario chefe ON s.idchefe = chefe.idfuncionario
    WHERE chefe is NOT NULL 
);

/*** Encontre o nome e a descrição de todos os tipos de produtos 
que têm pelo menos um produto em estoque. ***/
SELECT nome, descricao
FROM Produto
WHERE (quantest >= 1) ; 

/*** Selecione o nome e o telefone de todos os clientes que fizeram 
pelo menos um pedido. ***/
SELECT nome, contato
FROM cliente
WHERE idcliente in (SELECT idcliente
				   FROM Pedido);
				   
/*** Liste o nome e o salário de todos os funcionários que não têm chefe. ***/
SELECT nome, salario
FROM Funcionario
WHERE idfuncionario NOT IN (SELECT idchefe
				 FROM setor
				 WHERE idchefe is NULL);

/*** Encontre o nome e o tipo de todos os produtos que têm um preço de venda superior 
ao preço médio de venda de todos os produtos. ***/
SELECT nome, descricao, venda
FROM Produto
WHERE venda > (SELECT MAX (venda)
			   FROM Produto);
			   
/*** UPDATE com Subquery:
Atualize o salário de todos os funcionários 
para o dobro do salário médio de todos os funcionários. ***/
UPDATE Funcionario
SET salario = (SELECT AVG (salario) * 2
				 FROM Funcionario);
				 
/*** DELETE com Subquery:
Exclua todos os produtos cujo estoque 
é menor que a quantidade mínima em outro armazém. ***/
DELETE FROM Produto
WHERE quantest < (SELECT MIN(quantmin) FROM Armazem);

/*** INSERT com Subquery:
Insira um novo cliente com base nos dados 
de um pedido existente. ***/
INSERT INTO Cliente (idcliente, nome, endereco, contato)
SELECT idcliente, nome_cliente, endereco_cliente, telefone_cliente
FROM Pedido
WHERE idpedido = 12345;

/*** UPDATE com Subquery:
Atualize o status de todos os pedidos para 'Concluído' se tiverem mais de 3 itens. ***/
UPDATE Pedido
SET status = 'Concluído'
WHERE idpedido IN (SELECT idpedido FROM Itens GROUP BY idpedido HAVING COUNT(*) > 3);

/*** DELETE com Subquery:
Exclua todos os funcionários que não têm pedidos associados. ***/
DELETE FROM Funcionario
WHERE idfuncionario NOT IN (SELECT DISTINCT idvendedor FROM Pedido);


--- UPDATE com Subquery:
/***Atualize o preço de venda de todos os produtos para 10% acima do preço médio de venda de todos os produtos. ***/
UPDATE Produto
SET venda = (SELECT AVG (venda) * 1.10
			FROM Produto);

/*** Atualize a quantidade mínima em estoque de todos os produtos para 
o dobro da quantidade média em estoque de todos os produtos.***/
UPDATE Produto
SET quantest = (SELECT AVG (quantest) * 2.0 
			   FROM Produto);
			   
/*** Atualize o salário de todos os funcionários para 80% do salário máximo de todos os funcionários. ***/
UPDATE Funcionario
SET salario = (SELECT MAX (salario) * 1.80
			  FROM Funcionario);

/*** Atualize a quantidade de itens em estoque de todos os produtos para o dobro da quantidade média de itens 
em estoque de todos os produtos. ***/
UPDATE Produto
SET quantest = (SELECT AVG (quantest) * 2.0
			   FROM Produto);
			   
