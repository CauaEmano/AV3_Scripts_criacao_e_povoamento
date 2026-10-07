-- 1. PESSOAS & FUNCIONARIOS

CREATE TABLE Pessoa(
    cpf VARCHAR2(11),
    primeiro_nome VARCHAR2(30) CONSTRAINT nn_primeiro_nome_pessoa NOT NULL,
    sobrenome VARCHAR2(60) CONSTRAINT nn_sobrenome_pessoa NOT NULL,
    data_nascimento DATE CONSTRAINT nn_data_nascimento_pessoa NOT NULL,
    CONSTRAINT pk_pessoa PRIMARY KEY(cpf),
    CONSTRAINT chk_cpf_pessoa_11_digits CHECK(REGEXP_LIKE(cpf, '^[0-9]{11}$')),
    CONSTRAINT chk_data_nascimento_pessoa_min_date CHECK(data_nascimento >= DATE'1900-01-01')
);

CREATE TABLE TelefonePessoa(
    cpf_pessoa VARCHAR2(11), -- FK Pessoa(cpf)
    numero VARCHAR2(11),
    CONSTRAINT pk_telefone_pessoa PRIMARY KEY(cpf_pessoa, numero),
    CONSTRAINT chk_numero_telefone_pessoa_digits CHECK(REGEXP_LIKE(numero, '^[0-9]{10,11}$'))
);

CREATE TABLE CargoFuncionario(
    cargo VARCHAR2(50),
    setor VARCHAR2(50) CONSTRAINT nn_setor_cargo_funcionario NOT NULL,
    CONSTRAINT pk_cargo_funcionario PRIMARY KEY(cargo)
);

CREATE TABLE Funcionario(
    cpf_funcionario VARCHAR2(11), -- FK Pessoa(cpf)
    cargo VARCHAR2(50) CONSTRAINT nn_cargo_funcionario NOT NULL, -- FK CargoFuncionario(cargo)
    turno VARCHAR2(30),
    salario NUMBER(10, 2),
    cpf_supervisor VARCHAR2(11), -- FK Funcionario(cpf_funcionario), nulavel
    CONSTRAINT pk_funcionario PRIMARY KEY(cpf_funcionario),
    CONSTRAINT chk_salario_funcionario_gt_0 CHECK(salario > 0),
    CONSTRAINT chk_turno_funcionario_valores CHECK(turno IN ('Manhã', 'Tarde', 'Noite', 'Integral')),
    CONSTRAINT chk_funcionario_nao_supervisiona_si CHECK(cpf_supervisor <> cpf_funcionario)
);

-- 2. EVENTO & EDICAO

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

CREATE TABLE Contrata(
    cpf_funcionario VARCHAR2(11), -- FK Funcionario(cpf_funcionario)
    cod_evento NUMBER, -- FK Edicao(cod_evento, ano)
    ano NUMBER, -- FK Edicao(cod_evento, ano)
    carga_horaria_prevista NUMBER,
    carga_horaria_realizada NUMBER,
    CONSTRAINT pk_contrata PRIMARY KEY(cpf_funcionario, cod_evento, ano),
    CONSTRAINT chk_carga_prevista_contrata_gte_0 CHECK(carga_horaria_prevista >= 0),
    CONSTRAINT chk_carga_realizada_contrata_gte_0 CHECK(carga_horaria_realizada >= 0)
);

-- 3. ESPACO FISICO

CREATE TABLE Cep(
    cep VARCHAR2(8),
    logradouro VARCHAR2(100) CONSTRAINT nn_logradouro_cep NOT NULL,
    bairro VARCHAR2(50) CONSTRAINT nn_bairro_cep NOT NULL,
    cidade VARCHAR2(50) CONSTRAINT nn_cidade_cep NOT NULL,
    CONSTRAINT pk_cep PRIMARY KEY(cep),
    CONSTRAINT chk_cep_cep_8_digits CHECK(REGEXP_LIKE(cep, '^[0-9]{8}$'))
);

CREATE TABLE Local(
    cod_local NUMBER,
    nome VARCHAR2(100) CONSTRAINT nn_nome_local NOT NULL,
    numero VARCHAR2(10) CONSTRAINT nn_numero_local NOT NULL,
    complemento VARCHAR2(50),
    cep VARCHAR2(8) CONSTRAINT nn_cep_local NOT NULL, -- FK Cep(cep)
    CONSTRAINT pk_local PRIMARY KEY(cod_local)
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

-- 4. EMPRESAS & PRODUTOS

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

-- 5. INGRESSOS & PAGAMENTO

CREATE TABLE Cupom(
    codigo VARCHAR2(20),
    desconto NUMBER(5, 2) CONSTRAINT nn_desconto_cupom NOT NULL,
    data_validade DATE CONSTRAINT nn_data_validade_cupom NOT NULL,
    CONSTRAINT pk_cupom PRIMARY KEY(codigo),
    CONSTRAINT chk_codigo_cupom_formato CHECK(REGEXP_LIKE(codigo, '^[A-Z0-9]{3,20}$')),
    CONSTRAINT chk_desconto_cupom_between_0_100 CHECK(desconto BETWEEN 0 AND 100)
);

CREATE TABLE Recibo(
    codigo NUMBER,
    data_compra DATE CONSTRAINT nn_data_compra_recibo NOT NULL,
    valor_compra NUMBER(10, 2) CONSTRAINT nn_valor_compra_recibo NOT NULL,
    CONSTRAINT pk_recibo PRIMARY KEY(codigo),
    CONSTRAINT chk_valor_compra_recibo_gte_0 CHECK(valor_compra >= 0)
);

CREATE TABLE InstanciaIngresso(
    cod_evento NUMBER, -- FK Edicao(cod_evento, ano)
    ano NUMBER, -- FK Edicao(cod_evento, ano)
    tipo VARCHAR2(40),
    lote NUMBER,
    preco NUMBER(10, 2) CONSTRAINT nn_preco_instancia_ingresso NOT NULL,
    CONSTRAINT pk_instancia_ingresso PRIMARY KEY(cod_evento, ano, tipo, lote),
    CONSTRAINT chk_tipo_instancia_ingresso_valores CHECK(tipo IN ('INTEIRA', 'MEIA', 'VIP')),
    CONSTRAINT chk_lote_instancia_ingresso_gt_0 CHECK(lote > 0),
    CONSTRAINT chk_preco_instancia_ingresso_gte_0 CHECK(preco >= 0)
);

CREATE TABLE Ingresso(
    codigo NUMBER,
    cpf_pessoa VARCHAR2(11), -- FK Pessoa(cpf)
    cod_evento NUMBER CONSTRAINT nn_cod_evento_ingresso NOT NULL, -- FK InstanciaIngresso
    ano NUMBER CONSTRAINT nn_ano_ingresso NOT NULL, -- FK InstanciaIngresso
    tipo VARCHAR2(40) CONSTRAINT nn_tipo_ingresso NOT NULL, -- FK InstanciaIngresso
    lote NUMBER CONSTRAINT nn_lote_ingresso NOT NULL, -- FK InstanciaIngresso
    status_check_in VARCHAR2(20) CONSTRAINT nn_status_check_in_ingresso NOT NULL,
    CONSTRAINT pk_ingresso PRIMARY KEY(codigo),
    CONSTRAINT chk_status_check_in_ingresso_valores CHECK(status_check_in IN ('REALIZADO', 'NAO_REALIZADO'))
);

CREATE TABLE CompraIngresso(
    cod_ingresso NUMBER, -- FK Ingresso(codigo)
    cpf_comprador VARCHAR2(11) CONSTRAINT nn_cpf_comprador_compra_ingresso NOT NULL, -- FK Pessoa(cpf)
    cod_recibo NUMBER CONSTRAINT nn_cod_recibo_compra_ingresso NOT NULL, -- FK Recibo(codigo)
    cod_cupom VARCHAR2(20), -- FK Cupom(codigo), nulavel (compra sem cupom)
    valor_pago NUMBER(10, 2) CONSTRAINT nn_valor_pago_compra_ingresso NOT NULL,
    CONSTRAINT pk_compra_ingresso PRIMARY KEY(cod_ingresso),
    CONSTRAINT chk_valor_pago_compra_ingresso_gte_0 CHECK(valor_pago >= 0)
);

-- 6. ATIVIDADES

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
    premiacao NUMBER(10, 2) CONSTRAINT nn_premiacao_torneio NOT NULL,
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
    CONSTRAINT chk_inscricao_inscreve_gt_0 CHECK(inscricao > 0),
    CONSTRAINT chk_posicao_final_inscreve_gt_0 CHECK(posicao_final > 0)
);
