FROM openjdk:17-slim

# Download LanguageTool server
RUN apt-get update && apt-get install -y wget unzip ca-certificates \
    && wget -q https://languagetool.org/download/LanguageTool-stable.zip \
    && unzip LanguageTool-stable.zip -d /opt \
    && rm LanguageTool-stable.zip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/LanguageTool-*
