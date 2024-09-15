#!/bin/bash

# /etcをuserレベルで管理している/home/isuconetc/を、ほかserverにscpする
# isu2,isu3の設定は/etc/hostsをいじるかsshconfig書くか
# nginxとかのserverによって振り分ける系はこれやめた方がいいかも
# systemd, mysqld
scp -r etc/ isu2:etc/
scp -r etc/ isu3:etc/

