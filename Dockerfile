FROM openjdk:17-jdk-slim

ENV GB_VERSION=0.7.0
ENV JAVA_OPTS="-Xms128m -Xmx448m"

RUN apt-get update && apt-get install -y wget unzip \
    && wget https://github.com/grammarbot/grammarbot/releases/download/v${GB_VERSION}/grammarbot-${GB_VERSION}.zip \
    && unzip grammarbot-${GB_VERSION}.zip -d /opt \
    && rm grammarbot-${GB_VERSION}.zip

WORKDIR /opt/grammarbot-${GB_VERSION}

CMD sh -c "java $JAVA_OPTS -cp grammarbot.jar org.grammarbot.GrammarBot --port $PORT"
