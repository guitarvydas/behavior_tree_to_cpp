junk:-
    A = dict{top:10,left:1,stuff:"aaa"},
    B = dict{top:10, left:2,stuff:"bbb"},
    C = dict{top:20, left:3,stuff:"ccc"},
    List = [B,C,A],
    writeln(List),
    sort(left,@<,List,Sorted),
    writeln(Sorted).
