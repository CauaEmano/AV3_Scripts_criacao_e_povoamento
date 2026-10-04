CREATE TABLE Evento(
	cod_evento NUMBER,
  	nome VARCHAR2(100) CONSTRAINT nn_nome_evento NOT NULL,
  	publico_alvo VARCHAR2(100) CONSTRAINT nn_public_alvo_evento NOT NULL,
  	descricao VARCHAR2(255),
  	CONSTRAINT pk_evento PRIMARY KEY(cod_evento)
);

CREATE TABLE Edicao(
	cod_evento NUMBER, -- FK Evento(cod_evento)
  	ano NUMBER,
  	data_inicio DATE CONSTRAINT nn_data_inicio_edicao NOT NULL,
  	data_fim DATE CONSTRAINT nn_data_fim_edicao NOT NULL,
  	CONSTRAINT pk_edicao PRIMARY KEY(cod_evento, ano)
);

CREATE TABLE Area(
	cod_local NUMBER, -- FK Local(cod_local)
  	cod_area NUMBER,
  	nome VARCHAR2(100) CONSTRAINT nn_nome_area NOT NULL,
  	capacidade NUMBER CONSTRAINT nn_capacidade_area NOT NULL,
  	tamanho NUMBER CONSTRAINT nn_tamanho_area NOT NULL,
  	tipo VARCHAR2(50) CONSTRAINT nn_tipo_area NOT NULL,
  	preco_aluguel_estande NUMBER,
  	CONSTRAINT pk_area PRIMARY KEY(cod_local, cod_area),
  	CONSTRAINT chk_preco_aluguel_estande_gt_0 CHECK (preco_aluguel_estande > 0)
);

CREATE TABLE EdicaoLocal(
  	cod_evento NUMBER, -- FK Edicao(cod_evento)
  	ano NUMBER, -- FK Edicao(ano)
	cod_local NUMBER, -- FK Local(cod_local)
  	CONSTRAINT pk_edicao_local PRIMARY KEY(cod_evento, ano, cod_local)
);
