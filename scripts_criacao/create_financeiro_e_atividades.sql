CREATE TABLE Cupom(
    codigo NUMBER,
    desconto NUMBER(5, 2) CONSTRAINT nn_desconto_cupom NOT NULL,
    data_validade DATE CONSTRAINT nn_data_validade_cupom NOT NULL,
    CONSTRAINT pk_cupom PRIMARY KEY(codigo),
    CONSTRAINT chk_desconto_cupom_between_0_100 CHECK(desconto BETWEEN 0 AND 100)
);

CREATE TABLE Recibo(
    codigo NUMBER,
    data_compra DATE CONSTRAINT nn_data_compra_recibo NOT NULL,
    valor_compra NUMBER(10, 2) CONSTRAINT nn_valor_compra_recibo NOT NULL,
    CONSTRAINT pk_recibo PRIMARY KEY (codigo),
    CONSTRAINT chk_valor_compra_recibo_gte_0 CHECK(valor_compra >= 0)
);

CREATE TABLE InstanciaIngresso(
    cod_evento NUMBER, -- FK Edicao(cod_evento)
    ano NUMBER, -- FK Edicao(ano)
    tipo VARCHAR2(40),
    lote NUMBER,
    preco NUMBER(10, 2) CONSTRAINT nn_preco_instancia_ingresso NOT NULL,
    CONSTRAINT pk_instancia_ingresso PRIMARY KEY (cod_evento, ano, tipo, lote),
    CONSTRAINT chk_preco_instancia_ingresso_gte_0 CHECK(preco >= 0)
);

CREATE TABLE Ingresso(
    codigo NUMBER,
    cpf_pessoa VARCHAR2(11), -- FK Pessoa(cpf)
    cod_evento NUMBER, -- FK InstanciaIngresso(cod_evento)
    ano NUMBER, -- FK InstanciaIngresso(ano)
    tipo VARCHAR2(40), -- FK InstanciaIngresso(tipo)
    lote NUMBER, -- FK InstanciaIngresso(lote)
    status_check_in VARCHAR2(20) CONSTRAINT nn_status_check_in_ingresso NOT NULL,
    CONSTRAINT pk_ingresso PRIMARY KEY(codigo)
);

CREATE TABLE CompraIngresso(
    cod_ingresso NUMBER, -- FK Ingresso(codigo)
    cpf_comprador VARCHAR2(11) CONSTRAINT nn_cpf_comprador_compra_ingresso NOT NULL, -- FK Pessoa(cpf)
    cod_recibo NUMBER CONSTRAINT nn_cod_recibo_compra_ingresso NOT NULL, -- FK Recibo(codigo)
    cod_cupom NUMBER CONSTRAINT nn_cod_cupom_compra_ingresso NOT NULL, -- FK Cupom(codigo)
    valor_pago NUMBER(10, 2),
    CONSTRAINT pk_compra_ingresso PRIMARY KEY(cod_ingresso),
    CONSTRAINT chk_valor_pago_compra_ingresso_gte_0 CHECK(valor_pago >= 0)
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
    cache_convidado NUMBER(10, 2) CONSTRAINT nn_cache_convidado_atracao NOT NULL,
    tipo_apresentacao VARCHAR2(50) CONSTRAINT nn_tipo_apresentacao_atracao NOT NULL,
    CONSTRAINT pk_atracao PRIMARY KEY(cod_atv),
    CONSTRAINT chk_cache_convidado_atracao_gte_0 CHECK(cache_convidado >= 0)
);
 
CREATE TABLE Torneio(
    cod_atv NUMBER, -- FK Atividade(cod_atv)
    premiacao NUMBER CONSTRAINT nn_premiacao_torneio NOT NULL,
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
