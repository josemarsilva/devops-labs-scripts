#/bin/bash

# command line arguments ...

echo ""
echo "BUILD - Test Data Management ..."
echo ""

if [ "$1" = "" ]; then
        echo "test-data-managment.sh: ERROR - Missing parameters \$1 \$2"
        echo "  \$1: target environment"
        echo ""
        exit 1
fi

# check target environment ...

if [ "$1" != "tu" ] && [ "$1" != "ti" ] && [ "$1" != "th" ] && [ "$1" != "prod" ]; then
        echo "test-data-management.sh: ERROR - Invalid target environment value"
        echo "  value '$1' is not in expected values list: ('tu', 'ti', 'th', 'prod' )"
        exit 1
fi


# generating test data ...

echo ""
echo "Generating test data ..."
echo ""
touch count.dat
touch log.dat

ls -la count.dat log.dat


