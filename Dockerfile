# Put this file next to graffiti-wall-live.zip in the root of your GitHub repository.
# The host (Render, Railway, Fly.io ...) builds it: it unzips the project and starts the server.
FROM node:20-slim
RUN apt-get update && apt-get install -y --no-install-recommends unzip && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY *.zip /tmp/project.zip
RUN unzip -q /tmp/project.zip -d /tmp/p \
 && cp -a /tmp/p/*/. /app/ \
 && rm -rf /tmp/p /tmp/project.zip
RUN npm install --omit=dev --ignore-scripts
ENV NODE_ENV=production
EXPOSE 3000
CMD ["node", "server.js"]
