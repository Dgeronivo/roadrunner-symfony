FROM ghcr.io/roadrunner-server/roadrunner:2023.3 AS roadrunner
FROM php:8.2-cli

ARG HOST_UID=1000
ARG HOST_GID=1000

COPY --from=roadrunner /usr/bin/rr /usr/local/bin/rr
COPY --from=composer:2.2 /usr/bin/composer /usr/local/bin/composer

RUN apt-get update
RUN apt-get -y install git

RUN docker-php-ext-install sockets

WORKDIR /var/www/html

# this is not work. Volume remove all vendor from image
#COPY ./composer.* ./
#RUN composer install -n --no-ansi --no-suggest --prefer-dist

COPY . /var/www/html

RUN userdel -f www-data &&\
    if getent group www-data ; then groupdel www-data; fi &&\
    groupadd -g ${HOST_GID} www-data &&\
    useradd -l -u ${HOST_UID} -g www-data www-data &&\
    install -d -m 0755 -o www-data -g www-data /home/www-data &&\
    chown --changes --silent --no-dereference --recursive \
          --from=33:33 ${HOST_UID}:${HOST_GID} \
        /var/www/html

USER www-data

#ENTRYPOINT ["php", "simpleStart.php"] # just start container

CMD bash -c "composer install && rr serve"
