---- Criar um banco de dados chamado "Escola".
CREATE DATABASE Escola;

----- Abrir o banco de dados "Escola" para utilização.
USE Escola;

---- Criar uma tabela chamada "Alunos"
CREATE TABLE Alunos 
(
	matricula INT NOT NULL,
	nome VARCHAR (60) NOT NULL,
	idade INT NOT NULL,
	fk_turmas INT NOT NULL,
	CONSTRAINT PK_Aluno PRIMARY KEY (matricula, fk_turmas),
	CONSTRAINT FK_Aluno FOREIGN KEY (fk_turmas) REFERENCES Turmas (idturma)
);

---- Criar uma tabela chamada "Turmas"
CREATE TABLE Turmas
(
	idturma INT NOT NULL,
	nomeTurma VARCHAR (40) NOT NULL,
	professorResp VARCHAR (40),
	CONSTRAINT PK_Turmas PRIMARY KEY (idturma)
);
---- Adicionar, na tabela "Alunos", o campo abaixo especificado:
ALTER TABLE Alunos
	ADD COLUMN datanasc DATE;

---- Adicionar, na tabela "Turmas", o campo abaixo especificado:
ALTER TABLE Turmas
	ADD COLUMN turno VARCHAR (5);

---- Adicionar uma restrição de verificação à tabela
ALTER TABLE Alunos
	ADD CONSTRAINT CK_Alunos CHECK (idade > 0);

---- Alterar o tipo do campo "Nome" na tabela "Alunos" para VARCHAR(50).
ALTER TABLE Alunos
	ALTER COLUMN nome VARCHAR (70);
	
---- Excluir o campo "ProfessorResponsável" na tabela "Turmas".
ALTER TABLE Turmas
	DROP COLUMN professorResp;
	
----- Excluir a tabela "Alunos".
DROP TABLE Alunos;

----- Excluir a tabela "Turmas".
DROP TABLE Turmas;

---- Excluir o banco de dados "Escola".
DROP DATABASE Escola; 