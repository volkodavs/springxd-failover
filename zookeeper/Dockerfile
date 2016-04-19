FROM dockerspringxd_java8

ENV ZOOKEEPER_VERSION 3.4.6

RUN apt-get update && apt-get install -y \
  wget \
  dnsutils

RUN  \
  wget -O /opt/zookeeper-${ZOOKEEPER_VERSION}.tar.gz \
  http://ftp.heanet.ie/mirrors/www.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz

RUN tar xz -C /opt -f /opt/zookeeper-${ZOOKEEPER_VERSION}.tar.gz \
  zookeeper-${ZOOKEEPER_VERSION}/bin \
  zookeeper-${ZOOKEEPER_VERSION}/conf \
  zookeeper-${ZOOKEEPER_VERSION}/lib \
  zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.jar \
  && ln -s /opt/zookeeper-${ZOOKEEPER_VERSION} /opt/zookeeper \
  && rm /opt/zookeeper-${ZOOKEEPER_VERSION}.tar.gz \
  && mkdir -p /var/lib/zookeeper

RUN ulimit -n 100000

COPY config /tmp/zkconfig

COPY config/java.env /opt/zookeeper/conf/java.env

COPY docker-entrypoint.sh /entrypoint.sh

#Make executable
RUN chmod +x /entrypoint.sh && sleep 1


WORKDIR /opt/zookeeper

VOLUME /var/lib/zookeeper

EXPOSE 2181 2888 3888

ENTRYPOINT ["/entrypoint.sh"]

CMD ["./bin/zkServer.sh", "start-foreground"]
