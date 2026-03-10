✅ Step 1 — Copy CSV Into Hadoop Container

From your host:

$ docker cp data/ecommerce_delivery_data.csv hadoop-single-node:/tmp/ecommerce_delivery_data.csv 

✅ Step 2 — Enter Hadoop Container

$ docker exec -it hadoop-single-node bash

✅ Step 3 — Move CSV into HDFS

Inside the container:

hdfs dfs -mkdir -p /data
hdfs dfs -put /tmp/ecommerce_delivery_data.csv /data/ecommerce_delivery_data.csv

✅ Step 4 — Verify CSV in HDFS

hdfs dfs -ls /data
hdfs dfs -cat /data/ecommerce_delivery_data.csv | head