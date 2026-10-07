ALTER TABLE TelefonePessoa
ADD CONSTRAINT fk_cpf_pessoa_telefone_pessoa_pessoa FOREIGN KEY(cpf_pessoa) REFERENCES Pessoa(cpf);

ALTER TABLE Local
ADD CONSTRAINT fk_cep_local_cep FOREIGN KEY(cep) REFERENCES Cep(cep);

ALTER TABLE Funcionario
ADD CONSTRAINT fk_cpf_funcionario_funcionario_pessoa FOREIGN KEY(cpf_funcionario) REFERENCES Pessoa(cpf);

ALTER TABLE Funcionario
ADD CONSTRAINT fk_cargo_funcionario_cargo_funcionario FOREIGN KEY(cargo) REFERENCES CargoFuncionario(cargo);

ALTER TABLE Contrata
ADD CONSTRAINT fk_cpf_funcionario_contrata_funcionario FOREIGN KEY(cpf_funcionario) REFERENCES Funcionario(cpf_funcionario);

ALTER TABLE Contrata
ADD CONSTRAINT fk_cod_evento_ano_contrata_edicao FOREIGN KEY(cod_evento, ano) REFERENCES Edicao(cod_evento, ano);

ALTER TABLE Edicao
ADD CONSTRAINT fk_cod_evento_edicao_evento FOREIGN KEY(cod_evento) REFERENCES Evento(cod_evento);

ALTER TABLE Area
ADD CONSTRAINT fk_cod_local_area_local FOREIGN KEY(cod_local) REFERENCES Local(cod_local);

ALTER TABLE EdicaoLocal
ADD CONSTRAINT fk_cod_evento_ano_edicao_local_edicao FOREIGN KEY(cod_evento, ano) REFERENCES Edicao(cod_evento, ano);

ALTER TABLE EdicaoLocal
ADD CONSTRAINT fk_cod_local_edicao_local_local FOREIGN KEY(cod_local) REFERENCES Local(cod_local);

ALTER TABLE Estande
ADD CONSTRAINT fk_cod_local_cod_area_estande_area FOREIGN KEY(cod_local, cod_area) REFERENCES Area(cod_local, cod_area);

ALTER TABLE Estande
ADD CONSTRAINT fk_cod_evento_ano_estande_edicao FOREIGN KEY(cod_evento, ano) REFERENCES Edicao(cod_evento, ano);

ALTER TABLE Estande
ADD CONSTRAINT fk_cnpj_empresa_estande_empresa FOREIGN KEY(cnpj_empresa) REFERENCES Empresa(cnpj);

ALTER TABLE Disponibiliza
ADD CONSTRAINT fk_cnpj_empresa_disponibiliza_empresa FOREIGN KEY(cnpj_empresa) REFERENCES Empresa(cnpj);

ALTER TABLE Disponibiliza
ADD CONSTRAINT fk_cod_estande_disponibiliza_estande FOREIGN KEY(cod_estande) REFERENCES Estande(cod_estande);

ALTER TABLE Disponibiliza
ADD CONSTRAINT fk_cod_produto_disponibiliza_produto FOREIGN KEY(cod_produto) REFERENCES Produto(cod_produto);

ALTER TABLE Patrocina
ADD CONSTRAINT fk_cnpj_empresa_patrocina_empresa FOREIGN KEY(cnpj_empresa) REFERENCES Empresa(cnpj);

ALTER TABLE Patrocina
ADD CONSTRAINT fk_cod_evento_ano_patrocina_edicao FOREIGN KEY(cod_evento, ano) REFERENCES Edicao(cod_evento, ano);
