#!/bin/bash

ls 1>a

wc -l 0<a

sed 2>b

head -n 3 b

sed 2>&1
