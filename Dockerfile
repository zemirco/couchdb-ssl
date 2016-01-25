
FROM klaemo/couchdb

# install wget to download nginx signing key
RUN apt-get update && apt-get install -y wget

# install latest nginx
# http://nginx.org/en/linux_packages.html#distributions
# https://gist.github.com/Globegitter/685e3739c0f181bda3ec
RUN wget -O - http://nginx.org/keys/nginx_signing.key | apt-key add -
RUN echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" | tee -a /etc/apt/sources.list
RUN echo "deb-src http://nginx.org/packages/mainline/debian/ jessie nginx" | tee -a /etc/apt/sources.list

RUN apt-get update && apt-get install -y nginx

# add config and dummy certificates for localhost
ADD nginx.conf /etc/nginx/
ADD server.crt /etc/nginx/certs/server.crt
ADD server.key /etc/nginx/certs/server.key
ADD dhparams.pem /etc/nginx/certs/dhparams.pem
# ADD chain.pem /etc/nginx/certs/chain.pem

ADD entrypoint-nginx.sh /

ENTRYPOINT ["/entrypoint-nginx.sh"]

