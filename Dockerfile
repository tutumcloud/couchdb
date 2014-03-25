FROM ubuntu:saucy
MAINTAINER FENG, HONGLIN <hfeng@tutum.co>

#install CouchDB
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y couchdb 
RUN mkdir /var/run/couchdb
RUN sed -i -r 's/;bind_address = 127.0.0.1/bind_address = 0.0.0.0/' /etc/couchdb/local.ini

EXPOSE 5984
CMD sudo couchdb
