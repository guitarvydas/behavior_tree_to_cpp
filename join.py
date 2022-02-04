#!/usr/bin/env python3
# input: fd3 text A
# input: fd4 text B
# output: fd5

import sys
import os
import json
import html
import re


inA = 3
inB = 4

lots=32767
stringA = os.read (inA, lots).decode ('utf-8')
stringB = os.read (inB, lots).decode ('utf-8')
r = bytes(stringA + stringB, 'utf-8')
os.write(5, r)
