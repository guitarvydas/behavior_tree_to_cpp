#!/usr/bin/env swipl
:- use_module(library(http/json)).
:- initialization query.

queryjson:-
    json_read(user_input,FactArray),
    json(relation=father,subject=paul,Result),
    write(user_output,Result),
    halt.


