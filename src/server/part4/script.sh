#!/bin/bash

gcc server.c -o server -lfcgi
spawn-fcgi -p 8080 ./server
nginx -t
nginx -g "daemon off;"
service nginx start
nginx -s reload