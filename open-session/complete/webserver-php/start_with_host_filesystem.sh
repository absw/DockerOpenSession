#!/usr/bin/env bash

docker run --name webserver -d --rm -p 80:80 \
	-v $(pwd)/html:/var/www/html php:7.2-apache
