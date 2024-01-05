# Stage 1: Build stage
FROM node:14-alpine3.14 as build-stage
WORKDIR /app
COPY ./../../frontend/ . 
RUN npm ci 
RUN npm run build

# Stage 2: Nginx stage
FROM nginx:1.25.3-alpine as nginx-stage
VOLUME /var/log/nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]

# Stage 3: PostgreSQL stage
FROM postgres:alpine as postgres-stage
COPY init.sql /docker-entrypoint-initdb.d/
ENV POSTGRES_USER admin
ENV POSTGRES_PASSWORD admin
ENV POSTGRES_DB database
EXPOSE 5432
