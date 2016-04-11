FROM node:slim
MAINTAINER CenterStone Technologies, Inc.

#install dependencies
RUN apt-get update -qq \
&& apt-get upgrade -yq \
&& apt-get install -yq \
    less \
    nano \
    jq \
    netcat \
    net-tools \
&& npm install -g -q json \
&& npm install -g http-host-proxy \
&& export CB=containerbuddy-1.3.0 \
&& mkdir -p /opt/containerbuddy \
&& curl -Lo /tmp/${CB}.tar.gz https://github.com/joyent/containerbuddy/releases/download/1.3.0/containerbuddy-1.3.0.tar.gz \
&& tar xzf /tmp/${CB}.tar.gz -C /tmp && rm /tmp/${CB}.tar.gz \
&& mv /tmp/containerbuddy /opt/containerbuddy/

COPY /opt/containerbuddy /opt/containerbuddy
COPY bin/* /usr/bin/
COPY config/* /config/

EXPOSE 8080
ENTRYPOINT ["/usr/bin/run_consul-proxy"]
