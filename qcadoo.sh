#!/bin/bash
# install qcadoo

#docker stop qcadoo_mes
#docker rm -fv qcadoo_mes
#docker stop db_qcadoo
#docker rm -fv db_qcadoo

#docker build  -t="qcadoo" .

#docker network create --subnet=172.17.0.0/16 mynet
#docker run --name db_qcadoo -e POSTGRES_USER=qcadoo-mes -e POSTGRES_PASSWORD=qcadoo-mes1685 -e POSTGRES_DB=mes -e PGDATA=/var/lib/postgresql/data/pgdata -v /home/jwang/db/qcadoo/postgresql:/var/lib/postgresql/data/pgdata --net docker0 --ip 172.17.0.2 -d postgres:9.5

docker run --name db_qcadoo -e POSTGRES_USER=qcadoo-mes -e POSTGRES_PASSWORD=qcadoo-mes1685 -e POSTGRES_DB=mes -e PGDATA=/var/lib/postgresql/data/pgdata -v /home/jwang/db/qcadoo/postgresql:/var/lib/postgresql/data/pgdata -d postgres:9.5
# if error:
# docker run --name qcadoo_mes -p 8075:8080 --link db_qcadoo:db_qcadoo -d -v /home/jwang/db/qcadoo/logs:/qcadoo/mes/mes-application/target/tomcat-archiver/mes-application/logs --entrypoint "/bin/bash" -i -t  qcadoo
# docker exec -ti qcadoo_mes bash
# then .../startup.sh

# accorfing info above, need to change info in ./qcadoo/mes/mes-application/conf/db.properties

docker run --name qcadoo_mes -p 8075:8080 --link db_qcadoo:db_qcadoo -d -v /home/jwang/db/qcadoo/logs:/qcadoo/mes/mes-application/target/tomcat-archiver/mes-application/logs qcadoo
