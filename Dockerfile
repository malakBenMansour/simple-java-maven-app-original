# Use OpenJDK 11 as the base image
FROM adoptopenjdk:11-jdk-hotspot

# Set the working directory in the container
WORKDIR /app

# Install Maven
RUN apt-get update && \
    apt-get install -y maven

# Copy the Java application source code and pom.xml into the container
COPY ./my-app /app
COPY ./pom.xml /app

# Build the Java application using Maven
RUN mvn package

# Set the command to run your application
CMD ["java", "-jar", "target/my-app-1.0-SNAPSHOT.jar"]
