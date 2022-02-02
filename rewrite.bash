#!/bin/bash
prep=../prep/prep
here=`pwd`
$prep '.' '$' rewrite.ohm rewrite.glue --support=$here/rewritesupport.js --stop=1
