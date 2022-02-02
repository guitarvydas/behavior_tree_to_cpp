#!/usr/bin/env python3

import sys
import html
import re

state = interpreting
textStack = []

with open (sys.argv[1]) as commands:
    with open (sys.argv[2]) as text:
        global textStack = []
        global state = interpreting

        loop:
           exit when eof
           line = getLine ()
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
    elif (command == ":[foreach]"):
    elif (command == ":[endforeach]"):
    elif (command == ":[foreachfield name]"):
    elif (command == ":[endforeachfield name]"):
    elif (command == ":[rewrite]"):
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
