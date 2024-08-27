FROM nginx:1.27.1

LABEL maintainer="poker"

# reset nginx
ENV nginxWww /usr/share/nginx/html
RUN rm -rf ${nginxWww}/* \
    && mkdir -p ${nginxWww} \
    && mkdir -p /var/log/containers

COPY ngx_http_vhost_traffic_status_module.so /etc/nginx/modules/

RUN echo "load_module modules/ngx_http_vhost_traffic_status_module.so;" >> /etc/nginx/nginx.conf.tmp && \
   cat /etc/nginx/nginx.conf >> /etc/nginx/nginx.conf.tmp && \
   mv /etc/nginx/nginx.conf.tmp /etc/nginx/nginx.conf

COPY /maven/nebula-lobby/ ${nginxWww}/

# set up our nginx config and scripts
COPY nginx.conf /etc/nginx/nginx.conf

# expose port 80 for the web server
EXPOSE 80

# run nginx start script
CMD ["nginx"]