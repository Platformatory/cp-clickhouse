# Clickhouse with Kafka

Source code for a demo on ingesting household voltage readings into Kafka and querying analytics in Clickhouse

## Setup

1. Bring up the environment

```bash
docker-compose up -d
```

2. Start the producer

```bash
# sleep 30
docker-compose up -d producer
```

3. Create the table in clickhouse

```bash
docker-compose exec clickhouse clickhouse client --query "CREATE TABLE household_power_consumption (
    readingDate String,
    readingTime String,
    global_active_power Float32,
    global_reactive_power Float32,
    voltage Float32,
    global_intensity Float32,
    sub_metering_1 Float32,
    sub_metering_2 Float32,
    sub_metering_3 Float32
) ENGINE = MergeTree()
ORDER BY (readingDate, readingTime);"
```

4. Create the connector

```bash
./create_connector.sh
```

5. Query from clickhouse

```bash
docker-compose exec clickhouse clickhouse client
```