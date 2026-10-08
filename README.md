# Banco de Dados - Evento de Cultura Pop (Entrega AV3)

Equipe: _(preencher nomes)_

Scripts Oracle de criação e povoamento a partir do Esquema Relacional Normalizado (AV2).

## Estrutura
```
00_executar_tudo.sql          ordem oficial de execução
scripts_criacao/              01 a 05: sequences, tabelas e FKs
scripts_povoamento/           06 a 10: INSERTs
scripts_apoio/                11 consultas de validação, 99 drop_all
Esquema_relacional.pdf        esquema da AV2
```

## Ordem de execução (os números dos arquivos seguem a ordem)
| # | Arquivo | Conteúdo |
|---|---|---|
| 99 | `scripts_apoio/99_drop_all.sql` | Remove tabelas e sequences (rodar primeiro para reexecutar) |
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

Os INSERTs usam `seq_pk_*.NEXTVAL` e as chaves de referência seguem a ordem das sequences; para reexecutar, rode `99_drop_all.sql` antes.

## Decisões de modelagem refletidas nos scripts
- `Cupom.codigo` é texto (ex.: `POPCON10`); por isso não há sequence de cupom.
- `Recibo.valor_compra` é o valor bruto (soma dos preços dos ingressos); `CompraIngresso.valor_pago` já inclui o desconto do cupom.
- `CompraIngresso.cod_cupom` é opcional (compra sem cupom).
- Atividade é especialização disjunta e total (Atração ou Torneio).

## Dados de exemplo
2 eventos, 4 edições (2025 e 2026), 4 locais, 12 áreas, 38 pessoas (8 funcionários), 8 empresas, 12 produtos, 14 estandes,
42 ingressos em 26 recibos, 28 atividades (15 atrações e 13 torneios). CPFs, CNPJs e CEPs são fictícios.
Data de referência do povoamento: 07/10/2026 (as edições 2025 e a de 2026 do evento 2 já ocorreram; a de 2026 do evento 1 é em novembro).
