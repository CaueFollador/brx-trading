FROM eclipse-temurin:17-jre

ENV MULE_VERSION=4.9.0
ENV MULE_HOME=/opt/mule

#Instala o wget, que é necessário para baixar o Standalone CE da Mulesoft
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Baixa o Mule CE standalone do repositório Nexus da MuleSoft em modo silencioso (sem imprimir o output)
RUN wget -q \
  "https://repository.mulesoft.org/nexus/repository/releases/org/mule/distributions/mule-standalone/${MULE_VERSION}/mule-standalone-${MULE_VERSION}.tar.gz" \
  # Salva o arquivo baixado em /tmp
  -O /tmp/mule.tar.gz \
  # Extrai o conteúdo em /opt, criando a pasta mule-standalone-4.9.0
  && tar -xzf /tmp/mule.tar.gz -C /opt \
  # Renomeia a pasta extraída para /opt/mule
  && mv /opt/mule-standalone-${MULE_VERSION} ${MULE_HOME} \
  # Remove o .tar.gz para não inflar a imagem
  && rm /tmp/mule.tar.gz

#Copia o pacote .jar do projeto de dentro da pasta target para a pasta do mule_home
COPY target/*.jar ${MULE_HOME}/apps/

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 8081

CMD ["/docker-entrypoint.sh"]