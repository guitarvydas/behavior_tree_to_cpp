#!/bin/bash
# cat </dev/fd/3 >_tester.txt
# cat _tester.txt 1>&4
cat </dev/fd/3 1>&4
