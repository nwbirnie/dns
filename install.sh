#!/bin/bash
set -euox pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}"
cp -r var/* /var
cp -r etc/* /etc
cp -r usr/* /usr
systemctl enable pihole.service
systemctl enable dnscrypt-proxy.service
systemctl start pihole.service
systemctl start dnscrypt-proxy.service
