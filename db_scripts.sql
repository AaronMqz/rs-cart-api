CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

create type status_type as enum ('open', 'ordered');

create table carts (
    id uuid primary key default uuid_generate_v4(),
    user_id uuid default uuid_generate_v4(),
    created_at date default CURRENT_DATE,
    updated_at date default CURRENT_DATE,
    status status_type 
)

create table cart_items (
    cart_id uuid,
    product_id uuid default uuid_generate_v4(),
    count integer,
    foreign key ("cart_id") references "carts" ("id")
)

insert into carts (status) values
('ordered'),
('open'),
('ordered'),
('ordered'),
('open'),
('ordered'),
('open')

insert into cart_items (cart_id, count) values
('8eeb54d3-bbae-4d6a-b913-c88cee18ee24',5),
('b521af94-8d8f-49b5-b86a-2f3467f12224',6),
('abb4c90e-3afe-43bb-a4d1-27e5e5670952',7),
('1ae2e73d-ee2f-410e-b7ba-eb8a6075ef7b',8),
('7df0d81b-ccc7-4dc1-9255-73c0c9ed69fb',9),
('5dc3a6dd-5cb0-46d0-81b5-ba2ca0d1bcb6',10),
('6ddfc749-d6c1-41e9-8a29-d09557f5ed25',11);