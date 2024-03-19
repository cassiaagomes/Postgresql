---- Criar uma tabela chamada "Estudantes"
CREATE TABLE Estudantes
(
    id_estudante INT NOT NULL, 
    nome VARCHAR(30) NOT NULL, 
    idade INT NOT NULL,
    fk_curso_id INT NOT NULL,
    fk_curso_departamento INT NOT NULL,
    CONSTRAINT PK_Estudantes PRIMARY KEY (id_estudante),
    CONSTRAINT FK_Estudantes FOREIGN KEY (fk_curso_id, fk_curso_departamento) REFERENCES Cursos (id_cursos, fk_departamento)
);


---- Criar uma tabela chamada "Departamentos"
CREATE TABLE Departamentos 
(
    id_departamento INT,
    nome_departamento VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Departamentos PRIMARY KEY (id_departamento)
);

---- Criar uma tabela chamada "Cursos"
CREATE TABLE Cursos 
(
	id_cursos INT NOT NULL,
	nome_curso VARCHAR (30) NOT NULL, 
	fk_departamento INT NOT NULL,
	CONSTRAINT PK_cursos PRIMARY KEY (id_cursos, fk_departamento),
	CONSTRAINT FK_cursos FOREIGN KEY (fk_departamento) REFERENCES Departamentos (id_departamento)
);
