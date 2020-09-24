# This image has some installed tools
# https://github.com/tarampampam/node-docker
FROM tarampampam/node:12.18-alpine

# Missing binaries to build your dependencies
RUN apk add --no-cache \
    autoconf \
    automake \
    g++ \
    libc6-compat \
    libjpeg-turbo-dev \
    libpng-dev \
    libtool \
    make \
    nasm

# WORKDIR command works like MKDIR + CD
WORKDIR /app

# Copy package.json first so it caches dependencies
# Next we install dependencies
COPY package.json /app/
RUN yarn install

# Copy root so we have our code inside the container
COPY . /app

CMD [ "yarn", "dev" ]
