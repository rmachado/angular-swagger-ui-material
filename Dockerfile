FROM mhart/alpine-node:4
MAINTAINER rodrigo@start-game.com

RUN apk add --no-cache git

RUN npm install -g bower gulp http-server

ADD . /src/app

WORKDIR /src/app

RUN npm install && \
    bower install --allow-root && \
    gulp build

WORKDIR /src/app/dist

CMD http-server -p 80
