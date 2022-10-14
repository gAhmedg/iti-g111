FROM  openjdk:8
EXPOSE 8085
ADD target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar
ENTRYPOINT ["jave","-jar","/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar"]