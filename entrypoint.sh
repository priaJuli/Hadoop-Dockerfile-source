#!/bin/bash

set -e

# Format namenode if not formatted
if [ ! -d "/hadoop/dfs/namenode/current" ]; then
    echo "Formatting NameNode..."
    hdfs namenode -format
fi

echo "Starting HDFS..."

# Start NameNode
hdfs --daemon start namenode

# Start DataNode
hdfs --daemon start datanode

# Keep container alive
tail -f /dev/null