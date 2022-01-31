sequence(Node,Children):-
    bagof(Child,treefact(connected,Node,Child),Children).

sequencechildren(Node,Children):-
    sequence(Node,ChildrenNodes),
    describe(ChildrenNodes,Children,0).

describeNode(Child,ChildDescription,Index):-
    name(Child,Name),
    contains(Child,Textbox),
    textbox(Textbox),
    str(Textbox,Str),
    ChildDescription=desc{node:Child,type:Name,index:Index,str:Str}.

describe([],[],_).
describe([Child|MoreChildren],[ChildDescription|MoreDescriptions],Index):-
    describeNode(Child,ChildDescription,Index),
    N is Index + 1,
    describe(MoreChildren,MoreDescriptions,N).
