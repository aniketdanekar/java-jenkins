FROM openjdk:17-jdk-slim
WORKDIR /app
COPY addition.java .
RUN javac addition.java
CMD ["java", "addition"]

