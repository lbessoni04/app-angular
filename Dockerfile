FROM node:16.14.2-slim

#Essential tools and xvfb
RUN apt-get update && apt-get install -y \
    wget 

#Chrome browser to run the tests
ARG CHROME_VERSION=65.0.3325.181
RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add \
      && wget https://www.slimjet.com/chrome/download-chrome.php?file=lnx%2Fchrome64_$CHROME_VERSION.deb \
      && dpkg -i download-chrome*.deb || true
RUN apt-get install -y -f \
      && rm -rf /var/lib/apt/lists/*

#Disable the SUID sandbox so that chrome can launch without being in a privileged container
RUN dpkg-divert --add --rename --divert /opt/google/chrome/google-chrome.real /opt/google/chrome/google-chrome \
        && echo "#! /bin/bash\nexec /opt/google/chrome/google-chrome.real --no-sandbox --disable-setuid-sandbox \"\$@\"" > /opt/google/chrome/google-chrome \
        && chmod 755 /opt/google/chrome/google-chrome
        
#Adding Angular/CLI
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
RUN npm install -g @angular/cli    


