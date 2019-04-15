FROM php:7.3.4-fpm
LABEL maintainer="chendaye666<chendaye666@gmail.com>"

ENV TZ "Asia/Shanghai"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get install -y \
# 相关依赖必须手动安装
        libmemcached-dev \
        zlib1g-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libxml2-dev \
        libzip-dev \
        curl \
    # 安装扩展
    && docker-php-ext-install zip \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) bcmath \
    && docker-php-ext-install -j$(nproc) ctype \
    && docker-php-ext-install -j$(nproc) json \
    && docker-php-ext-install -j$(nproc) mbstring \
    && docker-php-ext-install -j$(nproc) tokenizer \
    && docker-php-ext-install -j$(nproc) xml \
    && docker-php-ext-install -j$(nproc) simplexml \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo \
    && docker-php-ext-install opcache \
    && docker-php-ext-install mysqli \
    && pecl install redis \
    && pecl install memcached \
    && pecl install mongodb \
    && pecl install xdebug \
    && docker-php-ext-enable redis memcached mongodb xdebug \
    && rm -r /var/lib/apt/lists/*
    # 安装composer并允许root用户运行
    ENV COMPOSER_ALLOW_SUPERUSER=1
    ENV COMPOSER_NO_INTERACTION=1
    ENV COMPOSER_HOME=/usr/local/share/composer
    RUN mkdir -p /usr/local/share/composer \
        && curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
        && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
        && rm -f /tmp/composer-setup.* \
        # 配置composer中国全量镜像
        && composer config -g repo.packagist composer https://packagist.phpcomposer.com
