#!/bin/bash
# in = fd3
# output: fd4 - child output
# output: fd5 - end
# arg $1 = child in=fd3, out=fd4

childprogram=$1
outputfromchild=duct_${RANDOM}
mkfifo $outputfromchild

$childprogram 3</dev/fd/3 4>&4 &
childpid=$!
echo 'done' 1>&5
rm -f $outputfromchild
