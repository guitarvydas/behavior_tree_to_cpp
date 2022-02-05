#!/bin/bash
# input @: /dev/fd/3
# input text: /dev/fd/4
# output /dev/fd/5

read at </dev/fd/3
sed -E s/@/${at}/g </dev/fd/4 >/dev/fd/5
