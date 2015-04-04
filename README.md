Go server Image
=================

This provides a Go server (CI tool) docker image.

## Installation

The installation is as simple as downloading any other docker image.

        docker pull mkulkarni/go-server

## Usage

Go server stores its data at the following location

	/var/lib/go-server       contains the binaries and database
	/etc/go                  contains the pipeline configuration files
	/var/log/go-server       contains the server logs
	/root/.ssh               stores the ssh keys

This Go server data needs to be persisted. The following persists the data on the host at location you chose. 

	docker run -d -p 8080:8153 \ 
	-v location-on-host:/root/.ssh \
	-v location-on-host:/var/lib/go-server \
	-v location-on-host:/etc/go \
	-v location-on-host:/var/log/go-server \ 
	mkulkarni/go-server

This starts up GO server on port 8080. 

## Docker versions

Docker 1.3 onwards are supported 
