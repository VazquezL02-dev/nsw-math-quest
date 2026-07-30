-- NSW Math Quest registration for the shared classroom Supabase project.
-- Run once in Supabase SQL Editor.

alter table public.apps add column if not exists subject text;
alter table public.student_results add column if not exists activity_name text;

insert into public.apps (app_key, app_name, subject, active)
values ('nsw-math-quest', 'NSW Math Quest', 'Mathematics', true)
on conflict (app_key) do update
set app_name = excluded.app_name,
    subject = excluded.subject,
    active = true;

grant select on public.students, public.apps to anon;
grant insert on public.student_results to anon;

-- These policies may already exist in your shared setup.
drop policy if exists "anon read active students" on public.students;
create policy "anon read active students"
on public.students for select to anon
using (active = true);

drop policy if exists "anon read active apps" on public.apps;
create policy "anon read active apps"
on public.apps for select to anon
using (active = true);

drop policy if exists "anon insert student results" on public.student_results;
create policy "anon insert student results"
on public.student_results for insert to anon
with check (true);

-- Allows this app to restore each student's saved progress.
drop policy if exists "anon read math quest results" on public.student_results;
create policy "anon read math quest results"
on public.student_results for select to anon
using (
  app_id = (
    select id from public.apps
    where app_key = 'nsw-math-quest'
    limit 1
  )
);

grant select on public.student_results to anon;
