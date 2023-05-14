#!/bin/bash

docker run --rm \
  --name pihole \
  -p 53:53/udp \
  -p 80:80 \
  -e TZ=Europe/London \
  -v /var/pihole/etc-pihole:/etc/pihole \
  -v /var/pihole/etc-dnsmasq.d:/etc/dnsmasq.d \
  pihole/pihole:latest

