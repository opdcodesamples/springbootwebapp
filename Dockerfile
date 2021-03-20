FROM openjdk:8-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

# This was the easiest and most straightform way of creating an image
#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} myspringboothelloapp.jar
#ENTRYPOINT ["java","-jar","/myspringboothelloapp.jar"]

# Now we are going to create layered image
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /myspringboothelloapp/lib
COPY ${DEPENDENCY}/META-INF /myspringboothelloapp/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /myspringboothelloapp
ENTRYPOINT ["java","-cp","myspringboothelloapp:myspringboothelloapp/lib/*","guru.springframework.SpringBootWebApplication"]