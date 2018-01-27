FROM tomcat:latest
# please note .dockerignore if files change
RUN mkdir /path 
RUN mkdir /path/to 
RUN mkdir /path/to/my/ 
RUN mkdir /path/to/my/external 
RUN mkdir /path/to/my/external/cache 
COPY ./server.xml /usr/local/tomcat/conf/
COPY ./xdstools5.war /usr/local/tomcat/webapps/

EXPOSE 8080 8888 8443
# CMD ["catalina.sh", "run"]
