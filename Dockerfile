FROM timbru31/node-chrome:16-slim

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

RUN npm install -g @angular/cli
