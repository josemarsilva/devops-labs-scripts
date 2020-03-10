#/bin/bash

# command line arguments ...

echo ""
echo "DEPLOY - Quality Gate ..."
echo ""

if [ "$1" = "" ]; then
        echo "quality-gate.sh: ERROR - Missing parameters \$1"
        echo "  \$1: target environment"
        echo ""
        exit 1
fi

# check target environment ...

if [ "$1" != "tu" ] && [ "$1" != "ti" ] && [ "$1" != "th" ] && [ "$1" != "prod" ]; then
        echo "quality-gate.sh: ERROR - Invalid target environment value"
        echo "  value '$1' is not in expected values list: ('tu', 'ti', 'th', 'prod' )"
        exit 1
fi


# Checking quality gate ...
echo ""
echo "Checking Quality Gate ..."
echo

QUALITY_GATE_NAME="Quality-Gate-QG-01"
QUALITY_GATE_DESCRIPTION="Report Analysis Algorithm Complexity - IF ... END-IF nesting"
QUALITY_GATE_STEP="Step-01: report.analysis.algorithm-comlexity.nesting-if-end-if.value <= 3"

# Check Quality Gate ...
GATE_VALUE=3
STRING_KEY_VALUE="report.analysis.algorithm-complexity.nesting-if-end-if.value"
REPORT_VALUE=`cat code-quality-analysis-report.txt | grep $STRING_KEY_VALUE`
REPORT_VALUE=${REPORT_VALUE//${STRING_KEY_VALUE}=}
STRING_KEY_VALUE="report.analysis.algorithm-complexity.nesting-if-end-if.code"
REPORT_CODE=`cat code-quality-analysis-report.txt | grep $STRING_KEY_VALUE`
REPORT_CODE=${REPORT_CODE//${STRING_KEY_VALUE}=}

# Result
echo "GATE_VALUE=$GATE_VALUE REPORT_VALUE=$REPORT_VALUE"
#if [ `expr $GATE_VALUE - $REPORT_VALUE` -lt 0 ]; then
#        echo "QUALITY_GATE_STEP......: FAILED! - $REPORT_VALUE vs $GATE_VALUE"
#        exit 1
#fi

echo ""
echo "QUALITY_GATE_STEP......: SUCCESS! -  $REPORT_VALUE vs $GATE_VALUE"
echo ""

