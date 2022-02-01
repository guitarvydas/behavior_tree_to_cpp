#!/bin/bash
prep=../prep/prep
here=`pwd`
$prep '.' '$' component.ohm component.glue --stop=1
