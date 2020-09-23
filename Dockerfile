FROM node:13-alpine
RUN apk add yarn
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app
# instala o yarn dentro do container
RUN yarn install
CMD [ "yarn", "dev" ]
EXPOSE 3000
