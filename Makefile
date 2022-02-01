all: fb.pl

fb.pl out.json: tree.drawio \
	diagram-to-factbase.bash connected.pl kind.pl name.pl \
	str.pl boundingbox.pl Makefile \
	contains.pl \
	emitter.pl emit.pl \
	xmlemit.py
	./diagram-to-factbase.bash '..' 'tree.drawio' >fb.pl
	./extend fb.pl connected.pl
	./extend fb.pl kind.pl
	./extend fb.pl name.pl
	./extend fb.pl str.pl
	./extend fb.pl boundingbox.pl
	./extend fb.pl contains.pl
	./emitter.pl <fb.pl >out.json
	./xmlemit.py out.json >out.xml

debug: out.json fb.pl
	./emitcode.pl <fb.pl
	#./parsecode.bash <fb.pl

