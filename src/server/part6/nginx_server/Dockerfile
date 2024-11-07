FROM nginx

WORKDIR /home/

COPY /nginx/nginx.conf /etc/nginx/nginx.conf

RUN apt-get update && apt install -y gcc spawn-fcgi libfcgi-dev \
    && rm -rf /var/lib/apt/lists/* \
    && touch /var/run/nginx.pid \
    && chown -R nginx:nginx /var/run/nginx.pid
