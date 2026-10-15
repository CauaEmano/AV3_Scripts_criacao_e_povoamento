## REGRAS DE NOMEAÇÃO E ESTRUTURA DO PROJETO (AV3 e AV4)

### Estrutura de pastas e numeração
Os arquivos são numerados na ordem de execução. O número nunca se repete.
```
scripts_criacao/      01 a 05  sequences, tabelas (3 arquivos por subtema) e FKs
scripts_povoamento/   06 a 10  INSERTs (evento_locais, pessoas_rh, comercial, ingressos, atividades)
scripts_apoio/        11 consultas de validação do povoamento · 99 drop_all
scripts_consulta/     12 a 16  ALTER/INDEX, consultas, DML e GRANT/REVOKE (AV4 - SQL)
oracle_functions/     17       funções
oracle_procedures/    18       procedures avulsas
oracle_packages/      19 e 20  pacotes (cadastro e funcionário)
oracle_triggers/      21 a 23  triggers (composto, de linha e de comando)
24_demo_plsql.sql     demonstração do PL/SQL (na raiz)
```

### Arquivos CREATE
Três arquivos .sql para a criação de tabelas, um por subtema do projeto:
```
Fundação e RH                    -> 02_create_fundacao_e_rh.sql
Estrutura do Evento e Comercial  -> 03_create_evento_e_comercial.sql
Financeiro e Atividades          -> 04_create_financeiro_e_atividades.sql
```

### Arquivos de povoamento
```
06_insert_evento_locais.sql   07_insert_pessoas_rh.sql   08_insert_comercial.sql
09_insert_ingressos.sql       10_insert_atividades.sql
```

### Outros arquivos
```
01_create_sequences.sql -> Implementação das sequências
05_add_fks.sql          -> Implementação das FKs
99_drop_all.sql         -> Remove tudo para reexecutar do zero
```

### Ordem de execução
A ordem oficial está em `00_executar_tudo.sql`:
```
DROP -> SEQUENCES -> CREATE TABLES -> ADD FKS -> INSERTS -> ALTER/INDEX -> CONSULTAS -> DML -> PL/SQL -> DEMO
```
As FKs só são criadas depois de todas as tabelas, e o PL/SQL só depois do povoamento
(os triggers não devem interferir na carga inicial).

### Nomeação de objetos PL/SQL (AV4)
```
Função avulsa       -> fn_<o_que_retorna>          (ex.: fn_receita_edicao)
Procedure avulsa    -> prc_<acao>                  (ex.: prc_realizar_checkin)
Pacote              -> pkg_<assunto>               (ex.: pkg_funcionario)
Trigger             -> trg_<tabela>_<regra>[_cmd]  (sufixo _cmd = nível de comando)
View                -> vw_<descricao>
Índice              -> idx_<tabela>_<colunas>
Parâmetros          -> p_<nome> (entrada/saída) e variáveis locais v_<nome>
Cursores            -> c_<nome>        Tipos (RECORD/TABLE) -> t_<nome>
Erros de aplicação  -> RAISE_APPLICATION_ERROR com códigos -20000 a -20999 (um por regra)
```

### Padrões de capitalização:
```
KEYWORDS (CREATE, TABLE, SELECT, FROM, CONSTRAINT, etc.) -> UPPERCASE
TIPOS (NUMBER, VARCHAR2, etc.) -> UPPERCASE
TABELAS -> PascalCase
COLUNAS -> snake_case
CONSTRAINTS -> snake_case
```

### Padrão de nomeação das CONSTRAINTS:
```
PRIMARY KEY -> pk_<nome_tabela>
FOREIGN KEY -> fk_<nome_atributo>_<nome_tabela>_<tabela_referenciada>
UNIQUE -> uq_<nome_atributo>_<nome_tabela>
NOT NULL -> nn_<nome_atributo>_<nome_tabela>
CHECK -> chk_<nome_atributo>_<nome_tabela>_<função_do_check>
```

### Ordem de definição nas tabelas:
```
COLUNAS -> PKs -> FKs -> Outras CONSTRAINTS
```

OBS<sub>1</sub>: FKs serão definidas posteriormente em um script à parte para evitar erros de definição. As únicas FKs que podem ser definidas com a tabela são as que referem à própria tabela. Para indicar que a coluna será uma FK, deixe um comentário no fim da sua linha.

OBS<sub>2</sub>: NOT NULL é uma exceção em "Outras CONSTRAINTS", pois precisa ser definido junto com a coluna.

OBS<sub>3</sub>: Atributos que são ou fazem parte de uma PK não usarão a definição NOT NULL, mesmo que sejam também uma FK.

### Sequências:
Sequências sempre explicitarão o início (START WITH) e a contagem (INCREMENT BY) nessa ordem e serão nomeadas da seguinte forma:
```
A sequência se refere a uma chave primária -> seq_<nome_chave_primaria>
A sequência se refere a qualquer outro atributo -> seq_<nome_atributo>_<nome_tabela>
```

OBS: Sequências também serão definidas em um script à parte para organizar melhor a estrutura do código-fonte.

### Preferências de tipo
Será preferido usar:
```
NUMBER ao invés de INTEGER
VARCHAR2 ao invés de CHAR
```
OBS: VARCHAR não será usado pois é um tipo deprecado.

### Criação de tabela
Segue um exemplo de criação de tabela, sequências, foreign keys e população seguindo as regras de nomeação e estrutura:
```sql

-- Pode estar em um arquivo separado do arquivo com "CREATE TABLE Contas"
CREATE TABLE Pessoas(
    pessoa_id NUMBER,
    conta_id NUMBER CONSTRAINT nn_conta_id_pessoas NOT NULL, -- FK Contas(conta_id)
    cpf VARCHAR2(11),
    nome VARCHAR2(50) CONSTRAINT nn_nome_pessoas NOT NULL,
    data_nasc DATE CONSTRAINT nn_data_nasc_pessoas NOT NULL,
    pai_id NUMBER,
    mae_id NUMBER,
    CONSTRAINT pk_pessoas PRIMARY KEY(pessoa_id),
    CONSTRAINT uq_cpf_pessoa UNIQUE(cpf),
    CONSTRAINT chk_cpf_length_eq_11 CHECK(LENGTH(cpf) = 11),
    CONSTRAINT fk_pai_id_pessoas_pessoas FOREIGN KEY(pai_id) REFERENCES Pessoas(pessoa_id),
    CONSTRAINT fk_mae_id_pessoas_pessoas FOREIGN KEY(mae_id) REFERENCES Pessoas(pessoa_id)
);

-- Arquivo dedicado à criação de sequências
CREATE SEQUENCE seq_pk_pessoas START WITH 1 INCREMENT BY 1;

-- Arquivo dedicado à criação de FKs
ALTER TABLE Pessoas
ADD CONSTRAINT fk_conta_id_pessoas_contas FOREIGN KEY(conta_id) REFERENCES Contas(conta_id);

-- Arquivo de população
INSERT INTO Pessoas VALUES (seq_pk_pessoas.NEXTVAL, 10, '12345678901', 'John Dad', DATE'1980-01-01', NULL, NULL);
INSERT INTO Pessoas VALUES (seq_pk_pessoas.NEXTVAL, 20, '12345678902', 'John Mom', DATE'1980-01-01', NULL, NULL);
INSERT INTO Pessoas VALUES (seq_pk_pessoas.NEXTVAL, 30, '12345678903', 'John', DATE'2000-01-01', 1, 2);
```
