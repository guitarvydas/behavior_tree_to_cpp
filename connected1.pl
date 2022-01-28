#!/usr/bin/env swipl
:- use_module(library(http/json)).
:- initialization connected.

connected:-
    consult(user),
    bagof([X,Y],connected1(X,Y),Bag),
    current_output(Out),
    connected_write(Out, Bag),
    %json_write(Out, Bag, [width(128)]),
    halt.

connected_write(_, []).
connected_write(Out, [[H1,H2]|T]):-
    format("treefact(connected, ~w, ~w).~n",[H1,H2]),
    connected_write(Out,T).

connected1(Node1,Node2):-
    name(Node1,N1),
    name(Node2,N2),
    source(Edge,N1),
    target(Edge,N2).

name(Node,Name):-legalname(Node,Name).

legalname(X,Lname):-
    diagram_fact(synonym, X, TempLname),
    legalname(TempLname,Lname).
legalname(X,X):- \+ diagram_fact(synonym,X,_).

source(Edge, NodeLegalName):-
    diagram_fact(source,Edge,NodeLegalName).
target(Edge, NodeLegalName):-
    diagram_fact(target,Edge,NodeLegalName).
