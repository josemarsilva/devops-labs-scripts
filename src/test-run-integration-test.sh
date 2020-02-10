#/bin/bash

# command line arguments ...

echo ""
echo "DEPLOY - Test Run - Integration Test ..."
echo ""

if [ "$1" = "" ]; then
        echo "test-run-integration-test.sh: ERROR - Missing parameters \$1"
        echo "  \$1: target environment"
        echo ""
        exit 1
fi

# check target environment ...

if [ "$1" != "tu" ] && [ "$1" != "ti" ] && [ "$1" != "th" ] && [ "$1" != "prod" ]; then
        echo "test-run-integration-test.sh: ERROR - Invalid target environment value"
        echo "  value '$1' is not in expected values list: ('tu', 'ti', 'th', 'prod' )"
        exit 1
fi


# Running Integration Test Case ...
echo ""
echo "Running Integration Test Case ..."
echo

TEST_CASE_NAME="Test-Case-I-01"
TEST_CASE_DESCRIPTION="Verificar se quantidade de linhas do arquivo 'log.dat' corresponde a contagem de linhas do conteudo do arquivo 'count.dat'"
TEST_CASE_STEP="Step-01: run programa './cobol-hello-world.exe'"

echo ""
echo "TEST_CASE_NAME....... : $TEST_CASE_NAME"
echo "TEST_CASE_DESCRIPTION : $TEST_CASE_DESCRIPTION"
echo "TEST_CASE_STEP........: $TEST_CASE_STEP"

PROGRAM_EXECUTION_SYSOUT=`./cobol-hello-world.exe`

TEST_CASE_STEP="Step-02: Test 'count.dat' vs 'log.dat'"
echo "TEST_CASE_STEP........: $TEST_CASE_STEP"

# Test
COUNT_DAT_CONTENTS=`cat count.dat`
COUNT_DAT_CONTENTS=${COUNT_DAT_CONTENTS//[$'\t\r\n']} && COUNT_DAT_CONTENTS=${COUNT_DAT_CONTENTS%%*( )}
COUNT_DAT_CONTENTS=`expr $COUNT_DAT_CONTENTS + 0`
LOG_DAT_COUNT_ROWS=`cat log.dat | wc -c`
LOG_DAT_COUNT_ROWS=`expr $LOG_DAT_COUNT_ROWS / 80`

# Result
if [ "$COUNT_DAT_CONTENTS" != "$LOG_DAT_COUNT_ROWS" ]; then
	echo "TEST_CASE_RETURN......: FAILED! - $COUNT_DAT_CONTENTS vs $LOG_DAT_COUNT_ROWS"
	exit 1
fi

echo "TEST_CASE_RETURN......: SUCCESS! - $COUNT_DAT_CONTENTS vs $LOG_DAT_COUNT_ROWS"
echo ""

