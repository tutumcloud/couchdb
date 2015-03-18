#!/bin/bash

if [ -f /var/lib/couchdb/.couchdb_admin_created ]; then
    echo "CouchDB 'admin' user already created!"
    exit 0
fi

#generate pasword
PASS=${COUCHDB_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${COUCHDB_PASS} ] && echo "preset" || echo "random" )

RET=7
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of CouchDB service startup"
    sleep 5
    curl -s http://127.0.0.1:5984 >/dev/null 2>&1
    RET=$?
done

echo "=> Creating an admin user with a ${_word} password in CouchDB"
curl -s -X PUT http://127.0.0.1:5984/_config/admins/admin -d '"'${PASS}'"'
echo "=> Done!"  
touch /var/lib/couchdb/.couchdb_admin_created
    
echo "========================================================================"
echo "You can now connect to this CouchDB server using:"
echo ""
echo "    curl http://admin:$PASS@<host>:<port>"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
