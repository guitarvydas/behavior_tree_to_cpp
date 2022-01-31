#!/usr/bin/env python3

import sys
import json
import html
import re

with open(sys.argv[1]) as f:
  data = json.load(f)

  print (f'<BehaviorTree ID="out">')
  for topNode in data:
    print (f'  <{topNode["nodekind"]} name=\"{topNode["id"]}\">')
    for node in topNode["children"]:
        print (f'    <{node["prototype"]} {html.unescape(node["str"])}/>')
    print (f'  </sequence>')
  print (f'</BehaviorTree>')

