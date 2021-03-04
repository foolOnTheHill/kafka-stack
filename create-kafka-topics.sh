#!/bin/bash -e

if [[ -n "$KAFKA_CREATE_TOPICS" ]]; then
	topics=$(echo $KAFKA_CREATE_TOPICS | tr "," "\n")

	for topic in $topics
	do
		config=($(echo $topic | tr ":" "\n"))
		kafka_2.12-2.6.0/bin/kafka-topics.sh --zookeeper $KAFKA_ADVERTISED_LISTENERS:2181 --create --topic ${config[0]} --partitions ${config[1]} --replication-factor ${config[2]}
	done

fi

exit 0