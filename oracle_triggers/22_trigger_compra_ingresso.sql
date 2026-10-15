CREATE OR REPLACE TRIGGER trg_compra_ingresso_valida
BEFORE INSERT OR UPDATE ON CompraIngresso
FOR EACH ROW
DECLARE
    v_preco       InstanciaIngresso.preco%TYPE;
    v_desconto    Cupom.desconto%TYPE;
    v_validade    Cupom.data_validade%TYPE;
    v_data_compra Recibo.data_compra%TYPE;
    v_esperado    NUMBER(10, 2);
BEGIN
    SELECT ii.preco
    INTO v_preco
    FROM Ingresso ing
    INNER JOIN InstanciaIngresso ii
        ON ii.cod_evento = ing.cod_evento
       AND ii.ano = ing.ano
       AND ii.tipo = ing.tipo
       AND ii.lote = ing.lote
    WHERE ing.codigo = :NEW.cod_ingresso;

    IF :NEW.cod_cupom IS NULL THEN
        v_esperado := v_preco;
    ELSE
        SELECT desconto, data_validade
        INTO v_desconto, v_validade
        FROM Cupom
        WHERE codigo = :NEW.cod_cupom;

        SELECT data_compra
        INTO v_data_compra
        FROM Recibo
        WHERE codigo = :NEW.cod_recibo;

        IF v_data_compra > v_validade THEN
            RAISE_APPLICATION_ERROR(
                -20020,
                'Cupom ' || :NEW.cod_cupom || ' vencido em ' || TO_CHAR(v_validade, 'DD/MM/YYYY')
            );
        END IF;

        v_esperado := ROUND(v_preco * (1 - v_desconto / 100), 2);
    END IF;

    IF ABS(:NEW.valor_pago - v_esperado) > 0.01 THEN
        RAISE_APPLICATION_ERROR(
            -20021,
            'valor_pago ' || :NEW.valor_pago || ' diferente do esperado ' || v_esperado
        );
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20022, 'Ingresso, cupom ou recibo inexistente para esta compra');
END trg_compra_ingresso_valida;
/
