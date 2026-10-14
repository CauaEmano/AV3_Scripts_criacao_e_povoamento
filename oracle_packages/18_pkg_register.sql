CREATE OR REPLACE PACKAGE pkg_register AS

	PROCEDURE register_pessoa(
		v_cpf IN Pessoa.cpf%TYPE,
		v_p_nome IN Pessoa.primeiro_nome%TYPE,
		v_s_nome IN Pessoa.sobrenome%TYPE,
		v_d_nasc IN Pessoa.data_nascimento%TYPE
	);

	PROCEDURE register_telefone_pessoa(
		v_cpf_pessoa IN TelefonePessoa.cpf_pessoa%TYPE,
		v_numero IN TelefonePessoa.numero%TYPE
	);

	PROCEDURE register_funcionario(
		v_cpf_funcionario IN Funcionario.cpf_funcionario%TYPE,
		v_cargo IN Funcionario.cargo%TYPE,
		v_turno IN Funcionario.turno%TYPE,
		v_salario IN Funcionario.salario%TYPE,
		v_cpf_supervisor IN Funcionario.cpf_supervisor%TYPE DEFAULT NULL
	);

	PROCEDURE register_empresa(
		v_cnpj IN Empresa.cnpj%TYPE,
		v_nome_c IN Empresa.nome_comercial%TYPE,
		v_nome_j IN Empresa.nome_juridico%TYPE
	);
	
END pkg_register;
/

CREATE OR REPLACE PACKAGE BODY pkg_register AS

	PROCEDURE register_pessoa(
		v_cpf IN Pessoa.cpf%TYPE,
		v_p_nome IN Pessoa.primeiro_nome%TYPE,
		v_s_nome IN Pessoa.sobrenome%TYPE,
		v_d_nasc IN Pessoa.data_nascimento%TYPE
	)

	IS
		rec_pessoa Pessoa%ROWTYPE;

	BEGIN

		rec_pessoa.cpf := v_cpf;
		rec_pessoa.primeiro_nome := v_p_nome;
		rec_pessoa.sobrenome := v_s_nome;
		rec_pessoa.data_nascimento := v_d_nasc;

		INSERT INTO Pessoa VALUES rec_pessoa;

	EXCEPTION

		WHEN DUP_VAL_ON_INDEX THEN
			DBMS_OUTPUT.PUT_LINE('ERRO AO REGISTRAR ' || v_cpf || ' - ESSE CPF JÁ FOI REGISTRADO');

		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('OCORREU UM ERRO INESPERADO...');
			RAISE;

	END register_pessoa;

	PROCEDURE register_telefone_pessoa(
		v_cpf_pessoa IN TelefonePessoa.cpf_pessoa%TYPE,
		v_numero IN TelefonePessoa.numero%TYPE
	)

	IS
		rec_telefone_pessoa TelefonePessoa%ROWTYPE;

	BEGIN

		rec_telefone_pessoa.cpf_pessoa := v_cpf_pessoa;
		rec_telefone_pessoa.numero := v_numero;

		INSERT INTO TelefonePessoa VALUES rec_telefone_pessoa;

	EXCEPTION

		WHEN DUP_VAL_ON_INDEX THEN
			DBMS_OUTPUT.PUT_LINE('ERRO AO REGISTRAR ' || v_numero || ' - ESSE NÚMERO JÁ FOI REGISTRADO EM ' || v_cpf_pessoa);

		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('OCORREU UM ERRO INESPERADO...');
			RAISE;

	END register_telefone_pessoa;

	PROCEDURE register_funcionario(
		v_cpf_funcionario IN Funcionario.cpf_funcionario%TYPE,
		v_cargo IN Funcionario.cargo%TYPE,
		v_turno IN Funcionario.turno%TYPE,
		v_salario IN Funcionario.salario%TYPE,
		v_cpf_supervisor IN Funcionario.cpf_supervisor%TYPE DEFAULT NULL
	)

	IS
		rec_funcionario Funcionario%ROWTYPE;

	BEGIN

		rec_funcionario.cpf_funcionario := v_cpf_funcionario;
		rec_funcionario.cargo := v_cargo;
		rec_funcionario.turno := v_turno;
		rec_funcionario.salario := v_salario;
		rec_funcionario.cpf_supervisor := v_cpf_supervisor;

		INSERT INTO Funcionario VALUES rec_funcionario;

	EXCEPTION

		WHEN DUP_VAL_ON_INDEX THEN
			DBMS_OUTPUT.PUT_LINE('ERRO AO REGISTRAR ' || v_cpf_funcionario || ' - ESSE CPF JÁ FOI REGISTRADO');

		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('OCORREU UM ERRO INESPERADO...');
			RAISE;

	END register_funcionario;

	PROCEDURE register_empresa(
		v_cnpj IN Empresa.cnpj%TYPE,
		v_nome_c IN Empresa.nome_comercial%TYPE,
		v_nome_j IN Empresa.nome_juridico%TYPE
	)

	IS
		rec_empresa Empresa%ROWTYPE;

	BEGIN

		rec_empresa.cnpj := v_cnpj;
		rec_empresa.nome_comercial := v_nome_c;
		rec_empresa.nome_juridico := v_nome_j;

		INSERT INTO Empresa VALUES rec_empresa;

	EXCEPTION

		WHEN DUP_VAL_ON_INDEX THEN
			DBMS_OUTPUT.PUT_LINE('ERRO AO REGISTRAR ' || v_cnpj || ' - ESSE CNPJ JÁ FOI REGISTRADO');

		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('OCORREU UM ERRO INESPERADO...');
			RAISE;

	END register_empresa;
	
END pkg_register;
/