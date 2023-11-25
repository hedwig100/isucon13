#!/bin/bash

# mysql, nginxのログをローテーションしてから, ベンチマークを実行する. 

# ```
# ./bench.sh
# ```

set -eux
cd "$(dirname "$0")"

sudo cp /dev/null /var/log/nginx/access.log
sudo systemctl restart nginx

sudo cp /dev/null /var/log/mysql/mysql-slow.log
# MEMO: This comand doesn't work well.
# sudo systemctl restart mysqld

cd ../webapp/go && make build
sudo systemctl restart isupipe-go.service