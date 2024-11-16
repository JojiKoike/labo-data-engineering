#!/bin/bash

seq "$1" | while read -r n; do
	echo "羊が$n匹"
	n=$((n + 1))
	sleep 1
done

for i in $(seq "$1"); do
	echo "羊が$i匹"
	sleep 1
done

for i in {1..3}; do
	echo "羊が$i匹"
	sleep 1
done
