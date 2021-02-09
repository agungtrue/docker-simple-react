# FROM node:alpine as builder
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# FROM nginx
FROM nginx:alpine
# FROM nginx:1.15.8-alpine
EXPOSE 80
# COPY --from=builder /app/build /usr/share/nginx/html
COPY --from=0 /app/build /usr/share/nginx/html
