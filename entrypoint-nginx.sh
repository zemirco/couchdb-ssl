#!/bin/bash
set -e;

# start nginx in the background
nginx -g 'daemon on;'

# start couchdb
exec /docker-entrypoint.sh couchdb
