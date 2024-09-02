# Clickhouse
This repo guides you through integrating Confluent Platform with ClickHouse by setting up Kafka to stream data into ClickHouse. It includes configuring Kafka Connect with a ClickHouse Sink Connector for real-time analytics.

## Start

```
docker-compose up -d
```

### Health

Check if all components are up and running using

```bash
docker-compose ps -a
# Ensure there are no Exited services and all containers have the status `Up`
```


### Logs

Check the logs of the respective service by its container name.

```bash
docker logs <container_name> # docker logs kafka1
```

### Restarting services

To restart a particular service - 

```bash
docker-compose restart <service_name> # docker-compose restart kafka1
# OR
docker-compose up -d --force-recreate <service_name> # docker-compose up -d --force-recreate kafka1
```


