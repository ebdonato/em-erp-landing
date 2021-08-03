# Eletromarquez Apps Landing Page (em-erp-landing)

Eletromarquez Apps Landing Page

## Install the dependencies

```bash
npm install
```

### Start the app in development mode (hot-code reloading, error reporting, etc.)

```bash
quasar dev
```

### Lint the files

```bash
npm run lint
```

### Build the app for production

```bash
quasar build
```

### Customize the configuration

See [Configuring quasar.conf.js](https://v2.quasar.dev/quasar-cli/quasar-conf-js).

## Docker configuration

### Criando Imagem Docker

`docker build . --build-arg API="http://localhost:3000" -t ebdonato/em-erp-landing:tag`

### Criando um container com a imagem

`docker run -d -p 8080:80 ebdonato/em-erp-landing:tag`

### Criando outra tags

`docker tag ebdonato/em-erp-landing:tag ebdonato/em-erp-landing:new-tag`
