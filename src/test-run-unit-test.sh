#/bin/bash

# command line arguments ...

echo ""
echo "DEPLOY - Test Run - Unit-test ..."
echo ""

if [ "$1" = "" ]; then
        echo "test-run-unit-test.sh: ERROR - Missing parameters \$1"
        echo "  \$1: target environment"
        echo ""
        exit 1
fi

# check target environment ...

if [ "$1" != "tu" ] && [ "$1" != "ti" ] && [ "$1" != "th" ] && [ "$1" != "prod" ]; then
        echo "test-run-unit-test.sh: ERROR - Invalid target environment value"
        echo "  value '$1' is not in expected values list: ('tu', 'ti', 'th', 'prod' )"
        exit 1
fi


# Running Unit Test Case ...
echo ""
echo "Running Unit Test Case ..."
echo

TEST_CASE_NAME="Test-Case-U-01"
TEST_CASE_DESCRIPTION="Verificar se na saida sysout do programa 'hello-cobol-world.exe' contem 'Hello'"
TEST_CASE_STEP="Step-01: run programa './cobol-hello-world.exe'"

echo ""
echo "TEST_CASE_NAME....... : $TEST_CASE_NAME"
echo "TEST_CASE_DESCRIPTION : $TEST_CASE_DESCRIPTION"
echo "TEST_CASE_STEP........: $TEST_CASE_STEP"

PROGRAM_EXECUTION_SYSOUT=`./cobol-hello-world.exe`

TEST_CASE_STEP="Step-02: Test if SysOut '$PROGRAM_EXECUTION_SYSOUT' contains string 'hello'"
echo "TEST_CASE_STEP........: $TEST_CASE_STEP"

# Test

CONTAINS_STRING=`echo $PROGRAM_EXECUTION_SYSOUT | grep -i "hello" | wc -l`

# Result
if [ "$CONTAINS_STRING" == "0" ]; then
	echo "TEST_CASE_RETURN......: FAILED!"
	exit 1
fi

echo "TEST_CASE_RETURN......: SUCCESS!"
echo ""

