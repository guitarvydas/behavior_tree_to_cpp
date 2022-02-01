#!/bin/bash
prep=../prep/prep
./emitcode.pl >out.txt
./emitcpp.py out.txt >out2.txt
$prep '.' '$' tokenize.ohm tokenize.glue --stop=1 <out2.txt
