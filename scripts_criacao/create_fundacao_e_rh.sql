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

CREATE TABLE CargoFuncionario(
    cargo VARCHAR2(50),
    setor VARCHAR2(50),
    CONSTRAINT pk_cargo_funcionario PRIMARY KEY(cargo)
);

CREATE TABLE Funcionario (
    cpf_funcionario VARCHAR2(11), -- FK Pessoa(cpf)
    cargo VARCHAR2(50) CONSTRAINT nn_cargo_funcionario NOT NULL, -- FK CargoFuncionario(cargo)
    turno VARCHAR2(30),
    salario NUMBER,
    cpf_supervisor VARCHAR2(11), -- FK Funcionario(cpf_funcionario), nullable
    CONSTRAINT pk_funcionario PRIMARY KEY(cpf_funcionario),
    CONSTRAINT fk_cpf_supervisor_funcionario_funcionario FOREIGN KEY(cpf_supervisor) REFERENCES Funcionario(cpf_funcionario),
    CONSTRAINT chk_salario_funcionario_gt_0 CHECK(salario > 0)
);

CREATE TABLE Contrata (
    cpf_funcionario VARCHAR2(11), -- FK Funcionario(cpf_funcionario)
    cod_evento NUMBER, -- FK Edicao(cod_evento, ano)
    ano NUMBER, -- FK Edicao(cod_evento, ano)
    carga_horaria_prevista NUMBER,
    carga_horaria_realizada NUMBER,
    CONSTRAINT pk_contrata PRIMARY KEY(cpf_funcionario, cod_evento, ano)
);
