FROM tomcat:9.0
# Copy war file to tomcat
COPY target/* /usr/local/tomcat/webapps/

# Expose the port
EXPOSE 8080

# Running the tomcat server
CMD ["catalina.sh", "run"]
