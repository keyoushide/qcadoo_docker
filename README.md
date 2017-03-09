# qcadoo mes docker
qcadoo manufacturing execution system
### Installation

```sh
$ cd qcadoo
$ docker build  -t="qcadoo" .
$ docker run --name db_qcadoo -e POSTGRES_USER=qcadoo-mes -e POSTGRES_PASSWORD=qcadoo-mes1685 -e POSTGRES_DB=mes -e PGDATA=/var/lib/postgresql/data/pgdata -v /home/jwang/db/qcadoo/postgresql:/var/lib/postgresql/data/pgdata -d postgres:9.5 4
$ docker run --name qcadoo_mes -p 8075:8080 --link db_qcadoo:db_qcadoo -d -v /home/jwang/db/qcadoo/logs:/qcadoo/mes/mes-application/target/tomcat-archiver/mes-application/logs qcadoo
```
### Note
Installation step 4 maybe failed, because:
 - the default docker container db_qcadoo IP is 172.17.0.2, If not, please change  dbJdbcUrl=jdbc:postgresql://172.17.0.2:5432/mes to dbJdbcUrl=jdbc:postgresql://db_qcadoo's IP:5432/mes in mes/mes-application/conf/tomcat/db.properties, mes/mes-application/target/tomcat-archiver/mes-application/qcadoo/db
 - If docker run error, skip the entrypoint use  command:
 docker run --name qcadoo_mes -p 8075:8080 --link db_qcadoo:db_qcadoo -d -v /home/jwang/db/qcadoo/logs:/qcadoo/mes/mes-application/target/tomcat-archiver/mes-application/logs --entrypoint "/bin/bash" -i -t  qcadoo
then run
docker exec -ti qcadoo_mes bash
/qcadoo/mes/mes-application/target/tomcat-archiver/mes-application/bin/startup.sh



**Free Software**
