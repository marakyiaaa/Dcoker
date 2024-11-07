FROM nginx

WORKDIR /home/

COPY server.c .
COPY script.sh .

RUN apt-get update && apt install -y gcc spawn-fcgi libfcgi-dev \
    && rm -rf /var/lib/apt/lists/* \
    && chmod 777 script.sh \
    && touch /var/run/nginx.pid \
    && chown -R nginx:nginx /var/run/nginx.pid \
    && chown -R nginx:nginx /var/run /var/cache/nginx

ENTRYPOINT ["bash", "script.sh"]