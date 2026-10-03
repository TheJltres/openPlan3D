FROM node:24-alpine AS build
WORKDIR /app

ENV NODE_ENV=production
COPY package*.json ./
RUN npm ci --include=dev

COPY . .
RUN npm run build

FROM node:24-alpine AS runtime
WORKDIR /app

ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=3000

COPY --from=build /app/build ./build
COPY --from=build /app/package*.json ./

# SvelteKit's generated Node server can require packages listed in the
# project's devDependencies, so keep the full lockfile installation here.
RUN npm ci --include=dev && npm cache clean --force

EXPOSE 3000
USER node

CMD ["node", "build"]
