FROM alpine:3.13
LABEL maintainer="Jose Maria Flores Zazo jmfloreszazo@gmail.com"
ARG JMETER_VERSION="5.4.1"
ARG JMETER_BACKENDLISTENER_VERSION="0.2.3"
ENV JMETER_HOME /usr/local/apache-jmeter-${JMETER_VERSION}
ENV	JMETER_BIN	${JMETER_HOME}/bin
ENV	JMETER_DOWNLOAD_URL  https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz
ENV JMETER_DOWNLOAD_BACKENDLISTENER_URL https://jmeter-plugins.org/files/packages/jmeter.backendlistener.azure-${JMETER_BACKENDLISTENER_VERSION}.zip
ARG TZ="Europe/Madrid"
RUN apk update \
	&& apk upgrade \
	&& apk add ca-certificates \
	&& update-ca-certificates \
	&& apk add --update openjdk8-jre tzdata curl unzip bash \
	&& apk add --no-cache nss \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /tmp/dependencies \
	&& curl -L --silent ${JMETER_DOWNLOAD_URL} > /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz  \
	&& mkdir -p /usr/local \
	&& tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /usr/local \
	&& wget ${JMETER_DOWNLOAD_BACKENDLISTENER_URL} \
    && unzip -o jmeter.backendlistener.azure-${JMETER_BACKENDLISTENER_VERSION}.zip -d ${JMETER_HOME} \
	&& rm -rf /tmp/dependencies
ENV PATH $PATH:$JMETER_BIN
COPY entrypoint.sh /
WORKDIR	${JMETER_HOME}
EXPOSE 1099
ENTRYPOINT ["/entrypoint.sh"]
