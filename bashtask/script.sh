#!/bin/bash
DIRECTORY=$*
COUNT_ARGUMENTS=$#
if [ $COUNT_ARGUMENTS -gt 0 ]
then
        for d in $DIRECTORY
        do
                if [ -d $d ]
                then
                        cd $d
                        FILE_ARR=$(ls | awk '/.txt/')
                        echo "$FILE_ARR"
                        for f in $FILE_ARR
                        do
                                ALL_NUM+=($(grep -oE "[0-9]{1,}" $f | awk '{print $1}'))
                                SUM_FILE_NUM=$(grep -oE "[0-9]{1,}" $f | awk '{s += $1} END {print s}')
                                SUM_ALL_NUM=$((SUM_ALL_NUM + SUM_FILE_NUM))
                        done
                        cd ..
                else
                        echo "The $d directory does not exist"
                        exit 0
                fi
        done
else
        echo "The number of arguments equals zero"
        exit 0
fi
echo "Sum of all numbers from the files: $SUM_ALL_NUM"

ALL_NUM_SIZE=${#ALL_NUM[@]}
MAX_NUM=${ALL_NUM[0]}
for((i=0; i < $ALL_NUM_SIZE; i++))
do
        if [ ${ALL_NUM[i]} -gt $MAX_NUM ]
        then
                MAX_NUM=${ALL_NUM[i]}
        fi
done
echo "Maximum number in files: $MAX_NUM"