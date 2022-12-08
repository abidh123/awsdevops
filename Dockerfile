FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|                                                                             g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install httpd -y
RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf
RUN echo "<h1>Welcome to StackSimplify - APP-1</h1>" > /var/www/html/index.html
RUN mkdir /var/www/html/app2
RUN echo "<h1>Welcome to Stack Simplify - APP-2</h1>" >  /var/www/html/app2/index.html                                                                             x.html
ENTRYPOINT ["/usr/sbin/httpd","-D","FOREGROUND"]
