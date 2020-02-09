#/bin/bash

#
# Step - 00: command line arguments
#
echo ""
echo "BUILD - Code Quality Analysis"
if [ -z "$1" ] && [ -z "$2" ]; then
        echo "code-quality-dresscode-script.sh: ERROR - Missing parameters \$1 \$2"
	echo "  \$1: cobol source code filename (.cbl)"
	echo "  \$2: code quality analysis report filename (.txt)"
        echo ""
        exit 1
fi

#
# Step - 01: Complexity analysis of an algorithm: IF ... END-IF nesting
#
echo ""
echo "Step - 01: Complexity analysis of an algorithm: IF ... END-IF nesting"
echo ""
declare -i CURRENT_NESTING=0
declare -i MAX_NESTING=0
declare    MAX_NESTING_CODE=""
echo $MAX_NESTING > 2.tmp
echo $MAX_NESTING_CODE > 1.tmp
grep -n 'IF \|END-IF' $1 | while read line; do
	echo "$line"
	# increment or decrement nesting ...
	if [[ $line =~ "END-IF" ]]; then
		((CURRENT_NESTING--))
	elif [[ $line =~ "IF " ]]; then
		((CURRENT_NESTING++))
	fi
	# Is this the max nesting ...
	if [ $CURRENT_NESTING -gt $MAX_NESTING ]; then
		MAX_NESTING=$(( CURRENT_NESTING ))
		echo $line > 1.tmp
		echo $MAX_NESTING> 2.tmp
	fi
done
MAX_NESTING_CODE=`cat 1.tmp`
MAX_NESTING=`cat 2.tmp`
rm 1.tmp
rm 2.tmp

#
# Step-99 - reporting ...
#
echo "report.source-filename=$1"   >  $2
echo "report.analysis-filename=$2" >> $2
dt=$(date '+%Y-%m-%d %H:%M:%S');
echo "report.date-time=$dt" >> $2
echo "report.analysis.algorithm-comlexity.nesting-if-end-if.value=$MAX_NESTING" >> $2
echo "report.analysis.algorithm-comlexity.nesting-if-end-if.code=$MAX_NESTING_CODE" >> $2

chmod 777 $2
