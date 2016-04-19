FROM dockerspringxd_java8


RUN apt-get update && apt-get install -y \
  netcat-traditional \
  unzip

#**************************************************************************
#**************************************************************************
#**************************************************************************
#********************* Install Spring XD **********************************
#**************************************************************************
#**************************************************************************
#**************************************************************************

ENV XD_BUILD release
ENV XD_VERSION 1.3.1.RELEASE
ENV MAVEN_REPO http://repo1.maven.org/maven2

RUN \
  wget http://repo.spring.io/${XD_BUILD}/org/springframework/xd/spring-xd/${XD_VERSION}/spring-xd-${XD_VERSION}-dist.zip \
    -O /opt/spring-xd-${XD_VERSION}-dist.zip \
  && unzip /opt/spring-xd-${XD_VERSION}-dist.zip -d /opt/

RUN \
   rm /opt/spring-xd-${XD_VERSION}-dist.zip \
  && ln -s /opt/spring-xd-${XD_VERSION} /opt/spring-xd


  #**************************************************************************
  #**************************************************************************
  #**************************************************************************
  #******************* Download SPRING XD libraries *************************
  #**************************************************************************
  #**************************************************************************
  #**************************************************************************

  ENV XD_LIB_PATH /opt/spring-xd/xd/lib

  RUN \
     wget http://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.38/mysql-connector-java-5.1.38.jar \
       -O ${XD_LIB_PATH}/mysql-connector-java-5.1.38.jar  


WORKDIR /opt/spring-xd
