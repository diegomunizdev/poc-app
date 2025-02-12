FROM node:18-alpine AS base
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn --frozen-lockfile
COPY . .
EXPOSE 3000

FROM base AS development
ENV NODE_ENV=development
CMD ["yarn", "dev"]

FROM base AS build
ENV NODE_ENV=production
RUN yarn build

FROM node:18-alpine AS production
ENV NODE_ENV=production
COPY --from=build /app .
CMD ["yarn", "start"]