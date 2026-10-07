-- CUPOM

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

INSERT INTO Cupom (codigo, desconto, data_validade)
VALUES ('QUADRI15', 15.00, DATE '2026-08-23');

INSERT INTO Cupom (codigo, desconto, data_validade)
VALUES ('GIBI10', 10.00, DATE '2025-08-24');

INSERT INTO Cupom (codigo, desconto, data_validade)
VALUES ('ANIME2025', 10.00, DATE '2025-11-15');

INSERT INTO Cupom (codigo, desconto, data_validade)
VALUES ('BEMVINDO5', 5.00, DATE '2025-11-17');

-- INSTANCIAINGRESSO (tabela de precos por edicao, tipo e lote)

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (1, 2025, 'INTEIRA', 1, 90.00);

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (1, 2025, 'INTEIRA', 2, 110.00);

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (1, 2025, 'MEIA', 1, 45.00);

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (1, 2025, 'MEIA', 2, 55.00);

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (1, 2025, 'VIP', 1, 170.00);

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (1, 2026, 'INTEIRA', 1, 120.00);

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (1, 2026, 'INTEIRA', 2, 140.00);

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (1, 2026, 'MEIA', 1, 60.00);

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (1, 2026, 'MEIA', 2, 70.00);

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (1, 2026, 'VIP', 1, 200.00);

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (2, 2025, 'INTEIRA', 1, 40.00);

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (2, 2025, 'MEIA', 1, 20.00);

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (2, 2026, 'INTEIRA', 1, 50.00);

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (2, 2026, 'MEIA', 1, 25.00);

INSERT INTO InstanciaIngresso (cod_evento, ano, tipo, lote, preco)
VALUES (2, 2026, 'VIP', 1, 120.00);

-- RECIBO (valor bruto da compra)

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2025-07-15', 80.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2025-08-10', 20.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2025-08-18', 40.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2025-09-05', 135.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2025-09-12', 90.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2025-10-02', 340.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2025-10-20', 275.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2025-11-03', 55.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-06-10', 240.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-06-18', 200.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-06-25', 120.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-07-01', 75.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-07-08', 200.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-07-20', 120.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-07-30', 300.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-08-05', 100.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-08-12', 120.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-08-15', 25.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-08-20', 75.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-09-01', 280.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-09-10', 70.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-09-15', 210.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-09-22', 400.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-10-03', 140.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-10-05', 210.00);

INSERT INTO Recibo (codigo, data_compra, valor_compra)
VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-10-07', 140.00);

-- INGRESSO (portador, instancia e status do check-in)

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233306', 2, 2025, 'INTEIRA', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233307', 2, 2025, 'INTEIRA', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233313', 2, 2025, 'MEIA', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233315', 2, 2025, 'INTEIRA', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233303', 1, 2025, 'INTEIRA', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233304', 1, 2025, 'MEIA', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233305', 1, 2025, 'INTEIRA', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233308', 1, 2025, 'VIP', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233309', 1, 2025, 'VIP', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233310', 1, 2025, 'INTEIRA', 2, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233311', 1, 2025, 'INTEIRA', 2, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233312', 1, 2025, 'MEIA', 2, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233314', 1, 2025, 'MEIA', 2, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233301', 1, 2026, 'INTEIRA', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233302', 1, 2026, 'INTEIRA', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233303', 1, 2026, 'VIP', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233305', 1, 2026, 'MEIA', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233304', 1, 2026, 'MEIA', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233301', 2, 2026, 'INTEIRA', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233302', 2, 2026, 'MEIA', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233308', 1, 2026, 'VIP', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233306', 2, 2026, 'VIP', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233310', 1, 2026, 'INTEIRA', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233311', 1, 2026, 'INTEIRA', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233312', 1, 2026, 'MEIA', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233316', 2, 2026, 'INTEIRA', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233317', 2, 2026, 'INTEIRA', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233322', 1, 2026, 'INTEIRA', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233318', 2, 2026, 'MEIA', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233320', 2, 2026, 'INTEIRA', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233321', 2, 2026, 'MEIA', 1, 'REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233323', 1, 2026, 'INTEIRA', 2, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233324', 1, 2026, 'INTEIRA', 2, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233325', 1, 2026, 'MEIA', 2, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233326', 1, 2026, 'INTEIRA', 2, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233327', 1, 2026, 'MEIA', 2, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233328', 1, 2026, 'VIP', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233329', 1, 2026, 'VIP', 1, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233330', 1, 2026, 'INTEIRA', 2, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233307', 1, 2026, 'INTEIRA', 2, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233309', 1, 2026, 'MEIA', 2, 'NAO_REALIZADO');

INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
VALUES (seq_pk_ingresso.NEXTVAL, '11122233313', 1, 2026, 'INTEIRA', 2, 'NAO_REALIZADO');

-- COMPRAINGRESSO (cod_ingresso/cod_recibo seguem a ordem das sequences)

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (1, '11122233306', 1, 'GIBI10', 36.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (2, '11122233306', 1, 'GIBI10', 36.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (3, '11122233313', 2, NULL, 20.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (4, '11122233315', 3, NULL, 40.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (5, '11122233303', 4, NULL, 90.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (6, '11122233303', 4, NULL, 45.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (7, '11122233305', 5, 'BEMVINDO5', 85.50);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (8, '11122233308', 6, NULL, 170.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (9, '11122233308', 6, NULL, 170.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (10, '11122233310', 7, 'ANIME2025', 99.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (11, '11122233310', 7, 'ANIME2025', 99.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (12, '11122233310', 7, 'ANIME2025', 49.50);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (13, '11122233314', 8, NULL, 55.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (14, '11122233301', 9, 'POPCON10', 108.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (15, '11122233301', 9, 'POPCON10', 108.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (16, '11122233303', 10, 'VIP25', 150.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (17, '11122233305', 11, NULL, 60.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (18, '11122233305', 11, NULL, 60.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (19, '11122233301', 12, 'QUADRI15', 42.50);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (20, '11122233301', 12, 'QUADRI15', 21.25);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (21, '11122233308', 13, 'VIP40', 120.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (22, '11122233306', 14, NULL, 120.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (23, '11122233310', 15, 'TOP10', 108.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (24, '11122233310', 15, 'TOP10', 108.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (25, '11122233310', 15, 'TOP10', 54.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (26, '11122233316', 16, 'QUADRI15', 42.50);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (27, '11122233316', 16, 'QUADRI15', 42.50);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (28, '11122233322', 17, NULL, 120.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (29, '11122233318', 18, NULL, 25.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (30, '11122233320', 19, NULL, 50.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (31, '11122233320', 19, NULL, 25.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (32, '11122233323', 20, 'TOP5', 133.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (33, '11122233323', 20, 'TOP5', 133.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (34, '11122233325', 21, 'POPCON7', 65.10);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (35, '11122233326', 22, NULL, 140.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (36, '11122233326', 22, NULL, 70.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (37, '11122233328', 23, 'VIP20', 160.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (38, '11122233328', 23, 'VIP20', 160.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (39, '11122233330', 24, NULL, 140.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (40, '11122233307', 25, 'POPCON10', 126.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (41, '11122233307', 25, 'POPCON10', 63.00);

INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
VALUES (42, '11122233313', 26, NULL, 140.00);

COMMIT;
