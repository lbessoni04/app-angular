FROM node:16.14.2-slim

#Essential tools and xvfb
RUN apt-get update && apt-get install -y \        
    wget 
    
#Chrome browser to run the tests
#ARG CHROME_VERSION=65.0.3325.181
#RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add \
#      && wget https://www.slimjet.com/chrome/download-chrome.php?file=lnx%2Fchrome64_$CHROME_VERSION.deb \
#      && dpkg -i download-chrome*.deb || true
#RUN apt-get install -y -f \
#      && rm -rf /var/lib/apt/lists/*
#ENV CHROME_BIN=/usr/bin/chromium-browser

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update -qq \
  && apt-get install -qq --no-install-recommends \
    google-chrome-stable \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
  
#Adding Angular/CLI
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
RUN npm install -g @angular/cli    


