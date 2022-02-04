#!/bin/bash
read stringA </dev/fd/3
read stringB </dev/fd/4
echo 'tester 0' 1>&2
echo tester A $stringA 1>&2
echo tester B $stringB 1>&2
echo in tester 1>&5
