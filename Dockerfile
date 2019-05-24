FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
ENV GRAV_VERSION 1.6.9
COPY ["start.sh", "/root/start.sh"]
RUN chmod +x /root/start.sh
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git wget curl nginx php7.2-fpm php7.2-gd php7.2-cli php7.2-curl php7.2-mbstring php7.2-xml php7.2-zip php7.2-dom unzip
RUN sed -i "s|gzip  on;|gzip  on; etag  off; server_tokens off; gzip_types text/css application/x-javascript;|" /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-available/default
RUN rm /etc/nginx/sites-enabled/default
COPY site.conf /etc/nginx/conf.d/site.conf
VOLUME ["/app"]
WORKDIR /root
EXPOSE 80
ENTRYPOINT /root/start.sh