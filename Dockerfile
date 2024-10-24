# Stage for building the application
FROM maven:3.9.9-eclipse-temurin-23-alpine AS builder

# Copy the Maven configuration files first to download dependencies separately
COPY pom.xml /source/
WORKDIR /source

# Download all the project dependencies and go offline
RUN mvn dependency:go-offline

# Copy the rest of the source code
COPY . /source

# Build the application and execute unit tests without downloading dependencies again
# Currently --offline switch to mvn command does not work. The message is
#  "in offline mode and the artifact ... has not been downloaded from it before."
RUN mvn clean package -Dmaven.test.failure.ignore=true

# NEW Stage for handling test reports
FROM scratch AS reporter
COPY --from=builder /source/target/surefire-reports /reports

