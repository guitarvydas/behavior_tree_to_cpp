#!/usr/bin/env swipl -q
:- use_module(library(http/json)).
:- initialization alltext.

alltext:-
    consult(user),
    bagof(Node,text(Node),Bag),
    current_output(Out),
    text_format(Out, Bag, S),
    write(S),
    halt.

    
text_format(_, [], "").
text_format(Out, [H|T], S):-
    format(string(S1),"treefact(textbox, ~w, 0).~n",[H]),
    text_format(Out,T,S2),
    string_concat(S1,S2,S).

text(Node) :- diagram_fact(value,Node,_).
