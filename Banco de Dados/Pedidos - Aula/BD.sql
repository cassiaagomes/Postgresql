Create Table Cidade (
	codigo INT NOT NULL,
	nome VARCHAR (30) NOT NULL,
	CONSTRAINT PkCidade PRIMARY KEY(codigo));
	
Create Table Socio (
	cpf CHAR(11) NOT NULL PRIMARY KEY,
	nome VARCHAR(30) NOT NULL, 
	sexo CHAR(1),
	email VARCHAR(30) UNIQUE,
	fk_cidade INT NOT NULL,
	FOREIGN KEY (fk_cidade) REFERENCES Cidade (codigo)
);

Create Table Depedente (
	fk_socio CHAR (11) NOT NULL,
	numero INT NOT NULL,
	nome VARCHAR(30) NOT NULL, 
	CONSTRAINT PK_Dependente PRIMARY KEY (fk_socio, numero),
	CONSTRAINT FK_Dependente_Socio FOREIGN KEY (fk_socio) REFERENCES Socio (cpf)	
);

ALTER TABLE Socio 
	ADD datanasc DATE;
	
ALTER TABLE Cidade
	ADD uf CHAR(2) NOT NULL; 
	
ALTER TABLE Depedente
	ADD CONSTRAINT CK_Dependente_numero CHECK (numero>0);
	
ALTER TABLE Socio
	ALTER COLUMN nome TYPE VARCHAR(40);
	
ALTER TABLE Cidade
	DROP COLUMN uf;
	
ALTER TABLE Socio
	DROP COLUMN fk_cidade;
	
DROP TABLE Cidade;

 
