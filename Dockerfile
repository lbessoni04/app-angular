FROM node:16.14.2-slim

RUN apt-get update
RUN apt-get install -y curl unzip xvfb libxi6 libgconf-2-4
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install ./google-chrome-stable_current_amd64.deb

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

RUN npm install -g @angular/cli
