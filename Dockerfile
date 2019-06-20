FROM openjdk:8-alpine
WORKDIR /opt
COPY acesso.jar /opt/acesso.jar
EXPOSE 9095

ENTRYPOINT [ "java", "-Dspring.datasource.url=${DATASOURCE_URL}", "-Dspring.datasource.username=${USERNAME}", "-Dspring.datasource.password=${PASSWORD}" ]
CMD ["-jar", "/opt/acesso.jar" ]
