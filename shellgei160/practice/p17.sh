#!/bin/bash

while read -r ln; do echo "$ln"; done </etc/passwd >~/a

echo "$(</etc/passwd)" >~/b
