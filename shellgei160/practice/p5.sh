#!/bin/bash

cat ../qdata/5/ntp.conf | awk '$1=="pool"' | awk '{print $2}'
