-- ---------------------------------------------------------------------
-- fn_receita_edicao: soma o que foi efetivamente pago (ja com desconto de
-- cupom) pelos ingressos de uma edicao. Retorna 0 se nao houve vendas.
-- ---------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_receita_edicao(
    p_cod_evento IN Edicao.cod_evento%TYPE,
    p_ano        IN Edicao.ano%TYPE
)
RETURN NUMBER
IS
    v_receita NUMBER(12, 2);
BEGIN
    SELECT NVL(SUM(ci.valor_pago), 0)
    INTO v_receita
    FROM CompraIngresso ci
    INNER JOIN Ingresso ing
        ON ing.codigo = ci.cod_ingresso
    WHERE ing.cod_evento = p_cod_evento
      AND ing.ano = p_ano;

    RETURN v_receita;
END fn_receita_edicao;
/

-- ---------------------------------------------------------------------
-- fn_status_vagas: classifica a ocupacao de um torneio (CASE WHEN).
-- Retorna, por exemplo, 'EM ALTA (6/16)'.
-- ---------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_status_vagas(
    p_cod_torneio IN Torneio.cod_atv%TYPE
)
RETURN VARCHAR2
IS
    v_vagas     Torneio.vagas%TYPE;
    v_inscritos NUMBER;
    v_ocupacao  NUMBER;
    v_status    VARCHAR2(30);
BEGIN
    SELECT vagas
    INTO v_vagas
    FROM Torneio
    WHERE cod_atv = p_cod_torneio;

    SELECT COUNT(*)
    INTO v_inscritos
    FROM Inscreve
    WHERE cod_torneio = p_cod_torneio;

    -- vagas > 0 (CHECK da tabela), entao nao ha divisao por zero
    v_ocupacao := ROUND(v_inscritos / v_vagas * 100, 1);

    CASE
        WHEN v_ocupacao >= 100 THEN v_status := 'LOTADO';
        WHEN v_ocupacao >= 35  THEN v_status := 'EM ALTA';
        WHEN v_ocupacao >= 20  THEN v_status := 'VAGAS DISPONIVEIS';
        ELSE v_status := 'INSCRICOES ABERTAS';
    END CASE;

    RETURN v_status || ' (' || v_inscritos || '/' || v_vagas || ')';

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'TORNEIO INEXISTENTE';
END fn_status_vagas;
/

-- ---------------------------------------------------------------------
-- prc_aplicar_cupom: aplica o desconto de um cupom sobre um valor.
-- p_valor e IN OUT: entra com o valor bruto e sai com o valor final.
-- Erros: -20010 cupom vencido na data da compra; -20011 cupom inexistente.
-- ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE prc_aplicar_cupom(
    p_cod_cupom   IN     Cupom.codigo%TYPE,
    p_data_compra IN     DATE,
    p_valor       IN OUT NUMBER
)
IS
    v_desconto Cupom.desconto%TYPE;
    v_validade Cupom.data_validade%TYPE;
BEGIN
    SELECT desconto, data_validade
    INTO v_desconto, v_validade
    FROM Cupom
    WHERE codigo = p_cod_cupom;

    IF p_data_compra > v_validade THEN
        RAISE_APPLICATION_ERROR(
            -20010,
            'Cupom ' || p_cod_cupom || ' vencido em ' || TO_CHAR(v_validade, 'DD/MM/YYYY')
        );
    END IF;

    p_valor := ROUND(p_valor * (1 - v_desconto / 100), 2);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20011, 'Cupom ' || p_cod_cupom || ' inexistente');
END prc_aplicar_cupom;
/

-- ---------------------------------------------------------------------
-- prc_realizar_checkin: registra o check-in de um ingresso.
-- p_resultado e OUT e informa o que aconteceu. p_data_ref e a data em que
-- o check-in esta sendo feito (permite testar sem depender do dia atual).
-- ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE prc_realizar_checkin(
    p_cod_ingresso IN  Ingresso.codigo%TYPE,
    p_data_ref     IN  DATE,
    p_resultado    OUT VARCHAR2
)
IS
    v_status Ingresso.status_check_in%TYPE;
    v_inicio Edicao.data_inicio%TYPE;
    v_fim    Edicao.data_fim%TYPE;
BEGIN
    SELECT ing.status_check_in, ed.data_inicio, ed.data_fim
    INTO v_status, v_inicio, v_fim
    FROM Ingresso ing
    INNER JOIN Edicao ed
        ON ed.cod_evento = ing.cod_evento
       AND ed.ano = ing.ano
    WHERE ing.codigo = p_cod_ingresso;

    IF v_status = 'REALIZADO' THEN
        p_resultado := 'JA_REALIZADO';
    ELSIF p_data_ref < v_inicio THEN
        p_resultado := 'EVENTO_NAO_INICIADO';
    ELSIF p_data_ref > v_fim THEN
        p_resultado := 'EVENTO_ENCERRADO';
    ELSE
        UPDATE Ingresso
        SET status_check_in = 'REALIZADO'
        WHERE codigo = p_cod_ingresso;

        p_resultado := 'CHECK_IN_REALIZADO';
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_resultado := 'INGRESSO_INEXISTENTE';
END prc_realizar_checkin;
/

-- ---------------------------------------------------------------------
-- prc_relatorio_receita: relatorio de receita por edicao e total geral.
-- Usa cursor explicito: OPEN, FETCH em LOOP com EXIT WHEN, CLOSE.
-- ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE prc_relatorio_receita
IS
    CURSOR c_edicoes IS
        SELECT ed.cod_evento, ed.ano, ev.nome
        FROM Edicao ed
        INNER JOIN Evento ev
            ON ev.cod_evento = ed.cod_evento
        ORDER BY ed.cod_evento, ed.ano;

    v_edicao  c_edicoes%ROWTYPE;
    v_receita NUMBER(12, 2);
    v_total   NUMBER(12, 2) := 0;
BEGIN
    OPEN c_edicoes;

    LOOP
        FETCH c_edicoes INTO v_edicao;
        EXIT WHEN c_edicoes%NOTFOUND;

        v_receita := fn_receita_edicao(v_edicao.cod_evento, v_edicao.ano);
        v_total := v_total + v_receita;

        DBMS_OUTPUT.PUT_LINE(
            RPAD(v_edicao.nome || ' ' || v_edicao.ano, 50) ||
            ' R$ ' || TO_CHAR(v_receita, 'FM999990.00')
        );
    END LOOP;

    CLOSE c_edicoes;

    DBMS_OUTPUT.PUT_LINE(RPAD('TOTAL GERAL', 50) || ' R$ ' || TO_CHAR(v_total, 'FM999990.00'));
END prc_relatorio_receita;
/

-- ---------------------------------------------------------------------
-- prc_relatorio_torneios: lista os torneios de uma edicao, do maior para o
-- menor premio, com a situacao das vagas. Usa FOR ... IN ... LOOP, que abre,
-- percorre e fecha o cursor sozinho.
-- ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE prc_relatorio_torneios(
    p_cod_evento IN Edicao.cod_evento%TYPE,
    p_ano        IN Edicao.ano%TYPE
)
IS
    v_contador NUMBER := 0;
BEGIN
    FOR r IN (
        SELECT tor.cod_atv, atv.nome, tor.premiacao
        FROM Torneio tor
        INNER JOIN Atividade atv
            ON atv.cod_atv = tor.cod_atv
        WHERE atv.cod_evento = p_cod_evento
          AND atv.ano = p_ano
        ORDER BY tor.premiacao DESC
    ) LOOP
        v_contador := v_contador + 1;

        DBMS_OUTPUT.PUT_LINE(
            v_contador || '. ' || RPAD(r.nome, 36) ||
            ' R$ ' || LPAD(TO_CHAR(r.premiacao, 'FM999990.00'), 8) ||
            ' | ' || fn_status_vagas(r.cod_atv)
        );
    END LOOP;

    IF v_contador = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum torneio encontrado para esta edicao.');
    END IF;
END prc_relatorio_torneios;
/
