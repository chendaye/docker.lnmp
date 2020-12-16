#!/bin/bash
docker-compose stop nginx #停止容器
docker-compose rm nginx #删除容器
docker-compose build nginx # 重建镜像
docker-compose up -d nginx # 重新构建容器，并启动
