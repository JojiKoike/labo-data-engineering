#!/bin/bash

set -e

mkdir ./tmp
cd ./tmp
seq 10000 | sed 's/^/echo $RANDOM > /' | bash

grep -l '^10$' -R | xargs rm

rm -fR ./tmp
