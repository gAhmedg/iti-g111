FROM  openjdk:8
EXPOSE 8086
ADD target/iti-g106-1.0.0.jar iti-g106-1.0.0.jar
ENTRYPOINT ["jave","-jar","/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar"]
