#!/bin/bash

curl -X POST -H "Content-Type: application/json" -d @clickhouse-connector.json localhost:8083/connectors

sleep 5

echo "Checking connector status..."

curl localhost:8083/connectors/voltage/status
