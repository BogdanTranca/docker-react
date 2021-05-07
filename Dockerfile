FROM node:alpine AS builder

WORKDIR '/node-app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /node-app/build /usr/share/nginx/html