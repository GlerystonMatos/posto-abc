CREATE TABLE Tanque
(
    Id INTEGER NOT NULL,
    Descricao VARCHAR(50),
    Tipo INTEGER NOT NULL,
    CONSTRAINT pk_Tanque_Combustivel PRIMARY KEY(Id)
);

CREATE GENERATOR gen_Tanque;

CREATE OR ALTER TRIGGER tg_Tanque FOR Tanque
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    NEW.Id = gen_id(gen_Tanque, 1);
END;

INSERT INTO Tanque
           (Descricao
           ,Tipo)
     VALUES('Tanque 01'
           ,0);

INSERT INTO Tanque
           (Descricao
           ,Tipo)
     VALUES('Tanque 02'
           ,1);

CREATE TABLE Bomba
(
    Id INTEGER NOT NULL,
    Descricao VARCHAR(50),
    TanqueId INTEGER NOT NULL,
    CONSTRAINT pk_Bomba PRIMARY KEY(Id),
    CONSTRAINT fk_BombaTanque FOREIGN KEY(TanqueId) REFERENCES Tanque(Id)
);

CREATE GENERATOR gen_Bomba;

CREATE OR ALTER TRIGGER tg_Bomba FOR Bomba
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    NEW.Id = gen_id(gen_Bomba, 1);
END;

INSERT INTO Bomba
           (Descricao
           ,TanqueId)
     VALUES('Bomba 01'
           ,1);

INSERT INTO Bomba
           (Descricao
           ,TanqueId)
     VALUES('Bomba 02'
           ,1);

INSERT INTO Bomba
           (Descricao
           ,TanqueId)
     VALUES('Bomba 03'
           ,2);

INSERT INTO Bomba
           (Descricao
           ,TanqueId)
     VALUES('Bomba 04'
           ,2);

CREATE TABLE Abastecimento
(
    Id INTEGER NOT NULL,
    Data DATE NOT NULL,
    BombaId INTEGER NOT NULL,
    Litros DECIMAL(10,2) NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    Imposto DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_Abastecimento PRIMARY KEY(Id),
    CONSTRAINT fk_AbastecimentoBomba FOREIGN KEY(BombaId) REFERENCES Bomba(Id)
);

CREATE GENERATOR gen_Abastecimento;

CREATE OR ALTER TRIGGER tg_Abastecimento FOR Abastecimento
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    NEW.Id = gen_id(gen_Abastecimento, 1);
END;

CREATE TABLE Configuracao
(
    Id INTEGER NOT NULL,
    ValorLitroGasolina DECIMAL(10,2) NOT NULL,
    ValorLitroOleoDiesel DECIMAL(10,2) NOT NULL,
    ValorImposto DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_Configuracao PRIMARY KEY(Id)
);

INSERT INTO Configuracao
           (Id
           ,ValorLitroGasolina
           ,ValorLitroOleoDiesel
           ,ValorImposto)
     VALUES(1
           ,3.95
           ,2.16
           ,13.00);