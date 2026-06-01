FROM maven:3.9-eclipse-temurin-17 AS builder

WORKDIR /app

COPY . .

RUN mvn clean install -DskipTests=true  

FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar /app/expenseapp.jar

CMD ["java","-jar","expenseapp.jar"] 
