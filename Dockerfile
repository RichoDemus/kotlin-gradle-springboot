FROM openjdk:10-jdk as builder
RUN mkdir src
WORKDIR src

# Download Gradle
COPY gradlew /src/
COPY gradle /src/gradle
RUN ./gradlew --no-daemon

COPY . /src/
RUN ./gradlew --no-daemon
RUN mkdir jars
RUN cp build/libs/kotlin-gradle-springboot.jar jars

FROM openjdk:10-jre
RUN mkdir app
WORKDIR app
COPY --from=builder /src/jars .

# the urandom thing reduces tomcat startup time, no idea if it's smart or not
CMD ["java","-Djava.security.egd=file:/dev/./urandom","-jar","kotlin-gradle-springboot.jar"]
