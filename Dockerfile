FROM tomcat:latest

COPY ./xdstools4.war /usr/local/tomcat/webapps/xdstools4.war
COPY ./server.xml /usr/local/tomcat/conf/

EXPOSE 8080 8888 8443
# CMD ["catalina.sh", "run"]
