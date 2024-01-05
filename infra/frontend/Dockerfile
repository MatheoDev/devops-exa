FROM node:21-alpine3.18 as build-stage
WORKDIR /app
COPY ./../../frontend/ . 
RUN npm ci 
RUN npm run build

# nginx stage
FROM nginx:1.25.3-alpine
VOLUME /var/log/nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
