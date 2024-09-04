#!/bin/bash

declare -A b
b["SHELL"]="$SHELL"
b["LANG"]="$LANG"
b["USER"]="$USER"

echo ${b["LANG"]}
