FROM openjdk:16-alpine3.13

WORKDIR /petclinicSite

COPY .mvn/ .mvn
COPY mvnw ./pom.xml ./


RUN ./mvnw dependency:go-offline
# executes

# COPY --from=maven target/SimpleJavaProject-*.jar ./SimpleJavaProject.jar
COPY src ./src
CMD ["./mvnw", "spring-boot:run"]
