--- 1. Explique: o que a seguinte consulta faz e apresenta?
select f.titulo
from filme f
where f.codest in (select e.codest
					from estudio e
					where e.nomeest like 'P%');
--- Resposta:  Seleciona o nome dos filmes que o nome do Estúdio começa com "P"

--- 2. Observe agora a seguinte consulta. O que ela faz? Em que ela difere da anterior?
select f.titulo
from filme f
where exists (select e.codest
				from estudio e
				where f.codest = e.codest and nomeest like 'P%');
--- Resposta: Seleciona o nome dos filmes onde o codigo do filme é igual ao código do estúdio e o nome do estudio começa com "P".

--- 3. Crie uma consulta que mostre as descrições de categorias que estão na tabela Filme (associadas a filmes).
SELECT DescCATEG 
FROM Categoria 
WHERE codCateg in (SELECT codCateg
				  	FROM Filme);
					
--- 4. Qual o nome do artista cujo nome de personagem é ‘Natalie’?
SELECT nomeart, codart
FROM Artista
WHERE exists (SELECT nomepers, codart
				FROM Personagem
				WHERE nomepers Like 'Natalie%' and codart = 1);
				
SELECT * FROM Personagem; 
SELECT * FROM Artista;
--- Resposta: Cameron Diaz

--- 5. Existe algum artista cadastrado que não esteja na tabela Personagem?
SELECT nomeart, codart
FROM Artista
WHERE codart NOT IN (SELECT codart
					FROM Personagem);					
--- Resposta: Sim. Tem a Júlia Roberts e o Rodrigo Santoro; 

--- 6. Crie uma consulta que apresente os nomes dos artistas que possuem cachê acima da média. Nesta, além de usar subconsulta, use JOIN entre artista e personagem.
SELECT a.nomeart
FROM Artista a
JOIN Personagem p ON a.codart = p.codart
WHERE p.Cache > (SELECT AVG(Cache) 
				 FROM Personagem);
				 
--- 7. Para a tabela artista, crie uma view artistaV com os seguintes campos: codart, nomeart, datanasc. Renomeie “codart” para “código do artista” e “nomeart” para “nome” na view. Liste o conteúdo da view criada.
CREATE OR REPLACE VIEW ArtistaV
(codigo_artista, nome, datanasc)
AS SELECT codart, nomeart, datanasc
FROM Artista;

SELECT * FROM ArtistaV;

--- 8. Crie uma view filmeV com os seguintes campos: titulo,duração, ano, estúdio (nome do estúdio).
CREATE OR REPLACE VIEW FilmeV
(titulo, duracao, ano, estudio)
AS SELECT Titulo, Duracao, Ano, NomeEst
FROM filme f join estudio e on f.codest = e.codest;
SELECT * FROM FilmeV;

--- 9. Faça a inserção da artista “Mariana Ximenes” com a data de nascimento ‘27/11/78’ através da view artistaV. Como foi possível inserir por meio da view? Explique.
INSERT INTO ArtistaV VALUES (default, 'Mariana Ximenes', '06/06/77');
SELECT * FROM ArtistaV;
SELECT * FROM ARTISTA;

--- 10. Tente inserir um filme através da view filmeV. O que aconteceu? Explique.
INSERT INTO FilmeV VALUES ('Batman', 135, 2024, 'DC Estudios' );
SELECT * FROM FilmeV;
SELECT * FROM Filme; 

--- Resposta: Deu um erro. Não é possível realizar a inserção pois a viwe não é atualizavél.

--- 11. Faça a inserção através da tabela base filme. Depois consulte a view. O filme foi inserido? Consulte também a tabela base e explique.
INSERT INTO Filme VALUES (default, 'Batman', 2024, 135, 4, 1 );
SELECT * FROM FilmeV;
SELECT * FROM Filme; 
