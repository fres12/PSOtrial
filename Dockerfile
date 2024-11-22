FROM node:20-alpine3.18 AS builder

WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm ci --only=production
COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]
