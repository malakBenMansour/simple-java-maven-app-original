FROM maven:3.5.4-jdk-11-slim as maven

COPY ./pom.xml ./pom.xml

COPY ./src ./src

RUN mvn dependency:go-offline -B

RUN mvn package

FROM adoptopenjdk:11-jre-hotspot

WORKDIR /adevguide

COPY --from=maven target/SimpleJavaProject-*.jar ./SimpleJavaProject.jar

CMD ["java", "-jar", "./SimpleJavaProject.jar"]
