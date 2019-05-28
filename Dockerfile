FROM openjdk:8-alpine
WORKDIR /opt
COPY acesso.jar /opt/acesso.jar
EXPOSE 9095

ARG PORT
ARG DATASOURCE_USERNAME
ARG DATASOURCE_PASSWORD
ARG HOST
ARG DBNAME

ENV DATASOURCE_URL=jdbc:postgresql://${HOST}:${PORT}/${DBNAME}
ENV USERNAME="${DATASOURCE_USERNAME}"
ENV PASSWORD="${DATASOURCE_PASSWORD}"

ENTRYPOINT [ "java", "-Dspring.datasource.url=${DATASOURCE_URL}", "-Dspring.datasource.username=${USERNAME}", "-Dspring.datasource.password=${PASSWORD}" ]
CMD ["-jar", "/opt/acesso.jar" ]
