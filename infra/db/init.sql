create table product
(
    id    serial
        primary key,
    name  varchar not null,
    price integer not null
);

alter table product
    owner to postgres;

create table inventory
(
    id          serial
        primary key,
    "createdAt" timestamp not null,
    "updatedAt" timestamp not null
);

alter table inventory
    owner to postgres;

create table inventory_product
(
    inventory     integer not null,
    product       integer not null,
    quantity      integer not null,
    "inventoryId" integer
        constraint "FK_27b99d1010c88d0c7b44c6e3b13"
            references inventory,
    "productId"   integer
        constraint "FK_6f211898538c98d206ef980ebbc"
            references inventory,
    constraint "PK_4ed65e576b2fedbd8e5d0909e39"
        primary key (inventory, product)
);

alter table inventory_product
    owner to postgres;

-- Insert data into product table
insert into product (name, price) values ('Pomme', 10);
insert into product (name, price) values ('Banane', 5);
insert into product (name, price) values ('Orange', 7);
insert into product (name, price) values ('Kiwi', 3);
insert into product (name, price) values ('Fraise', 15);
insert into product (name, price) values ('Ananas', 20);
insert into product (name, price) values ('Mangue', 25);
insert into product (name, price) values ('Papaye', 30);
insert into product (name, price) values ('Cerise', 40);
insert into product (name, price) values ('Raisin', 50);
insert into product (name, price) values ('Pêche', 60);
insert into product (name, price) values ('Abricot', 70);
insert into product (name, price) values ('Poire', 80);
insert into product (name, price) values ('Pomme de terre', 90);
