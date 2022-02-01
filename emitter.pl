#!/usr/bin/env swipl -s
:- use_module(library(http/json)).
:- initialization emitjson.

emitjson:-
    consult(user),
    consult(query),
    consult(emit),
    bagof(ignore{nodekind:sequence,id:Node,children:Children},sequencechildren(Node,Children),Bag),
    current_output(Out),
    %write(Out, Bag),
    json_write(Out, Bag, [width(128)]),
    nl,
    halt.
