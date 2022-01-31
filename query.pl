textbox(Node) :- treefact(kind, Node, textbox).
name(Node, Name) :- treefact(name, Node, Name).

% avoid name string (built into swipl)
str(Node,String) :- textbox(Node), treefact(str, Node, String).


