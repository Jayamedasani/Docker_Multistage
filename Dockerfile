FROM ubuntu:20.04
MAINTAINER jaya <jayalakshmi.medasani@wavemaker.com>
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y apt-utils && apt-get install -y curl
ENV PATH=$PATH:/opt/java/jdk-11/bin
RUN mkdir /opt/java && \
    curl https://download.java.net/java/ga/jdk11/openjdk-11_linux-x64_bin.tar.gz  | tar -xz -C /opt/java/
RUN java --version
ENV JAVA_HOME=/opt/java/jdk-11
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat/
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.70/bin/apache-tomcat-9.0.70.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.70/* /opt/tomcat/.
WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/Jayamedasani/Personal_Finance/blob/finalwallet/target/jayapersonalfinance.war
#COPY ./jayapersonalfinance.war .
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
