#！/bin/cd sh
cd /data/web/
dir=$(date +%Y-%m-%d~%H:%M:%S)

mkdir /data/web/backup/$dir
#将数据所在文件夹打包
tar -zcPvf /data/web/backup/$dir/fastdfs.tar.gz fastdfs
tar -zcPvf /data/web/backup/$dir/mysql.tar.gz mysql
tar -zcPvf /data/web/backup/$dir/mongo.tar.gz mongo
#删除改文件夹下超过30天的文件
find /data/web/backup -mtime +5  -exec rm -rf {} \;

