# Stage 1: Build stage
FROM node:14-alpine3.14 as build-stage
WORKDIR /app
COPY ./../../backend/ . 
RUN npm ci 
RUN npm run build

# Stage 2: Server stage for nestJS
FROM node:14-alpine3.14 as server-stage
WORKDIR /app
COPY --from=build-stage /app .
CMD ["npm", "run", "start:prod"]
