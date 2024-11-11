#!/bin/bash

# shellcheck disable=SC2121
IFS=:
set aa bb cc
echo "$*"

for x in "$1" "$2" "$3"; do
	echo "$x"
done

for i in "$@"; do
	echo "$i"
done

seq 3 | while read -r x; do
	printf "%s " "$x"
done
