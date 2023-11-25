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
sudo alp ltsv --file=/var/log/nginx/access.log --sort sum --reverse -q --nosave-pos --qs-ignore-values -m "/api/isu/,/register/,/isu/,/api/condition/"

if [ -n "$rotate_filepath" ]; then
    sudo mv /var/log/nginx/access.log $rotate_filepath
fi
