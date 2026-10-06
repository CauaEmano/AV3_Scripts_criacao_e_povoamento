-- PESSOAS que tambem atuam como funcionarios.
INSERT INTO Pessoa (cpf, primeiro_nome, sobrenome, data_nascimento)
VALUES ('11111111111', 'Ana', 'Silva', DATE '1985-04-12');

INSERT INTO Pessoa (cpf, primeiro_nome, sobrenome, data_nascimento)
VALUES ('22222222222', 'Bruno', 'Costa', DATE '1990-09-23');

INSERT INTO Pessoa (cpf, primeiro_nome, sobrenome, data_nascimento)
VALUES ('33333333333', 'Carla', 'Souza', DATE '1994-02-08');

INSERT INTO Pessoa (cpf, primeiro_nome, sobrenome, data_nascimento)
VALUES ('44444444444', 'Diego', 'Almeida', DATE '1988-11-30');

INSERT INTO Pessoa (cpf, primeiro_nome, sobrenome, data_nascimento)
VALUES ('55555555555', 'Elisa', 'Santos', DATE '1996-06-17');

INSERT INTO Pessoa (cpf, primeiro_nome, sobrenome, data_nascimento)
VALUES ('66666666666', 'Felipe', 'Oliveira', DATE '1992-01-25');

INSERT INTO Pessoa (cpf, primeiro_nome, sobrenome, data_nascimento)
VALUES ('77777777777', 'Gabriela', 'Lima', DATE '1998-08-04');

INSERT INTO Pessoa (cpf, primeiro_nome, sobrenome, data_nascimento)
VALUES ('88888888888', 'Heitor', 'Pereira', DATE '1987-12-19');

-- CARGOS
INSERT INTO CargoFuncionario (cargo, setor)
VALUES ('Coordenador de Eventos', 'Eventos');

INSERT INTO CargoFuncionario (cargo, setor)
VALUES ('Produtor de Atividades', 'Atividades');

INSERT INTO CargoFuncionario (cargo, setor)
VALUES ('Analista Financeiro', 'Financeiro');

INSERT INTO CargoFuncionario (cargo, setor)
VALUES ('Atendente Comercial', 'Comercial');

INSERT INTO CargoFuncionario (cargo, setor)
VALUES ('Tecnico de Infraestrutura', 'Operacoes');

-- FUNCIONARIOS: Ana e Bruno supervisionam as demais equipes.
INSERT INTO Funcionario (cpf_funcionario, cargo, turno, salario, cpf_supervisor)
VALUES ('11111111111', 'Coordenador de Eventos', 'Integral', 8500.00, NULL);

INSERT INTO Funcionario (cpf_funcionario, cargo, turno, salario, cpf_supervisor)
VALUES ('22222222222', 'Produtor de Atividades', 'Integral', 6200.00, '11111111111');

INSERT INTO Funcionario (cpf_funcionario, cargo, turno, salario, cpf_supervisor)
VALUES ('33333333333', 'Analista Financeiro', 'Integral', 5800.00, '11111111111');

INSERT INTO Funcionario (cpf_funcionario, cargo, turno, salario, cpf_supervisor)
VALUES ('44444444444', 'Atendente Comercial', 'Tarde', 3200.00, '22222222222');

INSERT INTO Funcionario (cpf_funcionario, cargo, turno, salario, cpf_supervisor)
VALUES ('55555555555', 'Atendente Comercial', 'Noite', 3200.00, '22222222222');

INSERT INTO Funcionario (cpf_funcionario, cargo, turno, salario, cpf_supervisor)
VALUES ('66666666666', 'Tecnico de Infraestrutura', 'Integral', 4500.00, '11111111111');

INSERT INTO Funcionario (cpf_funcionario, cargo, turno, salario, cpf_supervisor)
VALUES ('77777777777', 'Produtor de Atividades', 'Tarde', 4000.00, '22222222222');

INSERT INTO Funcionario (cpf_funcionario, cargo, turno, salario, cpf_supervisor)
VALUES ('88888888888', 'Tecnico de Infraestrutura', 'Noite', 4500.00, '66666666666');

-- CONTRATACOES para as edicoes 2025 e 2026 do evento 1.
INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('11111111111', 1, 2025, 40, 40);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('22222222222', 1, 2025, 36, 38);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('33333333333', 1, 2025, 32, 32);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('44444444444', 1, 2025, 24, 26);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('55555555555', 1, 2025, 24, 24);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('66666666666', 1, 2025, 30, 30);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('77777777777', 1, 2025, 28, 28);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('88888888888', 1, 2025, 24, 25);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('11111111111', 1, 2026, 40, 40);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('22222222222', 1, 2026, 36, 36);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('33333333333', 1, 2026, 32, 34);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('44444444444', 1, 2026, 24, 24);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('55555555555', 1, 2026, 24, 25);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('66666666666', 1, 2026, 30, 30);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('77777777777', 1, 2026, 28, 30);

INSERT INTO Contrata (cpf_funcionario, cod_evento, ano, carga_horaria_prevista, carga_horaria_realizada)
VALUES ('88888888888', 1, 2026, 24, 24);
