FROM ubuntu:14.04.1
USER root
MAINTAINER Manasi

RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get -y update

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
RUN apt-get -y install oracle-java8-installer

RUN wget http://download.go.cd/gocd-deb/go-server-14.4.0-1356.deb
RUN apt-get -y install git
RUN apt-get -y install unzip
RUN dpkg -i go-server-14.4.0-1356.deb
RUN sed -i 's/DAEMON=Y/DAEMON=N/g' /etc/default/go-server
RUN rm -rf go-server-14.4.0-1356.deb

USER go
RUN ssh-keygen -N "" -f /var/go/.ssh/id_rsa

USER root
CMD ["service", "go-server", "start"]
