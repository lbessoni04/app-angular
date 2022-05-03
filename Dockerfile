FROM justinribeiro/chrome-headless:latest

#Essential tools and xvfb
RUN apt-get update && apt-get install -y \        
    curl

#Installing Nodejs
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - 
RUN apt-get install -y nodejs
    
#Chrome browser to run the tests
#ARG CHROME_VERSION=65.0.3325.181
#RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add \
#      && wget https://www.slimjet.com/chrome/download-chrome.php?file=lnx%2Fchrome64_$CHROME_VERSION.deb \
#      && dpkg -i download-chrome*.deb || true
#RUN apt-get install -y -f \
#      && rm -rf /var/lib/apt/lists/*
#ENV CHROME_BIN=/usr/bin/chromium-browser

#Adding Angular/CLI
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
RUN npm install -g @angular/cli    


