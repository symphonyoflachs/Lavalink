FROM openjdk:17-jdk-slim

WORKDIR /app

COPY . /app

# Installiere Git für Build mit Git-Abfragen
RUN apt-get update && apt-get install -y git

# Initialisiere ein Fake-Git-Repo für Versionierung
RUN git init && git config user.email "you@example.com" && git config user.name "Your Name"

# Port freigeben
EXPOSE 2333

# Projekt builden
RUN ./gradlew build -x test --no-daemon

# Lavalink starten
CMD ["./gradlew", "run", "--no-daemon"]
