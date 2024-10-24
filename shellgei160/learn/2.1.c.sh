#!/bin/bash

a=私は
b=女優よ

c=$a$b
echo $c

a+=$b
echo $a

b=${a:0:1}${a:2:2}
echo $b

c=${a/女優/俳優}
echo $c
