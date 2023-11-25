#!/bin/bash

# [alp](https://github.com/tkuchiki/alp)をインストールする.
#
# ```
# ./alp-install.sh
# ```

set -eux
cd "$(dirname "$0")"

ALP_VERSION="v1.0.21"

echo "Install alp $ALP_VERSION"
wget https://github.com/tkuchiki/alp/releases/download/$ALP_VERSION/alp_linux_amd64.zip
unzip alp_linux_amd64.zip
sudo mv alp /usr/local/bin
rm alp_linux_amd64.zip
echo "Finish installing alp"