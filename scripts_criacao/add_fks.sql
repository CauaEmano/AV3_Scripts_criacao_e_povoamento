ALTER TABLE Funcionario
ADD CONSTRAINT fk_cpf_funcionario_funcionario_pessoa FOREIGN KEY(cpf_funcionario) REFERENCES Pessoa(cpf);

ALTER TABLE Funcionario
ADD CONSTRAINT fk_cargo_funcionario_cargo_funcionario FOREIGN KEY(cargo) REFERENCES CargoFuncionario(cargo);

ALTER TABLE Contrata
ADD CONSTRAINT fk_cpf_funcionario_contrata_funcionario FOREIGN KEY(cpf_funcionario) REFERENCES Funcionario(cpf_funcionario);

ALTER TABLE Contrata
ADD CONSTRAINT fk_cod_evento_ano_contrata_edicao FOREIGN KEY(cod_evento, ano) REFERENCES Edicao(cod_evento, ano);
