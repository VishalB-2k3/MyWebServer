# Dockerfile
FROM openjdk:11
COPY target/myapp.jar myapp.jar
ENTRYPOINT ["java", "-jar", "/myapp.jar"]
