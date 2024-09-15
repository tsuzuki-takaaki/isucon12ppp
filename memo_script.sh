#!/bin/bash

# serviceの停止(前から止めていく)
sudo systemctl stop nginx
sudo systemctl stop isuports.service
sudo systemctl stop mysql

# TODO: Please refactor
ssh isu2 sudo systemctl stop nginx
ssh isu2 sudo systemctl stop isuports.service
ssh isu2 sudo systemctl stop mysql

ssh isu3 sudo systemctl stop nginx
ssh isu3 sudo systemctl stop isuports.service
ssh isu3 sudo systemctl stop mysql
# /etcをuserレベルで管理している/home/isuconetc/を、ほかserverにscpする
# isu2,isu3の設定は/etc/hostsをいじるかsshconfig書くか
# nginxとかのserverによって振り分ける系はこれやめた方がいいかも
# systemd, mysqld
scp -r etc/ isu2:~/
scp -r etc/ isu3:~/

# Applicationの設定も同様にcopy
# sizeでかいのと、path指定本当にこれで正解？
# See man scp
scp -r webapp/ isu2:~/
scp -r webapp/ isu3:~/
scp /home/isucon/env.sh isu2:/home/isucon/
scp /home/isucon/env.sh isu3:/home/isucon/

# serviceの再起動(systemd unit fileを触った場合は、sudo systemctl daemon reload)
# 後ろから上げていく
sudo systemctl start mysql
sudo systemctl start isuports.service
sudo systemctl start nginx

ssh isu2 sudo systemctl start mysql
ssh isu2 sudo systemctl start isuports.service
ssh isu2 sudo systemctl start nginx

ssh isu3 sudo systemctl start mysql
ssh isu3 sudo systemctl start isuports.service
ssh isu3 sudo systemctl start nginx
