FROM openjdk:17-jdk-slim

# Pick a stable GrammarBot release (latest as of now is 0.9.7)
ENV GB_VERSION=0.9.7
ENV JAVA_OPTS="-Xms128m -Xmx448m"

# Install dependencies safely
RUN apt-get update && apt-get install -y wget unzip ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Download GrammarBot release
RUN wget -q https://github.com/grammarbot/grammarbot/releases/download/v${GB_VERSION}/grammarbot-${GB_VERSION}.zip \
    && unzip grammarbot-${GB_VERSION}.zip -d /opt \
    && rm grammarbot-${GB_VERSION}.zip

WORKDIR /opt/grammarbot-${GB_VERSION}

# Railway will inject $PORT dynamically
CMD sh -c "java $JAVA_OPTS -cp grammarbot.jar org.grammarbot.GrammarBot --port $PORT"
