--
-- File generated with SQLiteStudio v3.1.1 on qua mar 29 16:55:21 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: ARMAS
CREATE TABLE ARMAS (
	IDARMA INTEGER PRIMARY KEY, 
	CLASSE VARCHAR NOT NULL, 
	PESO DOUBLE, 
	NOME VARCHAR NOT NULL, 
	CALIBRE DOUBLE
	NOMEFORNECEDOR VARCHAR NOT NULL REFERENCES FORNECEDOR (NOMEMPRESA));

-- Table: BASE
CREATE TABLE BASE (
	NOME VARCHAR NOT NULL, 
	LOCALIZACAO VARCHAR NOT NULL, 
	AREA INTEGER CHECK (AREA > 10000), 
	CAPACIDADEMAX INTEGER CHECK (CAPACIDADEMAX > 100), 
	VERTENTE VARCHAR NOT NULL REFERENCES RAMOFORCASARMADAS (VERTENTE), 
	PRIMARY KEY (NOME, LOCALIZACAO));

-- Table: FORNECEDOR
CREATE TABLE FORNECEDOR (
	NOMEMPRESA VARCHAR NOT NULL PRIMARY KEY, 
	CONTACTO INTEGER, 
	LOCALIZACAOSEDE VARCHAR NOT NULL);

-- Table: FUNCAO
CREATE TABLE FUNCAO (
	FUNCAO VARCHAR NOT NULL PRIMARY KEY, 
	HORASTRABALHO INTEGER);

-- Table: INSCRITOSEMMISSAO
CREATE TABLE INSCRITOSEMMISSAO (
	IDMISSAO REFERENCES MISSOES (IDMISSAO), 
	NIDENTIFICACAOCIVIL INTEGER REFERENCES MILITAR (NIDENTIFICACAOCIVIL), 
	PRIMARY KEY (IDMISSAO, NIDENTIFICACAOCIVIL));

-- Table: MILITAR
CREATE TABLE MILITAR (
	NIDENTIFICACAOCIVIL INTEGER PRIMARY KEY REFERENCES PESSOA (NIDENTIFICACAOCIVIL), 
	HIERARQUIA VARCHAR NOT NULL, 
	SALARIO DOUBLE,
	FUNCAO VARCHAR NOT NULL REFERENCES FUNCAO (FUNCAO),
	NOMEBASE VARCHAR NOT NULL REFERENCES BASE (NOME), 
	LOCALBASE VARCHAR NOT NULL REFERENCES BASE (LOCALIZACAO));

-- Table: MILITARALOCADO
CREATE TABLE MILITARALOCADO (
	IDMISSAO INTEGER REFERENCES MISSOES (IDMISSAO), 
	IDENTIFICADORPESSOAL INTEGER,
	NIDENTIFICACAOCIVIL INTEGER REFERENCES MILITAR (NIDENTIFICACAOCIVIL), 
	PRIMARY KEY (IDMISSAO, IDENTIFICADORPESSOAL ));

-- Table: MISSOES
CREATE TABLE MISSOES (
	IDMISSAO INTEGER PRIMARY KEY, 
	LOCALIZACAO VARCHAR NOT NULL, 
	DATAINICIAL DATE, 
	DATAFINAL DATE, 
	TIPO VARCHAR NOT NULL 
	CHECK (TIPO = 'Militar' or TIPO = 'Nao militar'));

-- Table: PESSOA
CREATE TABLE PESSOA (
	NIDENTIFICACAOCIVIL INTEGER PRIMARY KEY, 
	NOME VARCHAR NOT NULL, 
	DATANASCIMENTO DATE, 
	GENERO CHAR, 
	ALTURA DOUBLE);

-- Table: QUANTIDADADEARMA
CREATE TABLE QUANTIDADADEARMA (
	IDARMA INTEGER REFERENCES ARMAS (IDARMA), 
	IDMISSAO INTEGER REFERENCES MISSOES (IDMISSAO), 
	NUMERO INTEGER, 
	PRIMARY KEY (IDARMA, IDMISSAO));

-- Table: QUANTIDADEVEICULO
CREATE TABLE QUANTIDADEVEICULO (
	IDVEICULO INTEGER REFERENCES VEICULOS (IDVEICULO), 
	IDMISSAO INTEGER REFERENCES MISSOES (IDMISSAO), 
	NUMERO INTEGER, 
	PRIMARY KEY (IDVEICULO, IDMISSAO));

-- Table: RAMOFORCASARMADAS
CREATE TABLE RAMOFORCASARMADAS (
	VERTENTE VARCHAR NOT NULL PRIMARY KEY, 
	LEMA VARCHAR NOT NULL, 
	MARCHA VARCHAR NOT NULL, 
	PATRONO VARCHAR NOT NULL, 
	GENERAL VARCHAR NOT NULL, 
	CHECK (VERTENTE = 'Forca aerea' or VERTENTE = 'Exercito' or VERTENTE = 'Marinha'));

-- Table: RELACAOMILITAR
CREATE TABLE RELACAOMILITAR (
	SOLDADO INTEGER PRIMARY KEY REFERENCES MILITAR (NIDENTIFICACAOCIVIL), 
	SUPERIOR INTEGER REFERENCES MILITAR (NIDENTIFICACAOCIVIL));

-- Table: STOCKARMAS
CREATE TABLE STOCKARMAS (
	IDARMA INTEGER REFERENCES ARMAS (IDARMA), 
	NOMEBASE VARCHAR NOT NULL REFERENCES BASE (NOME), 
	LOCALBASE VARCHAR NOT NULL REFERENCES BASE (LOCALIZACAO),
	QUANTIDADE INTEGER CHECK (QUANTIDADE > 0), 	
	PRIMARY KEY (IDARMA, NOMEBASE, LOCALBASE));

-- Table: STOCKVEICULOS
CREATE TABLE STOCKVEICULOS ( 
	IDVEICULO INTEGER REFERENCES VEICULOS (IDVEICULO),  
	NOMEBASE VARCHAR NOT NULL REFERENCES BASE (NOME),
	LOCALBASE VARCHAR NOT NULL REFERENCES BASE (LOCALIZACAO),
	QUANTIDADE INTEGER CHECK (QUANTIDADE > 0), 	
	PRIMARY KEY (IDVEICULO, NOMEBASE, LOCALBASE));

-- Table: TIPOVEICULO
CREATE TABLE TIPOVEICULO (
	TIPO VARCHAR NOT NULL PRIMARY KEY);

-- Table: VEICULO
CREATE TABLE VEICULOs (
	IDVEICULO VARCHAR NOT NULL PRIMARY KEY, 
	COMPRIMENTO DOUBLE, 
	LARGURA DOUBLE, 
	ALTURA DOUBLE, 
	MOTOR VARCHAR NOT NULL, 
	VELOCIDADEMAX DOUBLE, 
	TIPO VARCHAR NOT NULL REFERENCES TIPOVEICULO (TIPO), 
	FORNECEDOR VARCHAR NOT NULL REFERENCES FORNECEDOR (NOMEMPRESA));

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
