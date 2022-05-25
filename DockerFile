FROM openjdk<17>-alpine<v3.16>

COPY ./pom.xml ./pom.xml

COPY ./src ./src

RUN mvn dependency:go-offline -B

RUN mvn package

FROM openjdk:8u171-jre-alpine

WORKDIR /petclinicSite

COPY --from=maven target/SimpleJavaProject-*.jar ./SimpleJavaProject.jar

CMD ["java", "-jar", "./SimpleJavaProject.jar"]
