#!/usr/bin/env swipl
:- use_module(library(http/json)).
:- initialization emitjson.

emitjson:-
    consult(user),
    bagof([Relation,Subject,Object],treefact(Relation,Subject,Object),Bag),
    current_output(Out),
    json_write(Out,Bag, [width(128)]),
    write(Out, Bag),
    halt.

    
