#!/bin/bash

# alpを実行する. ログローテーションを行う場合は現在のログファイルの移動先を`<rotate_filepath>`として渡すことで行うことができる. 実際に試用する際はalpコマンドは調整すること.

# ```
# ./alp.sh (<rotate_filepath>)
# ```

set -eux
cd "$(dirname "$0")"

rotate_filepath=""
if [ $# -eq 1 ]; then
    rotate_filepath=$1
fi

# MEMO: -m 以降はグループ化して計測したいuriを書く
sudo alp ltsv --file=/var/log/nginx/access.log --sort sum --reverse -q --nosave-pos --qs-ignore-values -m "/api/initialize,/api/tag./api/user/[0-9a-zA-Z]+/theme,/api/livestream/reservation,/api/livestream/search,/api/user/[0-9a-zA-Z]+/livestream,/api/livestream/[0-9]+/livecomment,/api/livestream/[0-9]+/reaction,/api/livestream/[0-9]+/report,/api/livestream/[0-9]+/ngwords,/api/livestream/[0-9]+/livecomment/[0-9]+/report,/api/livestream/[0-9]+/moderate,/api/livestream/[0-9]+/enter,/api/livestream/[0-9]+/exit,/api/user/[0-9a-zA-Z]+/statistics,/api/user/[0-9a-zA-Z]+/icon,/api/livestream/[0-9]+/statistics,/api/livestream/[0-9]+,/api/user/[0-9a-zA-Z]+"

if [ -n "$rotate_filepath" ]; then
    sudo mv /var/log/nginx/access.log $rotate_filepath
fi
