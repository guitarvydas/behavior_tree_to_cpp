all:
	clear
	./diagram-to-factbase.bash '..' 'tree.drawio' >fb.pl
	./connected1.pl <fb.pl 2>/dev/null
	./kind.pl <fb.pl 2>/dev/null

