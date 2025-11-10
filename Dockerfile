# ------------------------------------
# Stage 1: Build the Astro Application
# ------------------------------------
FROM node:lts-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# -----------------------------------
# Stage 2: Production Runtime (NGINX)
# -----------------------------------
FROM nginx:alpine

COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80