#!/bin/bash
docker-compose stop redis #停止容器
docker-compose rm redis #删除容器
docker-compose build redis # 重建镜像
docker-compose up -d redis # 重新构建容器，并启动
