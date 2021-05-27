FROM openjdk:8-jre-alpine

#WORKDIR /var/lib/jenkins/workspace/test4-24-05-21/target/

RUN  mkdir /app

COPY ./target/*.jar /app/app.jar

CMD java -jar /app/app.jar
