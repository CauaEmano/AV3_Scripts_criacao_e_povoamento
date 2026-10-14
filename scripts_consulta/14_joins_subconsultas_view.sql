-- =====================================================================
-- 14_joins_subconsultas_view.sql
-- Checklist SQL: 11 (INNER JOIN), 16 (LEFT/RIGHT/FULL OUTER JOIN),
-- 17 (subconsulta com operador relacional), 18 (subconsulta com IN),
-- 19 (ANY), 20 (ALL), 24 (UNION/INTERSECT/MINUS), 25 (CREATE VIEW),
-- alem de 10, 14, 15, 21 e 22 reaproveitados.
-- Depende de 06 a 10 (povoamento).
-- =====================================================================

-- ---------------------------------------------------------------------
-- Q3: Agenda completa: evento, edicao, atividade, area e local.
-- Usa: INNER JOIN (cinco tabelas), ORDER BY
-- ---------------------------------------------------------------------
SELECT
    ev.nome        AS evento,
    atv.ano        AS ano_edicao,
    atv.nome       AS atividade,
    atv.status     AS status_atividade,
    ar.nome        AS area,
    lc.nome        AS local_evento
FROM Atividade atv
INNER JOIN Edicao ed
    ON ed.cod_evento = atv.cod_evento AND ed.ano = atv.ano
INNER JOIN Evento ev
    ON ev.cod_evento = ed.cod_evento
INNER JOIN Area ar
    ON ar.cod_local = atv.cod_local AND ar.cod_area = atv.cod_area
INNER JOIN Local lc
    ON lc.cod_local = ar.cod_local
ORDER BY ev.nome, atv.ano, atv.data_hora_inicio;

-- ---------------------------------------------------------------------
-- Q4: Todas as empresas com seus patrocinios (inclusive as sem patrocinio).
-- Usa: LEFT OUTER JOIN
-- ---------------------------------------------------------------------
SELECT
    emp.nome_comercial,
    pat.cod_evento,
    pat.ano,
    pat.cota_investimento
FROM Empresa emp
LEFT OUTER JOIN Patrocina pat
    ON pat.cnpj_empresa = emp.cnpj
ORDER BY emp.nome_comercial, pat.ano;

-- ---------------------------------------------------------------------
-- Q5: Empresas que nunca patrocinaram nenhuma edicao.
-- Usa: LEFT OUTER JOIN + IS NULL (anti-join)
-- ---------------------------------------------------------------------
SELECT emp.nome_comercial
FROM Empresa emp
LEFT OUTER JOIN Patrocina pat
    ON pat.cnpj_empresa = emp.cnpj
WHERE pat.cnpj_empresa IS NULL;

-- ---------------------------------------------------------------------
-- Q6: Todas as areas com seus estandes (inclusive as sem estande).
-- Usa: RIGHT OUTER JOIN
-- ---------------------------------------------------------------------
SELECT
    ar.cod_local,
    ar.cod_area,
    ar.nome  AS area,
    ar.tipo,
    es.cod_estande,
    es.ano   AS ano_estande
FROM Estande es
RIGHT OUTER JOIN Area ar
    ON ar.cod_local = es.cod_local AND ar.cod_area = es.cod_area
ORDER BY ar.cod_local, ar.cod_area;

-- ---------------------------------------------------------------------
-- Q7: Perfil de quem comprou ingresso e/ou se inscreveu em torneio.
-- Usa: FULL OUTER JOIN + CASE + NVL
-- ---------------------------------------------------------------------
SELECT
    pe.primeiro_nome || ' ' || pe.sobrenome AS pessoa,
    CASE
        WHEN comp.cpf_comprador IS NOT NULL AND insc.cpf IS NOT NULL THEN 'Comprou e competiu'
        WHEN comp.cpf_comprador IS NOT NULL                           THEN 'Só comprou'
        ELSE                                                               'Só competiu'
    END AS perfil
FROM (SELECT DISTINCT cpf_comprador FROM CompraIngresso) comp
FULL OUTER JOIN (SELECT DISTINCT cpf FROM Inscreve) insc
    ON insc.cpf = comp.cpf_comprador
INNER JOIN Pessoa pe
    ON pe.cpf = NVL(comp.cpf_comprador, insc.cpf)
ORDER BY perfil, pessoa;

-- ---------------------------------------------------------------------
-- Q8: CPFs de todos que compraram ingresso OU se inscreveram em torneio.
-- Usa: UNION
-- ---------------------------------------------------------------------
SELECT cpf_comprador AS cpf FROM CompraIngresso
UNION
SELECT cpf FROM Inscreve
ORDER BY cpf;

-- ---------------------------------------------------------------------
-- Q9: CPFs de quem comprou ingresso E se inscreveu em torneio.
-- Usa: INTERSECT
-- ---------------------------------------------------------------------
SELECT cpf_comprador AS cpf FROM CompraIngresso
INTERSECT
SELECT cpf FROM Inscreve
ORDER BY cpf;

-- ---------------------------------------------------------------------
-- Q10: Quem assistiu a atividades mas nunca comprou ingresso (ganhou de outra pessoa).
-- Usa: MINUS
-- ---------------------------------------------------------------------
SELECT cpf FROM Assiste
MINUS
SELECT cpf_comprador FROM CompraIngresso
ORDER BY cpf;

-- ---------------------------------------------------------------------
-- Q11: Compras com valor pago acima da media geral.
-- Usa: Subconsulta com operador relacional (>)
-- ---------------------------------------------------------------------
SELECT
    ci.cod_ingresso,
    pe.primeiro_nome || ' ' || pe.sobrenome AS comprador,
    ci.valor_pago
FROM CompraIngresso ci
INNER JOIN Pessoa pe
    ON pe.cpf = ci.cpf_comprador
WHERE ci.valor_pago > (SELECT AVG(valor_pago) FROM CompraIngresso)
ORDER BY ci.valor_pago DESC;

-- ---------------------------------------------------------------------
-- Q12: Torneio com a maior premiacao.
-- Usa: Subconsulta com operador relacional (=)
-- ---------------------------------------------------------------------
-- Variacao com operador de igualdade (=): torneio com a maior premiacao
SELECT atv.nome, atv.ano, tor.premiacao, tor.plataforma
FROM Torneio tor
INNER JOIN Atividade atv
    ON atv.cod_atv = tor.cod_atv
WHERE tor.premiacao = (SELECT MAX(premiacao) FROM Torneio);

-- ---------------------------------------------------------------------
-- Q13: Pessoas inscritas em torneios de PC do Recife Anime e Games Festival.
-- Usa: Subconsulta com IN (tres niveis)
-- ---------------------------------------------------------------------
SELECT DISTINCT
    pe.primeiro_nome || ' ' || pe.sobrenome AS pessoa
FROM Pessoa pe
WHERE pe.cpf IN (
    SELECT insc.cpf
    FROM Inscreve insc
    WHERE insc.cod_torneio IN (
        SELECT tor.cod_atv
        FROM Torneio tor
        INNER JOIN Atividade atv ON atv.cod_atv = tor.cod_atv
        WHERE tor.plataforma = 'PC'
          AND atv.cod_evento IN (
              SELECT cod_evento FROM Evento
              WHERE nome = 'Recife Anime e Games Festival'
          )
    )
)
ORDER BY pessoa;

-- ---------------------------------------------------------------------
-- Q14: Produtos nao-livros mais caros que ALGUM livro (maior que o livro mais barato).
-- Usa: Subconsulta com ANY
-- ---------------------------------------------------------------------
SELECT cod_produto, nome, tipo, preco
FROM Produto
WHERE preco > ANY (SELECT preco FROM Produto WHERE tipo = 'Livro')
  AND tipo <> 'Livro'
ORDER BY preco;

-- ---------------------------------------------------------------------
-- Q15: Torneios com premiacao maior que TODOS os torneios de Nintendo Switch.
-- Usa: Subconsulta com ALL
-- ---------------------------------------------------------------------
SELECT atv.nome, atv.ano, tor.plataforma, tor.premiacao
FROM Torneio tor
INNER JOIN Atividade atv
    ON atv.cod_atv = tor.cod_atv
WHERE tor.premiacao > ALL (SELECT premiacao FROM Torneio WHERE plataforma = 'Nintendo Switch')
ORDER BY tor.premiacao DESC;

-- ---------------------------------------------------------------------
-- Q16: View com o detalhe de cada ingresso (titular, comprador, recibo, cupom, valores).
-- Usa: CREATE VIEW
-- ---------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_ingressos_detalhados AS
SELECT
    ing.codigo                                   AS cod_ingresso,
    ev.nome                                      AS evento,
    ed.ano                                       AS ano_edicao,
    ii.tipo                                      AS tipo_ingresso,
    ii.lote                                      AS lote,
    ti.primeiro_nome || ' ' || ti.sobrenome      AS titular,
    cp.primeiro_nome || ' ' || cp.sobrenome      AS comprador,
    rec.codigo                                   AS cod_recibo,
    rec.data_compra                              AS data_compra,
    ii.preco                                     AS preco_tabela,
    cu.codigo                                    AS cupom,
    cu.desconto                                  AS desconto_cupom,
    ci.valor_pago                                AS valor_pago,
    ing.status_check_in                          AS status_check_in
FROM Ingresso ing
INNER JOIN Pessoa ti
    ON ti.cpf = ing.cpf_pessoa
INNER JOIN CompraIngresso ci
    ON ci.cod_ingresso = ing.codigo
INNER JOIN Pessoa cp
    ON cp.cpf = ci.cpf_comprador
INNER JOIN Recibo rec
    ON rec.codigo = ci.cod_recibo
LEFT OUTER JOIN Cupom cu
    ON cu.codigo = ci.cod_cupom
INNER JOIN InstanciaIngresso ii
    ON ii.cod_evento = ing.cod_evento AND ii.ano = ing.ano
   AND ii.tipo = ing.tipo AND ii.lote = ing.lote
INNER JOIN Edicao ed
    ON ed.cod_evento = ii.cod_evento AND ed.ano = ii.ano
INNER JOIN Evento ev
    ON ev.cod_evento = ed.cod_evento;

-- ---------------------------------------------------------------------
-- Q17: Consulta da view.
-- Usa: SELECT sobre VIEW
-- ---------------------------------------------------------------------
SELECT * FROM vw_ingressos_detalhados ORDER BY evento, ano_edicao, cod_ingresso;

-- ---------------------------------------------------------------------
-- Q18: Receita bruta x liquida por evento, edicao e tipo de ingresso, a partir da view.
-- Usa: GROUP BY, COUNT, SUM, ORDER BY sobre VIEW
-- ---------------------------------------------------------------------
SELECT
    evento,
    ano_edicao,
    tipo_ingresso,
    COUNT(*)           AS qtd_ingressos,
    SUM(preco_tabela)  AS receita_bruta,
    SUM(valor_pago)    AS receita_liquida
FROM vw_ingressos_detalhados
GROUP BY evento, ano_edicao, tipo_ingresso
ORDER BY evento, ano_edicao, tipo_ingresso;
