# Use an official Java runtime as base image
FROM maven:3.8.6-openjdk-17 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the source code to the container
COPY . .

# Build the JAR
RUN mvn clean package -DskipTests

# Use a smaller Java runtime for running the app
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy only the built JAR from the first stage
COPY --from=builder /app/target/*.jar app.jar

# Run the application
CMD ["java", "-jar", "app.jar"]