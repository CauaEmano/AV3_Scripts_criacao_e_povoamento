-- =====================================================================
-- 16_permissoes_grant_revoke.sql
-- Checklist SQL: 26 (GRANT / REVOKE)
-- O Oracle Live SQL / FreeSQL nao autoriza esses comandos, entao estao
-- COMENTADOS. Abaixo, o que cada um faria no banco do evento.
-- =====================================================================

-- GRANT concede a um usuario (ou papel/role) o direito de executar uma
-- operacao sobre um objeto. REVOKE retira esse direito. O principio e o
-- do menor privilegio: cada perfil recebe so o que precisa.

-- 1) Papeis (roles) por perfil de trabalho
-- CREATE ROLE papel_atendimento;
-- CREATE ROLE papel_financeiro;
-- CREATE ROLE papel_rh;

-- 2) Atendimento: consulta ingressos pela view (sem ver salario/CPF de outras tabelas)
--    e faz check-in pela procedure, sem poder alterar a tabela diretamente
-- GRANT SELECT ON vw_ingressos_detalhados TO papel_atendimento;
-- GRANT EXECUTE ON prc_realizar_checkin TO papel_atendimento;

-- 3) Financeiro: le e atualiza compras, cupons e recibos
-- GRANT SELECT, INSERT, UPDATE ON CompraIngresso TO papel_financeiro;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON Cupom TO papel_financeiro;
-- GRANT SELECT ON Recibo TO papel_financeiro;

-- 4) RH: acessa funcionarios somente pelo pacote (que valida as regras)
-- GRANT EXECUTE ON pkg_funcionario TO papel_rh;
-- GRANT SELECT ON Funcionario TO papel_rh;

-- 5) Associar o papel a um usuario
-- GRANT papel_atendimento TO maria_atendente;

-- 6) WITH GRANT OPTION: quem recebe pode repassar a permissao a outros
-- GRANT SELECT ON Evento TO coordenador_eventos WITH GRANT OPTION;

-- 7) REVOKE: retira permissoes (por exemplo, quando o financeiro nao
--    deve mais apagar cupons)
-- REVOKE DELETE ON Cupom FROM papel_financeiro;
-- REVOKE papel_atendimento FROM maria_atendente;

-- Observacao: um REVOKE de permissao concedida com GRANT OPTION tambem
-- remove, em cascata, o que o usuario repassou a terceiros.
