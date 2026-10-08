-- EMPRESA

INSERT INTO Empresa (cnpj, nome_comercial, nome_juridico)
VALUES ('11222333000181', 'Otaku Store', 'Otaku Store Comércio de Variedades LTDA');

INSERT INTO Empresa (cnpj, nome_comercial, nome_juridico)
VALUES ('22333444000172', 'Nordeste Games', 'Nordeste Games e Eletrônicos S.A.');

INSERT INTO Empresa (cnpj, nome_comercial, nome_juridico)
VALUES ('33444555000163', 'Sabor Pop', 'Sabor Pop Alimentos LTDA');

INSERT INTO Empresa (cnpj, nome_comercial, nome_juridico)
VALUES ('44555666000154', 'Mangá Mania', 'Mangá Mania Livraria e Editora LTDA');

INSERT INTO Empresa (cnpj, nome_comercial, nome_juridico)
VALUES ('55666777000145', 'EnergyUp', 'EnergyUp Bebidas do Brasil LTDA');

INSERT INTO Empresa (cnpj, nome_comercial, nome_juridico)
VALUES ('66777888000136', 'Quadrinhos & Cia', 'Quadrinhos e Companhia Editora LTDA');

INSERT INTO Empresa (cnpj, nome_comercial, nome_juridico)
VALUES ('77888999000127', 'Café Nanquim', 'Café Nanquim Gastronomia LTDA');

INSERT INTO Empresa (cnpj, nome_comercial, nome_juridico)
VALUES ('88999000000118', 'Cards Arena', 'Cards Arena Jogos de Cartas EIRELI');

-- PRODUTO

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (seq_pk_produto.NEXTVAL, 'Action Figure Colecionável', 'Colecionável', 189.90, 150);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (seq_pk_produto.NEXTVAL, 'Controle Pro Wireless', 'Eletrônico', 349.90, 60);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (seq_pk_produto.NEXTVAL, 'Combo Lamen + Refrigerante', 'Alimento', 35.00, 500);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (seq_pk_produto.NEXTVAL, 'Mangá Volume Único', 'Livro', 42.50, 300);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (seq_pk_produto.NEXTVAL, 'Energético Lata 473ml', 'Bebida', 12.00, 800);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (seq_pk_produto.NEXTVAL, 'Camiseta Estampada', 'Vestuário', 79.90, 200);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (seq_pk_produto.NEXTVAL, 'Mousepad Gamer', 'Acessório', 59.90, 120);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (seq_pk_produto.NEXTVAL, 'Graphic Novel Nacional', 'Livro', 68.00, 200);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (seq_pk_produto.NEXTVAL, 'Print Ilustrado A3', 'Arte', 35.00, 300);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (seq_pk_produto.NEXTVAL, 'Caneca Temática', 'Acessório', 39.90, 150);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (seq_pk_produto.NEXTVAL, 'Booster de Card Game', 'Colecionável', 25.00, 400);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (seq_pk_produto.NEXTVAL, 'Café Especial Gelado', 'Alimento', 14.00, 600);

-- ESTANDE (cod_estande, local, area, evento, ano, empresa, periodo do aluguel)

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (seq_pk_estande.NEXTVAL, 1, 5, 1, 2026, '11222333000181', DATE '2026-11-14', DATE '2026-11-16');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (seq_pk_estande.NEXTVAL, 1, 5, 1, 2026, '22333444000172', DATE '2026-11-14', DATE '2026-11-16');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (seq_pk_estande.NEXTVAL, 1, 4, 1, 2026, '33444555000163', DATE '2026-11-14', DATE '2026-11-16');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (seq_pk_estande.NEXTVAL, 1, 3, 1, 2026, '44555666000154', DATE '2026-11-14', DATE '2026-11-15');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (seq_pk_estande.NEXTVAL, 1, 4, 1, 2026, '55666777000145', DATE '2026-11-15', DATE '2026-11-16');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (seq_pk_estande.NEXTVAL, 1, 5, 1, 2025, '11222333000181', DATE '2025-11-15', DATE '2025-11-17');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (seq_pk_estande.NEXTVAL, 1, 3, 1, 2025, '44555666000154', DATE '2025-11-15', DATE '2025-11-17');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (seq_pk_estande.NEXTVAL, 1, 4, 1, 2025, '33444555000163', DATE '2025-11-15', DATE '2025-11-17');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (seq_pk_estande.NEXTVAL, 2, 2, 1, 2026, '22333444000172', DATE '2026-11-14', DATE '2026-11-16');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (seq_pk_estande.NEXTVAL, 3, 2, 2, 2025, '66777888000136', DATE '2025-08-22', DATE '2025-08-24');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (seq_pk_estande.NEXTVAL, 3, 4, 2, 2025, '77888999000127', DATE '2025-08-22', DATE '2025-08-24');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (seq_pk_estande.NEXTVAL, 3, 2, 2, 2026, '66777888000136', DATE '2026-08-21', DATE '2026-08-23');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (seq_pk_estande.NEXTVAL, 3, 4, 2, 2026, '88999000000118', DATE '2026-08-21', DATE '2026-08-23');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (seq_pk_estande.NEXTVAL, 3, 4, 2, 2026, '77888999000127', DATE '2026-08-22', DATE '2026-08-23');

-- DISPONIBILIZA (a empresa e sempre a que alugou o estande)

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('11222333000181', 1, 1);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('11222333000181', 1, 6);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('22333444000172', 2, 2);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('22333444000172', 2, 7);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('33444555000163', 3, 3);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('44555666000154', 4, 4);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('55666777000145', 5, 5);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('11222333000181', 6, 1);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('11222333000181', 6, 6);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('44555666000154', 7, 4);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('33444555000163', 8, 3);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('22333444000172', 9, 7);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('66777888000136', 10, 8);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('66777888000136', 10, 9);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('77888999000127', 11, 12);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('66777888000136', 12, 8);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('66777888000136', 12, 9);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('66777888000136', 12, 10);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('88999000000118', 13, 11);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('77888999000127', 14, 12);

INSERT INTO Disponibiliza (cnpj_empresa, cod_estande, cod_produto)
VALUES ('77888999000127', 14, 10);

-- PATROCINA

INSERT INTO Patrocina (cnpj_empresa, cod_evento, ano, cota_investimento)
VALUES ('22333444000172', 1, 2026, 50000.00);

INSERT INTO Patrocina (cnpj_empresa, cod_evento, ano, cota_investimento)
VALUES ('55666777000145', 1, 2026, 30000.00);

INSERT INTO Patrocina (cnpj_empresa, cod_evento, ano, cota_investimento)
VALUES ('11222333000181', 1, 2026, 15000.00);

INSERT INTO Patrocina (cnpj_empresa, cod_evento, ano, cota_investimento)
VALUES ('22333444000172', 1, 2025, 40000.00);

INSERT INTO Patrocina (cnpj_empresa, cod_evento, ano, cota_investimento)
VALUES ('33444555000163', 1, 2025, 10000.00);

INSERT INTO Patrocina (cnpj_empresa, cod_evento, ano, cota_investimento)
VALUES ('55666777000145', 1, 2025, 18000.00);

INSERT INTO Patrocina (cnpj_empresa, cod_evento, ano, cota_investimento)
VALUES ('66777888000136', 2, 2025, 20000.00);

INSERT INTO Patrocina (cnpj_empresa, cod_evento, ano, cota_investimento)
VALUES ('66777888000136', 2, 2026, 25000.00);

INSERT INTO Patrocina (cnpj_empresa, cod_evento, ano, cota_investimento)
VALUES ('77888999000127', 2, 2026, 8000.00);

COMMIT;
