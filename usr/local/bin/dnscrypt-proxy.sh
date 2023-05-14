#!/bin/bash

docker run --rm --name dnscrypt-proxy -p 5353:5353/udp -v /etc/dnscrypt-proxy:/config klutchell/dnscrypt-proxy
