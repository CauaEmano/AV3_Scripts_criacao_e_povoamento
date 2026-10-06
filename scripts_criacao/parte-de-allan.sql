CREATE TABLE Cupom(
    codigo VARCHAR(20) NOT NULL PRIMARY KEY,
    desconto DECIMAL(5,2) NOT NULL,
    data_validade DATE NOT NULL,
    CONSTRAINT CHK_Desconto CHECK (desconto BETWEEN 0 AND 100)
);

CREATE TABLE Recibo(
    codigo VARCHAR(20) NOT NULL PRIMARY KEY,
    data_compra DATE NOT NULL,
    valor_compra DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PK_Recibo PRIMARY KEY (codigo)
);

CREATE TABLE Instancia_Ingresso(
    cod_evento VARCHAR(20) NOT NULL,
    ano INT NOT NULL,
    tipo VARCHAR(40) NOT NULL,
    lote INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PK_Instancia_Ingresso PRIMARY KEY (cod_evento, ano, tipo, lote),
    CONSTRAINT FK_InstanciaIngresso_Edicao FOREIGN KEY(cod_evento, ano)
        REFERENCES Edicao(cod_evento, ano)
);

CREATE TABLE Ingresso(
    codigo VARCHAR(20) NOT NULL,
    cpf_pessoa VARCHAR(11),
    cod_evento VARCHAR(20),
    ano INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    lote INT NOT NULL,
    status_checkin VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Ingresso PRIMARY KEY(codigo),
    CONSTRAINT FK_Ingresso_Pessoa FOREIGN KEY(cpf_pessoa)
        REFERENCES Pessoa(cpf),
    CONSTRAINT FK_Ingresso_Instancia FOREIGN KEY(cod_evento, ano, tipo, lote)
        REFERENCES Instancia_Ingresso(cod_evento, ano, tipo, lote)
);