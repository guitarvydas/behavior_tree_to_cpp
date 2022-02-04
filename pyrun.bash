#!/bin/bash
set -x
trap catch ERR

duct3=duct3_$RANDOM
duct4=duct4_$RANDOM
duct5=duct5_$RANDOM
mkfifo $duct3 $duct4 $duct5

catch(){
    rm -f $duct3 $duct4 $duct5
    }

./join.py 3<$duct3 4<$duct4 5>$duct5 &
#./join.py 3<$duct3 4<$duct4 5>$duct5 &
pid=$!
echo -n 'hello ' >$duct3 &
echo -n 'world ' >$duct4 &
echo <$duct5 &
wait $pid
# rm -f $duct3
# rm -f $duct4
# rm -f $duct5

