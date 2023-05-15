#!/bin/bash

docker run --rm \
  --name pihole \
  --network pihole-bridge \
  --ip 172.20.10.2 \
  -p 53:53/udp \
  -p 80:80 \
  -e TZ=Europe/London \
  -v /var/pihole/etc-pihole:/etc/pihole \
  -v /var/pihole/etc-dnsmasq.d:/etc/dnsmasq.d \
  -v /var/pihole/log:/var/log/pihole \
  pihole/pihole:latest

