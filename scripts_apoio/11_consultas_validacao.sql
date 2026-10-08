SELECT 'Evento' AS tabela, COUNT(*) AS linhas FROM Evento UNION ALL
SELECT 'Edicao', COUNT(*) FROM Edicao UNION ALL
SELECT 'Local', COUNT(*) FROM Local UNION ALL
SELECT 'Area', COUNT(*) FROM Area UNION ALL
SELECT 'Pessoa', COUNT(*) FROM Pessoa UNION ALL
SELECT 'Funcionario', COUNT(*) FROM Funcionario UNION ALL
SELECT 'Contrata', COUNT(*) FROM Contrata UNION ALL
SELECT 'Empresa', COUNT(*) FROM Empresa UNION ALL
SELECT 'Produto', COUNT(*) FROM Produto UNION ALL
SELECT 'Estande', COUNT(*) FROM Estande UNION ALL
SELECT 'Disponibiliza', COUNT(*) FROM Disponibiliza UNION ALL
SELECT 'Patrocina', COUNT(*) FROM Patrocina UNION ALL
SELECT 'Cupom', COUNT(*) FROM Cupom UNION ALL
SELECT 'Recibo', COUNT(*) FROM Recibo UNION ALL
SELECT 'InstanciaIngresso', COUNT(*) FROM InstanciaIngresso UNION ALL
SELECT 'Ingresso', COUNT(*) FROM Ingresso UNION ALL
SELECT 'CompraIngresso', COUNT(*) FROM CompraIngresso UNION ALL
SELECT 'Atividade', COUNT(*) FROM Atividade UNION ALL
SELECT 'Atracao', COUNT(*) FROM Atracao UNION ALL
SELECT 'Torneio', COUNT(*) FROM Torneio UNION ALL
SELECT 'Assiste', COUNT(*) FROM Assiste UNION ALL
SELECT 'Inscreve', COUNT(*) FROM Inscreve;

-- 2) Especializacao disjunta e total: deve retornar 0 linhas
SELECT a.cod_atv
FROM Atividade a
LEFT JOIN Atracao t1 ON t1.cod_atv = a.cod_atv
LEFT JOIN Torneio t2 ON t2.cod_atv = a.cod_atv
WHERE (t1.cod_atv IS NULL AND t2.cod_atv IS NULL)
   OR (t1.cod_atv IS NOT NULL AND t2.cod_atv IS NOT NULL);

-- 3) Recibo.valor_compra = soma dos precos brutos dos ingressos: deve retornar 0 linhas
SELECT r.codigo
FROM Recibo r
JOIN CompraIngresso c ON c.cod_recibo = r.codigo
JOIN Ingresso i ON i.codigo = c.cod_ingresso
JOIN InstanciaIngresso ii ON ii.cod_evento = i.cod_evento AND ii.ano = i.ano
                         AND ii.tipo = i.tipo AND ii.lote = i.lote
GROUP BY r.codigo, r.valor_compra
HAVING SUM(ii.preco) <> r.valor_compra;

-- 4) Receita bruta e liquida de ingressos por edicao
SELECT i.cod_evento, i.ano, COUNT(*) AS ingressos, SUM(c.valor_pago) AS receita_liquida
FROM Ingresso i JOIN CompraIngresso c ON c.cod_ingresso = i.codigo
GROUP BY i.cod_evento, i.ano
ORDER BY i.cod_evento, i.ano;