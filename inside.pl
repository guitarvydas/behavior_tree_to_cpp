% succeeds only if B's bounding box is fully inside A's bounding box, inclusively
completelyInside(B,A):-
    treefact(boundingbox_left,B,Bl),
    treefact(boundingbox_top,B,Bt),
    treefact(boundingbox_right,B,Br),
    treefact(boundingbox_bottom,B,Bb),
    treefact(boundingbox_left,A,Al),
    treefact(boundingbox_top,A,At),
    treefact(boundingbox_right,A,Ar),
    treefact(boundingbox_bottom,A,Ab),
    A \= B,
    Bl >= Al,
    Bl =< Ar,
    Br >= Al,
    Br =< Ar,
    Bt >= At,
    Bt =< Ab,
    Bb >= At,
    Bb =< Ab.
    
