FROM amazoncorretto/alpine-preview:8-alpine-jre
MAINTAINER mahin.hannan@outlook.com

RUN apk add curl

RUN curl -SL 'https://s3.amazonaws.com/downloads.mirthcorp.com/connect/3.9.0.b2526/mirthconnect-3.9.0.b2526-unix.tar.gz' | tar -xzC /opt

RUN mv "/opt/Mirth Connect" /opt/mirthconnect
RUN mkdir /opt/mirthconnect/appdata
RUN mkdir /opt/mirthconnect/custom-extensions


VOLUME /opt/mirthconnect/
VOLUME /opt/mirthconnect/appdata
VOLUME /opt/mirthconnect/custom-extensions

RUN chmod 0755 /opt/mirthconnect
WORKDIR /opt/mirthconnect

EXPOSE 8443
EXPOSE 8080

CMD java -jar /opt/mirthconnect/mirth-server-launcher.jar
