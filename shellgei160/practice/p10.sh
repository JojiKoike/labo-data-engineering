#!/bin/bash

cat ../qdata/10/headings.md | sed -r 's/^## +(.*)/\1\n---/' | sed -r 's/^# +(.*)/\1\n===/'
