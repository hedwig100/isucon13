#!/bin/bash

# nginxの設定ファイルを[nginx.conf](nginx.conf)に設定し, , nginxを再起動する.  

# ```
# ./nginx-init.sh
# ```

set -eux
cd "$(dirname "$0")"

# 元の設定ファイルのバックアップを取る。
sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.old

# alp 用のログを吐き出す設定ファイルを置く。
sudo ln -s "$(pwd)/nginx.conf" /etc/nginx/nginx.conf

# nginx 再起動
sudo systemctl restart nginx

