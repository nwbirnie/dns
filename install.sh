#!/bin/bash
set -euox pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}"
cp -r var/* /var

if systemctl | grep pihole.service; then
  systemctl stop pihole.service
  systemctl stop dnscrypt-proxy.service
fi

cp -r etc/* /etc
cp -r usr/* /usr

mkdir -p /var/pihole
chmod -R 755 /var/pihole
chown -R root:root /var/pihole

docker network remove pihole-bridge
docker network create --subnet 172.20.10.0/29 pihole-bridge

systemctl daemon-reload
systemctl enable pihole.service
systemctl enable dnscrypt-proxy.service
systemctl restart pihole.service
systemctl restart dnscrypt-proxy.service
