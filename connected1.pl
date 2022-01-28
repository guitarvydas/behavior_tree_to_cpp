#!/usr/bin/env swipl

%% :-initialization main.

%% main:-
%%     consult(user_input),
%%     forall(connected(_,_),_).

connected1(Node1,Node2):-
    name(Node1,N1),
    name(Node2,N2),
    source(Edge,N1),
    target(Edge,N2),
    format("dtree_fact(connected1,~w,~w).~n",[N1,N2]).

name(Node,Name):-legalname(Node,Name).

legalname(X,Lname):-
    diagram_fact(synonym, X, TempLname),
    legalname(TempLname,Lname).
legalname(X,X):- \+ diagram_fact(synonym,X,_).

source(Edge, NodeLegalName):-
    diagram_fact(source,Edge,NodeLegalName).
target(Edge, NodeLegalName):-
    diagram_fact(target,Edge,NodeLegalName).
