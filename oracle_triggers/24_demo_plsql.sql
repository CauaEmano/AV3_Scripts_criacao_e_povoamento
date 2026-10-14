SET SERVEROUTPUT ON;

-- ---------------------------------------------------------------------
-- 1) Relatorio de receita por edicao (cursor explicito + funcao)
-- ---------------------------------------------------------------------
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- RECEITA POR EDICAO ---');
    prc_relatorio_receita;
END;
/

-- ---------------------------------------------------------------------
-- 2) Torneios por edicao (FOR IN LOOP + CASE WHEN na funcao de vagas)
-- ---------------------------------------------------------------------
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- TORNEIOS: RECIFE ANIME E GAMES FESTIVAL 2026 ---');
    prc_relatorio_torneios(1, 2026);
    DBMS_OUTPUT.PUT_LINE('--- TORNEIOS: FESTIVAL DE QUADRINHOS 2026 ---');
    prc_relatorio_torneios(2, 2026);
    DBMS_OUTPUT.PUT_LINE('--- TORNEIOS: EDICAO SEM TORNEIO ---');
    prc_relatorio_torneios(9, 2026);
END;
/

-- ---------------------------------------------------------------------
-- 3) Bloco anonimo com RECORD e colecao (TABLE OF ... INDEX BY)
--    Le os produtos mais caros para uma colecao e percorre com WHILE.
-- ---------------------------------------------------------------------
DECLARE
    TYPE t_produto IS RECORD (
        nome  Produto.nome%TYPE,
        tipo  Produto.tipo%TYPE,
        preco Produto.preco%TYPE
    );
    TYPE t_lista_produtos IS TABLE OF t_produto INDEX BY PLS_INTEGER;

    v_produtos t_lista_produtos;
    v_i        PLS_INTEGER;
    v_soma     NUMBER := 0;
BEGIN
    SELECT nome, tipo, preco
    BULK COLLECT INTO v_produtos
    FROM Produto
    WHERE preco >= 50
    ORDER BY preco DESC;

    DBMS_OUTPUT.PUT_LINE('--- PRODUTOS COM PRECO >= 50 (' || v_produtos.COUNT || ') ---');

    v_i := v_produtos.FIRST;
    WHILE v_i IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE(
            RPAD(v_produtos(v_i).nome, 30) || RPAD(v_produtos(v_i).tipo, 15) ||
            'R$ ' || TO_CHAR(v_produtos(v_i).preco, 'FM999990.00')
        );
        v_soma := v_soma + v_produtos(v_i).preco;
        v_i := v_produtos.NEXT(v_i);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Soma: R$ ' || TO_CHAR(v_soma, 'FM999990.00'));
END;
/

-- ---------------------------------------------------------------------
-- 4) prc_aplicar_cupom: parametro IN OUT e erros tratados com EXCEPTION WHEN
-- ---------------------------------------------------------------------
DECLARE
    v_valor NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- CUPONS ---');

    v_valor := 200;
    prc_aplicar_cupom('VIP25', DATE '2026-10-08', v_valor);
    DBMS_OUTPUT.PUT_LINE('VIP25 sobre 200.00 -> ' || TO_CHAR(v_valor, 'FM999990.00'));

    v_valor := 200;
    BEGIN
        prc_aplicar_cupom('GIBI10', DATE '2026-10-08', v_valor);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Cupom vencido: ' || SQLERRM);
    END;

    BEGIN
        prc_aplicar_cupom('NAOEXISTE', DATE '2026-10-08', v_valor);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Cupom inexistente: ' || SQLERRM);
    END;
END;
/

-- ---------------------------------------------------------------------
-- 5) prc_realizar_checkin: parametro OUT, IF/ELSIF e UPDATE.
--    O ingresso usado volta ao estado original no fim do bloco.
-- ---------------------------------------------------------------------
DECLARE
    v_ingresso  Ingresso.codigo%TYPE;
    v_resultado VARCHAR2(30);
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- CHECK-IN ---');

    -- ingresso da edicao 2026 do evento 1 (14 a 16/11/2026)
    SELECT MIN(codigo) INTO v_ingresso
    FROM Ingresso
    WHERE cod_evento = 1 AND ano = 2026;

    prc_realizar_checkin(v_ingresso, DATE '2026-10-08', v_resultado);
    DBMS_OUTPUT.PUT_LINE('Antes do evento     : ' || v_resultado);

    prc_realizar_checkin(v_ingresso, DATE '2026-11-14', v_resultado);
    DBMS_OUTPUT.PUT_LINE('No primeiro dia     : ' || v_resultado);

    prc_realizar_checkin(v_ingresso, DATE '2026-11-15', v_resultado);
    DBMS_OUTPUT.PUT_LINE('Segunda tentativa   : ' || v_resultado);

    -- desfaz o check-in de teste
    UPDATE Ingresso SET status_check_in = 'NAO_REALIZADO' WHERE codigo = v_ingresso;

    prc_realizar_checkin(v_ingresso, DATE '2026-12-01', v_resultado);
    DBMS_OUTPUT.PUT_LINE('Depois do evento    : ' || v_resultado);

    prc_realizar_checkin(999999, DATE '2026-11-14', v_resultado);
    DBMS_OUTPUT.PUT_LINE('Ingresso inexistente: ' || v_resultado);
END;
/

-- ---------------------------------------------------------------------
-- 6) Pacotes pkg_register e pkg_funcionario (cadastro de uma pessoa de teste)
-- ---------------------------------------------------------------------
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- PACOTES ---');

    pkg_register.register_pessoa('99999999901', 'Teste', 'Demonstracao', DATE '2000-05-05');
    pkg_register.register_pessoa('99999999901', 'Teste', 'Demonstracao', DATE '2000-05-05'); -- CPF repetido
    pkg_register.register_telefone_pessoa('99999999901', '81999990000');
    pkg_register.register_funcionario('99999999901', 'Atendente Comercial', 'Tarde', 3000, '22222222222');

    pkg_funcionario.consultar_funcionario('99999999901');
    pkg_funcionario.alterar_salario('99999999901', 3500);
    pkg_funcionario.alterar_supervisor('99999999901', '11111111111');
    pkg_funcionario.alterar_supervisor('99999999901', '00000000000'); -- supervisor inexistente
    pkg_funcionario.consultar_funcionario('11111111110');             -- funcionario inexistente

    -- limpeza dos dados de teste
    DELETE FROM Funcionario WHERE cpf_funcionario = '99999999901';
    DELETE FROM TelefonePessoa WHERE cpf_pessoa = '99999999901';
    DELETE FROM Pessoa WHERE cpf = '99999999901';
END;
/

-- ---------------------------------------------------------------------
-- 7) Trigger de Atividade: tenta inserir uma atividade no horario do
--    "Painel com Dubladores" (14/11/2026 14:00-15:30, Palco Principal).
-- ---------------------------------------------------------------------
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- TRIGGER DE ATIVIDADE ---');

    BEGIN
        INSERT INTO Atividade (cod_atv, nome, descricao, status, cod_local, cod_area,
                               data_hora_inicio, data_hora_fim, cod_evento, ano)
        VALUES (seq_pk_atividade.NEXTVAL, 'Teste de Conflito', 'Deve ser bloqueada pelo trigger',
                'AGENDADA', 1, 1, TIMESTAMP '2026-11-14 14:30:00', TIMESTAMP '2026-11-14 15:00:00', 1, 2026);

        DBMS_OUTPUT.PUT_LINE('ERRO: o trigger deveria ter bloqueado a insercao');
        DELETE FROM Atividade WHERE nome = 'Teste de Conflito';
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Bloqueado: ' || SQLERRM);
    END;
END;
/

-- ---------------------------------------------------------------------
-- 8) Trigger de CompraIngresso (nivel de linha): cria recibo e ingresso de
--    teste, tenta pagar um valor errado e depois o valor correto.
-- ---------------------------------------------------------------------
DECLARE
    v_recibo  Recibo.codigo%TYPE;
    v_ingresso Ingresso.codigo%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- TRIGGER DE COMPRA ---');

    INSERT INTO Recibo (codigo, data_compra, valor_compra)
    VALUES (seq_pk_recibo.NEXTVAL, DATE '2026-10-08', 120)
    RETURNING codigo INTO v_recibo;

    INSERT INTO Ingresso (codigo, cpf_pessoa, cod_evento, ano, tipo, lote, status_check_in)
    VALUES (seq_pk_ingresso.NEXTVAL, '11122233301', 1, 2026, 'INTEIRA', 1, 'NAO_REALIZADO')
    RETURNING codigo INTO v_ingresso;

    BEGIN
        INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
        VALUES (v_ingresso, '11122233301', v_recibo, 'POPCON10', 50);
        DBMS_OUTPUT.PUT_LINE('ERRO: o trigger deveria ter bloqueado o valor 50');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Valor errado bloqueado: ' || SQLERRM);
    END;

    BEGIN
        INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
        VALUES (v_ingresso, '11122233301', v_recibo, 'GIBI10', 108);
        DBMS_OUTPUT.PUT_LINE('ERRO: o trigger deveria ter bloqueado o cupom vencido');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Cupom vencido bloqueado: ' || SQLERRM);
    END;

    -- 120 com 10% de desconto = 108
    INSERT INTO CompraIngresso (cod_ingresso, cpf_comprador, cod_recibo, cod_cupom, valor_pago)
    VALUES (v_ingresso, '11122233301', v_recibo, 'POPCON10', 108);
    DBMS_OUTPUT.PUT_LINE('Compra correta aceita (valor_pago 108)');

    -- limpeza dos dados de teste
    DELETE FROM CompraIngresso WHERE cod_ingresso = v_ingresso;
    DELETE FROM Ingresso WHERE codigo = v_ingresso;
    DELETE FROM Recibo WHERE codigo = v_recibo;
END;
/

-- ---------------------------------------------------------------------
-- 9) Trigger de comando em Cupom: uma instrucao UPDATE que afeta varias
--    linhas gera UMA unica linha de auditoria.
-- ---------------------------------------------------------------------
INSERT INTO Cupom (codigo, desconto, data_validade) VALUES ('AUDIT10', 10, DATE '2026-12-31');
INSERT INTO Cupom (codigo, desconto, data_validade) VALUES ('AUDIT20', 20, DATE '2026-12-31');
UPDATE Cupom SET desconto = desconto + 5 WHERE codigo IN ('AUDIT10', 'AUDIT20');
DELETE FROM Cupom WHERE codigo IN ('AUDIT10', 'AUDIT20');

-- Esperado: INSERT, INSERT, UPDATE (um unico registro para 2 linhas), DELETE
SELECT cod_auditoria, operacao, usuario, data_hora
FROM AuditoriaCupom
ORDER BY cod_auditoria;

COMMIT;
