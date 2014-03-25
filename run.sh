#!/bin/bash

#enable job control in script
set -m

#run CouchDB in background
couchdb &

#set password for amdin account
sleep 3
if [ ! -f /.couchdb_admin_created ]; then
	/create_couchdb_admin_user.sh
fi

#bring couchdb to foreground
fg %1
