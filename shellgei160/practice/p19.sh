#!/bin/bash

printf xxxx-xxxx 1<>"$1"

mapfile -d '-' -t a <"$1"
echo xxxx-xxxx-"${a[2]}"-"${a[3]}" >"$1"

IFS=-
a=($(<"$1"))
echo xxxx-xxxx-"${a[2]}"-"${a[3]}" >"$1"
