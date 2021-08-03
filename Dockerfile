# estágio de compilação
FROM node:14 as build-stage
ARG API=http://localhost:3000
ENV API=${API}
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# estágio de produção
FROM nginx:stable-alpine as production-stage
LABEL maintainer "Eduardo Donato <eduardo.donato at eletromarquez.com.br>"
COPY --from=build-stage /app/dist/spa /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
