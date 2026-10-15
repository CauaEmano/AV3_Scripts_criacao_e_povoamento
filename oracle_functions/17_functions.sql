-- ---------------------------------------------------------------------
-- fn_timestamp_overlap: compara duas faixas de horário. Retorna TRUE caso
-- exista uma colisão entre os horários e FALSE caso contrário (faixas que
-- apenas se encostam não contam como colisão). Usada pelo trigger de Atividade.
-- ---------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_timestamp_overlap (
    start1 IN Atividade.data_hora_inicio%TYPE,
    end1 IN Atividade.data_hora_fim%TYPE,
    start2 IN Atividade.data_hora_inicio%TYPE,
    end2 IN Atividade.data_hora_fim%TYPE
)
RETURN BOOLEAN
IS BEGIN
    RETURN NOT (start1 >= end2 OR start2 >= end1);
END fn_timestamp_overlap;
/

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
