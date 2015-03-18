#!/bin/bash

#enable job control in script
set -m

#run CouchDB in background
couchdb &

#set password for admin account
if [ ! -f /var/lib/couchdb/.couchdb_admin_created ]; then
	/create_couchdb_admin_user.sh
fi

#bring couchdb to foreground
fg
