#/bin/bash

# command line arguments ...

echo ""
echo "BUILD - Package Release Shared File Server ..."
echo ""

if [ -z "$1" ] && [ -z "$2" ]; then
	echo "package-release.sh: ERROR - Missing parameters \$1 \$2"
	echo "  \$1: source path to filename"
	echo "  \$2: target path"
	echo ""
	exit 1
fi

# copying apackage release ...

echo "cp $1 $2"
echo "cp code-quality-analysis-report.txt $2"
echo ""

cp $1 $2
cp code-quality-analysis-report.txt $2 

echo ""
ls -la $2
