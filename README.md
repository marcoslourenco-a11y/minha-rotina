# Minha Rotina

App de rotina diária (Hoje, Agenda e Análise) que funciona no celular e no computador, com login e sincronização pelo Supabase.

## Como está organizado

- `index.html`: o app inteiro (telas, estilos e lógica).
- `config.js`: endereço e chave pública do projeto Supabase.
- `supabase.sql`: cria a tabela `rotina` com segurança por usuário (cada pessoa só vê os próprios dados).
- `manifest.webmanifest`, `sw.js`, `icons/`: deixam o app instalável e funcionando sem internet.
- `vendor/supabase.js`: biblioteca oficial do Supabase (versão 2.45.4), incluída no projeto.

## Configuração (uma vez só)

1. No Supabase, crie um projeto. Em **SQL Editor → New query**, cole o conteúdo de `supabase.sql` e clique em **Run**.
2. Em **Project Settings → API**, copie a **Project URL** e a chave **anon / publishable** para o `config.js`.
   Nunca use a chave `service_role` / `secret` no app.
3. Em **Authentication → URL Configuration**, coloque o endereço do app em **Site URL** (ex.: `https://SEU-USUARIO.github.io/minha-rotina/`) e também em **Redirect URLs**.
4. Publique a pasta no GitHub Pages: repositório → **Settings → Pages → Deploy from a branch → main / (root)**.

## Instalar

- **iPhone:** abra o endereço no Safari → botão Compartilhar → **Adicionar à Tela de Início**.
- **Computador:** abra no Chrome ou Edge → ícone **Instalar** na barra de endereço (ou salve nos favoritos).

## Como a sincronização funciona

- Tudo é salvo primeiro no aparelho (funciona sem internet) e enviado para a nuvem cerca de 1 segundo depois.
- Ao voltar para o app, ele busca a versão mais recente. Se você mexer nos dois aparelhos ao mesmo tempo sem internet, vale a alteração mais recente.
- No primeiro login em um aparelho novo, a rotina que já está na nuvem substitui a do aparelho.
