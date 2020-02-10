#/bin/bash

# command line arguments ...

echo ""
echo "DEPLOY - Download Package Release ..."
echo ""

if [ "$1" = "" ]; then
	echo "download-package-release.sh: ERROR - Missing parameters \$1"
	echo "  \$1: package-name"
	echo ""
	exit 1
fi

# check target environment ...

if [ "$1" == "" ]; then
	echo "download-package-release.s: ERROR - Invalid package-name parameter"
	echo "  parameter package-name is required"
        exit 1
fi	

# copying packages ...

echo ""
echo "cp /opt/devops-labs-share/package-release/* ."
echo ""

cp /opt/devops-labs-share/package-release/* .

# adjusting permission ...

echo ""
echo "chmod 777 ./*"
echo ""

chmod 777 ./*
pwd
ls -la

