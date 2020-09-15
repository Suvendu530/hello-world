FROM centos:latest

LABEL description="Hello AEM in the World of Technology"

RUN yum update -y \
&& yum install httpd -y \
&& yum install git -y \
&& yum install php -y \
&& yum install mysql -y

EXPOSE 80

COPY ../src/index.php /var/www/html/
COPY /etc/hosts /src 
RUN cp /src/hosts /var/www/html/
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D","FOREGROUND"]
