CREATE DATABASE IF NOT EXISTS Loja;
USE Loja;

CREATE TABLE Cliente (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(80) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    Celular VARCHAR(11) NULL,
    EndLogradouro VARCHAR(100) NOT NULL,
    EndNumero VARCHAR(10) NOT NULL,
    EndMunicipio INT NOT NULL,
    EndCep CHAR(8) NULL,
    Municipio_ID INT NOT NULL,
    FOREIGN KEY (Municipio_ID) REFERENCES Municipio(ID)
);

CREATE TABLE ContaReceber (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Cliente_ID INT NOT NULL,
    FaturaVendaID INT NULL,
    DataConta DATE NOT NULL,
    DataVencimento DATE NOT NULL,
    Valor DECIMAL(18,2) NOT NULL,
    Situacao ENUM("1", "2", "3") NOT NULL,
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID)
);

CREATE TABLE Municipio (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Estado_ID INT NOT NULL,
    Nome VARCHAR(80) NOT NULL,
    CodIBGE INT NOT NULL,
    FOREIGN KEY (Estado_ID) REFERENCES Estado(ID)
);

CREATE TABLE Estado (
	ID INT,
    Nome VARCHAR(50),
    UF CHAR(2)
);

INSERT INTO Estado (Nome, UF) VALUES
("Pernambuco", "PE"),
("Bahia","BA"),
("Alagoas","AL");

SELECT * FROM Estado;

INSERT INTO Municipio (Estado_ID, Nome, CodIBGE) VALUES
("0", "Iati", "2606507"),
("1", "Garanhuns", "2606002"),
("2", "Caruaru", "260410");

SELECT * FROM Municipio;

INSERT INTO Cliente (Nome, CPF, Celular, EndLogradouro, EndNumero, EndMunicipio, Municipio_ID, EndCEP) VALUES
("Daniel Tenório","12345678910","123456789","Centro","0","1","0","555345000"),
("Marcos","12345678910","123456789","centro","1","1","1","55345000"),
("Ailsson","12345678910","123456789","Rua b","2","2","3","11000000");

SELECT * FROM Cliente;

INSERT INTO ContaReceber (Cliente_ID, FaturaVendaID, DataConta, DataVencimento, Valor, Situacao) VALUES
("0", "0", "2024-10-29", "2025-02-05", "100.00", "1"),
("1", "1", "2024-10-28", "2025-02-06", "50.00", "2"),
("2", "2", "2024-10-27", "2025-02-07", "25.00", "3");
