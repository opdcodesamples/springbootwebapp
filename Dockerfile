FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} myspringboothelloapp.jar
ENTRYPOINT ["java","-jar","/myspringboothelloapp.jar"]