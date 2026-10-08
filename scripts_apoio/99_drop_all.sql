BEGIN
    FOR t IN (SELECT table_name FROM user_tables
              WHERE table_name IN ('PESSOA','TELEFONEPESSOA','CARGOFUNCIONARIO','FUNCIONARIO','EVENTO','EDICAO',
                                   'CONTRATA','CEP','LOCAL','AREA','EDICAOLOCAL','EMPRESA','PRODUTO','ESTANDE',
                                   'DISPONIBILIZA','PATROCINA','CUPOM','RECIBO','INSTANCIAINGRESSO','INGRESSO',
                                   'COMPRAINGRESSO','ATIVIDADE','ATRACAO','TORNEIO','ASSISTE','INSCREVE')) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS PURGE';
    END LOOP;
    FOR s IN (SELECT sequence_name FROM user_sequences WHERE sequence_name LIKE 'SEQ_PK_%') LOOP
        EXECUTE IMMEDIATE 'DROP SEQUENCE ' || s.sequence_name;
    END LOOP;
END;
/