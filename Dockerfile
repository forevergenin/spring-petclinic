FROM maven as build

WORKDIR /opt/spring-petclinic

COPY . .

RUN mvn package


FROM java:8-jre-alpine

WORKDIR /

COPY --from=build /opt/spring-petclinic/target/spring-petclinic-*.jar app

EXPOSE 8080

CMD java -jar app
