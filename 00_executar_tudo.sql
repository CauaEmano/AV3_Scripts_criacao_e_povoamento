@scripts_apoio/99_drop_all.sql
@scripts_criacao/01_create_sequences.sql
@scripts_criacao/02_create_fundacao_e_rh.sql
@scripts_criacao/03_create_evento_e_comercial.sql
@scripts_criacao/04_create_financeiro_e_atividades.sql
@scripts_criacao/05_add_fks.sql
-- EVITA QUE STRINGS COM "&" SEJAM VISTAS COMO VARIÁVEIS DE SUBSTITUIÇÃO
SET DEFINE OFF;
@scripts_povoamento/06_insert_evento_locais.sql
@scripts_povoamento/07_insert_pessoas_rh.sql
@scripts_povoamento/08_insert_comercial.sql
@scripts_povoamento/09_insert_ingressos.sql
@scripts_povoamento/10_insert_atividades.sql
-- REATIVA AS VARIÁVEIS DE SUBSTITUIÇÃO
SET DEFINE ON;
@scripts_apoio/11_consultas_validacao.sql
@oracle_packages/pkg_register.sql
@oracle_packages/pkg_update.sql
@oracle_functions/timestamp_overlap.sql
@oracle_triggers/trg_atividade_timestamp_overlap.sql


@13_joins_subconsultas_view.sql
