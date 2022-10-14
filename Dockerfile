


FROM alpine

RUN apk update && \
    apk upgrade 
RUN apk add openjdk8

ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8086
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]