#!/bin/bash
set -ex

if [ -f /var/lib/maria/slow.log ]; then
    sudo mv /var/log/mariadb/slow.log /var/log/mariadb/slow.log.$(date +%Y%m%d-%H%M%S)
fi
if [ -f /var/log/h2o/.access.log ]; then
    sudo mv /var/log/h2o/access.log /var/h2o/access.log.$(date +%Y%m%d-%H%M%S)
fi
sudo systemctl restart mariadb
sudo systemctl restart h2o
sudo systemctl restart torb.nodejs.service
# エラーがないか
sudo journalctl -f
