#!/bin/bash

p=pen
re=''
# shellcheck disable=SC2016
echo $p "$p" '$p'
# shellcheck disable=SC2016
echo "This is a $p." 'That is a $p.'
# shellcheck disable=SC2154
echo "This is a ${p}cil." This is a "$p"cil "That is a $pcil."

grep "$re" /etc/passwd
# shellcheck disable=SC2086
grep $re /etc/passwd
