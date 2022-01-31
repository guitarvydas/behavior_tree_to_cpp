#!/usr/bin/env swipl -q
:- use_module(library(http/json)).
:- initialization allstr.

allstr:-
    consult(user),
    consult(query),
    bagof([Node,String],istr(Node,String),Bag),
    current_output(Out),
    istr_format(Out, Bag, S),
    write(S),
    halt.

    
istr_format(_, [], "").
istr_format(Out, [[N|[Str]]|T], S):-
    format(string(S1),"treefact(str, ~w, ~q).~n",[N,Str]),
    istr_format(Out,T,S2),
    string_concat(S1,S2,S).

istr(Node,String) :- textbox(Node), diagram_fact(value,Node,String).
