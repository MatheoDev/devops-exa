# Stage 1: Build stage
FROM node:21-alpine3.18 as build-stage
WORKDIR /app
COPY ../../frontend/ .
RUN npm install 
RUN npm run build

# Stage 2: Nginx stage
FROM nginx:1.25.3-alpine as nginx-stage
VOLUME /var/log/nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
