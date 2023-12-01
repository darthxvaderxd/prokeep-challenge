# Dockerfile for running the node version of this challenge
FROM node:20-alpine as base
WORKDIR /app
COPY . .

# Install dependencies
FROM base as dependencies
RUN yarn install --ignore-optional; exit 0

# Build production image
FROM base as production
COPY --from=dependencies /app/node_modules ./node_modules

# Insure node user has access to the files
RUN chown -Rf node /app

# Set the user to node user instead of root
USER 1000

EXPOSE 4000
ENTRYPOINT [ "sh", "-c" ]
CMD [ "yarn", "docker" ]