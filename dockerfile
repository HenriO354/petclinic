FROM openjdk:16-alpine3.13

COPY mvnw ./pom.xml

COPY src ./src

RUN ./mvnw dependency:go-offline
# executes

WORKDIR /petclinicSite

# COPY --from=maven target/SimpleJavaProject-*.jar ./SimpleJavaProject.jar

CMD ["./mvnw", "spring-boot:run"]
