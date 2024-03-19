--- VIEWS: É uma tabela virtual derivada de outra(s) tabela(s)

--- Problema: Criar uma view que contenha somente produtos cuja unidade é KG
CREATE OR REPLACE VIEW Prquilo
(codigo, descricao, unidade)
AS SELECT codprod, descricao, unidade
	FROM Produto
	Where unidade = 'KG'; 
	
SELECT * from Prquilo; 
SELECT descricao from Prquilo;

--- Problema: Criar uma view que contenha o código do vendedor, seu nome e seu salario
CREATE OR REPLACE VIEW 
	VendSal(codigo, nome, salario)
	AS SELECT codvend, nome, salariofixo
		FROM vendedor;
		
SELECT * FROM VendSal;
SELECT nome FROM VendSal ORDER BY nome; 


SELECT * FROM Prquilo
ORDER BY Codigo;

SELECT * FROM Produto
ORDER BY Codprod;

INSERT INTO Prquilo VALUES (110, 'Arroz', 'KG');

SELECT * FROM Prquilo; 
SELECT * FROM Produto; 

UPDATE Prquilo
SET descricao = 'Arroz Integral'
WHERE codigo = 110; 

SELECT * FROM Prquilo ORDER BY codigo;
SELECT * FROM Produto ORDER BY codprod; 

DELETE FROM Prquilo
WHERE descricao = 'Arroz Integral';

CREATE or replace VIEW Listapedidos AS
   Select nome, descricao
   From vendedor v join pedido p on v.codvend = p.codvend 
   Join itenspedido i on p.numped = i.numped 
   join produto pr on i.codprod = pr.codprod
 order by nome;
 
Select * from listapedidos order by nome;

Create or replace view totalsalarios as
    select sum(salariofixo) as TotaldeSalarios
    from vendedor;

Select * from totalsalarios;

CREATE OR REPLACE VIEW ProdutodescA AS
SELECT codprod, descricao
FROM produto
WHERE descricao like 'A%'
WITH CHECK OPTION;

Select * from produtodesca;

Insert into ProdutodescA values (40, 'Manteiga');
Insert into ProdutodescA values (41, 'Azeite');

Select * from cliente; 

With ClientesAtivos AS
    (SELECT codcli from Cliente WHERE endereco is not null ), 
    ClientesInativos AS
    (SELECT codcli from Cliente WHERE endereco is null )
    SELECT * FROM ClientesAtivos
    UNION 
    SELECT * FROM ClientesInativos;

	