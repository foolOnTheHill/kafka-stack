FROM adoptopenjdk/openjdk11-openj9

COPY run.sh /
COPY create-kafka-topics.sh /

RUN apt update && apt install -y supervisor && chmod a+x /run.sh && chmod a+x /create-kafka-topics.sh

ADD kafka_2.12-2.6.0 kafka_2.12-2.6.0
ADD schema-registry_6.2.0-0 schema-registry_6.2.0-0

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 2181 9092 8081

CMD ["/run.sh"]