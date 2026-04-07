create database SurfCo;
Use SurfCo; 

-- TABELAS --

CREATE TABLE administradores 
( 
	id_admin INT AUTO_INCREMENT NOT NULL,
	login    VARCHAR(200) NOT NULL,
	senha    VARCHAR(300) NOT NULL,
  
	UNIQUE (login),
	UNIQUE (senha),
  
	PRIMARY KEY (id_admin)
);

CREATE TABLE fornecedores 
(
	id_fornecedor INT AUTO_INCREMENT NOT NULL,
    nome_empresa VARCHAR(200) NOT NULL,
    email VARCHAR(150) NOT NULL,
    telefone VARCHAR(50) NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    CNPJ CHAR(14) NOT NULL, 
    
    id_admin INT NOT NULL,
    
    UNIQUE (CNPJ),
	UNIQUE (email),
	UNIQUE (telefone),
    
    PRIMARY KEY (id_fornecedor),
    FOREIGN KEY (id_admin) REFERENCES administradores (id_admin)
);

CREATE TABLE pranchas 
(
cod_prancha INT AUTO_INCREMENT NOT NULL,
tamanho FLOAT NOT NULL,
material VARCHAR(200) NOT NULL, 
Volume FLOAT NOT NULL, 
encaixe_quilha ENUM('FCS I', 'FCS II') NOT NULL DEFAULT 'FCS I',
RABETA VARCHAR(200) NOT NULL,

id_fornecedor INT NOT NULL,

PRIMARY KEY (cod_prancha),
FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)

);

CREATE TABLE quilhas 
( 
cod_quilha INT AUTO_INCREMENT NOT NULL,
encaixe ENUM('FCS I', 'FCS II') NOT NULL DEFAULT 'FCS I',
material VARCHAR(200) NOT NULL,
categoria VARCHAR(100) NOT NULL,

id_fornecedor INT NOT NULL,

PRIMARY KEY (cod_quilha),
FOREIGN KEY (id_fornecedor) REFERENCES fornecedores (id_fornecedor)

);

CREATE TABLE straps 
(
cod_strap INT AUTO_INCREMENT NOT NULL,
tamanho FLOAT NOT NULL,
cor VARCHAR(100) NOT NULL,

id_fornecedor INT NOT NULL,

PRIMARY KEY (cod_strap),
FOREIGN KEY (id_fornecedor) REFERENCES fornecedores (id_fornecedor)

);
