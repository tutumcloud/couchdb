FROM ubuntu:saucy
MAINTAINER FENG, HONGLIN <hfeng@tutum.co>

#install CouchDB
RUN sudo apt-get update
RUN sudo apt-get install -y couchdb 
RUN mkdir /var/run/couchdb

EXPOSE 5984
CMD sudo couchdb
