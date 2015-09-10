FROM node:slim
MAINTAINER Michael Zeller <mike.zeller@joyent.com>

#install dependencies
RUN apt-get update
RUN npm install -g json
RUN npm install -g http-host-proxy 

COPY config.json config.json
COPY passhash.txt passhash.txt 
COPY setup.sh setup.sh

EXPOSE 8080
ENTRYPOINT ["./setup.sh"]
