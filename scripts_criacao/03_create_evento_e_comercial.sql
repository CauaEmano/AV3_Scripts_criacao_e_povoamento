CREATE TABLE Evento(
    cod_evento NUMBER,
    nome VARCHAR2(100) CONSTRAINT nn_nome_evento NOT NULL,
    publico_alvo VARCHAR2(100) CONSTRAINT nn_publico_alvo_evento NOT NULL,
    descricao VARCHAR2(255),
    CONSTRAINT pk_evento PRIMARY KEY(cod_evento)
);

CREATE TABLE Edicao(
    cod_evento NUMBER, -- FK Evento(cod_evento)
    ano NUMBER,
    data_inicio DATE CONSTRAINT nn_data_inicio_edicao NOT NULL,
    data_fim DATE CONSTRAINT nn_data_fim_edicao NOT NULL,
    CONSTRAINT pk_edicao PRIMARY KEY(cod_evento, ano),
    CONSTRAINT chk_edicao_ano CHECK(ano >= 2000),
    CONSTRAINT chk_edicao_datas CHECK(data_fim >= data_inicio)
);

CREATE TABLE Area(
    cod_local NUMBER, -- FK Local(cod_local)
    cod_area NUMBER,
    nome VARCHAR2(100) CONSTRAINT nn_nome_area NOT NULL,
    capacidade NUMBER CONSTRAINT nn_capacidade_area NOT NULL,
    tamanho NUMBER CONSTRAINT nn_tamanho_area NOT NULL,
    tipo VARCHAR2(50) CONSTRAINT nn_tipo_area NOT NULL,
    preco_aluguel_estande NUMBER(10, 2),
    CONSTRAINT pk_area PRIMARY KEY(cod_local, cod_area),
    CONSTRAINT chk_capacidade_area_gt_0 CHECK(capacidade > 0),
    CONSTRAINT chk_tamanho_area_gt_0 CHECK(tamanho > 0),
    CONSTRAINT chk_preco_aluguel_estande_gt_0 CHECK(preco_aluguel_estande > 0)
);

CREATE TABLE EdicaoLocal(
    cod_evento NUMBER, -- FK Edicao(cod_evento, ano)
    ano NUMBER, -- FK Edicao(cod_evento, ano)
    cod_local NUMBER, -- FK Local(cod_local)
    CONSTRAINT pk_edicao_local PRIMARY KEY(cod_evento, ano, cod_local)
);

CREATE TABLE Empresa(
    cnpj VARCHAR2(14),
    nome_comercial VARCHAR2(100) CONSTRAINT nn_nome_comercial_empresa NOT NULL,
    nome_juridico VARCHAR2(100) CONSTRAINT nn_nome_juridico_empresa NOT NULL,
    CONSTRAINT pk_empresa PRIMARY KEY(cnpj),
    CONSTRAINT chk_cnpj_empresa_14_digits CHECK(REGEXP_LIKE(cnpj, '^[0-9]{14}$'))
);

CREATE TABLE Produto(
    cod_produto NUMBER,
    nome VARCHAR2(100) CONSTRAINT nn_nome_produto NOT NULL,
    tipo VARCHAR2(50) CONSTRAINT nn_tipo_produto NOT NULL,
    preco NUMBER(10, 2) CONSTRAINT nn_preco_produto NOT NULL,
    estoque_inicial NUMBER CONSTRAINT nn_estoque_inicial_produto NOT NULL,
    CONSTRAINT pk_produto PRIMARY KEY(cod_produto),
    CONSTRAINT chk_produto_preco CHECK(preco >= 0),
    CONSTRAINT chk_produto_estoque CHECK(estoque_inicial >= 0)
);

CREATE TABLE Estande(
    cod_estande NUMBER,
    cod_local NUMBER CONSTRAINT nn_cod_local_estande NOT NULL, -- FK Area(cod_local, cod_area)
    cod_area NUMBER CONSTRAINT nn_cod_area_estande NOT NULL, -- FK Area(cod_local, cod_area)
    cod_evento NUMBER CONSTRAINT nn_cod_evento_estande NOT NULL, -- FK Edicao(cod_evento, ano)
    ano NUMBER CONSTRAINT nn_ano_estande NOT NULL, -- FK Edicao(cod_evento, ano)
    cnpj_empresa VARCHAR2(14), -- FK Empresa(cnpj)
    aluguel_inicio DATE,
    aluguel_fim DATE,
    CONSTRAINT pk_estande PRIMARY KEY(cod_estande),
    CONSTRAINT chk_estande_aluguel CHECK(aluguel_fim >= aluguel_inicio)
);

CREATE TABLE Disponibiliza(
    cnpj_empresa VARCHAR2(14), -- FK Empresa(cnpj)
    cod_estande NUMBER, -- FK Estande(cod_estande)
    cod_produto NUMBER, -- FK Produto(cod_produto)
    CONSTRAINT pk_disponibiliza PRIMARY KEY(cnpj_empresa, cod_estande, cod_produto)
);

CREATE TABLE Patrocina(
    cnpj_empresa VARCHAR2(14), -- FK Empresa(cnpj)
    cod_evento NUMBER, -- FK Edicao(cod_evento, ano)
    ano NUMBER, -- FK Edicao(cod_evento, ano)
    cota_investimento NUMBER(12, 2) CONSTRAINT nn_cota_investimento_patrocina NOT NULL,
    CONSTRAINT pk_patrocina PRIMARY KEY(cnpj_empresa, cod_evento, ano),
    CONSTRAINT chk_patrocina_cota CHECK(cota_investimento > 0)
);