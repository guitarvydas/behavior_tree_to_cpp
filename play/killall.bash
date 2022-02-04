pyrun=`ps | grep pyrun | sed -E 's/[ ]+.*$//'`
wrapper=`ps | grep wrapper | sed -E 's/[ ]+.*$//'`

echo $pyrun
echo $wrapper
kill $pyrun
kill $wrapper

