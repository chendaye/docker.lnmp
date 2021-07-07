
#!/bin/bash
docker-compose stop php #停止容器
docker-compose rm php  #删除容器
docker-compose build php # 重建镜像
docker-compose up -d php # 重新构建容器，并启动
