sequence(Node,Children):-
    bagof(Child,treefact(connected,Node,Child),Children).

sequencechildren(Node,Children):-
    sequence(Node,ChildrenNodes),
    describe(ChildrenNodes,Descriptions,0),
    Children = Descriptions.

describeNode(Node,Description,Index):-
    name(Node,Name),
    contains(Node,Textbox),
    textbox(Textbox),
    str(Textbox,Str),
    boundingbox_left(Node,Left),
    boundingbox_top(Node,Top),
    Description=desc{node:Node,type:Name,index:Index,str:Str,left:Left,top:Top}.

describe([],[],_).
describe([Child|MoreChildren],[ChildDescription|MoreDescriptions],Index):-
    describeNode(Child,ChildDescription,Index),
    N is Index + 1,
    describe(MoreChildren,MoreDescriptions,N).
