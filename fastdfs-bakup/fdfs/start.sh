mkdir -p /var/local/fdfs/storage/data /var/local/fdfs/tracker; 
ln -s /var/local/fdfs/storage/data/ /var/local/fdfs/storage/data/M00; 

sed -i "s/listen\ .*$/listen\ $WEB_PORT;/g" /usr/local/nginx/conf/nginx.conf; 
sed -i "s/http.server_port=.*$/http.server_port=$WEB_PORT/g" /etc/fdfs/storage.conf; 

if [ "$IP" = "" ]; then 
IP=172.17.0.2; 
fi 
sed -i "s/^tracker_server=.*$/tracker_server=$IP:$FDFS_PORT/g" /etc/fdfs/client.conf; 
sed -i "s/^tracker_server=.*$/tracker_server=$IP:$FDFS_PORT/g" /etc/fdfs/storage.conf; 
sed -i "s/^tracker_server=.*$/tracker_server=$IP:$FDFS_PORT/g" /etc/fdfs/mod_fastdfs.conf; 

/etc/init.d/fdfs_trackerd start; 
/etc/init.d/fdfs_storaged start; 
/usr/local/nginx/sbin/nginx; 
tail -f /usr/local/nginx/logs/access.log