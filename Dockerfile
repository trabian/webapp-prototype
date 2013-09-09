FROM centos:6.4

RUN yum install -y git

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum install -y npm

RUN yum install -y ruby rubygems

# Install libraries for PhantomJS
RUN yum install -y freetype fontconfig

ADD . /src

RUN npm install -g grunt-cli

RUN gem install bundler

RUN cd /src; rm -Rf node_modules; npm install; bundle install
