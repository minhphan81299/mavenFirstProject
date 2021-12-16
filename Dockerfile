FROM tomcat:jdk9-openjdk
# Copy war file to tomcat
COPY target/travelblog-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/

# Expose the port
EXPOSE 8080

# Running the tomcat server
CMD ["catalina.sh", "run"]
