CREATE OR REPLACE TRIGGER trg_atividade_timestamp_overlap
FOR INSERT OR UPDATE ON Atividade
COMPOUND TRIGGER

    TYPE rec_atividade IS RECORD(
        cod_atv Atividade.cod_atv%TYPE,
        cod_local Atividade.cod_local%TYPE,
        cod_area Atividade.cod_area%TYPE,
        data_hora_inicio Atividade.data_hora_inicio%TYPE,
        data_hora_fim Atividade.data_hora_fim%TYPE
    );

    TYPE t_atividade IS TABLE OF rec_atividade INDEX BY BINARY_INTEGER;

    v_t_atividade t_atividade;

    BEFORE STATEMENT IS BEGIN
        SELECT cod_atv, cod_local, cod_area, data_hora_inicio, data_hora_fim
        BULK COLLECT
        INTO v_t_atividade
        FROM Atividade;
    END BEFORE STATEMENT;

    BEFORE EACH ROW
    
    IS
        v_rec_atividade rec_atividade;
        i BINARY_INTEGER;

    BEGIN
        
        i := v_t_atividade.FIRST;
        WHILE i IS NOT NULL LOOP

            v_rec_atividade := v_t_atividade(i);

            IF INSERTING OR UPDATING AND :NEW.cod_atv <> v_rec_atividade.cod_atv THEN

                IF (
                    :NEW.cod_local = v_rec_atividade.cod_local AND
                    :NEW.cod_area = v_rec_atividade.cod_area AND
                    timestamp_overlap(
                        :NEW.data_hora_inicio,
                        :NEW.data_hora_fim,
                        v_rec_atividade.data_hora_inicio,
                        v_rec_atividade.data_hora_fim
                    )
                ) THEN
                    RAISE_APPLICATION_ERROR(
                        -20000,
                        'ERRO: HORÁRIO DA ATIVIDADE ' ||
                        :NEW.cod_atv || ' (' ||
                        :NEW.data_hora_inicio || ' - ' ||
                        :NEW.data_hora_fim ||
                        ') ESTÁ SOBREPONDO O HORÁRIO DE OUTRA ATIVIDADE'
                    );
                END IF;

            END IF;

            i := v_t_atividade.NEXT(i);

        END LOOP;

    END BEFORE EACH ROW;

    AFTER EACH ROW
    
    IS
        v_index BINARY_INTEGER;
        i BINARY_INTEGER;

    BEGIN

        IF INSERTING THEN
            v_index := v_t_atividade.COUNT + 1;

        ELSIF UPDATING THEN

            i := v_t_atividade.FIRST;
            WHILE i IS NOT NULL LOOP

                IF v_t_atividade(i).cod_atv = :NEW.cod_atv THEN
                    v_index := i;
                    EXIT;
                END IF;
            
                i := v_t_atividade.NEXT(i);

            END LOOP;

        END IF;

        v_t_atividade(v_index).cod_atv := :NEW.cod_atv;
        v_t_atividade(v_index).cod_local := :NEW.cod_local;
        v_t_atividade(v_index).cod_area := :NEW.cod_area;
        v_t_atividade(v_index).data_hora_inicio := :NEW.data_hora_inicio;
        v_t_atividade(v_index).data_hora_fim := :NEW.data_hora_fim;

    END AFTER EACH ROW;

END trg_atividade_timestamp_overlap;
/
