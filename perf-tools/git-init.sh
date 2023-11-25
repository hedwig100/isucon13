#!/bin/bash

# サーバ上にてあるディレクトリ以下のファイルをgit管理する. ディレクトリを指定しない場合はカレントディレクトリをgit管理する.
#
# ```
# ./git-init.sh <reponame> (<dirname>)
# ```

set -eu
cd "$(dirname "$0")"

reponame=$1
git_dir='.'
if [ $# -eq 2 ]; then
    git_dir=$2
fi

echo "Generate ssh key pair to connect private repository"
ssh-keygen -f ~/.ssh/id_rsa -N ''
echo "Public Key (You can copy-and-paste to your github)"
printf '\n'
cat ~/.ssh/id_rsa.pub
printf '\n'
echo "Finish creating ssh key pair"

echo "Initialize git repository"
cd $git_dir
rm -rf .git && git init
git config user.email "shota.in26@gmail.com"
git config user.name "hedwig100"
git remote add origin git@github.com:hedwig100/$reponame.git
echo "Finished initializing git repository"


