FROM debian:bookworm


RUN     apt update && apt upgrade
RUN     apt install wget php php-fpm php-mysqli php-curl php-dom php-exif php-fileinfo php-xml php-zip php-phar php-tokenizer -y
RUN	wget -P var/www/html/adminer https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php


COPY ./tools/script.sh /etc/script.sh
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d


ENTRYPOINT ["/bin/bash", "/etc/script.sh"]
