all: fb.pl

deb: fb.pl emitter.pl emit.pl
	./emitter.pl <fb.pl

fb.pl : diagram-to-factbase.bash connected.pl kind.pl name.pl str.pl boundingbox.pl Makefile \
	contains.pl
	./diagram-to-factbase.bash '..' 'tree.drawio' >fb.pl
	./extend fb.pl connected.pl
	./extend fb.pl kind.pl
	./extend fb.pl name.pl
	./extend fb.pl str.pl
	./extend fb.pl boundingbox.pl
	./extend fb.pl contains.pl

