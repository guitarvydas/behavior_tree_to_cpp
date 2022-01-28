#!/usr/bin/env swipl
:- use_module(library(http/json)).
:- initialization allkind.

allkind:-
    consult(user),
    bagof([Node,Kind],kind(Node,Kind),Bag),
    current_output(Out),
    kind_format(Out, Bag, S),
    write(S),
    %json_write(Out, Bag, [width(128)]),
    halt.

kind_format(_, [], "").
kind_format(Out, [[H1,H2]|T], S):-
    format(string(S1),"treefact(kind, ~w, ~w).~n",[H1,H2]),
    kind_format(Out,T,S2),
    string_concat(S1,S2,S).

kind(Node,sequence):-
    diagram_fact(value,Node,"#sequence").
kind(Node,fallback):-
    diagram_fact(value,Node,"#fallback").
kind(Node,action):-
    diagram_fact(value,Node,K),
    K \= "#sequence",
    K \= "#fallback".
    
