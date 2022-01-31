#!/usr/bin/env swipl -q
:- use_module(library(http/json)).
:- initialization boundingboxes.


boundingboxes :-
    consult(user),
    bagof([ID,L,T,R,B],boundingbox(ID,L,T,R,B),Bag),
    formatAllBBs(Bag,S),
    write(S),nl.
    
boundingbox(ID,Left,Top,Right,Bottom) :-
    diagram_fact(x,ID,X),
    diagram_fact(y,ID,Y),
    diagram_fact(width,ID,W),
    diagram_fact(height,ID,H),
    Left is X,
    Top is Y,
    Right is X+W,
    Bottom is Y+H.

formatAllBBs([],"").
formatAllBBs([[ID,L,T,R,B]|Rest],S) :-
    formatBB(SingleS,ID,L,T,R,B),
    formatAllBBs(Rest,RestS),
    string_concat(SingleS,RestS,S).
    
formatBB(S,ID,L,T,R,B) :-
    %% format("treefact(boundingbox_left,~w,~w).~n",[ID,L]),
    %% format("treefact(boundingbox_top,~w,~w).~n",[ID,T]),
    %% format("treefact(boundingbox_right,~w,~w).~n",[ID,R]),
    %% format("treefact(boundingbox_bottom,~w,~w).~n",[ID,B]).    
    format(string(S),"treefact(boundingbox_left,~w,~w).~ntreefact(boundingbox_top,~w,~w).~ntreefact(boundingbox_right,~w,~w).~ntreefact(boundingbox_bottom,~w,~w).~n",[ID,L,ID,T,ID,R,ID,B]).
