
FROM node:22-alpine AS base

WORKDIR /app

COPY package*.json .

RUN npm ci 

EXPOSE 3000

# production

FROM base AS production

COPY . .

CMD ["npm","start"]


# development

FROM base AS development

RUN npm prune --omit-dev

CMD ["npm","run","dev"]




