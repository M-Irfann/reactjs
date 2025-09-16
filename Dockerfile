FROM node:18-alpine AS builder

WORKDIR /app

COPY package* .json ./

RUN npm install

COPY . .

RUN npm run build

# nginx stage

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/

COPY --from=builder /app/dist/ /usr/share/nginx/html

EXPOSE 84




