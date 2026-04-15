create database SurfCo;
Use SurfCo; 

-- TABELAS --

CREATE TABLE clientes 
(

id_cliente INT AUTO_INCREMENT NOT NULL, 

nome VARCHAR (50) NOT NULL,
email VARCHAR (50) NOT NULL,
senha_hash CHAR (60) NOT NULL,

(UNIQUE) email,

PRIMARY KEY (id_cliente)

);

CREATE TABLE pranchas 
(
cod_prancha INT AUTO_INCREMENT NOT NULL,

tamanho FLOAT NOT NULL,
material VARCHAR(200) NOT NULL, 
Volume FLOAT NOT NULL, 
encaixe_quilha ENUM('FCS I', 'FCS II') NOT NULL DEFAULT 'FCS I',
RABETA VARCHAR(200) NOT NULL,
preco   DECIMAL(10, 2) NOT NULL,
estoque INT NOT NULL DEFAULT 0


PRIMARY KEY (cod_prancha)

);

CREATE TABLE quilhas 
( 
cod_quilha INT AUTO_INCREMENT NOT NULL,

encaixe ENUM('FCS I', 'FCS II') NOT NULL DEFAULT 'FCS I',
material VARCHAR(200) NOT NULL,
categoria VARCHAR(100) NOT NULL,
preco   DECIMAL(10, 2) NOT NULL,
estoque INT            NOT NULL DEFAULT 0,


PRIMARY KEY (cod_quilha)

);

CREATE TABLE straps 
(
cod_strap INT AUTO_INCREMENT NOT NULL,

nome VARCHAR (100) NOT NULL,
tamanho INT NOT NULL,
cor VARCHAR(100) NOT NULL,
preco   DECIMAL(10, 2) NOT NULL,
estoque INT NOT NULL DEFAULT 0,

PRIMARY KEY (cod_strap)

);

CREATE TABLE pedidos 
(

id_pedido INT AUTO_INCREMENT NOT NULL,

data_pedido DATETIME DEFAULT NOW(),
estado ENUM ENUM( 'pendente', 'pago', 'enviado', 'cancelado')) NOT NULL DEFAULT 'pendente',
total DECIMAL (10,2) NOT NULL,

FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
PRIMARY KEY (id_pedido)

);

-- INSERTS DOS PRODUTOS --

INSERT INTO straps (nome, tamanho, cor) VALUES

("Strap 6ft Preto", 6, "preto", 85.00, 20),
("Strap 6ft Branco", 6, "branco", 85.00, 20),
("Strap 6ft Vermelho", 6, "vermelho", 85.00, 20),
("Strap 6ft Amarelo", 6, "amarelo", 85.00, 20),
("Strap 8ft Preto", 8, "preto", 95.00, 20),
("Strap 8ft Branco", 8, "branco", 95.00, 20),
("Strap 8ft Vermelho", 8, "vermelho", 95.00, 20),
("Strap 9ft Amarelo", 9, "amarelo", 115.00, 20),
("Strap 9ft Vermelho", 9, "vermelho", 115.00, 20),
("Strap 9ft Branco", 9, "branco", 115.00, 20),
("Strap 9ft Preto", 9, "preto", 115.00, 20);
