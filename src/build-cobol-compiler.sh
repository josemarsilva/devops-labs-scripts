#/bin/bash

echo ""
echo "Build Cobol Compiler ..."
echo ""

if [ -z "$1" ] && [ -z "$2" ]; then
	echo "build-cobol-compile.sh: ERROR - Missing parameters \$1 \$2"
	echo ""
	exit 1
fi

echo "cobc -free -x -o $1 $2"
echo ""

cobc -free -x -o $1 $2
