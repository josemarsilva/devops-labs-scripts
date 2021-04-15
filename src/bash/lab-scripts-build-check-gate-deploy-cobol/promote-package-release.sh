#/bin/bash

# command line arguments ...

echo ""
echo "DEPLOY - Promote Package Release to environment ..."
echo ""

if [ "$1" = "" ]; then
	echo "promote-package-release.sh: ERROR - Missing parameters \$1 \$2"
	echo "  \$1: target environment"
	echo ""
	exit 1
fi

# check target environment ...

if [ "$1" != "tu" ] && [ "$1" != "ti" ] && [ "$1" != "th" ] && [ "$1" != "prod" ]; then
	echo "promote-package-release.sh: ERROR - Invalid target environment value"
	echo "  value '$1' is not in expected values list: ('tu', 'ti', 'th', 'prod' )"
        exit 1
fi	

# promote ...

echo ""
echo "Target environment '$1'"
echo ""

# copying packages ...

echo ""
echo "cp ./* /opt/devops-labs-share/environment/$1/"
echo ""

cp ./* /opt/devops-labs-share/environment/$1/
pwd
ls -la 
ls -la /opt/devops-labs-share/environment/$1/
