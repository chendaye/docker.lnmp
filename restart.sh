#!/bin/bash
docker-compose stop
service docker restart
mv /data/web/fastdfs/tracker/data /data/web/fastdfs/tracker/d
mkdir /data/web/fastdfs/tracker/data
docker-compose up -d
docker-compose ps
