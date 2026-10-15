# Banco de Dados - Evento de Cultura Pop (Entregas AV3 e AV4)

Equipe 04:

- Allan Fernandes
- Allanis Beatriz
- Amanda Pereira
- Arthur Luz
- Cauã Emanuel
- Felipe Albuquerque

Projeto da disciplina Gerenciamento de Dados e Informação (IF685, UFPE).
Scripts Oracle de criação e povoamento (AV3) e de consultas SQL e PL/SQL (AV4), a partir do Esquema Relacional Normalizado (AV2).

## Estrutura
```
00_executar_tudo.sql          ordem oficial de execução
24_demo_plsql.sql             demonstração do PL/SQL (DBMS_OUTPUT)
CHECKLIST_AV4.md              ficha da AV4: cada um dos 46 itens com arquivo e linha
SYNTAX.md                     padrões de nomeação e estrutura do código
docs/                         esquema relacional (AV2) e minimundo
scripts_criacao/              01 a 05: sequences, tabelas e FKs
scripts_povoamento/           06 a 10: INSERTs
scripts_apoio/                11 validação do povoamento, 99 drop_all
scripts_consulta/             12 a 16: ALTER/INDEX, consultas, DML e GRANT/REVOKE
oracle_functions/             17: funções
oracle_procedures/            18: procedures avulsas
oracle_packages/              19 e 20: pacotes
oracle_triggers/              21 a 23: triggers
```

## Ordem de execução (os números dos arquivos seguem a ordem)
| # | Arquivo | Conteúdo |
|---|---|---|
| 99 | `scripts_apoio/99_drop_all.sql` | Remove tudo do schema (rodar primeiro para reexecutar) |
| 01 | `scripts_criacao/01_create_sequences.sql` | CREATE SEQUENCE |
| 02 | `scripts_criacao/02_create_fundacao_e_rh.sql` | Pessoa, Telefone, Cep, Local, Cargo, Funcionário, Contrata |
| 03 | `scripts_criacao/03_create_evento_e_comercial.sql` | Evento, Edição, Área, EdiçãoLocal, Empresa, Produto, Estande, Disponibiliza, Patrocina |
| 04 | `scripts_criacao/04_create_financeiro_e_atividades.sql` | Cupom, Recibo, InstânciaIngresso, Ingresso, CompraIngresso, Atividade, Atração, Torneio, Assiste, Inscreve |
| 05 | `scripts_criacao/05_add_fks.sql` | Chaves estrangeiras |
| 06 | `scripts_povoamento/06_insert_evento_locais.sql` | Evento, Edição, Cep, Local, Área, EdiçãoLocal |
| 07 | `scripts_povoamento/07_insert_pessoas_rh.sql` | Pessoa, Telefone, Cargo, Funcionário, Contrata |
| 08 | `scripts_povoamento/08_insert_comercial.sql` | Empresa, Produto, Estande, Disponibiliza, Patrocina |
| 09 | `scripts_povoamento/09_insert_ingressos.sql` | Cupom, Recibo, InstânciaIngresso, Ingresso, CompraIngresso |
| 10 | `scripts_povoamento/10_insert_atividades.sql` | Atividade, Atração, Torneio, Assiste, Inscreve |
| 11 | `scripts_apoio/11_consultas_validacao.sql` | Conferências pós-povoamento |
| 12 | `scripts_consulta/12_ddl_alter_index.sql` | ALTER TABLE e CREATE INDEX |
| 13 | `scripts_consulta/13_consultas_filtros_agregacao.sql` | Q1 e Q2: filtros e agregações |
| 14 | `scripts_consulta/14_joins_subconsultas_view.sql` | Q3 a Q18: joins, conjuntos, subconsultas e view |
| 15 | `scripts_consulta/15_dml_update_delete.sql` | INSERT, UPDATE e DELETE |
| 16 | `scripts_consulta/16_permissoes_grant_revoke.sql` | GRANT/REVOKE (comentados) |
| 17 | `oracle_functions/17_functions.sql` | fn_timestamp_overlap, fn_receita_edicao, fn_status_vagas |
| 18 | `oracle_procedures/18_procedures.sql` | Procedures avulsas (cursor, loops, OUT e IN OUT) |
| 19 | `oracle_packages/19_pkg_register.sql` | Pacote de cadastro |
| 20 | `oracle_packages/20_pkg_funcionario.sql` | Pacote de consulta e alteração de funcionários |
| 21 | `oracle_triggers/21_trigger_atividade_timestamp_overlap.sql` | Trigger composto: sem sobreposição de atividades |
| 22 | `oracle_triggers/22_trigger_compra_ingresso.sql` | Trigger de linha: valida cupom e valor pago |
| 23 | `oracle_triggers/23_trigger_auditoria_cupom.sql` | Trigger de comando e tabela de auditoria |
| 24 | `24_demo_plsql.sql` | Demonstração de tudo que foi criado em 17 a 23 |

`00_executar_tudo.sql` chama todos na ordem (SQL*Plus, SQLcl ou SQL Developer). No Oracle Live SQL / FreeSQL o comando `@` não existe:
cole e execute cada arquivo na ordem acima. O `SET DEFINE OFF` do `00_executar_tudo.sql` é necessário porque há textos com "&" (ex.: "Quadrinhos & Cia").

Os INSERTs usam `seq_pk_*.NEXTVAL` e as chaves de referência seguem a ordem das sequences; para reexecutar, rode `99_drop_all.sql` antes.
Atenção: o `99_drop_all.sql` remove todas as tabelas, views, sequences, procedures, funções, pacotes e triggers do schema, não só os deste projeto.

## Decisões de modelagem refletidas nos scripts
- `Cupom.codigo` é texto (ex.: `POPCON10`); por isso não há sequence de cupom.
- `Recibo.valor_compra` é o valor bruto (soma dos preços dos ingressos); `CompraIngresso.valor_pago` já inclui o desconto do cupom.
- `CompraIngresso.cod_cupom` é opcional (compra sem cupom).
- Atividade é especialização disjunta e total (Atração ou Torneio).
- O trigger de Atividade considera atividades `CANCELADA` como ocupando o horário.

## Extensões da AV4 (não constam no esquema da AV2)
- Coluna `Pessoa.email` (opcional, única e validada), criada por ALTER TABLE em `12_ddl_alter_index.sql`.
- Tabela `AuditoriaCupom` e sequence `seq_pk_auditoria_cupom`, usadas pelo trigger de comando (`oracle_triggers/23_trigger_auditoria_cupom.sql`).
- Índices `idx_ingresso_cpf_pessoa`, `idx_atividade_edicao_inicio` e `idx_pessoa_sobrenome_upper`.

## Dados de exemplo
2 eventos, 4 edições (2025 e 2026), 4 locais, 12 áreas, 38 pessoas (8 funcionários), 8 empresas, 12 produtos, 14 estandes,
42 ingressos em 26 recibos, 28 atividades (15 atrações e 13 torneios). CPFs, CNPJs e CEPs são fictícios.
Data de referência do povoamento: 07/10/2026 (as edições 2025 e a de 2026 do evento 2 já ocorreram; a de 2026 do evento 1 é em novembro).
Os testes de DML e da demonstração PL/SQL usam dados próprios (cupons FLASH30, EXPIRADO10, AUDIT10, AUDIT20 e uma pessoa de teste) e os removem ao final.
O único dado do povoamento alterado de forma permanente é o salário de três funcionários (bônus de 5% em `15_dml_update_delete.sql`).
