all: component.json rwtokens.json

fb.pl out.json: tree.drawio diagram-to-factbase.bash connected.pl kind.pl name.pl str.pl boundingbox.pl Makefile contains.pl emitter.pl emit.pl xmlemit.py tokens.json
	./diagram-to-factbase.bash '..' 'tree.drawio' >fb.pl
	./extend fb.pl connected.pl
	./extend fb.pl kind.pl
	./extend fb.pl name.pl
	./extend fb.pl str.pl
	./extend fb.pl boundingbox.pl
	./extend fb.pl contains.pl
	./emitter.pl <fb.pl >out.json
	./xmlemit.py out.json >out.xml
	./tokenize.bash <fb.pl >tokens.json

component.json: parsecomponent.bash tokens.json component.ohm component.glue tokens.json componentsupport.js fb.pl
	./parsecomponent.bash <tokens.json >component.json

rwtokens.json: rwtokenize.bash rwtokenize.ohm rwtokenize.glue rewrite.spec
	./rwtokenize.bash <rewrite.spec >rwtokens.json

debug: component.json rwtokens.json rewrite.spec
	./makerwscript.bash <rwtokens.json >script.lisp

pydebug:
	./pyrun.bash

clean:
	rm -f *~
	rm -f _*

