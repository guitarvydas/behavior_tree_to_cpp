#!/usr/bin/env swipl
:- initialization query.

query:-
    consult(user),
    triple(father,paul,F),
    write(user_output,F),
    halt.

