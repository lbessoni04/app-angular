FROM node:16.14.2-slim

RUN apt-get update -qq \
  && apt-get install -qq --no-install-recommends \
    wget \
    gnupg2 \
    ca-certificates \
    apt-transport-https \
  && apt-get upgrade -qq
  
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
  
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && apt install ./google-chrome-stable_current_amd64.deb

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

RUN npm install -g @angular/cli
