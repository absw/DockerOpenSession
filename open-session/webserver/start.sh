#!/usr/bin/env bash

docker run --name webserver -d --rm -p 80:80 httpd
