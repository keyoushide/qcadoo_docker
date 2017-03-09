#
# qcadoo Dockerfile
#
# docker build -t="qcadoo" .
# docker run --name db_qcadoo -e POSTGRES_USER=qcadoo-mes -e POSTGRES_PASSWORD=qcadoo-mes1685 -e POSTGRES_DB=mes -d postgres:9.5
# docker run --name qcadoo_mes --link db_qcadoo:db_qcadoo -d qcadoo

# Pull base images.
FROM maven:3.2.5-jdk-8

MAINTAINER Jiahua <jiahuawang123@gmail.com>

#ADD qcadoo-mes-1.6.15 /qcadoo
ADD src /qcadoo

# Install
RUN 	apt-get update \
	&& apt-get install -y postgresql-client \
	&& apt-get install -y vim \

	&& cd /qcadoo/qcadoo-super-pom-open \
	&& mvn clean install \
	&& cd /qcadoo/qcadoo-maven-plugin \
	&& mvn clean install \
	&& cd /qcadoo/qcadoo \
	&& mvn clean install -Pfast \
	&& cd /qcadoo/mes \
	&& mvn clean install \
	&& cd /qcadoo/mes/mes-application \
	&& mvn clean install -Ptomcat,extra -Dprofile=tomcat \
	&& cd /qcadoo/mes/mes-application/target/tomcat-archiver/mes-application \
	&& chmod a+x ./bin/*.sh

EXPOSE 8080

ENTRYPOINT ["/qcadoo/mes/mes-application/target/tomcat-archiver/mes-application/bin/startup.sh"]
