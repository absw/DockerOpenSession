#!/usr/bin/env bash

docker run --name webserver -d --rm -p 80:80 -v webpages:/usr/local/apache2/htdocs httpd
