FROM centos:latest
LABLE description="Hello AEM in the World of Technology"

RUN yum update -y \
&& yum install httpd -y \
&& yum install git -y \
&& yum install mod-php -y \
&& yum install mysql -y

COPY ../src/index.php /var/www/html/
COPY /etc/hosts /src 

RUN cp /src/hosts /var/www/html/

EXPOSE 80

ENTRYPOINT["/usr/sbin/httpd"]
CMD["-D","FOREGROUND"]
