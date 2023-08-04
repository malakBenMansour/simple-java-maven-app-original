# Use Maven 3.5.4 with JDK 11 as the base image for building the application
FROM maven:3.5.4-jdk-11-slim as maven

# Copy the entire project into the container
COPY . /app

# Set the working directory
WORKDIR /app

# Build the Java application using Maven with JDK 11
RUN mvn package

# Use OpenJDK 11 as the base image for the final runtime
FROM adoptopenjdk:11-jre-hotspot

# Set the working directory in the container
WORKDIR /adevguide

# Copy the built JAR file from the maven build stage
COPY --from=maven /app/target/SimpleJavaProject-*.jar ./SimpleJavaProject.jar

# Run the Java application
CMD ["java", "-jar", "./SimpleJavaProject.jar"]
