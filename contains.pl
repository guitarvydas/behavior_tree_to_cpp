#!/usr/bin/env swipl -q
:- use_module(library(http/json)).
:- initialization allcontains.

allcontains :-
    consult(user),
    consult(inside),
    bagof([Node,Child],completelyInside(Child,Node),Bag),
    formatContainsList(Bag,S),
    write(S),
    nl.

formatContains(Node,Child,S) :-
    format(string(S), "treefact(contains,~w,~w).~n", [Node, Child]).

formatContainsList([], "").
formatContainsList([[Node,Child]|Rest], S) :-
    formatContains(Node, Child, Ssingle),
    formatContainsList(Rest, Srest),
    string_concat(Ssingle, Srest, S).
