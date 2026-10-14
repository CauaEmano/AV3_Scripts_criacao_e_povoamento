SELECT 
    cod_cupom,
    COUNT(cod_ingresso) AS total_usos_cupao,
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
    total_usos_cupao DESC;


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