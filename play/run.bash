#!/bin/bash
#./hello.bash 4>&2

./wrapper.bash ./hello.bash 3<test.txt 4>&2 5>&2
