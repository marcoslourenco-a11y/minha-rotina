-- Cole isto no Supabase: menu SQL Editor → New query → Run.
-- Cria a tabela onde fica a sua rotina e garante que cada pessoa só vê os próprios dados.
create table if not exists public.rotina (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.rotina enable row level security;
drop policy if exists "ler a propria rotina" on public.rotina;
drop policy if exists "criar a propria rotina" on public.rotina;
drop policy if exists "atualizar a propria rotina" on public.rotina;
create policy "ler a propria rotina" on public.rotina for select using (auth.uid() = user_id);
create policy "criar a propria rotina" on public.rotina for insert with check (auth.uid() = user_id);
create policy "atualizar a propria rotina" on public.rotina for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- Garante que usuários logados possam usar a tabela pela API
-- (projetos novos do Supabase podem vir sem essa permissão).
grant usage on schema public to authenticated;
grant select, insert, update on public.rotina to authenticated;
