


FROM alpine

RUN apk update && \
    apk upgrade 
RUN apk add openjdk8=8.252.09-r0

ARG JAR_FILE=build/libs/*.jar
ADD target/iti-g106-1.0.0.jar iti-g106-1.0.0.jar
EXPOSE 8086
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]