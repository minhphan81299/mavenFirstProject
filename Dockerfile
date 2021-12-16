FROM tomcat:jdk11-corretto

# Copy war file to tomcat
COPY target/travelblog-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/

# Expose the port

# Running the tomcat server
CMD ["catalina.sh", "run"]
