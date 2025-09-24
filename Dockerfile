# Base image with Java
FROM openjdk:17-jdk-slim

# Set Java memory options (Railway free tier has 512 MB RAM)
ENV JAVA_OPTS="-Xms128m -Xmx448m"

# Install dependencies
RUN apt-get update && apt-get install -y wget unzip ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Download and extract GrammarBot 0.9.8
RUN wget -q https://github.com/grammarbot/grammarbot/releases/download/v0.9.8/grammarbot-0.9.8.zip \
    && unzip grammarbot-0.9.8.zip -d /opt \
    && rm grammarbot-0.9.8.zip

# Set working directory
WORKDIR /opt/grammarbot-0.9.8

# Start GrammarBot server on Railway's dynamic $PORT
CMD sh -c "java $JAVA_OPTS -cp grammarbot.jar org.grammarbot.GrammarBot --port $PORT"
