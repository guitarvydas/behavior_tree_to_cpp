#!/bin/bash
prep=../prep/prep
here=`pwd`
spec=$1
text=$2
$prep '.' '$' genrw.ohm genrw.glue --input=$spec --support=$here/genrwsupport.js --stop=1
#chmod +x rewrite.py
#./rewriter.py $text
