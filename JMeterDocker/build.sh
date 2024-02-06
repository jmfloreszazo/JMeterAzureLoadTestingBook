#!/bin/bash

JMETER_VERSION="5.4.1"

docker build  --build-arg JMETER_VERSION=${JMETER_VERSION} -t "jmfloreszazo/jmeter:${JMETER_VERSION}" .
