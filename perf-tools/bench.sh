#!/bin/bash

# mysql, nginxのログをローテーションしてから, ベンチマークを実行する. 

# ```
# ./bench.sh
# ```

set -eux
cd "$(dirname "$0")"

stamp=`date "+%Y%d%m%M%H"`
if [ -e /var/log/nginx/access.log ]; then
    sudo mv /var/log/nginx/access.log /var/log/nginx/access_$stamp.log
fi
sudo touch /var/log/nginx/access.log
sudo systemctl restart nginx

# MEMO: This comand doesn't work well.
if [ -e /var/log/mysql/mysql-slow.log ]; then
    sudo mv /var/log/mysql/mysql-slow.log /var/log/mysql/mysql-slow_$stamp.log
fi
sudo touch /var/log/mysql/mysql-slow.log
sudo systemctl restart mysqld

# MEMO: you have to change the command below to the command of the contest.
cd ~/bench && ./bench -all-addresses 127.0.0.10 -target 127.0.0.10:443 -tls -jia-service-url http://127.0.0.1:4999