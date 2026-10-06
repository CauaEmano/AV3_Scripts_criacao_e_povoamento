-- 1. EVENTO
-- Evento "guarda-chuva"; as edicoes anuais ficam na tabela Edicao

INSERT INTO Evento (cod_evento, nome, publico_alvo, descricao)
VALUES (1, 'Recife Anime e Games Festival', 'Fas de anime, games e cultura pop', 'Convencao anual de cultura pop com atracoes, torneios e estandes');


-- 2. EDICAO
-- Restricao: data_fim >= data_inicio

INSERT INTO Edicao (cod_evento, ano, data_inicio, data_fim)
VALUES (1, 2025, DATE '2025-11-15', DATE '2025-11-17');

INSERT INTO Edicao (cod_evento, ano, data_inicio, data_fim)
VALUES (1, 2026, DATE '2026-11-14', DATE '2026-11-16');


-- 3. AREA
-- Areas dentro do local 10; preco_aluguel_estande so e preenchido nas areas que alugam estandes
-- (quando informado, deve ser > 0). Areas 1 e 2 sao as usadas por Atividade.

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (10, 1, 'Palco Principal', 3000, 1200, 'Palco', NULL);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (10, 2, 'Arena E-Sports', 800, 600, 'Arena', NULL);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (10, 3, 'Artists Alley', 1500, 900, 'Exposicao', 2500.00);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (10, 4, 'Praca de Alimentacao', 1200, 700, 'Alimentacao', 4000.00);

INSERT INTO Area (cod_local, cod_area, nome, capacidade, tamanho, tipo, preco_aluguel_estande)
VALUES (10, 5, 'Galeria de Lojas', 2000, 1500, 'Comercial', 6000.00);


-- 4. EDICAOLOCAL
-- Relaciona cada edicao aos locais em que ela acontece

INSERT INTO EdicaoLocal (cod_evento, ano, cod_local)
VALUES (1, 2025, 10);

INSERT INTO EdicaoLocal (cod_evento, ano, cod_local)
VALUES (1, 2026, 10);


-- 5. EMPRESA
-- CNPJ com 14 digitos (somente numeros)

INSERT INTO Empresa (cnpj, nome_comercial, nome_juridico)
VALUES ('11222333000181', 'Otaku Store', 'Otaku Store Comercio de Variedades LTDA');

INSERT INTO Empresa (cnpj, nome_comercial, nome_juridico)
VALUES ('22333444000172', 'Nordeste Games', 'Nordeste Games e Eletronicos S.A.');

INSERT INTO Empresa (cnpj, nome_comercial, nome_juridico)
VALUES ('33444555000163', 'Sabor Pop', 'Sabor Pop Alimentos LTDA');

INSERT INTO Empresa (cnpj, nome_comercial, nome_juridico)
VALUES ('44555666000154', 'Mangá Mania', 'Manga Mania Livraria e Editora LTDA');

INSERT INTO Empresa (cnpj, nome_comercial, nome_juridico)
VALUES ('55666777000145', 'EnergyUp', 'EnergyUp Bebidas do Brasil LTDA');


-- 6. PRODUTO
-- preco >= 0 e estoque_inicial >= 0

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (1, 'Action Figure Colecionavel', 'Colecionavel', 189.90, 150);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (2, 'Controle Pro Wireless', 'Eletronico', 349.90, 60);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (3, 'Combo Lamen + Refrigerante', 'Alimento', 35.00, 500);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (4, 'Manga Volume Unico', 'Livro', 42.50, 300);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (5, 'Energetico Lata 473ml', 'Bebida', 12.00, 800);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (6, 'Camiseta Estampada', 'Vestuario', 79.90, 200);

INSERT INTO Produto (cod_produto, nome, tipo, preco, estoque_inicial)
VALUES (7, 'Mousepad Gamer', 'Acessorio', 59.90, 120);


-- 7. ESTANDE
-- Estande alugado por uma empresa, em uma area, durante uma edicao
-- Restricao: aluguel_fim >= aluguel_inicio (periodos dentro das datas da edicao)

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (1, 10, 5, 1, 2026, '11222333000181', DATE '2026-11-14', DATE '2026-11-16');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (2, 10, 5, 1, 2026, '22333444000172', DATE '2026-11-14', DATE '2026-11-16');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (3, 10, 4, 1, 2026, '33444555000163', DATE '2026-11-14', DATE '2026-11-16');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (4, 10, 3, 1, 2026, '44555666000154', DATE '2026-11-14', DATE '2026-11-15');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (5, 10, 4, 1, 2026, '55666777000145', DATE '2026-11-15', DATE '2026-11-16');

INSERT INTO Estande (cod_estande, cod_local, cod_area, cod_evento, ano, cnpj_empresa, aluguel_inicio, aluguel_fim)
VALUES (6, 10, 5, 1, 2025, '11222333000181', DATE '2025-11-15', DATE '2025-11-17');


-- 8. DISPONIBILIZA
-- Produtos vendidos por uma empresa em um estande (a empresa deve ser a mesma que alugou o estande)

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


-- 9. PATROCINA
-- Restricao: cota_investimento > 0

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