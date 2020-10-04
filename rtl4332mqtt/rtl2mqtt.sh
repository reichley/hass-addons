#!/bin/sh

# A simple script that will receive events from an RTL433 SDR and resend the data via MQTT

# Author: Chris Kacerguis <chriskacerguis@gmail.com>
# Modification for hass.io add-on: Nick Reichley
# You'll find 167 options (as of 4 Oct 2020) and other command flags at the link below
# https://github.com/merbanan/rtl_433

export LANG=C
# export below used for current hassio library loading for rtl_433
export LD_LIBRARY_PATH=/usr/local/lib64
PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

CONFIG_PATH=/data/options.json
MQTT_HOST="$(jq --raw-output '.mqtt_host' $CONFIG_PATH)"
MQTT_USER="$(jq --raw-output '.mqtt_user' $CONFIG_PATH)"
MQTT_PASS="$(jq --raw-output '.mqtt_password' $CONFIG_PATH)"
MQTT_TOPIC="$(jq --raw-output '.mqtt_topic' $CONFIG_PATH)"
PROTOCOL="$(jq --raw-output '.protocol' $CONFIG_PATH)"
FREQUENCY="$(jq --raw-output '.frequency' $CONFIG_PATH)"
GAIN="$(jq --raw-output '.gain' $CONFIG_PATH)"
OFFSET="$(jq --raw-output '.frequency_offset' $CONFIG_PATH)"

# Start the listener and enter an endless loop
echo "Starting RTL_433 with parameters:"
echo "MQTT Host =" $MQTT_HOST
echo "MQTT User =" $MQTT_USER
echo "MQTT Password =" $MQTT_PASS
echo "MQTT Topic =" $MQTT_TOPIC
echo "RTL_433 Protocol =" $PROTOCOL
# Frequency, gain, and freq offset unneccessary since protocol selects for user
echo "RTL_433 Frequency =" $FREQUENCY
echo "RTL_433 Gain =" $GAIN
echo "RTL_433 Frequency Offset =" $OFFSET

set -x  ## uncomment for MQTT logging...
# topics found at: $MQTT_TOPIC/# (device id)
/usr/local/bin/rtl_433 -M newmodel -R $PROTOCOL -F "mqtt://$MQTT_HOST:1883,user=$MQTT_USER,pass=$MQTT_PASS,retain=1,devices=$MQTT_TOPIC[/id]"
