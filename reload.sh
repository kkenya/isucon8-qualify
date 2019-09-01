#!/bin/bash
set -ex

if [ -f /var/lib/maria/slow.log ]; then
    sudo mv /var/log/mariadb/slow.log /var/log/mariadb/slow.log.$(date +%Y%m%d-%H%M%S)
fi
if [ -f /var/log/nginx/.access.log ]; then
    sudo mv /var/log/nginx/access.log /var/nginx/access.log.$(date +%Y%m%d-%H%M%S)
fi
sudo systemctl restart mariadb
sudo systemctl restart nginx
sudo systemctl restart torb.nodejs.service
# エラーがないか
sudo journalctl -f
