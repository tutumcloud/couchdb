#!/bin/bash

#enable job control in script
set -m

#run CouchDB in background
# couchdb &
/usr/bin/couchdb -a /etc/couchdb/default.ini -a /etc/couchdb/local.ini -b -r 5 -p /var/run/couchdb/couchdb.pid -o /dev/null -e /dev/null -R &

#set password for admin account
if [ ! -f /etc/couchdb/.couchdb_admin_created ]; then
	/create_couchdb_admin_user.sh
fi

#bring couchdb to foreground
fg
