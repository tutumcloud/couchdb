tutum-docker-couchdb
====================

**This image will be deprecated soon. Please use the docker official image:** https://hub.docker.com/_/couchdb/


[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Base docker image to run a CouchDB database server


Usage
-----

To create the image `tutum/couchdb`, execute the following command on the tutum-docker-couchdb folder:

	docker build -t tutum/couchdb .

To run the image and bind to port 5984:

	docker run -d -p 5984:5984 tutum/couchdb

The first time that you run your container, a new user `admin` with all privileges
will be created in CouchDB with a random password. To get the password, check the logs
of the container by running:

	docker logs <CONTAINER_ID>

You will see an output like the following:

	========================================================================
	You can now connect to this CouchDB server using:

	    curl http://admin:BCRmhDz4hT7g@<host>:<port>

	Please remember to change the above password as soon as possible!
	========================================================================

In this case, `BCRmhDz4hT7g` is the password allocated to the `admin` user.

You can now test your deployment:

	curl http://admin:BCRmhDz4hT7g@127.0.0.1:5984/


Setting a specific password for the admin account
-------------------------------------------------

If you want to use a preset password instead of a random generated one, you can
set the environment variable `COUCHDB_PASS` to your specific password when running the container:

	docker run -d -p 5984:5984 -e COUCHDB_PASS="mypass" tutum/couchdb

You can now test your deployment:

	curl http://admin:mypass@127.0.0.1:5984/

Done!

**by http://www.tutum.co**
