#/bin/bash

# command line arguments ...

echo ""
echo "BUILD - Package Release Shared File Server ..."
echo ""

if [ -z "$1" ] && [ -z "$2" ]; then
	echo "package-release.sh: ERROR - Missing parameters \$1 \$2"
	echo "  \$1: target path"
	echo "  \$2: source path to filename #1"
	echo ""
	exit 1
fi

# copying apackage release ...

echo "cp $1 $2 $3 $4 $5 $6 $7 $8"
echo ""

cp $2 $1
cp $3 $1

# adjusting permissions ...
chmod a+rw $1/*


echo ""
ls -la $1

