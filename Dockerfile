FROM openjdk:17-jdk-slim

ENV LT_VERSION=6.5

RUN apt-get update && apt-get install -y wget unzip \
    && wget https://languagetool.org/download/LanguageTool-${LT_VERSION}.zip \
    && unzip LanguageTool-${LT_VERSION}.zip -d /opt \
    && rm LanguageTool-${LT_VERSION}.zip

WORKDIR /opt/LanguageTool-${LT_VERSION}

EXPOSE 8010

CMD ["java", "-cp", "languagetool-server.jar", "org.languagetool.server.HTTPServer", \
     "--port", "8010", "--public"]
