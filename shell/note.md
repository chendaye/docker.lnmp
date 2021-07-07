# 常用docker命令

```bash
# 列出所有容器
docker ps -aq

# 停止所有容器
docker stop $(docker ps -aq)

# 删除所有的容器
docker rm $(docker ps -aq)

# 删除所有的镜像
docker rmi $(docker images -q)

```

# fastdfs

```bash
docker build --network host ./fastdfs 

# 修改镜像名称
dockerlnmp_redis
docker tag 582b01d85408 dockerlnmp_fastdfs:latest
images
```