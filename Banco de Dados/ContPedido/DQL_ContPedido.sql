/*** 1. Obter, para todos os produtos, 
código, nome com o cabeçalho "Produto", 
quantidade em estoque com o cabeçalho "Estoque Real" 
e estoque mínimo com o cabeçalho "Estoque Mínimo". ***/
SELECT idproduto, nome as "Produto",
		quantest as "Estoque Rea1",
		estmin as "Estoque Minm"
FROM Produto;

/*** 2 . Obter, para todos os produtos, 
o código, o nome, o preço de venda 
e uma coluna adicional informando 
um aumento de 25% sobre o preço de venda.
Dê um nome a esta coluna. ***/
SELECT idproduto, nome, 
		venda as "Preço de Venda",
		venda * 1.25 as "Preço com Aumento"
FROM Produto;

/*** 3. Obter código, nome, tipo, preço de custo
e preço de venda de todos os produtos ordenados pelo
tipo em ordem descendente e pelo nome em ordem ascendente. ***/
SELECT nome, 
	   custo as "Preço de custo", 
	   venda as "Preço de venda"
FROM Produto
ORDER BY idtipo desc, nome; 

/*** 4. Obter o nome e o setor dos funcionários
que nasceram nas cidades com código 7, 8 e 15, ordenados
pelo setor e nome do funcionário. ***/
SELECT nome, idsetor
FROM Funcionario
WHERE idnatural in (7,8,15)
ORDER BY idsetor ASC, nome ASC; 

/*** 5. Obter os produtos cujo tipo seja 1, 2 ou 3 
e o preço de venda esteja entre R$ 10,00 e R$ 50,00. ***/
SELECT nome, idtipo, 
	   venda as "Preço de venda"
FROM Produto
WHERE idtipo in (1,2,3) AND venda BETWEEN 10 AND 30;

/*** 6. Obter todos os dados dos funcionários que 
não têm e-mail, mas possuam celular. ***/
SELECT * FROM Funcionario
WHERE email is NULL and celular is NOT NULL;

/*** 7. Obter o nome e o salário dos funcionários homens,
casados e com salário menor ou igual a R$
3.000,00, ordenados pelo salário em ordem descendente. ***/
SELECT nome, salario
FROM Funcionario
WHERE (sexo = 'M' and estcivil = 'C' and salario <= 3000)
ORDER BY salario DESC;

/*** 8. Obter o nome e o preço de venda dos produtos 
cuja descrição contenha a palavra "chocolate" com
preço de venda maior ou igual a R$ 15,00, ordenados 
pelo preço de venda em ordem descendente.***/
SELECT descricao, 
	   venda as "Preço de venda"
FROM Produto
WHERE descricao like '%chocolate%' 
AND (venda >= 15)
ORDER BY venda DESC;

/*** 9.Obter o código e o nome dos funcionários homens, 
exceto aqueles cujos nomes iniciam pela letra
"A", ordenados pelo nome em ordem ascendente. ***/
SELECT idfuncionario, nome
FROM Funcionario
WHERE nome NOT LIKE 'A%'
ORDER BY nome DESC;

/*** 10. Obter quantos clientes fizeram 
pedido na empresa. ***/
SELECT COUNT (DISTINCT idcliente ) AS "Qtd Cliente"
FROM Pedido;

/*** 11. Obter a soma do valor do frete de 
todos os pedidos atendidos por via marítima. ***/
SELECT SUM (frete) AS "Valor frete"
FROM Pedido
WHERE via like 'M%';

/*** 12. Obter a data de nascimento da 
funcionária mais velha. ***/
SELECT MAX (datanasc) AS "Data mais velha" 
FROM Funcionario
WHERE (sexo = 'F');

/*** Obter quantos homens e quantas mulheres 
funcionários nasceram em cada cidade. ***/
SELECT idnatural, sexo, COUNT(*) AS "Quantidade"
FROM Funcionario 
GROUP BY sexo, idnatural;

/*** Exibir o total de salários de cada setor da empresa 
que tenha este total > R$ 5.000,00. ***/
SELECT idsetor, SUM(salario) AS "Total"
FROM Funcionario
GROUP BY idsetor
HAVING SUM (salario) > 5000;



	   

		
