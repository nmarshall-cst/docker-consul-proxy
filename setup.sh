#!/usr/bin/env bash

#Get the config from consul if you wanted, as an example:
#curl -s http://consul:8500/v1/kv/proxy/config | json -ag value | base64 -d > /config.json
#curl -s http://consul:8500/v1/kv/proxy/userauth | json -ag value | base64 -d > /config.json

mkdir /keys > /dev/null 2>&1
generatekeys() {
        openssl genrsa -out /keys/my.key 4096
        openssl req -new -x509 -days 1826 -key /keys/my.key -subj "/C=US/ST=NewYork/L=NewYork/O=Global \
                Security/OU=IT Department/CN=example.com" -out /keys/my.crt
}

[[ -f /keys/my.key ]] || generatekeys

exec http-host-proxy -r /config.json --ssl -k /keys/my.key -c /keys/my.crt -a /passhash.txt
