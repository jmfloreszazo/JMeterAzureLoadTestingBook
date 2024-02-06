#!/bin/bash
export TARGET_HOST="jmfloreszjmetertest-dev.azurewebsites.net"
export TARGET_PORT="443"
export TARGET_PATH="/weatherforecast"

T_DIR=tests

# Reporting dir: start fresh
R_DIR=${T_DIR}/report
rm -rf ${R_DIR} > /dev/null 2>&1
mkdir -p ${R_DIR}

/bin/rm -f ${T_DIR}/test-plan.jtl ${T_DIR}/jmeter.log  > /dev/null 2>&1

./run.sh -Dlog_level.jmeter=DEBUG \
	-JTARGET_HOST=${TARGET_HOST} -JTARGET_PORT=${TARGET_PORT} \
	-JTARGET_PATH=${TARGET_PATH} \
	-n -t ${T_DIR}/JMeterWebApi.jmx -l ${T_DIR}/result.csv -j ${T_DIR}/jmeter.log \
	-e -o ${R_DIR}

echo "==== jmeter.log ===="
cat ${T_DIR}/jmeter.log


echo "==== CSV Test Report ===="
cat ${T_DIR}/result.csv

echo "==== HTML Test Report ===="
echo "See HTML test report in ${R_DIR}/index.html"
