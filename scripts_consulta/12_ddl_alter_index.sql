-- =====================================================================
-- 12_ddl_alter_index.sql
-- Checklist SQL: 1 (ALTER TABLE) e 2 (CREATE INDEX)
-- Rodar depois do povoamento (06 a 10) e antes dos scripts 13 em diante.
-- =====================================================================

-- ---------------------------------------------------------------------
-- [SQL 1] ALTER TABLE
-- Cenario: a organizacao quer enviar o ingresso/comunicados por e-mail,
-- entao Pessoa ganha a coluna email. A coluna e opcional (nem todo
-- visitante informa e-mail) e, quando preenchida, deve ser unica e valida.
-- ---------------------------------------------------------------------
-- ADD coluna
ALTER TABLE Pessoa ADD email VARCHAR2(100);

-- ADD CONSTRAINT (UNIQUE e CHECK). NULL e aceito em ambas.
ALTER TABLE Pessoa ADD CONSTRAINT uq_email_pessoa UNIQUE(email);
ALTER TABLE Pessoa ADD CONSTRAINT chk_email_pessoa_formato
    CHECK(REGEXP_LIKE(email, '^[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'));

-- MODIFY: descricoes de atividade passaram a ter textos maiores
ALTER TABLE Atividade MODIFY descricao VARCHAR2(1000);

-- ---------------------------------------------------------------------
-- [SQL 2] CREATE INDEX
-- O Oracle cria indice automaticamente para PK e UNIQUE, mas NAO para FK.
-- Os indices abaixo cobrem colunas muito usadas em JOIN e WHERE.
-- ---------------------------------------------------------------------
-- FK usada para achar "os ingressos de uma pessoa" (JOIN com Pessoa)
CREATE INDEX idx_ingresso_cpf_pessoa ON Ingresso(cpf_pessoa);

-- Indice composto: agenda de uma edicao ordenada por horario
-- (colunas mais seletivas/igualdade primeiro, faixa de data por ultimo)
CREATE INDEX idx_atividade_edicao_inicio ON Atividade(cod_evento, ano, data_hora_inicio);

-- Indice baseado em funcao: busca de pessoa por sobrenome sem diferenciar
-- maiusculas de minusculas (o WHERE precisa usar a mesma funcao UPPER)
CREATE INDEX idx_pessoa_sobrenome_upper ON Pessoa(UPPER(sobrenome));

-- Consulta que se beneficia do indice funcional
SELECT cpf, primeiro_nome, sobrenome
FROM Pessoa
WHERE UPPER(sobrenome) = 'ALMEIDA CAVALCANTI';
