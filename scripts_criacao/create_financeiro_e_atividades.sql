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


CREATE TABLE Compra_Ingresso(
    id_compra NUMBER(10) NOT NULL,
    valor_pago NUMBER(10, 2) NOT NULL,
    cpf_pessoa VARCHAR(11) NOT NULL,
    codigo_cupom VARCHAR(20),
    codigo_recibo VARCHAR(10),

    CONSTRAINT pk_compra_ingresso PRIMARY KEY(id_compra),
    CONSTRAINT fk_compra_pessoa FOREIGN KEY(cpf_pessoa)
        REFERENCES Pessoa(cpf),
    CONSTRAINT fk_compra_cupom FOREIGN KEY(codigo_cupom)
        REFERENCES Cupom(codigo),
    CONSTRAINT fk_compra_recibo FOREIGN KEY(codigo_recibo)
        REFERENCES Recibo(codigo)
);

CREATE TABLE Atividade(
    cod_atv NUMBER,
    nome VARCHAR2(50) CONSTRAINT nn_nome_atividade NOT NULL,
    descricao VARCHAR2(500),
    status VARCHAR2(50) CONSTRAINT nn_status_atividade NOT NULL,
    cod_local NUMBER CONSTRAINT nn_cod_local_atividade NOT NULL, -- FK Area(cod_local, cod_area)
    cod_area NUMBER CONSTRAINT nn_cod_area_atividade NOT NULL, -- FK Area(cod_local, cod_area)
    data_hora_inicio TIMESTAMP CONSTRAINT nn_data_hora_inicio_atividade NOT NULL,
    data_hora_fim TIMESTAMP CONSTRAINT nn_data_hora_fim_atividade NOT NULL,
    cod_evento NUMBER CONSTRAINT nn_cod_evento_atividade NOT NULL, -- FK Edicao(cod_evento, ano)
    ano NUMBER CONSTRAINT nn_ano_atividade NOT NULL, -- FK Edicao(cod_evento, ano)
    CONSTRAINT pk_atividade PRIMARY KEY(cod_atv),
    CONSTRAINT chk_status_atividade_valores CHECK(status IN ('AGENDADA', 'EM ANDAMENTO', 'ENCERRADA', 'CANCELADA')),
    CONSTRAINT chk_data_hora_fim_atividade_gt_inicio CHECK(data_hora_fim > data_hora_inicio)
);

CREATE TABLE Atracao(
    cod_atv NUMBER, -- FK Atividade(cod_atv)
    cache_convidado NUMBER(10,2) CONSTRAINT nn_cache_convidado_atracao NOT NULL,
    tipo_apresentacao VARCHAR2(50) CONSTRAINT nn_tipo_apresentacao_atracao NOT NULL,
    CONSTRAINT pk_atracao PRIMARY KEY(cod_atv),
    CONSTRAINT chk_cache_convidado_atracao_gte_0 CHECK(cache_convidado >= 0)
);
 
CREATE TABLE Torneio(
    cod_atv NUMBER, -- FK Atividade(cod_atv)
    premiacao VARCHAR2(255) CONSTRAINT nn_premiacao_torneio NOT NULL,
    plataforma VARCHAR2(50) CONSTRAINT nn_plataforma_torneio NOT NULL,
    vagas NUMBER CONSTRAINT nn_vagas_torneio NOT NULL,
    regulamento VARCHAR2(4000),
    CONSTRAINT pk_torneio PRIMARY KEY(cod_atv),
    CONSTRAINT chk_premiacao_torneio_gte_0 CHECK(premiacao >= 0),
    CONSTRAINT chk_vagas_torneio_gt_0 CHECK(vagas > 0)
);
 
CREATE TABLE Assiste(
    cpf VARCHAR2(11), -- FK Pessoa(cpf)
    cod_atv NUMBER, -- FK Atividade(cod_atv)
    CONSTRAINT pk_assiste PRIMARY KEY(cpf, cod_atv)
);
 
CREATE TABLE Inscreve(
    cpf VARCHAR2(11), -- FK Pessoa(cpf)
    cod_torneio NUMBER, -- FK Torneio(cod_atv)
    inscricao NUMBER CONSTRAINT nn_inscricao_inscreve NOT NULL,
    posicao_final NUMBER,
    CONSTRAINT pk_inscreve PRIMARY KEY(cpf, cod_torneio),
    CONSTRAINT uq_cod_torneio_inscricao_inscreve UNIQUE(cod_torneio, inscricao),
    CONSTRAINT chk_posicao_final_inscreve_gt_0 CHECK(posicao_final > 0)
);