#!/usr/bin/env swipl -s
:- use_module(library(http/json)).
:- initialization emitcode.

emitcode:-
    consult(user),
    consult(query),
    consult(emit),
    bagof([Node,Code],codestr(Node,Code),Bag),
    code_write(Bag),
    nl,
    halt.

code_write([]).
code_write([[_,Code]|Rest]) :- 
    writeln(Code), 
    code_write(Rest).
