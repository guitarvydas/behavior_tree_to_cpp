#!/usr/bin/env swipl -q
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

%% node {
%% shape     connected text      color
%% _         no        _         _     -> comment
%% rectangle yes       #sequence       -> sequence
%% rectangle yes       #fallback       -> fallback
%% rectangle yes                 red   -> syncnode
%% rectangle yes                 gray  -> textbox
%% rectangle no        _         yellow-> codebox
%% else      yes                       -> asyncnode
%% }

kind(Node, comment) :- vertex(Node), textOther(Node), colorOther(Node), \+ connected(Node).
kind(Node, sequence):-rectangle(Node),textSequence(Node).
kind(Node, fallback):-rectangle(Node),textFallback(Node).
kind(Node, syncnode):-rectangle(Node),textOther(Node),red(Node).
kind(Node, textbox):-rectangle(Node),textOther(Node),gray(Node).
kind(Node, codebox):-rectangle(Node),textOther(Node),yellow(Node).
kind(Node, asyncnode):-rectangle(Node),textOther(Node),colorOther(Node), \+ kind(Node, comment).

textSequence(Node):-name(Node,"#sequence").
textFallback(Node):-name(Node,"#fallback").
textOther(Node):- \+ textSequence(Node), \+ textFallback(Node).
red(Node):-diagram_fact(fillColor,Node,"#f8cecc").
gray(Node):-diagram_fact(fillColor,Node,"#f5f5f5").
yellow(Node):-diagram_fact(fillColor,Node,"#fff2cc").
colorOther(Node):- \+ red(Node), \+ gray(Node).

edge(Node):-vertex(Node), diagram_fact(edge,Node,_).
ellipse(Node):-vertex(Node), diagram_fact(ellipse,Node,_).
rectangle(Node):-vertex(Node),\+ edge(Node), \+ ellipse(Node).
vertex(Node):-diagram_fact(vertex,Node,_).

name(Node, Name):-diagram_fact(value, Node, Name).

connected(Node) :- treefact(connected, Node, _).
connected(Node) :- treefact(connected, _, Node).
