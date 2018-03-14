FROM tomcat:latest
# please note .dockerignore if files change
# github released version 5.2.3 external cache
RUN mkdir /path 
RUN mkdir /path/to 
RUN mkdir /path/to/my/ 
RUN mkdir /path/to/my/external 
RUN mkdir /path/to/my/external/cache 
# latest build version external cache build with Release.properties -Dbuild.profile.id=Release
RUN mkdir /your
RUN mkdir /your/external
RUN mkdir /your/external/cache
RUN mkdir /your/external/cache/location 

COPY ./server.xml /usr/local/tomcat/conf/
COPY ./xdstools6.war /usr/local/tomcat/webapps/

EXPOSE 8080 8888 8443
# CMD ["catalina.sh", "run"]
