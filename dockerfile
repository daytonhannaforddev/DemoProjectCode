FROM eclipse-temurin:17-jre
WORKDIR /app
# copy the fat jar and rename it to app.jar
COPY target/*-shaded.jar /app/app.jar
EXPOSE 8080
ENV PORT=8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
