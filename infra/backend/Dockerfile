# Stage 1: Build stage
FROM node:21-alpine3.18 as build-stage
WORKDIR /app
COPY ../../backend/ . 
RUN npm install 
RUN npm run build

# Stage 2: Server stage for nestJS
FROM node:21-alpine3.18 as server-stage
WORKDIR /app
COPY --from=build-stage /app .
CMD ["npm", "run", "start:prod"]
