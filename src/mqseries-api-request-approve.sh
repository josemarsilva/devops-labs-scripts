#/bin/bash

# command line arguments ...

echo ""
echo "DEPLOY - MQSeries API - REQUEST - Approve #1 ..."
echo ""

if [ "$1" = "" ]; then
	echo "mqseries-api-request-promote.sh: ERROR - Missing parameters \$1"
	echo "  \$1: target environment"
	echo ""
	exit 1
fi

# check target environment ...

if [ "$1" != "tu" ] && [ "$1" != "ti" ] && [ "$1" != "th" ] && [ "$1" != "prod" ]; then
	echo "mqseries-api-request-promote.sh: ERROR - Invalid target environment value"
	echo "  value '$1' is not in expected values list: ('tu', 'ti', 'th', 'prod' )"
        exit 1
fi	

# Approve #1 ...

echo ""
echo "Target environment '$1' '$2' '$3' '$4' '$5' '$6' '$7' '$8'"
echo ""

# Build MQSeries PUT message ... 

echo ""
echo "Build MQSeries PUT message request approve #1 ..."
echo ""

ACTION=put
HOST=127.0.0.1
PORT=1414
CHANNEL=DEV.APP.SVRCONN
QMGR=QM1
APP_PASSWORD=passw0rd
QUEUE_NAME=DEV.QUEUE.1
MESSAGE="APPROVE1       $1 $2 $3 $4 $5 $6 $7 $8"

echo ""
echo "java -jar /home/ubuntu/githome/bitbucket.server.local/mqseries-api-cli/dist/mqseries-api-cli.jar -A ${ACTION} -H ${HOST} -P ${PORT} -C ${CHANNEL} -Q ${QMGR} -p ${APP_PASSWORD} -q ${QUEUE_NAME} -m '${MESSAGE}'"
echo ""

java -jar /home/ubuntu/githome/bitbucket.server.local/mqseries-api-cli/dist/mqseries-api-cli.jar -A ${ACTION} -H ${HOST} -P ${PORT} -C ${CHANNEL} -Q ${QMGR} -p ${APP_PASSWORD} -q ${QUEUE_NAME} -m '${MESSAGE}'

