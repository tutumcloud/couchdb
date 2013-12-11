tutum-docker-couchdb
=====================

Base docker image to run a CouchDB server


Usage
-----

To create the image `tutum/couchdb`, execute the following command on the tutum-couchdb folder:

	sudo docker build -t tutum/couchdb .


Running the CouchDB server
---------------------------

Run the following command to start rabbitmq:

	ID=$(sudo docker run -d -p 5984 tutum/rabbitmq)


It will store the new container ID (like `d35bf1374e88`) in $ID. Get the allocated external port:

	sudo docker port $ID 5984


It will print the allocated port (like 47283).

Done!
