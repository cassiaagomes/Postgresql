CREATE TABLE Artista
(CodArt SERIAL PRIMARY KEY,
NomeArt VARCHAR(60),
Cidade VARCHAR(60),
Pais VARCHAR(40),
DataNasc DATE);

CREATE TABLE Estudio
(CodEst SERIAL PRIMARY KEY,
NomeEst VARCHAR(40));

CREATE TABLE Categoria
(CodCat SERIAL PRIMARY KEY,
DescCateg VARCHAR(40));

CREATE TABLE Filme
(CodFilme SERIAL PRIMARY KEY,
Titulo VARCHAR(40),
Ano INT,
Duracao INT,
FK_Categoria_CodCat INT,
FK_Estudio_CodEst INT,
CONSTRAINT FK_Categoria_CodCat FOREIGN KEY (FK_Categoria_CodCat) REFERENCES Categoria(CodCat),
CONSTRAINT FK_Estudio_CodEst FOREIGN KEY (FK_Estudio_CodEst) REFERENCES Estudio(CodEst));

CREATE TABLE Personagem
(FK_Filme_CodFilme INT,
FK_Artista_CodArt INT,
Cashe NUMERIC(13, 2),
Nome_personagem VARCHAR(40),
CONSTRAINT PKPersonagem PRIMARY KEY (FK_Filme_CodFilme, FK_Artista_CodArt),
CONSTRAINT FK_Filme_CodFilme FOREIGN KEY (FK_Filme_CodFilme) REFERENCES Filme(CodFilme),
CONSTRAINT FK_Artista_CodArt FOREIGN KEY (FK_Artista_CodArt) REFERENCES Artista(CodArt));



insert into artista values(default,'Cameron Diaz',null,'USA','15/07/75');
insert into artista values(default,'Julia Roberts',null,'USA','20/08/67');
insert into artista values(default,'Brad Pitt',null,null,'05/03/70');
insert into artista values(default,'Joaquin Phoenix',null,null,'06/04/72');
insert into artista values(default,'Bradley Cooper',null,'USA','06/06/77');
insert into artista values(default,'Tom Cruise',null,'USA','10/09/64');
insert into artista values(default,'Rodrigo Santoro','Rio de Janeiro','Brasil','12/10/78');

insert into estudio values(default,'Paramount');
insert into estudio values(default,'Disney');
insert into estudio values(default,'Universal');

insert into categoria values(default,'Aventura');
insert into categoria values(default,'Romance');
insert into categoria values(default,'Comédia');
insert into categoria values(default,'Ação');
insert into categoria values(default,'Suspense');
insert into categoria values(default,'Drama');

insert into filme values(default,'Encontro Explosivo',2010,134,4,1);
insert into filme values(default,'O Besouro Verde',2010,155,1,1);
insert into filme values(default,'Comer, Rezar, Amar',2010,177,2,1);
insert into filme values(default,'Coringa',2019,122,6,1);
insert into filme values(default,'Era uma vez em Hollywood',2020,119,4,2);
insert into filme values(default,'Nasce uma estrela',2018,100,6,1);

insert into personagem values(1,1,10000,'Natalie');
insert into personagem values(1,2,10000,'Tom');
insert into personagem values(5,3,10000,'John');
insert into personagem values(3,2,6000,'Ana');
insert into personagem values(6,5,11000,'Tom');
insert into personagem values(4,4,12000,'John');

select * from Artista;
select * from Estudio;
select * from Categoria;
select * from Filme;
select * from Personagem;

insert into filme values(default,'Elvis',2022,120,null,3);

select * 
from Artista
order by NomeArt ASC;

select *
from Artista
where NomeArt Like 'B%';

select *
from Filme
where Ano = 2019;

update Personagem
set cashe = cashe * 1.15;

insert into artista values(default,'Marina Sena','Goias','Brasil','11/09/02');
insert into artista values(default,'Pablo Vittar','Minas Gerais','Brasil','01/11/97');

select Titulo
from Filme
where Duracao > 120;

select * 
from Filme
where Duracao > 120;

select *
from Artista
where Cidade is NULL;

update Artista
set cidade = 'Phoenix'
where codart = 1;

update Artista
set cidade = 'Orlando'
where codart = 2;

update Artista
set cidade = 'Dallas'
where codart = 3;

select Categoria.DescCateg
from Filme
join Categoria on Filme.FK_Categoria_CodCat = Categoria.CodCat
where Filme.Titulo = 'Coringa';

select Filme.Titulo, Estudio.NomeEst, Categoria.DescCateg
from Filme
join Estudio on Filme.FK_Estudio_CodEst = Estudio.CodEst
join Categoria on Filme.FK_Categoria_CodCat = Categoria.CodCat;

select Artista.NomeArt
from Artista
join Personagem on Artista.CodArt = Personagem.FK_Artista_CodArt
join Filme on Personagem.FK_Filme_CodFilme = Filme.CodFilme
where Filme.Titulo = 'Encontro Explosivo';

select distinct Artista.NomeArt
from Artista
join Personagem on Artista.CodArt = Personagem.FK_Artista_CodArt
join Filme on Personagem.FK_Filme_CodFilme = Filme.CodFilme
join Categoria on Filme.FK_Categoria_CodCat = Categoria.CodCat
where Artista.NomeArt like 'B%' and Categoria.DescCateg = 'Aventura';

select Categoria.DescCateg, count(*) as Contagem
from Filme
join Categoria on Filme.FK_Categoria_CodCat = Categoria.CodCat
group by Categoria.DescCateg;

select a.nomeart, p.nomepers
from artista a left outer join personagem p on a.codart = p.codart;

select codart
  from artista
Except
  select codart
   from personagem;
   
Select f.titulo as Filme
From filme f left join categoria c on f.codcateg = c.codcateg
Where f.codcateg is null;






