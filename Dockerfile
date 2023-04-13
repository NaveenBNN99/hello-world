# Use an OpenJDK 8 runtime as the base image for the build stage
FROM maven:3.6.3-jdk-8 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:resolve
COPY src src
RUN mvn package

# Use an OpenJDK 8 runtime as the base image for the runtime stage
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar .
CMD ["java", "-jar", "spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar"]
