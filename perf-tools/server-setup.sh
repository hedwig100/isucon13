#!/bin/bash

# サーバをセットアップする. 具体的には

# 1. gitレポジトリを作り
# 2. モニタリングツールをインストールする
# 3. nginxの設定ファイルを設定する. 

# ```
# ./server-setup.sh <reponame>
# ```

set -eux
cd "$(dirname "$0")"

reponame=$1

sudo apt-get update
./git-init.sh $reponame
./monitoring-install.sh
./nginx-init.sh