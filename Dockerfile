# Build stage
FROM maven:3-openjdk-22 AS build
WORKDIR /app

COPY . .
RUN mvn clean package -DskipTests

# Run stage
FROM openjdk:22-jdk-slim
WORKDIR /app

COPY --from=build /app/target/KiraJewelry-0.0.1-SNAPSHOT.jar kirajewelry.jar
EXPOSE 8080

ENTRYPOINT ["java","-jar","kirajewelry.jar"]
