FROM tomcat:10.1-jdk17-temurin

# Remove all default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR as ROOT.war to serve at http://localhost:8099/
COPY target/dictionary.war /usr/local/tomcat/webapps/ROOT.war

# Set custom Tomcat config (for port 8099)
COPY server.xml /usr/local/tomcat/conf/server.xml

# Add wait script
COPY wait-for-mysql.sh /wait-for-mysql.sh
RUN apt-get update && apt-get install -y netcat-traditional && chmod +x /wait-for-mysql.sh

EXPOSE 8099

CMD ["/wait-for-mysql.sh"]
