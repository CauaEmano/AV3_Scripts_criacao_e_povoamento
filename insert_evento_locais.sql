-- EVENTO

INSERT INTO Evento (cod_evento, nome, publico_alvo, descricao)
VALUES (seq_pk_evento.NEXTVAL, 'Recife Anime e Games Festival', 'Fãs de anime, games e cultura pop', 'Convenção anual de cultura pop com atrações, torneios e estandes');

INSERT INTO Evento (cod_evento, nome, publico_alvo, descricao)
VALUES (seq_pk_evento.NEXTVAL, 'Festival Recife de Quadrinhos e Ilustração', 'Leitores de HQ, mangá, ilustradores e colecionadores', 'Festival anual de quadrinhos com painéis, autógrafos, oficinas e feira de editoras');

-- EDICAO

INSERT INTO Edicao (cod_evento, ano, data_inicio, data_fim)
VALUES (1, 2025, DATE '2025-11-15', DATE '2025-11-17');

INSERT INTO Edicao (cod_evento, ano, data_inicio, data_fim)
VALUES (1, 2026, DATE '2026-11-14', DATE '2026-11-16');

INSERT INTO Edicao (cod_evento, ano, data_inicio, data_fim)
VALUES (2, 2025, DATE '2025-08-22', DATE '2025-08-24');

INSERT INTO Edicao (cod_evento, ano, data_inicio, data_fim)
VALUES (2, 2026, DATE '2026-08-21', DATE '2026-08-23');

-- CEP

INSERT INTO Cep (cep, logradouro, bairro, cidade)
VALUES ('51110160', 'Avenida República do Líbano', 'Pina', 'Recife');

INSERT INTO Cep (cep, logradouro, bairro, cidade)
VALUES ('50030230', 'Avenida Alfredo Lisboa', 'Recife', 'Recife');

INSERT INTO Cep (cep, logradouro, bairro, cidade)
VALUES ('53020000', 'Avenida Sigismundo Gonçalves', 'Carmo', 'Olinda');

-- LOCAL

INSERT INTO Local (cod_local, nome, numero, complemento, cep)
VALUES (seq_pk_local.NEXTVAL, 'Centro de Convenções de Pernambuco', 's/n', NULL, '51110160');

INSERT INTO Local (cod_local, nome, numero, complemento, cep)
VALUES (seq_pk_local.NEXTVAL, 'Arena Recife Gamer', 's/n', 'Bloco B', '51110160');

INSERT INTO Local (cod_local, nome, numero, complemento, cep)
VALUES (seq_pk_local.NEXTVAL, 'Armazém Cultural do Recife Antigo', '14', NULL, '50030230');

INSERT INTO Local (cod_local, nome, numero, complemento, cep)
VALUES (seq_pk_local.NEXTVAL, 'Teatro Cultural do Carmo', '120', NULL, '53020000');

-- AREA

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (1, 1, 'Palco Principal', 3000, 1200, 'Palco', NULL);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (1, 2, 'Arena E-Sports', 800, 600, 'Arena', NULL);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (1, 3, 'Artists Alley', 1500, 900, 'Exposição', 2500);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (1, 4, 'Praça de Alimentação', 1200, 700, 'Alimentação', 4000);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (1, 5, 'Galeria de Lojas', 2000, 1500, 'Comercial', 6000);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (2, 1, 'Arena Gamer Principal', 500, 400, 'Arena', NULL);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (2, 2, 'Espaço Retro Games', 300, 250, 'Exposição', 1800);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (3, 1, 'Salão Principal', 1200, 800, 'Palco', NULL);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (3, 2, 'Galeria de Quadrinhos', 900, 700, 'Exposição', 2200);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (3, 3, 'Espaço Oficinas', 200, 150, 'Oficina', NULL);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (3, 4, 'Feira de Editoras', 600, 500, 'Comercial', 3000);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (4, 1, 'Auditório', 400, 300, 'Palco', NULL);

-- EDICAOLOCAL

INSERT INTO EdicaoLocal (cod_evento, ano, cod_local)
VALUES (1, 2025, 1);

INSERT INTO EdicaoLocal (cod_evento, ano, cod_local)
VALUES (1, 2026, 1);

INSERT INTO EdicaoLocal (cod_evento, ano, cod_local)
VALUES (1, 2026, 2);

INSERT INTO EdicaoLocal (cod_evento, ano, cod_local)
VALUES (2, 2025, 3);

INSERT INTO EdicaoLocal (cod_evento, ano, cod_local)
VALUES (2, 2026, 3);

INSERT INTO EdicaoLocal (cod_evento, ano, cod_local)
VALUES (2, 2026, 4);

COMMIT;
