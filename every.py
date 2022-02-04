#!/usr/bin/env python3
# input: fd3
# output: fd5 - child output
# output: fd6 - end

import sys
import os
import json
import html
import re

input=3
lots=32767
stringA = os.read (input, lots).decode ('utf-8')
