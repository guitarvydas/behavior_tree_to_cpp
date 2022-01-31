textbox(Node) :- treefact(kind, Node, textbox).
name(Node, Name) :- treefact(name, Node, Name).

connected(Node) :- treefact(connected, Node, _).
connected(Node) :- treefact(connected, _, Node).

% avoid name string (built into swipl)
str(Node,String) :- textbox(Node), treefact(str, Node, String).


