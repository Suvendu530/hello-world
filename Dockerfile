FROM centos:latest

# Install Apache
RUN yum -y update
RUN yum -y install httpd httpd-tools

# Install EPEL Repo
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
  && rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-8.rpm

# Install PHP
RUN dnf module enable php:remi-7.4 -y

# Update Apache Configuration
RUN sed -E -i -e '/<Directory "\/var\/www\/html">/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
RUN sed -E -i -e 's/DirectoryIndex (.*)$/DirectoryIndex index.php \1/g' /etc/httpd/conf/httpd.conf

EXPOSE 80

COPY src/index.php /var/www/html/
COPY src/hosts /src/
RUN cp /src/hosts /var/www/html/

# Start Apache
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
