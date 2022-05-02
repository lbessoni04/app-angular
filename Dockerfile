FROM node:16.14.2-slim

RUN apt-get update -qq \
  && apt-get install -qq --no-install-recommends \
    wget \
    gnupg2 \
    ca-certificates \
    apt-transport-https \
  && apt-get upgrade -qq
  
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
  
RUN wget -q -O - https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb | apt-key add - \
  && apt install ./google-chrome-stable_current_amd64.deb \
  && apt-get update -qq \
  && apt-get install -qq --no-install-recommends \
    google-chrome-stable \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*


