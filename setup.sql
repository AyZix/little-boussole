create table if not exists public.results (
  id bigint generated always as identity primary key,
  name text not null check (char_length(name) between 1 and 24),
  name_key text not null unique,
  x int not null check (x between -100 and 100),
  y int not null check (y between -100 and 100),
  at timestamptz not null default now()
);

alter table public.results enable row level security;

create policy "tout le monde lit" on public.results for select using (true);
create policy "tout le monde ajoute" on public.results for insert with check (true);
create policy "tout le monde modifie" on public.results for update using (true);
create policy "tout le monde supprime" on public.results for delete using (true);

grant select, insert, update, delete on public.results to anon;
