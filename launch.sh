#!/bin/bash

if [ -z $TRANSMISSION_PASS ]; then
    TRANSMISSION_PASS=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c8)
    echo "    | Web administration default user created:"
    echo "    |     Login : transmission"
    echo "    |     Passwd: ${TRANSMISSION_PASS}"
    echo "    | http://<your_server>:9091/"
fi


docker stop t
docker rm t

docker run -d -p 51413:51413 -p 51413:51413/udp \
    -p 9091:9091 -e TRANSMISSION_PASS=$TRANSMISSION_PASS \
    -v /home/downloads:/transmission/downloads \
    --name t stevenmartins/transmission
