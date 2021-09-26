FROM centos:latest
RUN yum install -y httpd \
zip \
unzip
ADD
WORKDIR /var/www/html
RUN unzip kindle.zip
RUN cp -rvf markup-kindle/*
RUN rm -rf markup-kindle kindle.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
