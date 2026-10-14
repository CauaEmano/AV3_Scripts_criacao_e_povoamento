-- =====================================================================
-- 13_consultas_filtros_agregacao.sql
-- Checklist SQL: 6 (SELECT-FROM-WHERE), 7 (BETWEEN), 8 (IN), 9 (LIKE),
-- 10 (IS NULL / IS NOT NULL), 12 (MAX), 13 (MIN), 14 (AVG), 15 (COUNT),
-- 21 (ORDER BY), 22 (GROUP BY) e 23 (HAVING)
-- =====================================================================

-- ---------------------------------------------------------------------
-- Q1: Quais cupons foram usados mais de uma vez e quanto cada um
-- arrecadou? Mostra uso, media, maior e menor valor pago por cupom.
-- Usa: COUNT, AVG, MAX, MIN, IS NOT NULL, GROUP BY, HAVING, ORDER BY
-- ---------------------------------------------------------------------
SELECT 
    cod_cupom,
    COUNT(cod_ingresso) AS total_usos_cupom,
    AVG(valor_pago) AS media_valor_arrecadado,
    MAX(valor_pago) AS maior_valor_pago,
    MIN(valor_pago) AS menor_valor_pago
FROM 
    CompraIngresso
WHERE 
    cod_cupom IS NOT NULL
GROUP BY 
    cod_cupom
HAVING 
    COUNT(cod_ingresso) > 1
ORDER BY 
    total_usos_cupom DESC;

-- ---------------------------------------------------------------------
-- Q2: Torneios agendados ou cancelados em 2026 que tenham descricao.
-- Usa: SELECT-FROM-WHERE, IN, BETWEEN, LIKE, IS NOT NULL
-- ---------------------------------------------------------------------
SELECT 
    cod_atv,
    nome,
    status,
    data_hora_inicio
FROM 
    Atividade
WHERE 
    status IN ('AGENDADA', 'CANCELADA') 
    AND data_hora_inicio BETWEEN TIMESTAMP '2026-01-01 00:00:00' AND TIMESTAMP '2026-12-31 23:59:59'
    AND nome LIKE '%Torneio%' 
    AND descricao IS NOT NULL;
