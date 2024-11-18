#!/bin/bash

n="XYZ"
(
	for i in {A..C}; do
		# shellcheck disable=SC2030
		n+=$i
		echo "$n"
	done
)
# shellcheck disable=SC2031
echo "$n"
