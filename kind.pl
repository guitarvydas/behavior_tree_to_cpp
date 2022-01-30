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

gray(Node):-diagram_fact(fillColor,Node,"#f5f5f5").
red(Node):-diagram_fact(fillColor,Node,"#f5f5f5"), \+ gray(Node).

kind(Node,text):-gray(Node).
kind(Node,sequence):-
    diagram_fact(value,Node,"#sequence"),
    \+ gray(Node).
kind(Node,fallback):-
    diagram_fact(value,Node,"#fallback"),
    \+ gray(Node).
kind(Node,syncaction):-
    diagram_fact(value,Node,K),
    K \= "#sequence",
    K \= "#fallback",
    red(Node).
kind(Node,asyncaction):-
    diagram_fact(value,Node,K),
    K \= "#sequence",
    K \= "#fallback",
    \+ gray(Node).
    
