FROM ubuntu:saucy
MAINTAINER FENG, HONGLIN <hfeng@tutum.co>

#install CouchDB
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y couchdb 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl pwgen
RUN mkdir /var/run/couchdb
RUN sed -i -r 's/;bind_address = 127.0.0.1/bind_address = 0.0.0.0/' /etc/couchdb/local.ini

ADD create_couchdb_admin_user.sh /create_couchdb_admin_user.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 5984
CMD ["/run.sh"]
