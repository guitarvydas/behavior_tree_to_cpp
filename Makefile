all:
	./diagram-to-factbase.bash '..' 'tree.drawio' >fb.pl
	./connected.pl <fb.pl >>fb.pl
	./kind.pl <fb.pl >>fb.pl 
	./name.pl <fb.pl >>fb.pl
	./str.pl <fb.pl >>fb.pl

strdeb:
	./str.pl <fb.pl >_junk.txt
	cat _junk.txt

deb:
	./emit.pl <fb.pl


