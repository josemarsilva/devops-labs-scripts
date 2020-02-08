#/bin/bash

echo ""
echo "BUILD - Package Release Shared File Server ..."
echo ""

if [ -z "$1" ] && [ -z "$2" ]; then
	echo "package-release.sh: ERROR - Missing parameters \$1 \$2"
	echo ""
	exit 1
fi

echo "cp $1 $2"
echo ""

cp $1 $2

echo ""
ls -la $2
