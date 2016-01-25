#!/bin/bash
set -e;

# chown _nginx: /usr/local/etc/stud/stud.pem
# chown _nginx: /var/run/stud
# chown -R _nginx: /usr/local/var/run/stud /usr/local/etc/stud
# chmod 0770 /usr/local/var/run/stud
#
# chmod 664 /usr/local/etc/stud/*.conf
# chmod 600 /usr/local/etc/stud/stud.pem

mkdir /var/run/nginx
# useradd -d /var/run/nginx _nginx
# gosu _nginx nginx
# gosu _nginx nginx

nginx -g 'daemon on;'

exec /docker-entrypoint.sh couchdb
