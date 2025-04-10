FROM openjdk:17-jdk-slim

WORKDIR /app

# Install dependencies & clone Lavalink
COPY . /app

# Port
EXPOSE 2333

# Build the project
RUN ./gradlew build --no-daemon

# Run Lavalink
CMD ["./gradlew", "run", "--no-daemon"]
