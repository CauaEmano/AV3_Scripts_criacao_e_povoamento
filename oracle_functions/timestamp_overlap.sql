CREATE OR REPLACE FUNCTION timestamp_overlap (
    start1 IN Atividade.data_hora_inicio%TYPE,
    end1 IN Atividade.data_hora_fim%TYPE,
    start2 IN Atividade.data_hora_inicio%TYPE,
    end2 IN Atividade.data_hora_fim%TYPE
)
RETURN BOOLEAN
IS BEGIN
    RETURN NOT (start1 >= end2 OR start2 >= end1);
END timestamp_overlap;
/
