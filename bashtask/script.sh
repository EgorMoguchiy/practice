#!/bin/bash
DIRECTORY=$*
COUNT_ARGUMENTS=$#
if [ $COUNT_ARGUMENTS -gt 0 ]
then
        for n in $DIRECTORY
        do
                if [ -d $n ]
                then
                        cd $n
                        ls
                else
                        echo "The $n directory does not exist"
                        exit 0
                fi
        done
else
        echo "The number of arguments equals zero"
        exit 0
fi
echo "OK"