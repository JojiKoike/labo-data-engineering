import logging
import sys

from pyspark.sql import SparkSession

if __name__ == "__main__":
    NUM_ARGS = 2
    if len(sys.argv) != NUM_ARGS:
        logging.error("Usage: mnmcount <file>")
        sys.exit(-1)

# Get or Create SparkSession
spark: SparkSession = SparkSession.Builder().appName("Spark").getOrCreate()

# Data Loading
mnm_file = sys.argv[1]
mnm_df = (
    spark.read.format("csv")
    .option("header", "true")
    .option("inferSchema", "true")
    .load(mnm_file)
)

# Summary
count_mnm_df = (
    mnm_df.select("State", "Color", "Count")
    .groupBy("State", "Color")
    .sum("Count")
    .orderBy("sum(Count)", ascending=False)
)

# Visualize
count_mnm_df.show(n=60, truncate=False)
logging.info("Total Rows = %d", count_mnm_df.count())

ca_count_mnm_df = (
    mnm_df.select("State", "Color", "Count")
    .where(mnm_df.State == "CA")
    .groupBy("State", "Color")
    .sum("Count")
    .orderBy("sum(Count)", ascending=False)
)

count_mnm_df.show(n=60, truncate=False)

spark.stop()
