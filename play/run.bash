#!/bin/bash
./wrapper.bash ./tester.bash 3<test.txt 4>&1 5>&1 &
