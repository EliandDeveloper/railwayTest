FROM openjdk:17
LABEL authors="MSI"

COPY target/serverside-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
