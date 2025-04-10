# building
FROM eclipse-temurin:24-jdk-alpine AS build
WORKDIR /opt/ap
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ["./mvnw", "dependency:go-offline"]
COPY ./src ./src
RUN ["./mvnw", "clean", "install"]

# executing
FROM eclipse-temurin:24-jre-alpine AS final
WORKDIR /opt/app
EXPOSE 8787
COPY --from=build /opt/app/target/*.jar /opt/app/*.jar
ENTRYPOINT ["java", "-jar", "/opt/app/*.jar"]