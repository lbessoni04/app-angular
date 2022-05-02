FROM node:16.14.2-slim

RUN  apt-get update \
  && apt-get install -y wget \
  && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && apt install ./google-chrome-stable_current_amd64.deb

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

RUN npm install -g @angular/cli
