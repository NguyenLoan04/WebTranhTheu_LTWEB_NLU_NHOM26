# Build bằng maven
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml ./
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package -DskipTests

# Chạy bằng tomcat
FROM tomcat:10.1-jdk21-temurin
WORKDIR /usr/local/tomcat/webapps/
COPY --from=build /app/target/*.war ROOT.war
CMD ["catalina.sh", "run"]