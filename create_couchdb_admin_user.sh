#!/bin/bash

if [ -f /.couchdb_admin_created ]; then
    echo "CouchDB 'admin' user already created!"
    exit 0
fi
    
#generate pasword
PASS=${COUCHDB_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${COUCHDB_PASS} ] && echo "preset" || echo "random" )

echo "=> Creating an admin user with a ${_word} password in CouchDB"
curl -s -X PUT http://127.0.0.1:5984/_config/admins/admin -d '"'${PASS}'"'
echo "=> Done!"  
touch /.couchdb_admin_created
    
echo "========================================================================"
echo "You can now connect to this CouchDB server using:"
echo ""
echo "  USERNAME:admin           PASSWORD:$PASS"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
