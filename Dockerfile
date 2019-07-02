FROM openjdk:8-alpine
WORKDIR /opt
COPY acesso.jar /opt/acesso.jar
EXPOSE 9095

ENTRYPOINT [ "java", "-Dspring.datasource.url=${DATASOURCE_URL}", "-Dspring.datasource.username=${USERNAME}", "-Dspring.datasource.password=${PASSWORD}", "-Dlogging.file=${LOG_PATH}" ]
CMD ["-jar", "/opt/acesso.jar", ">> /opt/logs/java.txt" ]
