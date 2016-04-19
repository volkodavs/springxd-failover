FROM dockerspringxd_java8


RUN apt-get update  && \
    apt-get install -y git wget unzip


ENV \
  KM_VERSION=1.3.0.4 \
  KM_REVISION=1b45af100ee302dfe53f31a9c7a041999fe3d83a

ENV ZK_HOSTS=localhost:2181,localhost:2182,localhost:2183

RUN mkdir -p /tmp && \
    cd /tmp && \
    git clone https://github.com/yahoo/kafka-manager && \
    cd /tmp/kafka-manager && \
    git checkout ${KM_REVISION} && \
    echo 'scalacOptions ++= Seq("-Xmax-classfile-name", "200")' >> build.sbt && \
    ./sbt clean dist && \
    unzip  -d / ./target/universal/kafka-manager-${KM_VERSION}.zip && \
    rm -fr /tmp/* /root/.sbt /root/.ivy2



WORKDIR /kafka-manager-${KM_VERSION}

EXPOSE 9000
ENTRYPOINT ["./bin/kafka-manager","-Dconfig.file=conf/application.conf"]
