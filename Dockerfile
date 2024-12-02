FROM openjdk:21
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp

RUN ./mvmw clean package
RUN mkdir /bin/app
RUN MV target/tp-cd-2024-0.0.1-SNAPSHOT.jar /bin/app

FROM openjdk:21
COPY --from=0 /bin/app /bin/app
CMD ["java", "-jar", "/bin/app/tp-cd-2024-0.0.1-SNAPSHOT.jar"]