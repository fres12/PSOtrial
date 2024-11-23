FROM node:20-alpine3.18 AS builder

RUN apt-get update && apt-get install \
    git libx11-xcb1 libxcb-dri3-0 libxtst6 libnss3 libatk-bridge2.0-0 libgtk-3-0 libxss1 libasound2 \
    -yq --no-install-suggests --no-install-recommends \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm ci --only=production
RUN npx electron-rebuild
COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]
