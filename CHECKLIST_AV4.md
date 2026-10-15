# Checklist AV4 - Ficha de avaliação da parte prática (SQL/PL)

Equipe 04 - Gerenciamento de Dados e Informação (IF685)

Todos os 46 itens estão cobertos. A coluna "Onde" aponta a primeira ocorrência
(arquivo e linha); a observação cita outras ocorrências e a consulta/rotina em que o
recurso é usado. As consultas Q1 a Q18 são numeradas nos comentários dos scripts.

## SQL (26 itens)

| # | Item | Onde | Observação |
|---|---|---|---|
| 1 | ALTER TABLE | `scripts_consulta/12_ddl_alter_index.sql` (linha 14) | ADD coluna, ADD CONSTRAINT (UNIQUE e CHECK) e MODIFY em Atividade |
| 2 | CREATE INDEX | `scripts_consulta/12_ddl_alter_index.sql` (linha 38) | 3 indices: FK, composto e baseado em funcao |
| 3 | INSERT INTO | `scripts_povoamento/06_insert_evento_locais.sql` (linha 3) | 730 INSERTs no povoamento (06 a 10); cupons de teste em scripts_consulta/15_dml_update_delete.sql |
| 4 | UPDATE | `scripts_consulta/15_dml_update_delete.sql` (linha 34) | bonus de 5% com subconsulta; tambem UPDATE de Cupom e Pessoa |
| 5 | DELETE | `scripts_consulta/15_dml_update_delete.sql` (linha 58) | remocao simples e com subconsulta (NOT IN) |
| 6 | SELECT-FROM-WHERE | `scripts_consulta/13_consultas_filtros_agregacao.sql` (linha 21) | Q1 e Q2 (WHERE com filtros combinados) |
| 7 | BETWEEN | `scripts_consulta/13_consultas_filtros_agregacao.sql` (linha 43) | Q2: faixa de datas de 2026 |
| 8 | IN | `scripts_consulta/13_consultas_filtros_agregacao.sql` (linha 42) | Q2 (lista); Q13 em scripts_consulta/14_joins_subconsultas_view.sql (subconsulta) |
| 9 | LIKE | `scripts_consulta/13_consultas_filtros_agregacao.sql` (linha 44) | Q2: nome LIKE %Torneio% |
| 10 | IS NULL / IS NOT NULL | `scripts_consulta/13_consultas_filtros_agregacao.sql` (linha 22) | Q1 e Q2; IS NULL no anti-join Q5 em scripts_consulta/14_joins_subconsultas_view.sql |
| 11 | INNER JOIN | `scripts_consulta/14_joins_subconsultas_view.sql` (linha 22) | Q3: cinco tabelas encadeadas |
| 12 | MAX | `scripts_consulta/13_consultas_filtros_agregacao.sql` (linha 17) | Q1; tambem Q12 em scripts_consulta/14_joins_subconsultas_view.sql |
| 13 | MIN | `scripts_consulta/13_consultas_filtros_agregacao.sql` (linha 18) | Q1 |
| 14 | AVG | `scripts_consulta/13_consultas_filtros_agregacao.sql` (linha 16) | Q1; tambem Q11 em scripts_consulta/14_joins_subconsultas_view.sql |
| 15 | COUNT | `scripts_consulta/13_consultas_filtros_agregacao.sql` (linha 15) | Q1; tambem Q18 em scripts_consulta/14_joins_subconsultas_view.sql |
| 16 | LEFT / RIGHT / FULL OUTER JOIN | `scripts_consulta/14_joins_subconsultas_view.sql` (linha 42) | Q4 (LEFT), Q6 (RIGHT) e Q7 (FULL) |
| 17 | Subconsulta com operador relacional | `scripts_consulta/14_joins_subconsultas_view.sql` (linha 128) | Q11 (>) e Q12 (=) |
| 18 | Subconsulta com IN | `scripts_consulta/14_joins_subconsultas_view.sql` (linha 149) | Q13: tres niveis de IN |
| 19 | Subconsulta com ANY | `scripts_consulta/14_joins_subconsultas_view.sql` (linha 171) | Q14 |
| 20 | Subconsulta com ALL | `scripts_consulta/14_joins_subconsultas_view.sql` (linha 183) | Q15 |
| 21 | ORDER BY | `scripts_consulta/13_consultas_filtros_agregacao.sql` (linha 27) | em todas as consultas |
| 22 | GROUP BY | `scripts_consulta/13_consultas_filtros_agregacao.sql` (linha 23) | Q1; tambem Q18 em scripts_consulta/14_joins_subconsultas_view.sql |
| 23 | HAVING | `scripts_consulta/13_consultas_filtros_agregacao.sql` (linha 25) | Q1: cupons usados mais de uma vez |
| 24 | UNION / INTERSECT / MINUS | `scripts_consulta/14_joins_subconsultas_view.sql` (linha 95) | Q8 (UNION), Q9 (INTERSECT) e Q10 (MINUS) |
| 25 | CREATE VIEW | `scripts_consulta/14_joins_subconsultas_view.sql` (linha 190) | Q16: vw_ingressos_detalhados |
| 26 | GRANT / REVOKE | `scripts_consulta/16_permissoes_grant_revoke.sql` (linha 19) | comandos comentados (o Live SQL nao permite), com a explicacao de cada um |

## PL (20 itens)

| # | Item | Onde | Observação |
|---|---|---|---|
| 1 | Uso de RECORD | `oracle_triggers/21_trigger_atividade_timestamp_overlap.sql` (linha 5) | rec_atividade; tambem em 24_demo_plsql.sql (t_produto) |
| 2 | Estrutura do tipo TABLE | `oracle_triggers/21_trigger_atividade_timestamp_overlap.sql` (linha 13) | colecao INDEX BY; tambem em 24_demo_plsql.sql |
| 3 | Bloco anonimo | `24_demo_plsql.sql` (linha 29) | varios blocos anonimos de demonstracao |
| 4 | CREATE PROCEDURE | `oracle_procedures/18_procedures.sql` (linha 6) | 4 procedures avulsas; tambem as dos pacotes (oracle_packages/19_pkg_register.sql e oracle_packages/20_pkg_funcionario.sql) |
| 5 | CREATE FUNCTION | `oracle_functions/17_functions.sql` (linha 6) | fn_timestamp_overlap, fn_receita_edicao e fn_status_vagas |
| 6 | %TYPE | `oracle_functions/17_functions.sql` (linha 7) | em todos os arquivos PL |
| 7 | %ROWTYPE | `oracle_packages/19_pkg_register.sql` (linha 42) | registros de insercao; c_edicoes%ROWTYPE em oracle_procedures/18_procedures.sql |
| 8 | IF ELSIF | `oracle_procedures/18_procedures.sql` (linha 60) | prc_realizar_checkin; tambem oracle_triggers/21_trigger_atividade_timestamp_overlap.sql e oracle_triggers/23_trigger_auditoria_cupom.sql |
| 9 | CASE WHEN | `oracle_functions/17_functions.sql` (linha 69) | fn_status_vagas (CASE ... END CASE) |
| 10 | LOOP EXIT WHEN | `oracle_procedures/18_procedures.sql` (linha 99) | prc_relatorio_receita |
| 11 | WHILE LOOP | `oracle_triggers/21_trigger_atividade_timestamp_overlap.sql` (linha 33) | trigger de Atividade; tambem 24_demo_plsql.sql |
| 12 | FOR IN LOOP | `oracle_procedures/18_procedures.sql` (linha 128) | prc_relatorio_torneios |
| 13 | SELECT ... INTO | `oracle_functions/17_functions.sql` (linha 31) | fn_receita_edicao e outras; tambem oracle_packages/20_pkg_funcionario.sql |
| 14 | CURSOR (OPEN, FETCH, CLOSE) | `oracle_procedures/18_procedures.sql` (linha 95) | prc_relatorio_receita |
| 15 | EXCEPTION WHEN | `oracle_functions/17_functions.sql` (linha 79) | todas as unidades PL; DUP_VAL_ON_INDEX em oracle_packages/19_pkg_register.sql |
| 16 | Parametros IN, OUT e IN OUT | `oracle_procedures/18_procedures.sql` (linha 9) | IN OUT em prc_aplicar_cupom e OUT em prc_realizar_checkin |
| 17 | CREATE OR REPLACE PACKAGE | `oracle_packages/19_pkg_register.sql` (linha 1) | pkg_register e pkg_funcionario (oracle_packages/20_pkg_funcionario.sql) |
| 18 | CREATE OR REPLACE PACKAGE BODY | `oracle_packages/19_pkg_register.sql` (linha 32) | pkg_register e pkg_funcionario (oracle_packages/20_pkg_funcionario.sql) |
| 19 | CREATE OR REPLACE TRIGGER (comando) | `oracle_triggers/23_trigger_auditoria_cupom.sql` (linha 12) | trg_cupom_auditoria_cmd: dispara uma vez por instrucao |
| 20 | CREATE OR REPLACE TRIGGER (linha) | `oracle_triggers/22_trigger_compra_ingresso.sql` (linha 3) | trg_compra_ingresso_valida; tambem as secoes de linha do composto em oracle_triggers/21_trigger_atividade_timestamp_overlap.sql |

## Como executar e conferir
1. Rode `00_executar_tudo.sql` (ou cada arquivo na ordem do README).
2. As saídas do PL/SQL aparecem em `24_demo_plsql.sql` (DBMS_OUTPUT).
3. `scripts_apoio/11_consultas_validacao.sql` confere o povoamento (contagens, especialização e recibos).
