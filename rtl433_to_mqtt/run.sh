#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

MQTT_HOST="$(bashio::config 'mqtt_host')"
MQTT_USER="$(bashio::config 'mqtt_user')"
MQTT_PASSWORD="$(bashio::config 'mqtt_password')"
MQTT_TOPIC="$(bashio::config 'mqtt_topic')"
PROTOCOL="$(bashio::config 'protocol')"
RETAIN="$(bashio::config 'retain')"

echo "Starting rtl433_to_mqtt with the following parameters:"
echo "MQTT Host = $MQTT_HOST, MQTT User = $MQTT_USER, MQTT Password = $MQTT_PASSWORD"
echo "MQTT Topic = $MQTT_TOPIC, PROTOCOL = $PROTOCOL, RETAIN = $RETAIN"
echo ""

set -x

/usr/local/bin/rtl_433 -M newmodel -R $PROTOCOL -F "mqtt://$MQTT_HOST:1883,user=$MQTT_USER,pass=$MQTT_PASSWORD,retain=$RETAIN,devices=$MQTT_TOPIC[/id]"
