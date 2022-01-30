#!/usr/bin/env swipl
:- use_module(library(http/json)).
:- initialization allnames.

allnames:-
    consult(user),
    bagof([Node,Name],name(Node,Name),Bag),
    current_output(Out),
    name_format(Out, Bag, S),
    write(S),
    %json_write(Out, Bag, [width(128)]),
    halt.

    
name_format(_, [], "").
name_format(Out, [[H1,H2]|T], S):-
    format(string(S1),"treefact(name, ~w, ~q).~n",[H1,H2]),
    name_format(Out,T,S2),
    string_concat(S1,S2,S).

name(Node, Name):-diagram_fact(value, Node, Name), \+ treefact(kind, Node, textbox).
