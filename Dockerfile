# Stage for building the application
FROM maven:3.9.3-eclipse-temurin-17-alpine AS builder

# Copy the Maven configuration files first to download dependencies separately
COPY pom.xml /source/
WORKDIR /source

# Download all the project dependencies and go offline
RUN mvn dependency:go-offline

# Copy the rest of the source code
COPY . /source

# Build the application and execute unit tests without downloading dependencies again
RUN mvn clean package -Dmaven.test.failure.ignore=true

# NEW Stage for handling test reports
FROM scratch AS reporter
COPY --from=builder /source/target/surefire-reports /reports

# Stage for running the application
FROM openjdk:17-jdk-slim AS runtime
WORKDIR /app
COPY --from=builder /source/target/my-application.jar .
CMD ["java", "-jar", "my-application.jar"]
