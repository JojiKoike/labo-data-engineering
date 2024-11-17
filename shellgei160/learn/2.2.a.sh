#!/bin/bash

# shellcheck disable=SC2216
sleep 100 | sleep 100 | sleep 100 | sleep 100 | sleep 100 &

ps | awk '$4 == "sleep" {a[$1]="";b++;} END {print length(a), b;}'
