#!/bin/bash

a=("$SHELL" "$LANG" "$USER")

declare -A b
b["SHELL"]="$SHELL"
b["LANG"]="$LANG"
b["USER"]="$USER"

echo ${b["LANG"]}
echo ${a[1]}

IFS=:
echo "${b[@]}"
echo "${b[*]}"
echo "${a[@]}"
echo "${a[*]}"

echo ${#a[@]}
echo ${#a[*]}
echo ${#b[@]}
echo ${#b[*]}

echo "${!b[@]}"
echo "${!b[*]}"
