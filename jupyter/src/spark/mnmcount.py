import logging
import os
import sys

from pyspark.sql import SparkSession

RUN_LOCAL = 2
RUN_CLUSTER = 1

spark: SparkSession = (
    SparkSession.Builder()
    .config(
        "spark.hadoop.fs.s3a.aws.credentials.provider",
        "org.apache.hadoop.fs.s3a.SimpleAWSCredentialsProvider",
    )
    .appName("PythonMnMCount")
    .getOrCreate()
)

if len(sys.argv) == RUN_CLUSTER:
    hadoop_configuration = spark.sparkContext._jsc.hadoopConfiguration()  # type: ignore  # noqa: PGH003, SLF001
    hadoop_configuration.set(
        "fs.s3a.endpoint", os.getenv("MINIO_ENDPOINT", "http://minio:9000")
    )
    hadoop_configuration.set(
        "fs.s3a.access.key", os.getenv("MINIO_ACCESS_KEY", "CUAuKNtR10mGBTY6EC1E")
    )
    hadoop_configuration.set(
        "fs.s3a.secret.key",
        os.getenv("MINIO_SECRET_KEY", "QJIzz5OrzThJbTSpvh7iseRPNYDWC4RT3C3VeGOG"),
    )
    hadoop_configuration.set("fs.s3a.path.style.access", "true")
    hadoop_configuration.set("fs.s3a.connection.ssl.enabled", "false")
    mnm_file = "s3a://data/mnm_dataset.csv"
elif len(sys.argv) == RUN_LOCAL:
    mnm_file = sys.argv[1]
else:
    logging.error("command error")
    sys.exit(-1)

# Data Loading
mnm_df = spark.read.option("header", "true").option("inferSchema", "true").csv(mnm_file)

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
