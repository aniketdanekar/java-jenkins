FROM openjdk:17-jdk-slim
WORKDIR /app
COPY addition.java .
RUN javac Main.java
CMD ["java", "Main"]

