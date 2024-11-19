#!/bin/bash

declare -A x
IFS=:
# shellcheck disable=SC2154
while read -r {a..g}; do [[ "$g" = "" ]] || x[$g]+=.; done </etc/passwd
for i in "${!x[@]}"; do echo "$i: ${#x[$i]}"; done
unset x
