# Use a base image with Java 11
FROM openjdk:11

# Copy the packaged JAR file into the container
COPY target/myapp.jar myapp.jar

# Define the command to run the JAR file when the container starts
ENTRYPOINT ["java", "-jar", "/myapp.jar"]
