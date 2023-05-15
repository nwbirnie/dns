#!/bin/bash
set -euox pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}"
cp -r var/* /var
cp -r etc/* /etc
cp -r usr/* /usr

docker network remove pihole-bridge || true
docker network create --subnet 172.20.10.0/29 pihole-bridge

systemctl daemon-reload
systemctl enable pihole.service
systemctl enable dnscrypt-proxy.service
systemctl restart pihole.service
systemctl restart dnscrypt-proxy.service
