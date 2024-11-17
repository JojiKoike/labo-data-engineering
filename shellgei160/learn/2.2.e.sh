#!/bin/bash

a=しんじゅく
echo "${a}を逆さにすると$(echo "$a" | rev)です。"

cat <(echo $a) <(echo を逆さにすると) <(echo $a | rev)
