#!/bin/bash

docker exec -it rr_app /bin/bash -c "php /usr/local/bin/composer $1 $2 $3 $4"
