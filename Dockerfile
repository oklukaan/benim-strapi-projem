FROM node:20-alpine
# Gerekli kütüphaneleri kuruyoruz
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git

# Çalışma dizini
WORKDIR /opt/

# Bağımlılıkları kopyala ve kur
COPY package.json package-lock.json ./
RUN npm install -g node-gyp
RUN npm config set fetch-retry-maxtimeout 600000 -g
RUN npm install

# Proje kodlarını kopyala
WORKDIR /opt/app
COPY . .

# Lokalde anlık yenilenme (hot-reload) için build
RUN NODE_OPTIONS="--max-old-space-size=2048" npm run build

EXPOSE 1337
CMD ["npm", "run", "develop"]