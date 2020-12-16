#!/bin/bash
apt-get update -y
apt-get install -y git php7.2-cli hhvm composer nodejs npm

#安装docker
apt-get remove docker docker-engine docker-ce docker.io
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get update
apt-get install -y docker-ce docker-compose

#目录
#data
mkdir /data

#docker.lnmp
cd /data
git clone git@github.com:chendaye/docker.lnmp.git
cd docker.lnmp
git fetch 
git checkout -b prod origin/prod
git branch --set-upstream-to=origin/prod prod

#web
cd /data
mkdir -p web/www/
cd web/www/
git clone git@github.com:chendaye/lengo.git
cd lengo
git fetch
git checkout -b dev origin/dev
git branch --set-upstream-to=origin/dev dev

#创建server软连接
ln -s /var/www/html/lengo/public server

#创建数据文件夹
mkdir web/backup/
mkdir web/mongo/
mkdir web/mysql/
mkdir web/fastdfs/
mkdir web/fastdfs/storage/
mkdir web/fastdfs/storage/data/
mkdir web/fastdfs/storage/logs/
mkdir web/fastdfs/tracker
mkdir web/fastdfs/tracker/data/
mkdir web/fastdfs/tracker/logs/

#依赖
cd /data/web/www/lengo/
composer install
cd /data/web/www/lengo/client/
npm install

#追加内容
echo "#docker
alias lnmp='cd /data/web/www/docker.lnmp/'
alias demo='cd /data/web/www/'
alias bak='cd /data/web/backup/'
alias lengo='cd /data/web/www/lengo'
alias client='cd /data/web/www/lengo/client'

alias web='docker-compose up -d && docker-compose restart'
alias dphp='docker exec -it long-php /bin/bash'
alias dnginx='docker exec -it long-nginx /bin/bash'
alias dmysql='docker exec -it long-mysql /bin/bash'
alias dredis='docker exec -it long-redis /bin/bash'
alias dmemcached='docker exec -it long-memcached /bin/bash'
alias dmongo='docker exec -it long-mongo /bin/bash'
alias dfastdfs='docker exec -it long-fastdfs /bin/bash'" >> ~/.bashrc

#使生效
source ~/.bashrc