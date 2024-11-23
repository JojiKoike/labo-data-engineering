#!/bin/bash

cd ../qdata/21 || exit

find . -type f | grep -v "\./dir_b/d" | sort

shopt -s globstar
echo dir_a/* dir_b/* dir_c/** | grep -o '[^ ]*[0-9]'
