#!/bin/sh

docker run -d --name mariadb-client recipedude/apline-mariadb-client
docker logs nfs-client
