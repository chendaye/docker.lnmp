## php fastdfs扩展安装
```bash
apt-get update
apt-get install -y git gcc  make automake autoconf libtool  wget openssl libssl-dev

 cd /usr/local/src  \
  &&    git clone https://github.com/happyfish100/libfastcommon.git --depth 1        \
  &&    git clone https://github.com/happyfish100/fastdfs.git --depth 1    

   cd libfastcommon/   \
  &&    ./make.sh && ./make.sh install  \
  &&    cd ../  \
  &&    cd fastdfs/   \
  &&    ./make.sh && ./make.sh install  

  cd /usr/local/src/fastdfs/php_client \
  && /usr/local/bin/phpize \
  &&  ./configure --with-php-config=/usr/local/bin/php-config \
  && make 
  && make install

  cd /usr/local/src/fastdfs/conf \
  && cp client.conf /etc/fdfs/ \
  # && cp fastdfs_client.ini /usr/local/php/etc \
  && cat fastdfs_client.ini >> /usr/local/php/etc/php.ini
  && cd /etc/fdfs/ \
  && sed -i "s/^tracker_server=.*$/tracker_server=$IP:$FDFS_PORT/g" /etc/fdfs/client.conf 


# /usr/local/lib/php/extensions/no-debug-non-zts-20180731
```