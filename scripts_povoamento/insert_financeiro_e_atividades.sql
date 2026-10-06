-- 1. CUPOM
-- Restrição: desconto deve estar entre 0 e 100, porque corresponde a porcentagem.

INSERT INTO Cupom (codigo, desconto, data_validade)
VALUES ('POPCON10', 10.00, DATE '2026-12-31');

INSERT INTO Cupom (codigo, desconto, data_validade)
VALUES ('VIP25', 25.00, DATE '2026-11-20');

INSERT INTO Cupom (codigo, desconto, data_validade)
VALUES ('VIP40', 40.00, DATE '2026-11-25');

INSERT INTO Cupom (codigo, desconto, data_validade)
VALUES ('TOP10', 10.00, DATE '2026-11-30');

INSERT INTO Cupom (codigo, desconto, data_validade)
VALUES ('TOP5', 5.00, DATE '2026-12-12');

INSERT INTO Cupom (codigo, desconto, data_validade)
VALUES ('VIP20', 20.00, DATE '2026-12-09');

INSERT INTO Cupom (codigo, desconto, data_validade)
VALUES ('POPCON7', 7.00, DATE '2026-12-25');

-- 2. RECIBO
-- Registo do documento fiscal com o valor bruto da transação

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES ('REC1001', DATE '2026-10-01', 120.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES ('REC1002', DATE '2026-10-02', 54.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES ('REC1003', DATE '2026-10-03', 120.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES ('REC1004', DATE '2026-10-04', 57.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES ('REC1005', DATE '2026-10-05', 320.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES ('REC1006', DATE '2026-10-05', 60.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES ('REC1007', DATE '2026-10-07', 200.00);

-- 3. INSTANCIA_INGRESSO
-- Define a tabela de preços por edição, tipo e lote

INSERT INTO Instancia_Ingresso (cod_evento, ano, tipo, lote, preco)
VALUES ('EVT_REC', 2026, 'INTEIRA', 1, 120.00);

INSERT INTO Instancia_Ingresso (cod_evento, ano, tipo, lote, preco)
VALUES ('EVT_REC', 2026, 'MEIA', 1, 60.00);

INSERT INTO Instancia_Ingresso (cod_evento, ano, tipo, lote, preco)
VALUES ('EVT_REC', 2026, 'VIP', 1, 200.00);


-- 4. INGRESSO
-- Unidade física/digital associada a uma instância de ingresso

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_checkin)
VALUES ('ING001', '12345678901', 'EVT_REC', 2026, 'INTEIRA', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_checkin)
VALUES ('ING002', '98765432100', 'EVT_REC', 2026, 'MEIA', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_checkin)
VALUES ('ING003', '45678901234', 'EVT_REC', 2026, 'VIP', 1, 'REALIZADO');


-- 5. COMPRA_INGRESSO
-- Transação de pagamento (pode associar cupom opcionalmente)

INSERT INTO Compra_Ingresso (id_compra, valor_pago, cpf_pessoa, codigo_cupom, codigo_recibo)
VALUES (1, 108.00, '12345678901', 'POPCON10', 'REC1001');

INSERT INTO Compra_Ingresso (id_compra, valor_pago, cpf_pessoa, codigo_cupom, codigo_recibo)
VALUES (2, 54.00, '98765432100', 'TOP10', 'REC1002');

INSERT INTO Compra_Ingresso (id_compra, valor_pago, cpf_pessoa, codigo_cupom, codigo_recibo)
VALUES (3, 120.00, '98765432100', NULL, 'REC1002');


-- 6. ATIVIDADE
-- Superclasse: status restrito e data_hora_fim posterior ao início

-- cod_atv 1-7  = Atracoes (area 1, palco principal)
-- cod_atv 8-14 = Torneios (area 2, arena e-sports)
-- Sem sobreposicao de horario dentro da mesma area.
 
-- Atracoes
INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area, data_hora_inicio, data_hora_fim, cod_evento, ano)
VALUES (1, 'Painel com Dubladores', 'Sessao de perguntas e respostas com dubladores', 'AGENDADA', 10, 1,
        TIMESTAMP '2026-11-14 14:00:00', TIMESTAMP '2026-11-14 15:30:00', 'EVT_REC', 2026);
INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area, data_hora_inicio, data_hora_fim, cod_evento, ano)
VALUES (2, 'Show de Abertura J-Pop', 'Show de banda J-Pop no palco principal', 'AGENDADA', 10, 1,
        TIMESTAMP '2026-11-14 18:00:00', TIMESTAMP '2026-11-14 19:30:00', 'EVT_REC', 2026);
INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area, data_hora_inicio, data_hora_fim, cod_evento, ano)
VALUES (3, 'Sessao de Autografos com Mangaka', 'Fila de autografos com mangaka convidado', 'AGENDADA', 10, 1,
        TIMESTAMP '2026-11-15 10:00:00', TIMESTAMP '2026-11-15 12:00:00', 'EVT_REC', 2026);
INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area, data_hora_inicio, data_hora_fim, cod_evento, ano)
VALUES (4, 'Desfile Cosplay', 'Desfile e premiacao dos melhores cosplays', 'AGENDADA', 10, 1,
        TIMESTAMP '2026-11-15 14:00:00', TIMESTAMP '2026-11-15 16:30:00', 'EVT_REC', 2026);
INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area, data_hora_inicio, data_hora_fim, cod_evento, ano)
VALUES (5, 'Concerto Sinfonico de Animes', 'Orquestra executando trilhas de animes', 'AGENDADA', 10, 1,
        TIMESTAMP '2026-11-15 19:00:00', TIMESTAMP '2026-11-15 21:00:00', 'EVT_REC', 2026);
INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area, data_hora_inicio, data_hora_fim, cod_evento, ano)
VALUES (6, 'Painel da Industria de Games', 'Debate sobre o mercado de games no Brasil', 'AGENDADA', 10, 1,
        TIMESTAMP '2026-11-16 11:00:00', TIMESTAMP '2026-11-16 12:30:00', 'EVT_REC', 2026);
INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area, data_hora_inicio, data_hora_fim, cod_evento, ano)
VALUES (7, 'Meet and Greet com Youtuber', 'Encontro com criador de conteudo', 'CANCELADA', 10, 1,
        TIMESTAMP '2026-11-16 15:00:00', TIMESTAMP '2026-11-16 16:00:00', 'EVT_REC', 2026);
 
-- Torneios
INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area, data_hora_inicio, data_hora_fim, cod_evento, ano)
VALUES (8, 'Torneio Street Fighter 6', 'Disputa eliminatoria na arena de e-sports', 'AGENDADA', 10, 2,
        TIMESTAMP '2026-11-14 16:00:00', TIMESTAMP '2026-11-14 20:00:00', 'EVT_REC', 2026);
INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area, data_hora_inicio, data_hora_fim, cod_evento, ano)
VALUES (9, 'Torneio Tekken 8', 'Chaveamento duplo de lutadores', 'AGENDADA', 10, 2,
        TIMESTAMP '2026-11-15 10:00:00', TIMESTAMP '2026-11-15 13:00:00', 'EVT_REC', 2026);
INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area, data_hora_inicio, data_hora_fim, cod_evento, ano)
VALUES (10, 'Torneio Smash Bros Ultimate', 'Campeonato 1v1 sem itens', 'AGENDADA', 10, 2,
        TIMESTAMP '2026-11-15 14:00:00', TIMESTAMP '2026-11-15 18:00:00', 'EVT_REC', 2026);
INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area, data_hora_inicio, data_hora_fim, cod_evento, ano)
VALUES (11, 'Torneio Mario Kart 8 Deluxe', 'Grand Prix eliminatorio', 'AGENDADA', 10, 2,
        TIMESTAMP '2026-11-16 10:00:00', TIMESTAMP '2026-11-16 12:00:00', 'EVT_REC', 2026);
INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area, data_hora_inicio, data_hora_fim, cod_evento, ano)
VALUES (12, 'Torneio EA Sports FC', 'Mata-mata de futebol virtual', 'AGENDADA', 10, 2,
        TIMESTAMP '2026-11-14 10:00:00', TIMESTAMP '2026-11-14 13:00:00', 'EVT_REC', 2026);
INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area, data_hora_inicio, data_hora_fim, cod_evento, ano)
VALUES (13, 'Torneio Valorant', 'Campeonato 5v5 por equipes', 'AGENDADA', 10, 2,
        TIMESTAMP '2026-11-16 13:00:00', TIMESTAMP '2026-11-16 18:00:00', 'EVT_REC', 2026);
INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area, data_hora_inicio, data_hora_fim, cod_evento, ano)
VALUES (14, 'Torneio Just Dance', 'Batalha de danca por pontuacao', 'AGENDADA', 10, 2,
        TIMESTAMP '2026-11-15 18:00:00', TIMESTAMP '2026-11-15 20:00:00', 'EVT_REC', 2026);



-- 7. ATRACAO
-- Subclasse de Atividade (herda cod_atv = 1)

INSERT INTO Atracao (cod_atv, cache_convidado, tipo_apresentacao) 
VALUES (1, 3500.00, 'Painel');

INSERT INTO Atracao (cod_atv, cache_convidado, tipo_apresentacao) 
VALUES (2, 7000.00, 'Show');

INSERT INTO Atracao (cod_atv, cache_convidado, tipo_apresentacao) 
VALUES (3, 2500.00, 'Autografos');

INSERT INTO Atracao (cod_atv, cache_convidado, tipo_apresentacao) 
VALUES (4, 1500.00, 'Desfile');

INSERT INTO Atracao (cod_atv, cache_convidado, tipo_apresentacao) 
VALUES (5, 9000.00, 'Concerto');

INSERT INTO Atracao (cod_atv, cache_convidado, tipo_apresentacao) 
VALUES (6, 3000.00, 'Painel');

INSERT INTO Atracao (cod_atv, cache_convidado, tipo_apresentacao) 
VALUES (7, 2000.00, 'Meet and Greet');



-- 8. TORNEIO
-- Subclasse de Atividade (herda cod_atv = 2)

INSERT INTO Torneio (cod_atv, premiacao, plataforma, vagas, regulamento)
VALUES (8, 2000.00, 'PlayStation 5', 32, 'Eliminacao simples; melhor de 3 partidas.');
INSERT INTO Torneio (cod_atv, premiacao, plataforma, vagas, regulamento)
VALUES (9, 1500.00, 'PC', 16, 'Eliminacao dupla; melhor de 5 na final.');
INSERT INTO Torneio (cod_atv, premiacao, plataforma, vagas, regulamento)
VALUES (10, 1000.00, 'Nintendo Switch', 32, 'Partidas 1v1, 3 vidas, sem itens, melhor de 3.');
INSERT INTO Torneio (cod_atv, premiacao, plataforma, vagas, regulamento)
VALUES (11, 800.00, 'Nintendo Switch', 24, 'Grand Prix de 4 pistas; pontuacao acumulada.');
INSERT INTO Torneio (cod_atv, premiacao, plataforma, vagas, regulamento)
VALUES (12, 1200.00, 'Xbox Series X', 16, 'Mata-mata em jogo unico; prorrogacao e penaltis.');
INSERT INTO Torneio (cod_atv, premiacao, plataforma, vagas, regulamento)
VALUES (13, 5000.00, 'PC', 16, 'Equipes de 5 jogadores; fase de grupos e playoffs.');
INSERT INTO Torneio (cod_atv, premiacao, plataforma, vagas, regulamento)
VALUES (14, 500.00, 'Nintendo Switch', 20, 'Tres rodadas; vence quem somar mais pontos.');




-- 9. ASSISTE
-- Relação N:N entre Visitante (Pessoa) e Atividade // Atividade 7 cancelada então ninguém assiste

INSERT INTO Assiste (cpf, cod_atv) 
VALUES ('12345678901', 1);

INSERT INTO Assiste (cpf, cod_atv) 
VALUES ('98765432100', 1);

INSERT INTO Assiste (cpf, cod_atv) 
VALUES ('45678901234', 2);

INSERT INTO Assiste (cpf, cod_atv) 
VALUES ('11122233344', 3);

INSERT INTO Assiste (cpf, cod_atv) 
VALUES ('55566677788', 4);

INSERT INTO Assiste (cpf, cod_atv) 
VALUES ('32165498700', 5);

INSERT INTO Assiste (cpf, cod_atv) 
VALUES ('74185296300', 6);


-- 10. INSCREVE
-- Relação N:N entre Competidor (Pessoa) e Torneio
-- posicao_final pode ser NULL enquanto o torneio decorre

INSERT INTO Inscreve (cpf, cod_torneio, inscricao, posicao_final) 
VALUES ('12345678901',  8, 101, NULL);

INSERT INTO Inscreve (cpf, cod_torneio, inscricao, posicao_final) 
VALUES ('98765432100',  8, 102, NULL);

INSERT INTO Inscreve (cpf, cod_torneio, inscricao, posicao_final) 
VALUES ('45678901234',  9, 101, NULL);

INSERT INTO Inscreve (cpf, cod_torneio, inscricao, posicao_final) 
VALUES ('11122233344', 10, 101, NULL);

INSERT INTO Inscreve (cpf, cod_torneio, inscricao, posicao_final) 
VALUES ('55566677788', 11, 101, NULL);

INSERT INTO Inscreve (cpf, cod_torneio, inscricao, posicao_final) 
VALUES ('32165498700', 13, 101, NULL);

INSERT INTO Inscreve (cpf, cod_torneio, inscricao, posicao_final) 
VALUES ('74185296300', 14, 101, NULL);