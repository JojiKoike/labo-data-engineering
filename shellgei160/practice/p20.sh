#!/bin/bash

for i in $(
	cd /usr || exit
	echo *
); do echo "$i"; done
