-- =====================================================================
-- 15_dml_update_delete.sql
-- Checklist SQL: 3 (INSERT INTO), 4 (UPDATE) e 5 (DELETE)
-- Depende de 12_ddl_alter_index.sql (coluna Pessoa.email).
-- Os INSERTs/DELETEs de teste usam cupons proprios (FLASH30, EXPIRADO10),
-- entao os dados do povoamento nao sao perdidos.
-- =====================================================================

-- ---------------------------------------------------------------------
-- [SQL 3] INSERT INTO - cupons de teste
-- FLASH30: promocao relampago ainda valida. EXPIRADO10: ja vencido e nunca usado.
-- ---------------------------------------------------------------------
INSERT INTO Cupom (codigo, desconto, data_validade) VALUES ('FLASH30', 30, DATE '2026-10-20');
INSERT INTO Cupom (codigo, desconto, data_validade) VALUES ('EXPIRADO10', 10, DATE '2026-01-31');

SELECT codigo, desconto, data_validade FROM Cupom ORDER BY data_validade;

-- ---------------------------------------------------------------------
-- [SQL 4] UPDATE
-- (a) Mudanca simples: a promocao relampago foi ampliada (mais desconto, +15 dias)
-- ---------------------------------------------------------------------
UPDATE Cupom
SET desconto = 35,
    data_validade = data_validade + 15
WHERE codigo = 'FLASH30';

-- (b) Com subconsulta: bonus de 5% para quem trabalhou mais horas do que o
--     previsto na edicao 2026 do evento 1 (Carla, Elisa e Gabriela)
SELECT cpf_funcionario, salario FROM Funcionario
WHERE cpf_funcionario IN (SELECT cpf_funcionario FROM Contrata
                          WHERE cod_evento = 1 AND ano = 2026
                            AND carga_horaria_realizada > carga_horaria_prevista);

UPDATE Funcionario
SET salario = ROUND(salario * 1.05, 2)
WHERE cpf_funcionario IN (
    SELECT cpf_funcionario
    FROM Contrata
    WHERE cod_evento = 1
      AND ano = 2026
      AND carga_horaria_realizada > carga_horaria_prevista
);

SELECT cpf_funcionario, salario FROM Funcionario
WHERE cpf_funcionario IN ('33333333333', '55555555555', '77777777777');

-- (c) Usa a coluna criada no ALTER TABLE: e-mail institucional dos funcionarios
UPDATE Pessoa
SET email = LOWER(primeiro_nome) || '.' || LOWER(sobrenome) || '@culturapop.com.br'
WHERE cpf IN (SELECT cpf_funcionario FROM Funcionario);

SELECT primeiro_nome, sobrenome, email FROM Pessoa WHERE email IS NOT NULL ORDER BY primeiro_nome;

-- ---------------------------------------------------------------------
-- [SQL 5] DELETE
-- (a) Remove um registro especifico (a promocao relampago acabou)
-- ---------------------------------------------------------------------
DELETE FROM Cupom WHERE codigo = 'FLASH30';

-- (b) Com subconsulta: apaga cupons vencidos que nunca foram usados em compra.
--     O IS NOT NULL dentro do NOT IN e necessario: se a subconsulta devolver
--     algum NULL, o NOT IN nao retorna nenhuma linha.
DELETE FROM Cupom
WHERE data_validade < DATE '2026-10-07'
  AND codigo NOT IN (SELECT cod_cupom FROM CompraIngresso WHERE cod_cupom IS NOT NULL);

-- Confirma: so restam os 11 cupons do povoamento
SELECT COUNT(*) AS total_cupons FROM Cupom;

COMMIT;
