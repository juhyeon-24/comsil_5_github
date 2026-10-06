#!/bin/sh
DATAFILE=mydata.txt
AWKFILE=display.awk

name="`basename $0`"

if [ $# -eq 0 ]
then
    echo "Usage: $name searchfor [...searchfor]"
    echo "(You didn't tell me what you want to search for.)"
    exit 1
fi

arglist="$1"
shift
for arg in "$@"
do
    arglist="$arglist|$arg"
done

egrep -i "($arglist)" $DATAFILE | awk -f $AWKFILE