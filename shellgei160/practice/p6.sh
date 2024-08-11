#!/bin/bash

seq 5 | awk '{for(i=1;i<$1;i++){printf " "};print "x"}' | tac
