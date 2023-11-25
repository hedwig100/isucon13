#!/bin/bash

# MySQLが吐いたslowqueryを見る. ログローテーションを行う場合は現在のログファイルの移動先を`<rotate_filepath>`として渡すことで行うことができる. 実際に使用する際はmysqldumpslowコマンドは調整すること.

# ```
# ./slowquery.sh (<rotate_filepath>)
# ```

set -eux
cd "$(dirname "$0")"

rotate_filepath=""
if [ $# -eq 1 ]; then
    rotate_filepath=$1
fi

# TODO: don't use head
sudo mysqldumpslow -s t /var/log/mysql/mysql-slow.log | head -n 100

#if [ -n "$rotate_filepath" ]; then
#    sudo mv /var/log/mysql/mysql-slow.log $rotate_filepath
#fi
