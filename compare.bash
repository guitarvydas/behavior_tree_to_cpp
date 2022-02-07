set -x
clear
./run.bash >ex2-from-lisp.cpp
touch tree.drawio
make -s
diff -w ex2.cpp ex2-from-lisp.cpp

