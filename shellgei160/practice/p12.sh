#!/bin/bash

# Pattern 1
if [ "$1" = "" ]; then
	read -r n
else
	n="$1"
fi

echo $((n * 2))

# Pattern 2
[ "$1" = "" ] && read -r n || n="$1"
echo $((n * 2))
