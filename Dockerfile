FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY Main.java .

RUN javac Main.java

CMD ["java", "Main"]


