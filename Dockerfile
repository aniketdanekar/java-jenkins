FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY . .
RUN javac addition.java
CMD ["java", "addition"]

