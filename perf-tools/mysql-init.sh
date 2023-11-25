#!/bin/bash

# **なんかよくわからんけど動かないので使わない, [これ](https://zenn.dev/userkazun/scraps/e83a71f93bb94d)みたいにログインしてslowクエリを吐くようにする.**
# MySQLの設定ファイル(の一部)を[my.cnf](my.cnf)に設定し, mysqlを再起動する. 

# ```
# ./mysql-init.sh
# ```

set -eux
cd "$(dirname "$0")"

# 元の設定ファイルのバックアップを取る。
sudo mv /etc/mysql/conf.d/my.cnf /etc/mysql/conf.d/my.cnf.old

# mysql slow logを吐くようにする
sudo ln -s "$(pwd)/my.cnf" /etc/mysql/conf.d/my.cnf

# mysql 再起動
sudo systemctl restart mysqld