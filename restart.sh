#!/bin/bash
docker-compose stop
service docker restart
rm -rf /data/web/fastdfs/tracker/d
mv /data/web/fastdfs/tracker/data /data/web/fastdfs/tracker/d
mkdir /data/web/fastdfs/tracker/data
docker-compose up -d
docker-compose restart
docker-compose ps
