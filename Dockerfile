FROM openjdk:8
EXPOSE 8080
ADD target/app-k8s.jar app-k8s.jar
ENTRYPOINT ["java","-jar","/app-k8s.jar"]