#!/bin/bash -eu

#ISUCONのアプリフォルダを指定
BASE_DIR=/home/isucon/isucon5-qualify

cd ${BASE_DIR}; git pull;

#Database initialize

sudo systemctl stop mysql
sudo ls /var/log/mysql/error.log
sudo rm -f /var/lib/mysql/slow.log
sudo systemctl start mysql;


#Go app initialize
rm -f ${BASE_DIR}/webapp/go/server;
make -C ${BASE_DIR}/webapp/go app;
sudo systemctl restart isuxi.go.service;
sudo systemctl daemon-reload

#nginx initialize
sudo rm -f /var/log/nginx/access.log /var/log/nginx/error.log
sudo systemctl restart nginx
