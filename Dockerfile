FROM centos:latest
LABEL maintainer "Arnab Kumar Nandy <arnab.nandy1991@gmail.com>"
RUN yum install epel-release -y
RUN yum install gcc openssl-devel bzip2-devel wget curl make sqlite3-devel sqlite-devel mariadb-deve mariadb-libs mariadb -y
WORKDIR /tmp/
RUN wget https://www.python.org/ftp/python/3.6.6/Python-3.6.6.tgz
RUN tar xzf Python-3.6.6.tgz
WORKDIR /tmp/Python-3.6.6
RUN ./configure
RUN make
RUN make install
RUN yum install mariadb-devel mariadb mysql mariadb-libs -y
RUN pip3 install django
RUN pip3 install mysqlclient
RUN mkdir /opt/django
WORKDIR /opt/django
ENV MYSQL_DB_NAME=appdb
ENV MYSQL_USER_NAME=django
ENV MYSQL_PASSWORD=root123
ENV MYSQL_HOST=0.0.0.0
ENV MYSQL_PORT=33060
RUN django-admin startproject Clinicaldasboard
RUN python3 Clinicaldasboard/manage.py startapp Medicine
ADD Treasuregram/settings.py /opt/django/Clinicaldasboard/Clinicaldasboard/settings.py
ADD Treasuregram/urls.py /opt/django/Clinicaldasboard/Clinicaldasboard/urls.py
ADD Medicine/urls.py /opt/django/Clinicaldasboard/Medicine/urls.py
ADD Medicine/views.py /opt/django/Clinicaldasboard/Medicine/views.py
ADD Medicine/admin.py /opt/django/Clinicaldasboard/Medicine/admin.py
ADD Medicine/models.py /opt/django/Clinicaldasboard/Medicine/models.py
ADD Medicine/templates/index.html /opt/django/Clinicaldasboard/Medicine/templates/index.html
ADD Medicine/static/images/location-icon.png /opt/django/Clinicaldasboard/Medicine/static/images/location-icon.png
ADD Medicine/static/images/logo.png /opt/django/Clinicaldasboard/Medicine/static/images/logo.png
ADD Medicine/static/images/material-icon.png /opt/django/Clinicaldasboard/Medicine/static/images/material-icon.png
ADD Medicine/static/images/value-icon.png /opt/django/Clinicaldasboard/Medicine/static/images/value-icon.png
ADD Medicine/static/images/company-icon.png /opt/django/Clinicaldasboard/Medicine/static/images/company-icon.png
RUN python3 Clinicaldasboard/manage.py makemigrations
RUN python3 Clinicaldasboard/manage.py migrate --run-syncdb
RUN echo "from django.contrib.auth.models import User;User.objects.create_superuser('admin', 'admin@example.com', 'root123')" | python3 Clinicaldasboard/manage.py shell
EXPOSE 8000
CMD ["python3", "Clinicaldasboard/manage.py", "runserver", "0.0.0.0:8000"]
