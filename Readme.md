✅ Step 1 — Build and Run Container for Hadoop

# Build Image
$ docker build -t ubuntu-hadoop:3.3.6 . 

# Run Container
$ docker run -d --name hadoop-single-node --network spark_local_server -p 9870:9870 -p 9000:9000 ubuntu-hadoop:3.3.6

# Access HDFS UI
http://localhost:9870

✅ Step 2 — Copy CSV Into Hadoop Container

# Access HDFS CLI
docker exec -it hadoop-single-node hdfs dfs -ls /

# Create directory
docker exec -it hadoop-single-node hdfs dfs -mkdir /data

# Move CSV into HDFS
docker cp data/ecommerce_delivery_data.csv hadoop-single-node:/tmp/ecommerce_delivery_data.csv 

✅ Step 3 — Enter Hadoop Container

docker exec -it hadoop-single-node bash

✅ Step 4 — Move CSV into HDFS

Inside the container:

hdfs dfs -mkdir -p /data
hdfs dfs -put /tmp/ecommerce_delivery_data.csv /data/ecommerce_delivery_data.csv

✅ Step 5 — Verify CSV in HDFS

hdfs dfs -ls /data
hdfs dfs -cat /data/ecommerce_delivery_data.csv | head
    
## Note

Final size for the Hadoop Image will be 1.05 GB.

