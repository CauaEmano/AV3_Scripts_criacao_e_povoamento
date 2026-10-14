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
| 1 | Uso de RECORD | `scripts_plsql/21_trigger_atividade_overlap.sql` (linha 15) | rec_atividade; tambem em scripts_plsql/24_demo_plsql.sql (t_produto) |
| 2 | Estrutura do tipo TABLE | `scripts_plsql/21_trigger_atividade_overlap.sql` (linha 23) | colecao INDEX BY; tambem em scripts_plsql/24_demo_plsql.sql |
| 3 | Bloco anonimo | `scripts_plsql/24_demo_plsql.sql` (linha 38) | varios blocos anonimos de demonstracao |
| 4 | CREATE PROCEDURE | `scripts_plsql/20_funcoes_procedures.sql` (linha 82) | 4 procedures avulsas; tambem as dos pacotes (18 e 19) |
| 5 | CREATE FUNCTION | `scripts_plsql/20_funcoes_procedures.sql` (linha 15) | fn_receita_edicao, fn_status_vagas e scripts_plsql/17_function_timestamp_overlap.sql |
| 6 | %TYPE | `scripts_plsql/20_funcoes_procedures.sql` (linha 16) | em todos os arquivos PL |
| 7 | %ROWTYPE | `scripts_plsql/18_pkg_register.sql` (linha 50) | registros de insercao; c_edicoes%ROWTYPE em scripts_plsql/20_funcoes_procedures.sql |
| 8 | IF ELSIF | `scripts_plsql/20_funcoes_procedures.sql` (linha 136) | prc_realizar_checkin; tambem scripts_plsql/21_trigger_atividade_overlap.sql e scripts_plsql/23_trigger_auditoria_cupom.sql |
| 9 | CASE WHEN | `scripts_plsql/20_funcoes_procedures.sql` (linha 62) | fn_status_vagas (CASE ... END CASE) |
| 10 | LOOP EXIT WHEN | `scripts_plsql/20_funcoes_procedures.sql` (linha 175) | prc_relatorio_receita |
| 11 | WHILE LOOP | `scripts_plsql/21_trigger_atividade_overlap.sql` (linha 43) | trigger de Atividade; tambem scripts_plsql/24_demo_plsql.sql |
| 12 | FOR IN LOOP | `scripts_plsql/20_funcoes_procedures.sql` (linha 204) | prc_relatorio_torneios |
| 13 | SELECT ... INTO | `scripts_plsql/20_funcoes_procedures.sql` (linha 24) | fn_receita_edicao e outras; tambem scripts_plsql/19_pkg_funcionario.sql |
| 14 | CURSOR (OPEN, FETCH, CLOSE) | `scripts_plsql/20_funcoes_procedures.sql` (linha 171) | prc_relatorio_receita |
| 15 | EXCEPTION WHEN | `scripts_plsql/20_funcoes_procedures.sql` (linha 72) | todas as unidades PL; DUP_VAL_ON_INDEX em scripts_plsql/18_pkg_register.sql |
| 16 | Parametros IN, OUT e IN OUT | `scripts_plsql/20_funcoes_procedures.sql` (linha 85) | IN OUT em prc_aplicar_cupom e OUT em prc_realizar_checkin |
| 17 | CREATE OR REPLACE PACKAGE | `scripts_plsql/18_pkg_register.sql` (linha 9) | pkg_register e pkg_funcionario (scripts_plsql/19_pkg_funcionario.sql) |
| 18 | CREATE OR REPLACE PACKAGE BODY | `scripts_plsql/18_pkg_register.sql` (linha 40) | pkg_register e pkg_funcionario (scripts_plsql/19_pkg_funcionario.sql) |
| 19 | CREATE OR REPLACE TRIGGER (comando) | `scripts_plsql/23_trigger_auditoria_cupom.sql` (linha 20) | trg_cupom_auditoria_cmd: dispara uma vez por instrucao |
| 20 | CREATE OR REPLACE TRIGGER (linha) | `scripts_plsql/22_trigger_compra_ingresso.sql` (linha 12) | trg_compra_ingresso_valida; tambem as secoes de linha do composto em scripts_plsql/21_trigger_atividade_overlap.sql |

## Como executar e conferir
1. Rode `00_executar_tudo.sql` (ou cada arquivo na ordem do README).
2. As saídas do PL/SQL aparecem em `scripts_plsql/24_demo_plsql.sql` (DBMS_OUTPUT).
3. `scripts_apoio/11_consultas_validacao.sql` confere o povoamento (contagens, especialização e recibos).
