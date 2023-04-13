# Use an OpenJDK 8 runtime as the base image
FROM openjdk:8-jre-alpine

# Set the working directory
WORKDIR /app

# Copy the POM.xml file to the container
COPY pom.xml .

# Resolve dependencies specified in the POM.xml file
RUN ["mvn", "dependency:resolve"]

# Copy the source code to the container
COPY . .

# Compile the Java source code and package it as a JAR file
RUN ["mvn", "package"]

# Set the command to run when the container starts
CMD ["java", "-jar", "target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar"]
