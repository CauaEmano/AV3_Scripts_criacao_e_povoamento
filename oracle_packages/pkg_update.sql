CREATE OR REPLACE PACKAGE pkg_funcionario AS
    PROCEDURE consultar_funcionario(
        p_cpf IN Funcionario.cpf_funcionario%TYPE

    );

    PROCEDURE alterar_salario(
        p_cpf IN Funcionario.cpf_funcionario%TYPE,
        p_novo_salario IN Funcionario.salario%TYPE
    );

    PROCEDURE alterar_supervisor(
        p_cpf IN Funcionario.cpf_funcionario%TYPE,
        p_novo_supervisor IN Funcionario.cpf_funcionario%TYPE
    );

END pkg_funcionario;
/

CREATE OR REPLACE PACKAGE BODY pkg_funcionario AS
    PROCEDURE consultar_funcionario(
        p_cpf IN Funcionario.cpf_funcionario%TYPE
    )
    IS
        v_nome Pessoa.primeiro_nome%TYPE;
        v_sobrenome Pessoa.sobrenome%TYPE;
        v_cargo Funcionario.cargo%TYPE;
        v_salario Funcionario.salario%TYPE;
    
    BEGIN
        SELECT  p.primeiro_nome,
                p.sobrenome,
                f.cargo,
                f.salario
        
        INTO v_nome,
             v_sobrenome,
             v_cargo,
             v_salario
        
        FROM Pessoa p
        JOIN Funcionario f
          ON f.cpf_funcionario = p.cpf
        WHERE f.cpf_funcionario = p_cpf;

        DBMS_OUTPUT.PUT_LINE('Nome: ' ||
            v_nome || ' ' || v_sobrenome);
        DBMS_OUTPUT.PUT_LINE('Cargo: ' || v_cargo);
        DBMS_OUTPUT.PUT_LINE('Salario: ' || v_salario);
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE(
                'Funcionario nao encontrado.'
            );
    
    END consultar_funcionario;

    PROCEDURE alterar_salario(
        p_cpf IN Funcionario.cpf_funcionario%TYPE,
        p_novo_salario IN Funcionario.salario%TYPE
    )
    IS
    BEGIN
        IF p_novo_salario <= 0 THEN
            RAISE_APPLICATION_ERROR(
                -20001,
                'O salario deve ser maior do que zero.'
            );
        END IF;

        UPDATE Funcionario
        SET salario = p_novo_salario
        WHERE cpf_funcionario = p_cpf;

        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE(
                'Funcionario nao encontrado.'
            );
        ELSE
            DBMS_OUTPUT.PUT_LINE(
                'Salario atualizado com sucesso.'
            );
        END IF;
    END alterar_salario;

    PROCEDURE alterar_supervisor(
        p_cpf IN Funcionario.cpf_funcionario%TYPE,
        p_novo_supervisor IN Funcionario.cpf_supervisor%TYPE
    )

    IS
    BEGIN
        IF p_cpf = p_novo_supervisor THEN
            RAISE_APPLICATION_ERROR(
                -20002,
                'Um funcionario nao pode supervisionar a si mesmo.'
            );
        END IF;

        UPDATE Funcionario
        SET cpf_supervisor = p_novo_supervisor
        WHERE cpf_funcionario = p_cpf;

        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE(
                'Funcionario nao encontrado.'
            );
        ELSE
            DBMS_OUTPUT.PUT_LINE(
                'Supervisor atualizado com sucesso.'
            );

        END IF;
    END alterar_supervisor;

END pkg_funcionario;
/