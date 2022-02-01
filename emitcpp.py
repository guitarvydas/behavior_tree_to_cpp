#!/usr/bin/env python3

import sys
import json
import html
import re

with open(sys.argv[1]) as f:
  data = f.read ()

  text1 = html.unescape (data).replace ("<br>", "\n").replace ("<span>", "").replace ("</span>", "\n")
  text2 = html.unescape (text1).replace ("\n\n", "\n")
  print (text2)

