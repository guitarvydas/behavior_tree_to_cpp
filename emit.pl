#!/usr/bin/env swipl
:- use_module(library(http/json)).
:- initialization emitjson.

emitjson:-
    consult(user),
    consult(query),
    bagof([Node,Children],children(Node,Children),Bag),
    current_output(Out),
    %write(Out, Bag),
    json_write(Out, Bag),
    nl,
    halt.

sequence(Node,Children):-
    bagof(Child,treefact(connected,Node,Child),Children).

children(Node,Children):-
    sequence(Node,ChildrenNodes),
    describe(ChildrenNodes,Children,0).

describe1(Child,ChildDescription,Index):-
    name(Child,Name),
    ChildDescription=desc{node:Child,type:Name,index:Index}.

describe([],[],_).
describe([Child|MoreChildren],[ChildDescription|MoreDescriptions],Index):-
    describe1(Child,ChildDescription,Index),
    N is Index + 1,
    describe(MoreChildren,MoreDescriptions,N).
