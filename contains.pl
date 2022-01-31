#!/usr/bin/env swipl -q
:- use_module(library(http/json)).
:- initialization allcontains.

allcontains :-
    consult(user),
    consult(inside),
    bagof([Node,Child],completelyInside(Child,Node),Bag),
    write(Bag),
    nl.
