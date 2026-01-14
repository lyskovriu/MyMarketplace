FROM maven:3.9.12-eclipse-temurin-21 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package

FROM openjdk:26-ea-21-jdk-slim
COPY --from=build /app/target/*.jar /app.jar
CMD ["java", "-jar", "/app.jar"]