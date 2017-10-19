FROM openjdk:8u141-jdk-slim

MAINTAINER Michael Faille <michael@faille.io>

RUN apt update && apt install -y gpg apt-transport-https && \
    echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
    cd /var/lib/apt/lists && \
    apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
    apt update && \
    apt-get install -y sbt

# ONBUILD ADD code
# ONBUILD RUN sbt dist
