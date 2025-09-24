FROM openjdk:17-jdk-slim

ENV LT_VERSION=6.5
ENV JAVA_OPTS="-Xms128m -Xmx448m"

RUN apt-get update && apt-get install -y wget unzip \
    && wget https://languagetool.org/download/LanguageTool-${LT_VERSION}.zip \
    && unzip LanguageTool-${LT_VERSION}.zip -d /opt \
    && rm LanguageTool-${LT_VERSION}.zip

WORKDIR /opt/LanguageTool-${LT_VERSION}

# Railway will inject its own $PORT
CMD sh -c "java $JAVA_OPTS -cp languagetool-server.jar org.languagetool.server.HTTPServer --port $PORT --public"
