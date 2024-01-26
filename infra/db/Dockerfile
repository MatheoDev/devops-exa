# Stage 1: PostgreSQL stage
FROM postgres:latest
COPY ./infra/db/init.sql /docker-entrypoint-initdb.d/
