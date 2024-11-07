FROM nginx

WORKDIR /home/

RUN useradd -m myuser

COPY server.c .
COPY script.sh .
COPY /nginx/nginx.conf /etc/nginx/nginx.conf

RUN apt-get update && apt install -y gcc spawn-fcgi libfcgi-dev \
    && rm -rf /var/lib/apt/lists/* \
    && chmod 777 script.sh \
    && mkdir -p /var/cache/nginx /var/run \
    && chown -R myuser:myuser /var/cache/nginx /var/run /home \
    && touch /var/run/nginx.pid \
    && chown -R myuser:myuser /var/run/nginx.pid \
    && chmod u-s /usr/bin/newgrp \
    && chmod u-s /usr/bin/umount \
    && chmod u-s /usr/bin/chsh \
    && chmod g-s /usr/bin/expiry \
    && chmod u-s /usr/bin/gpasswd \
    && chmod u-s /usr/bin/su \
    && chmod u-s /usr/bin/chfn \
    && chmod g-s /usr/sbin/unix_chkpwd \
    && chmod u-s /usr/bin/mount \
    && chmod g-s /usr/bin/chage \
    && chmod u-s /usr/bin/passwd

## Переключение на пользователя
USER myuser

# Добавление HEALTHCHECK
HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1

ENTRYPOINT ["bash", "script.sh"]