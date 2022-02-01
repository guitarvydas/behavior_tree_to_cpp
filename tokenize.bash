#!/bin/bash
prep=../prep/prep
./emitcode.pl >out.txt
./emitcpp.py out.txt >out2.txt
here=`pwd`
$prep '.' '$' tokenize.ohm tokenize.glue --stop=1 --support=$here/support.js <out2.txt
