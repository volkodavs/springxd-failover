FROM dockerspringxd_java8

ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 0.8.2.2
ENV KAFKA_JMX_PORT 7203

ENV KAFKA_HOME /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"


# Install Kafka
RUN apt-get update && \
    apt-get install -y  wget && \
    apt-get clean && \
    wget -q http://apache.mirrors.spacedump.net/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz && \
    tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C /opt && \
    rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz && \
    ln -s $KAFKA_HOME /opt/kafka


RUN ulimit -n 100000

COPY config /tmp/kfConfig
COPY config/kafka-server-config/kafka-run-class.sh  /opt/kafka/bin/kafka-run-class.sh
COPY config/kafka-server-config/kafka-server-start.sh  /opt/kafka/bin/kafka-server-start.sh


COPY docker-entrypoint.sh /entrypoint.sh
#Make executeble
RUN chmod +x /entrypoint.sh \
  && chmod +x /opt/kafka/bin/kafka-run-class.sh \
  && chmod +x /opt/kafka/bin/kafka-server-start.sh \
  && sleep 1

WORKDIR /opt/kafka

EXPOSE 9092 ${KAFKA_JMX_PORT}

ENTRYPOINT ["/entrypoint.sh"]

CMD ["./bin/kafka-server-start.sh", "config/server.properties"]
