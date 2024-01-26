CREATE TABLE IF NOT EXISTS product (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR NOT NULL,
    "price" DECIMAL NOT NULL
);

alter table product
    owner to postgres;