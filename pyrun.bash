#!/bin/bash
set -x
trap catch ERR

set -x

duct3=duct3_$RANDOM
duct4=duct4_$RANDOM
duct5=duct5_$RANDOM
mkfifo $duct3 $duct4 $duct5

catch(){
    rm -f $duct3 $duct4 $duct5
    }

./join.py 3<$duct3 &
#./join.py 3<$duct3 4<$duct4 5>$duct5 &
pid=$!
echo hello >$duct3 &
# echo world >$duct4 &
wait $pid
# echo <$duct5
rm -f $duct3
rm -f $duct4
rm -f $duct5

