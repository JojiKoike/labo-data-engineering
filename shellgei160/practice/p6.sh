#!/bin/bash

seq 5 | awk '{for(i=1;i<$1;i++){printf " "};print "x"}' | tac

seq 5 | awk '{a++;for(i=5;i>a;i--){printf " "};print "x"}'
