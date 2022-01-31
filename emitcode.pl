#!/usr/bin/env swipl -s
:- use_module(library(http/json)).
:- initialization emitcode.

emitcode:-
    consult(user),
    consult(query),
    consult(emit),
    bagof(Code,codestr(_,Code),Bag),
    code_write(Bag),
    nl,
    halt.

code_write([]).
code_write([First|Rest]) :- 
    writeln(First), 
    code_write(Rest).
