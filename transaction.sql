-- Set up Storage!
-- This is the only transaction I run against the database in local.
-- CLI version: 0.17.0

drop policy if exists "SELECT BUCKET" on storage.buckets;
drop policy if exists "CREATE BUCKET" on storage.buckets;
drop policy if exists "UPDATE BUCKET" on storage.buckets;
drop policy if exists "DELETE BUCKET" on storage.buckets;

drop policy if exists "SELECT OBJECT" on storage.objects;
drop policy if exists "INSERT OBJECT" on storage.objects;
drop policy if exists "UPDATE OBJECT" on storage.objects;
drop policy if exists "DELETE OBJECT" on storage.objects;

-- Buckets&
create policy "SELECT BUCKET"
  on storage.buckets for select
  using ( true );

create policy "CREATE BUCKET"
  on storage.buckets for insert
  with check ( true );

create policy "UPDATE BUCKET"
  on storage.buckets for update
  with check ( true );

create policy "DELETE OBJECT"
  on storage.buckets for delete
  using ( true );

-- Objects
create policy "SELECT OBJECT"
  on storage.objects for select
  using ( true );

create policy "INSERT OBJECT"
  on storage.objects for insert
  with check ( true );

create policy "UPDATE OBJECT"
  on storage.objects for update
  with check ( true );
  
 create policy "DELETE OBJECT"
  on storage.objects for delete
  using ( true );