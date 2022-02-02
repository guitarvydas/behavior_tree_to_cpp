#!/bin/bash
prep=../prep/prep
here=`pwd`
$prep '.' '$' genrw.ohm genrw.glue --support=$here/genrwsupport.js --stop=1
