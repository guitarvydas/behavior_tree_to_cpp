#usage ./diagram-to-factbase.bash 3<xxx 4<yyy
#
# where xxx is a string - the directory path to the root of all tools
# where yyy is a string - the name of a .drawio file
#
# N.B. you can't say ... 4<"tree.drawio" since bash evals the RHS and expects it to be a file, you need to say ... 4<`echo tree.drawio`

ductA=ductA_$RANDOM
ductB=ductB_$RANDOM
mkfifo $ductA $ductB

root=$1
target=$2

# for d2f 
$root/components/d2f.comp 3<$ductA 4<$ductB 5>&1 &
pid=$!
echo $root >$ductA &
echo $target >$ductB &
wait $pid
rm -rf $ductA $ductB
