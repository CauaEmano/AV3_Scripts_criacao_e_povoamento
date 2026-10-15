-- 0) Limpeza (permite reexecutar do zero)
@scripts_apoio/99_drop_all.sql

-- 1) Criacao: sequences, tabelas e chaves estrangeiras
@scripts_criacao/01_create_sequences.sql
@scripts_criacao/02_create_fundacao_e_rh.sql
@scripts_criacao/03_create_evento_e_comercial.sql
@scripts_criacao/04_create_financeiro_e_atividades.sql
@scripts_criacao/05_add_fks.sql

-- 2) Povoamento
-- EVITA QUE STRINGS COM "&" SEJAM VISTAS COMO VARIAVEIS DE SUBSTITUICAO
SET DEFINE OFF;
@scripts_povoamento/06_insert_evento_locais.sql
@scripts_povoamento/07_insert_pessoas_rh.sql
@scripts_povoamento/08_insert_comercial.sql
@scripts_povoamento/09_insert_ingressos.sql
@scripts_povoamento/10_insert_atividades.sql
-- REATIVA AS VARIAVEIS DE SUBSTITUICAO
SET DEFINE ON;
@scripts_apoio/11_consultas_validacao.sql

-- 3) AV4 - SQL: ALTER/INDEX, consultas, DML e permissoes
@scripts_consulta/12_ddl_alter_index.sql
@scripts_consulta/13_consultas_filtros_agregacao.sql
@scripts_consulta/14_joins_subconsultas_view.sql
@scripts_consulta/15_dml_update_delete.sql
@scripts_consulta/16_permissoes_grant_revoke.sql

-- 4) AV4 - PL/SQL: funcoes, pacotes, procedures e triggers (nesta ordem)
@oracle_functions/17_functions.sql
@oracle_procedures/18_procedures.sql
@oracle_packages/19_pkg_register.sql
@oracle_packages/20_pkg_funcionario.sql
@oracle_triggers/21_trigger_atividade_timestamp_overlap.sql
@oracle_triggers/22_trigger_compra_ingresso.sql
@oracle_triggers/23_trigger_auditoria_cupom.sql

-- 5) Demonstracao do PL/SQL
@24_demo_plsql.sql
