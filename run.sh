#!/bin/bash -e

if [[ -z "$KAFKA_ADVERTISED_LISTENERS" ]]; then
    echo "ERROR: missing mandatory config: KAFKA_ADVERTISED_LISTNERS"
    exit 1
fi

echo "advertised.listeners=PLAINTEXT://$KAFKA_ADVERTISED_LISTENERS:9092" >> /kafka_2.12-2.6.0/config/server.properties

exec "/usr/bin/supervisord" "-c" "/etc/supervisor/conf.d/supervisord.conf"