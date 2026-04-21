create extension if not exists pgcrypto;

create type public.furniture_status as enum (
  'planned',
  'in_stock',
  'delivered',
  'installed',
  'broken',
  'under_repair',
  'written_off',
  'moved'
);

create table public.pharmacies (
  id uuid primary key default gen_random_uuid(),
  pharmacy_number text not null unique,
  name text not null,
  address text not null,
  status text not null,
  created_at timestamptz not null default timezone('utc', now())
);

create table public.furniture_types (
  id uuid primary key default gen_random_uuid(),
  type_code text not null unique,
  title text not null,
  category text not null,
  notes text,
  created_at timestamptz not null default timezone('utc', now())
);

create table public.furniture_items (
  id uuid primary key default gen_random_uuid(),
  internal_item_id text not null unique,
  inventory_code text not null unique,
  pharmacy_id uuid not null references public.pharmacies(id) on delete restrict,
  furniture_type_id uuid not null references public.furniture_types(id) on delete restrict,
  status public.furniture_status not null,
  installed_at timestamptz,
  qr_slug text not null unique,
  created_at timestamptz not null default timezone('utc', now()),
  constraint furniture_items_internal_vs_inventory_code_check
    check (internal_item_id <> inventory_code)
);

create table public.inventory_events (
  id uuid primary key default gen_random_uuid(),
  furniture_item_id uuid not null references public.furniture_items(id) on delete cascade,
  event_type text not null,
  actor_name text,
  actor_contact text,
  created_at timestamptz not null default timezone('utc', now())
);

create table public.damage_reports (
  id uuid primary key default gen_random_uuid(),
  furniture_item_id uuid not null references public.furniture_items(id) on delete restrict,
  pharmacy_id uuid not null references public.pharmacies(id) on delete restrict,
  comment text not null,
  photo_url text,
  status text not null,
  bitrix_task_id text,
  created_at timestamptz not null default timezone('utc', now())
);

create table public.bitrix_tasks (
  id uuid primary key default gen_random_uuid(),
  damage_report_id uuid not null unique references public.damage_reports(id) on delete cascade,
  external_task_id text not null,
  webhook_status text not null,
  payload_snapshot jsonb,
  created_at timestamptz not null default timezone('utc', now())
);

create table public.users (
  id uuid primary key default gen_random_uuid(),
  role text not null,
  full_name text not null,
  email text not null unique,
  phone text,
  created_at timestamptz not null default timezone('utc', now())
);

create index furniture_items_pharmacy_id_idx
  on public.furniture_items (pharmacy_id);

create index furniture_items_furniture_type_id_idx
  on public.furniture_items (furniture_type_id);

create index furniture_items_status_idx
  on public.furniture_items (status);

create index inventory_events_furniture_item_id_idx
  on public.inventory_events (furniture_item_id);

create index damage_reports_furniture_item_id_idx
  on public.damage_reports (furniture_item_id);

create index damage_reports_pharmacy_id_idx
  on public.damage_reports (pharmacy_id);

create index damage_reports_status_idx
  on public.damage_reports (status);

create or replace function public.prevent_internal_item_id_update()
returns trigger
language plpgsql
as $$
begin
  if new.internal_item_id <> old.internal_item_id then
    raise exception 'internal_item_id is immutable';
  end if;

  return new;
end;
$$;

create trigger furniture_items_prevent_internal_item_id_update
before update on public.furniture_items
for each row
execute function public.prevent_internal_item_id_update();
