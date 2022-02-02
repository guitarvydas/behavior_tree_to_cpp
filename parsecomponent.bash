#!/bin/bash
prep=../prep/prep
here=`pwd`
$prep '.' '$' component.ohm component.glue --support=$here/componentsupport.js --stop=1
