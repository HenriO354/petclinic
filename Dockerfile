FROM openjdk:16-alpine3.13 AS builder

WORKDIR /petclinicSite
COPY . ./
RUN ./mvnw package

FROM openjdk:16-alpine3.13

WORKDIR /petclinicSite

# copy only the artifacts we need from the first stage and discard the rest
COPY --from=builder /petclinicSite/target/*.jar ./dependencies.jar
CMD [ "java", "-jar", "dependencies.jar" ]
