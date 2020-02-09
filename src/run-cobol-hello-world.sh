#/bin/bash

echo ""
echo "Run Cobol Hello World ( '$1' )"
echo ""

if [ -z "$1" ]; then
	echo "run-cobol-hello-world.sh: ERROR - Missing parameters \$1"
	echo "  \$1: environment in ( 'tu', 'ti', 'th', 'prod' )" 
	echo ""
	exit 1
fi

# change current directory ...
echo "cd /opt/devops-labs-share/deploy-environment/$1/"
echo ""
cd /opt/devops-labs-share/deploy-environment/$1/

touch count.dat
touch log.dat

ls -la



