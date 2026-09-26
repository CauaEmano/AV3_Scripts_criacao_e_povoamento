# Banco de Dados - Evento de Cultura Pop (AV2)

Repositório destinado aos scripts de criação (DDL) e povoamento (DML) do projeto de Banco de Dados (2026.2) do CIn-UFPE.

## Equipe (Os 6 integrantes)
* Allan Fernandes (afl4)
* Allanis Beatriz (aboml)
* Amanda Pereira (apmo)
* Arthur Gabriel (agsl)
* Cauã Emanuel (ceor)
* Felipe Melo (fma4)

## Estrutura do Projeto
* `/docs`: Documentação base, esquema relacional e diagrama ER.
* `/scripts_criacao`: Scripts DDL (Tabelas, Constraints, Sequences).
* `/scripts_povoamento`: Scripts DML (Carga de dados rica e coerente com o tema).

## Como Executar
1. Acesse o [Oracle Live SQL](https://livesql.oracle.com/).
2. Execute primeiro os scripts da pasta `/scripts_criacao` respeitando a ordem de dependência das chaves estrangeiras.
3. Em seguida, execute os arquivos da pasta `/scripts_povoamento`.