#!/usr/bin/env python3

import sys
import html
import re

state = interpreting
textStack = []
controlStack = []
eof = false

with open (sys.argv[1]) as script:
    with open (sys.argv[2]) as text:
        global textStack
        textStack = []
        global controlStack
        controlStack = []
        global state
        state = interpreting
        global eof
        eof = false

        while (not eof):
           line = script.readline ()
           if (state == "interpreting"):
               interpret (line)
           elif (state == "collecting":
                 collect (line)
           else:
                 panic (f'invalid state /{state}/ in main loop')

def interpret (command):
    if (command == ":[newchunk]"):
                 textStack.push ([])
    elif (command == ":[endchunk]"):
                 textStack.pop ()
    elif (command == ":[collect]"):
                 state = collecting
    elif (command == ":[foreach name]"):
    elif (command == ":[endforeach]"):
    elif (command == ":[rewrite]"):
    elif (command == ":[begin]"):
    elif (command == ":[end]"):
    else:                 
        panic (f'invalid command /{command}/ in interpreting state')

def collect (line):            
   if (line == ":[endcollect]"):
       global state=interpreting
   else:
       textStack.top = textStack.top.join ('\n')
       appendTextToTopItem (text=line)
        
def appendTextToTopItem (text):
    global textStack
    textStack.top.push (text)
