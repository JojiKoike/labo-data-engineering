#!/bin/bash

# 小問１
echo I am a perfect human | while read -r a; do echo "$a"; done

echo I am a perfect human | (
	read -r a
	echo "${a^^}"
)

# 小問２
echo pen-pinapple-apple-pen | (
	IFS=- read -r -a w
	echo "${w[*]^}"
)
