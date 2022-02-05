#!/bin/bash
#./wrapper.bash ./tester.bash 3<test.txt 4>out4.txt 5>out5.txt

./text.bash 3>out3.txt
echo junk >_junk.txt
./edit.bash 3<_junk.txt 4<out3.txt 5>&1
