#!/bin/bash

spark-submit --master spark://spark-cluster-master:7077 --packages org.apache.hadoop:hadoop-aws:3.2.0 ./src/spark/mnmcount.py
