# Use a Maven image for building the project
FROM maven:3.8-openjdk-17 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:resolve

# Copy the rest of the project files
COPY . .

# Package the Karate project
RUN mvn clean package -DskipTests

# Use a lightweight JRE image for running the tests
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the compiled JAR from the build stage
COPY --from=build /app/target/*.jar karate.jar

# Set the entry point to run Karate tests
ENTRYPOINT ["java", "-jar", "karate.jar"]
ENTRYPOINT ["java", "-jar", "karate.jar", "-Dkarate.env=qa"]
