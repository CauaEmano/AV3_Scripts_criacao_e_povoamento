## REGRAS DE NOMEAÇÃO E ESTRUTURA DA AV3

### Arquivos CREATE
Serão gerados 3 arquivos .sql para a criação de tabelas referentes aos subtemas do projeto:
```
Fundação e RH -> create_fundacao_e_rh.sql
Estrutura do Evento e Comercial -> create_evento_e_comercial.sql
Financeiro e Atividades -> create_financeiro_e_atividades.sql
```

### Arquivos INSERT
Serão gerados 3 arquivos .sql para a população das tabelas referentes aos subtemas do projeto:
```
Fundação e RH -> insert_fundacao_e_rh.sql
Estrutura do Evento e Comercial -> insert_evento_e_comercial.sql
Financeiro e Atividades -> insert_financeiro_e_atividades.sql
```

### Outros arquivos
```
create_sequences.sql -> Implementação das sequências
add_fks.sql -> Implementação das FKs
```

### Ordem de execução
Os arquivos serão executados na ordem do seguinte roteiro:
```
CREATE TABLES -> INSERT TABLES -> CREATE SEQUENCES -> ADD FKS
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
