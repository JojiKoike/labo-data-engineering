#!/bin/bash

if echo "$1" | grep '[02468]$'; then
	echo "偶数"
elif echo "$1" | grep '[13579]$'; then
	echo "奇数"
else
	echo "整数ではありません"
fi
