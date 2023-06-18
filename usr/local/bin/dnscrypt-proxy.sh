#!/bin/bash

docker run --rm \
  --name dnscrypt \
  --network pihole-bridge \
  --ip 172.20.10.3 \
  -p 5353:5353/udp \
  -v /etc/dnscrypt-proxy:/config \
  -v /var/dnscrypt:/var/dnscrypt \
  klutchell/dnscrypt-proxy
