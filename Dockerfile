FROM node:20-alpine3.18 AS builder

WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN apt-get -y install libgtkextra-dev libgconf2-dev libnss3 libasound2 libxtst-dev libxss1

RUN npm install --save-dev electron

RUN npm ci install
COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]
