Kafka Stack
===========

Dockerfile for Zookeeper, Kafka and Schema Registry for testing.

Why?
----

Often, I need to run integration tests that depends on Kafka, which depends on Zookeeper, and Schema Registry, which depends both on Kafka and Zookeeper. Most of the time I also need to setup CI pipelines to run these tests, which means creating containers for Zookeeper, Kafka and Schema Registry and linking them. Some CI apps do not allow or make it very difficult for service containers to comunicate with each other. This docker image creates a container with Zookeeper, Kafka and Schema Registry. This means:

- No dependency on an external hosts, or linking to another containers
- Zookeeper, Kafka and Schema Registry are configured to work together out of the box

How to
------

```
docker run -p 2181:2181 -p 8081:8081 -p 9092:9092 -e KAFKA_ADVERTISED_LISTENERS=localhost -d kafka-stack
```

Zookeeper is available at port `2181`, Schema Registry at `8081` and Kafka at `9092`.

Setting `KAFKA_CREATE_TOPICS` variable will allow to create topics on container startup, ex:
```
export KAFKA_CREATE_TOPICS="ex1:3:1,ex2:3:1"
```
In the example above ex1 is the topic name, 3 is the number of partitions and 1 is the number of replication factors.
More than one topic can be created using `,(comma)` as delimiter. 