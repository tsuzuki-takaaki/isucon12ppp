#!/bin/bash

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
