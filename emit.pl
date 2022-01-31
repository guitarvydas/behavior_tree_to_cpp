sequence(Node,Children):-
    bagof(Child,treefact(connected,Node,Child),Children).

sequencechildren(Node,Children):-
    sequence(Node,ChildrenNodes),
    describe(ChildrenNodes,Descriptions),
    %Children = Descriptions.
    sort(left, @<, Descriptions, Children).

describeNode(Node,Description):-
    name(Node,Name),
    contains(Node,Textbox),
    textbox(Textbox),
    str(Textbox,Str),
    boundingbox_left(Node,Left),
    boundingbox_top(Node,Top),
    Description=desc{id:Node,prototype:Name,str:Str,left:Left,top:Top}.

describe([],[]).
describe([Child|MoreChildren],[ChildDescription|MoreDescriptions]):-
    describeNode(Child,ChildDescription),
    describe(MoreChildren,MoreDescriptions).
