FROM maven as builder
WORKDIR /usr/src/myapp
COPY . /usr/src/myapp

RUN mvn clean package
RUN mkdir /bin/app
RUN mv target/tp-cd-2024-0.0.1-SNAPSHOT.jar /bin/app

FROM openjdk:21
COPY --from=0 /bin/app /bin/app
CMD ["java", "-jar", "/bin/app/tp-cd-2024-0.0.1-SNAPSHOT.jar"]