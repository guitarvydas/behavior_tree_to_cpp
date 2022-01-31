% refer only to treefact()s here...
%  (these queries are meant to be used after the fb has been generated)

textbox(Node) :- treefact(kind, Node, textbox).
name(Node, Name) :- treefact(name, Node, Name).

connected(Node) :- treefact(connected, Node, _).
connected(Node) :- treefact(connected, _, Node).

% avoid name string (built into swipl)
str(Node,String) :- textbox(Node), treefact(str, Node, String).


contains(Node,Child) :- treefact(contains, Node, Child).

