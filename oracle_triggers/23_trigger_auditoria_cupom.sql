CREATE TABLE AuditoriaCupom(
    cod_auditoria NUMBER,
    operacao VARCHAR2(10) CONSTRAINT nn_operacao_auditoria_cupom NOT NULL,
    usuario VARCHAR2(128) CONSTRAINT nn_usuario_auditoria_cupom NOT NULL,
    data_hora TIMESTAMP CONSTRAINT nn_data_hora_auditoria_cupom NOT NULL,
    CONSTRAINT pk_auditoria_cupom PRIMARY KEY(cod_auditoria),
    CONSTRAINT chk_operacao_auditoria_cupom_valores CHECK(operacao IN ('INSERT', 'UPDATE', 'DELETE'))
);

CREATE SEQUENCE seq_pk_auditoria_cupom START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER trg_cupom_auditoria_cmd
AFTER INSERT OR UPDATE OR DELETE ON Cupom
DECLARE
    v_operacao AuditoriaCupom.operacao%TYPE;
BEGIN
    IF INSERTING THEN
        v_operacao := 'INSERT';
    ELSIF UPDATING THEN
        v_operacao := 'UPDATE';
    ELSE
        v_operacao := 'DELETE';
    END IF;

    INSERT INTO AuditoriaCupom (cod_auditoria, operacao, usuario, data_hora)
    VALUES (seq_pk_auditoria_cupom.NEXTVAL, v_operacao, USER, SYSTIMESTAMP);
END trg_cupom_auditoria_cmd;
/
