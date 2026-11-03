FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY addition.java .
RUN javac addition.java
CMD ["java", "addition"]

