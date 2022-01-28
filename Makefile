all:
	clear
	./diagram-to-factbase.bash '..' 'tree.drawio' >fb.pl
	./connected1.pl <fb.pl

