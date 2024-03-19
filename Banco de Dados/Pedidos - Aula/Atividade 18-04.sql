Select * from empregado order by matricula; 

Select nome from departamento; 

Insert into departamento values (default, 'Administração', 'Sede');
Insert into Empregado values (default, 'Maria', 'José', current_date, 'Auxiliar administrativo', 5800.00, null, 3);

select primeironome as Nome, 
sobrenome as Sobrenome,
cargo as Cargo
from Empregado 
where cargo Like '%Analista de Sistemas Pleno%';

Select e.primeironome || ' ' || e.sobrenome as "Empregado", 
d.nome as "Departamento" 
From empregado e 
join departamento d on e.coddepto = d.coddepto;

--- Gera o nome e o sobrenome dos empregados na tabela empregado e o seu respectivo departamento;

select * from Empregado;
select * from Departamento; 

select d.nome, 
count (e.primeironome) as quantidade_empregados
from empregado e
join departamento d on e.coddepto = d.coddepto
group by e.coddepto, d.nome; 


select d.nome,
sum (salario) as soma_salario
from empregado e
join departamento d on e.coddepto = d.coddepto
group by e.coddepto, d.nome; 

Select g.primeironome || ' ' || g.sobrenome as "Gerente",
e.primeironome || ' ' || e.sobrenome as "Empregado" 
From (empregado e join empregado g
on e.gerente = g.matricula) order by g.Gerente;

----- Está acima consulta retorna o nome do gerente e dos empregados atrelados a este gerente;

Select g.primeironome || ' ' || g.sobrenome as "Gerente",
e.primeironome || ' ' || e.sobrenome as "Empregado" 
From (empregado e left join empregado g
on e.gerente = g.matricula) order by g.Gerente;

----- A consulta acim com left join não mudou em nada; 

select distinct e.sobrenome
from empregado e
join empregado g on e.gerente = g.matricula
where g.sobrenome = 'Guedes';


select *
from empregado e
where not exists (
    select 1
    from departamento d
    where e.coddepto = d.coddepto
);

create or replace view EmpDepto 
(nomeEmp, deptoEmp)
as Select e.primeironome, d.nome
from (empregado e join departamento d
	 on e.coddepto = d.coddepto); 
	 
select * from EmpDepto; 


