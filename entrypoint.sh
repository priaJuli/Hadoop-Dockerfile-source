#!/bin/bash

set -e

# Identify the role based on the container hostname
ROLE=$(hostname)

if [ "$ROLE" == "namenode" ]; then
    # 1. Format NameNode only if it hasn't been done before
    if [ ! -d "/hadoop/dfs/namenode/current" ]; then
        echo "ROLE: NameNode - Initializing storage..."
        hdfs namenode -format -nonInteractive
    fi
    echo "Starting NameNode..."
    # Running in foreground (no --daemon) so Docker can track the process
    exec hdfs namenode

elif [ "$ROLE" == "datanode" ]; then
    echo "Starting DataNode..."
    # Running in foreground
    exec hdfs datanode

else
    echo "Unknown Role: $ROLE. Starting bash for inspection."
    exec /bin/bash
fi