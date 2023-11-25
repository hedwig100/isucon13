#!/bin/bash

# モニタリングツール一式をインストールする. 具体的には

# 1. [alp](https://github.com/tkuchiki/alp)
# 2. graphviz (pprofのグラフ描画用)

# をインストールする. 

# ```
# ./monitoring-install.sh
# ```

set -eux
cd "$(dirname "$0")"

# Install alp
./alp-install.sh

# Install mysqldump
# TODO: I don't know why, but sometimes this library breaks mysqld process.
#       so stop installing it.
# sudo apt-get -y install mysql-client

# Install graphviz for pprof graph visualization
sudo apt-get -y install graphviz