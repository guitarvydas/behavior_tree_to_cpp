all:
	./diagram-to-factbase.bash '..' 'tree.drawio' >fb.pl
	./connected1.pl <fb.pl >>fb.pl
	./kind.pl <fb.pl >>fb.pl 
	./name.pl <fb.pl >>fb.pl
	./text.pl <fb.pl >>fb.pl
	./emit.pl <fb.pl

deb:
	./emit.pl <fb.pl


