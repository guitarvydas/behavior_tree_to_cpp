all: fb.pl

deb: fb.pl
	./emit.pl <fb.pl

fb.pl : diagram-to-factbase.bash connected.pl kind.pl name.pl str.pl
	./diagram-to-factbase.bash '..' 'tree.drawio' >fb.pl
	./connected.pl <fb.pl >>fb.pl
	./kind.pl <fb.pl >>fb.pl 
	./name.pl <fb.pl >>fb.pl
	./str.pl <fb.pl >>fb.pl



