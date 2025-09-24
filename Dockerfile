FROM openjdk:17-jdk-slim

ENV JAVA_OPTS="-Xms128m -Xmx448m"

# Install dependencies
RUN apt-get update && apt-get install -y wget unzip ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Download and extract GrammarBot 0.9.7
RUN wget -q https://github.com/grammarbot/grammarbot/releases/download/v0.9.7/grammarbot-0.9.7.zip \
    && unzip grammarbot-0.9.7.zip -d /opt \
    && rm grammarbot-0.9.7.zip

WORKDIR /opt/grammarbot-0.9.7

# Railway will inject $PORT dynamically
CMD sh -c "java $JAVA_OPTS -cp grammarbot.jar org.grammarbot.GrammarBot --port $PORT"
