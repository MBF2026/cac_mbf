-- Base de données du site MBF 2026 - TEAM REVELATION
-- 1) L'e-mail administrateur est déjà renseigné plus bas (fonction is_admin).
-- 2) Collez tout ce script dans Supabase > SQL Editor, puis cliquez sur Run.

create table if not exists public.docs (
  col text not null,
  id text not null,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz default now(),
  primary key (col, id)
);

alter table public.docs enable row level security;

create or replace function public.is_admin() returns boolean
language sql stable as $$
  select lower(coalesce(auth.jwt() ->> 'email', '')) = lower('duhamelzola08@gmail.com')
$$;

-- Lecture : tout le monde lit les contenus publics ; avis et alertes : seulement l'admin (et chacun lit les siens)
create policy docs_lecture on public.docs for select using (
  col in ('missions','tx','reports','events')
  or public.is_admin()
  or (col in ('alerts','reviews') and id = auth.uid()::text)
);

-- Écriture : l'admin partout
create policy docs_admin on public.docs for all
  using (public.is_admin()) with check (public.is_admin());

-- Chaque visiteur peut écrire uniquement son propre avis / sa propre alerte
create policy docs_membre on public.docs for all
  using (col in ('alerts','reviews') and id = auth.uid()::text)
  with check (col in ('alerts','reviews') and id = auth.uid()::text);
