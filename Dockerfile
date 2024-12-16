FROM confluentinc/cp-kafka-connect:7.6.0

USER root

RUN yum install -y unzip

USER appuser

RUN curl -LO https://github.com/ClickHouse/clickhouse-kafka-connect/releases/download/v1.2.6/clickhouse-kafka-connect-v1.2.6.zip && \
  unzip clickhouse-kafka-connect-v1.2.6.zip

USER root

RUN  mv clickhouse-kafka-connect-v1.2.6 /usr/share/java/kafka/clickhouse-kafka-connect-v1.2.6

USER appuser