#BUild
FROM maven:3.8.4-openjdk-17-slim AS build
#O workdir ele vai criar uma pasta chamada app e vai copiar o pom.xml e a pasta src para dentro dela, depois ele vai rodar o comando mvn clean package para gerar o .jar
WORKDIR /app
#O Copy ele vai copiar o pom.xml e a pasta src para dentro da pasta app, depois ele vai rodar o comando mvn clean package para gerar o .jar
COPY pom.xml .
COPY src ./src
#RUN ele vai rodar o comando mvn clean package para gerar o jar do projeto. Usamos -Dmaven.test.skip=true em vez do antigo -DskipTests porque a partir do Spring Boot 4.1 o -DskipTests parou de pular o processamento AOT dos testes, e como agora temos um repositorio JPA isso pode travar ou deixar o build dentro do container bem mais lento
RUN mvn clean package -Dmaven.test.skip=true

#Run ele e o tipo do java que vamos usar para rodar o projeto, nesse caso e o eclipse-temurin:17-jre-alpine, ele e uma imagem mais leve do java 17, sem as dependencias de build
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
