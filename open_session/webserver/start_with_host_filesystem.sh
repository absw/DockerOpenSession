#!/usr/bin/env bash

docker run --name webserver -d --rm -p 80:80 -v $(pwd)/html:/usr/local/apache2/htdocs httpd
