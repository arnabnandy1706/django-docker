FROM centos:latest
LABEL maintainer "Arnab Kumar Nandy <arnab.nandy1991@gmail.com>"
RUN yum install epel-release -y
RUN yum install gcc openssl-devel bzip2-devel wget curl make sqlite3-devel sqlite-devel -y
WORKDIR /tmp/
RUN wget https://www.python.org/ftp/python/3.6.6/Python-3.6.6.tgz
RUN tar xzf Python-3.6.6.tgz
WORKDIR /tmp/Python-3.6.6
RUN ./configure
RUN make
RUN make install
RUN pip3 install django
RUN mkdir /opt/django
WORKDIR /opt/django
RUN django-admin startproject Treasuregram
RUN python3 Treasuregram/manage.py startapp main_app
ADD Treasuregram/settings.py /opt/django/Treasuregram/Treasuregram/settings.py
ADD Treasuregram/urls.py /opt/django/Treasuregram/Treasuregram/urls.py
ADD main_app/urls.py /opt/django/Treasuregram/main_app/urls.py
ADD main_app/views.py /opt/django/Treasuregram/main_app/views.py
ADD main_app/admin.py /opt/django/Treasuregram/main_app/admin.py
ADD main_app/models.py /opt/django/Treasuregram/main_app/models.py
ADD main_app/templates/index.html /opt/django/Treasuregram/main_app/templates/index.html
ADD main_app/static/images/location-icon.png /opt/django/Treasuregram/main_app/static/images/location-icon.png
ADD main_app/static/images/logo.png /opt/django/Treasuregram/main_app/static/images/logo.png
ADD main_app/static/images/material-icon.png /opt/django/Treasuregram/main_app/static/images/material-icon.png
ADD main_app/static/images/value-icon.png /opt/django/Treasuregram/main_app/static/images/value-icon.png
RUN python3 Treasuregram/manage.py makemigrations
RUN python3 Treasuregram/manage.py migrate --run-syncdb
RUN echo "from django.contrib.auth.models import User;User.objects.create_superuser('admin', 'admin@example.com', 'root123')" | python3 Treasuregram/manage.py shell
EXPOSE 8000
CMD ["python3", "Treasuregram/manage.py", "runserver", "0.0.0.0:8000"]
