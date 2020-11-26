FROM tomcat:9.0.40-jdk8-adoptopenjdk-openj9
RUN apt-get update && apt-get install apt-utils && apt-get install maven git mc net-tools -y
WORKDIR /root
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn package -f /root/boxfuse-sample-java-war-hello/pom.xml
RUN cp /root/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/hello-1.0.war
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]
