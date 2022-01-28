
I have a knowledge base represented as PROLOG facts.  

I run swipl commands in a pipeline, each step emitting a new set of facts.

I append the new facts to the old knowledge base using `bash` commands.

Now, I want to do this same thing using a knowledge base represented as some kind of JSON.

Questions:

1) How best to represent the facts (triples) as JSON?
2) How to read all of the facts in?
3) How to query the read-in factbase?
4) How to write out all of the new facts (or, how to write out the complete augmented factbase)?

I know how to write queries in PROLOG (3).  Maybe question (2) becomes "how to read all of the JSON facts and convert them to internal form?"

A simple example follows
fb.pl
```
triple(father,john,george).
triple(father,paul,ringo).
```
queries.pl
```
#!/usr/bin/env swipl
:- initialization query.

query:-
    consult(user),
    triple(father,paul,F),
    write(user_output,F),
    halt.
```
bash command line:
```
chmod +x query.pl
$ ./query.pl -q <fb.pl 2>/dev/null
```
