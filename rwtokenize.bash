#!/bin/bash
prep=../prep/prep
here=`pwd`
$prep '.' '$' rwtokenize.ohm rwtokenize.glue --stop=1 --support=$here/support.js

