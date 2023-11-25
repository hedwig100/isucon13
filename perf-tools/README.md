# Perf-Tools

## Usage

ISUCON的初動?
```
# Local
cd perf-tools
./ssh-init.sh <hostname>
ssh <hostname>

# Server-1
ssh-keygen -f ~/.ssh/id_rsa -N ''
cat ~/.ssh/id_rsa.pub
# copy and paste public key to your github
cd <directory you want to control>
git init
./monitoring-install.sh
./nginx-init.sh
# + mysql query config


# Local
git clone https://github.com/hedwig100/<reponame>.git
cd <reponame>
```

## `alp.sh`

alpを実行する. ログローテーションを行う場合は現在のログファイルの移動先を`<rotate_filepath>`として渡すことで行うことができる. 実際に試用する際はalpコマンドは調整すること.

```
./alp.sh (<rotate_filepath>)
```

## `alp-install.sh`

[alp](https://github.com/tkuchiki/alp)をインストールする.

```
./alp-install.sh
```

## `bench.sh`

mysql, nginxのログをローテーションしてから, ベンチマークを実行する. 

```
./bench.sh
```

## `git-init.sh`

サーバ上にてあるディレクトリ以下のファイルをgit管理する. ディレクトリを指定しない場合はカレントディレクトリをgit管理する.

```
./git-init.sh <reponame> (<dirname>)
```

## `monitoring-install.sh`

モニタリングツール一式をインストールする. 具体的には

1. [alp](https://github.com/tkuchiki/alp)
2. graphviz (pprofのグラフ描画用)

をインストールする. 

```
./monitoring-install.sh
```

## `mysql-init.sh` [Don't use]

**なんかよくわからんけど動かないので使わない, /etc/mysql/my.cnfとかに追記する. mysqlのconfigファイルは読む順番があるっぽいが左のファイルに書くと動いたので左のファイルに**
```
[mysqld]
slow_query_log=1
slow_query_log_file=/var/log/mysql/mysql-slow.log
long_query_time=0
```
**とかを書いてなんか動かす**

~~**なんかよくわからんけど動かないので使わない, [これ](https://zenn.dev/userkazun/scraps/e83a71f93bb94d)みたいにログインしてslowクエリを吐くようにする. 具体的には**~~
```
# sqlサーバにログイン
mysql -uisucon -p
show variables like '%slow%';
set GLOBAL slow_query_log=1;
set GLOBAL slow_query_log_file='/var/log/mysql/mysql-slow.log';
set GLOBAL long_query_time = 0.0;
exit
# 再度ログインして確認.
mysql -uisucon -p
show variables like '%slow%';
```
~~**とする.**~~

MySQLの設定ファイル(の一部)を[my.cnf](my.cnf)に設定し, mysqlを再起動する. 

```
./mysql-init.sh
```

## `nginx-init.sh`

nginxの設定ファイルを[nginx.conf](nginx.conf)に設定し, nginxを再起動する.  

```
./nginx-init.sh
```

## `server-setup.sh`

サーバをセットアップする. 具体的には

1. gitレポジトリを作り
2. モニタリングツールをインストールする
3. nginxの設定ファイルを設定する. 

```
./server-setup.sh <reponame>
```

## `slowquery.sh`

MySQLが吐いたslowqueryを見る. ログローテーションを行う場合は現在のログファイルの移動先を`<rotate_filepath>`として渡すことで行うことができる. 実際に使用する際はmysqldumpslowコマンドは調整すること.

```
./slowquery.sh (<rotate_filepath>)
```

## `ssh-init.sh`

ローカルでサーバ接続用の鍵ペアを作成し, `~/.ssh/config` を接続名だけで接続できるようにアップデートする.

```
./ssh-init.sh <hostname> <ip address> <username>
```