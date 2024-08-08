#!/bin/bash

mkdir ./tmp
cd ./tmp
seq 1000000 | xargs -P2 touch

time ls -U | xargs -P2 rename 's/^/0000000/;s/0*([0-9]{7})/$1/'
