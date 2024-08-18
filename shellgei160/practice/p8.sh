#!/bin/bash

awk -F: '{print $(NF-2)}' ../qdata/8/access.log | \
awk '$1<"12"{print "午前"} $1>="12"{print "午後"}' | sort | uniq -c
