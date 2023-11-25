#!/bin/bash

# ローカルでAWSインスタンス接続用の鍵ペアを作成し, `~/.ssh/config` を接続名だけで接続できるようにアップデートする.
#
# ```
# ./ssh-init.sh <hostname> <ip address> <username>
# ```

set -eux
cd "$(dirname "$0")"

hostname=$1
ip_addr=$2
user=$3

echo "Create ssh key pair"

filename=$hostname
ssh-keygen -f ~/.ssh/$filename -N ''

echo "Finish creating ssh key pair"
echo "Update ~/.ssh/config file"

echo "Host $hostname
HostName $ip_addr
User $user
IdentityFile ~/.ssh/$filename.key
" >> ~/.ssh/config

echo "Finish updating ssh config"


