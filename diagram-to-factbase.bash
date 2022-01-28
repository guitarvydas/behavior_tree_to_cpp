set -x
#usage ./diagram-to-factbase.bash 3<xxx 4<yyy
#
# where xxx is a string - the directory path to the root of all tools
# where yyy is a string - the name of a .drawio file
#
# N.B. you can't say ... 4<"tree.drawio" since bash evals the RHS and expects it to be a file, you need to say ... 4<`echo tree.drawio`

ductA=ductA_$RANDOM
ductB=ductB_$RANDOM
ductC=ductC_$RANDOM
mkfifo $ductA $ductB $ductC

root=$1
target=$2

# for d2f 
$root/components/d2f.comp 3<$ductA 4<$ductB 5>$ductC &
echo $root >$ductA &
echo $target >$ductB &
cat <$ductC >d2f.fb.pl
cat d2f.fb.pl

rm -rf $ductA $ductB $ductC
