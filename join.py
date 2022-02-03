#!/usr/bin/env python3
# input: fd3 text A
# input: fd4 text B
# output: fd5

import sys
import os
import json
import html
import re

print ("IN join.py")

inA = os.fdopen (3)
# inB = os.fdopen (4)
# out = os.fdopen (5)

stringA = os.read (inA)
print (f'A is /{stringA}/')
# stringB = os.read (inB)

# print (stringA + stringB, file=out)
