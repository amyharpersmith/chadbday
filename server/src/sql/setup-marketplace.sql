------------
-- Marketplace
------------

create schema if not exists marketplace;

/*
    Creates an addon table that contains the addon marketplace.
 */
create table if not exists marketplace.addons
(
    id                bigserial primary key unique,
    user_id           bigint references app.users (id) on update cascade on delete no action,
    resource_id       bigint unique,      -- The id of the resource this addon is related to
    type              addon_t   not null, -- The type of resource this is
    description       text,
    author            text,
    tags              text[],
    featured_sorting  smallint           default 0,
    price             decimal,
    payment_frequency text,
    global            bool               default false not null,
    version           text               default '0.0.1',
    created_on        timestamp not null default current_timestamp,
    last_updated      timestamp not null default current_timestamp
);

create index if not exists addons_type on marketplace.addons (type);
create index if not exists addons_description on marketplace.addons (description);
create index if not exists addons_author on marketplace.addons (author);
create index if not exists addons_tags on marketplace.addons (tags);
create index if not exists addons_featured_sorting on marketplace.addons (featured_sorting);
create index if not exists addons_price on marketplace.addons (price);
create index if not exists addons_global on marketplace.addons (global);
create index if not exists addons_last_updated on marketplace.addons (last_updated);

create table if not exists marketplace.downloads
(

);
