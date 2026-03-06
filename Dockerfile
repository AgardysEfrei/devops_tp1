FROM openjdk:26-rc-jdk AS build
WORKDIR /app
COPY . .
RUN ./gradlew clean build

FROM openjdk:26-rc-jdk AS run
WORKDIR /app
COPY --from=build --chown=app-user:app-user /app/build/libs/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
